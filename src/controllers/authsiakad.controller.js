import prisma from "../config/prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { successResponse, errorResponse } from "../utils/response.js";
import cookieOptions from "../utils/cookieOptions.js";

const JWT_SECRET = process.env.JWT_SECRET || "secret"
// register, login, logout

export const register = async (req,res) => {
    try {

        const {name, email, password, role} = req.body

        //validate
        if(!name || !email || !password || !role){
            return errorResponse(res, "All fields are required", null, 400);
        }

        //hash password sebelum disimpan
        const hashed = await bcrypt.hash(password, 10)

        // simpan user baru
        const user = await prisma.userSiakad.create({
            data:{
                name,
                email,
                password: hashed,
                role,
            }
        })

        return successResponse(res, "Register Successfully", {
            id:user.id,
            name:user.name,
            email:user.email,
            role: user.role,
        })
        
    } catch (error) {
        return errorResponse(res,"failed to register user", error.message, 500)
    }
}

export const login = async (req,res) => {
    try {
        const {email, password} = req.body

        //validate
        if (!email || !password){
            return errorResponse(res, "Email and password are required", null, 400);
        }

        // cari user
        const user = await prisma.userSiakad.findUnique({ where: {email} })
        if(!user){
            return errorResponse(res, "Email not found", null, 401)
        }

        //cocokan password
        const match = await bcrypt.compare(password, user.password)
        if(!match){
            return errorResponse(res,"incorrect password", null, 401)
        }

        // Buat JWT Token
        const token = jwt.sign(
            { id:user.id, role: user.role},
            JWT_SECRET,
            { expiresIn: "1d" }
        )

        // simpan token di cookie
        res.cookie("token", token, cookieOptions(req))

        return successResponse(res,"Login successful", {
            id:user.id,
            name:user.name,
            email:user.email,
            role:user.role,
            token:token,
        })
    } catch (error) {
        return errorResponse(res, "Failed to login", error.message, 500);
    }
}

export const logout = (req,res) => {
    res.clearCookie("token", {
        ...cookieOptions(req),
        maxAge: undefined,
    });
    return successResponse(res,"Logout successful")
}