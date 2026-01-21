import prisma from "../config/prisma.js"
import bcrypt from "bcrypt"
import { successResponse, errorResponse } from "../utils/response.js"

// getAllUsers,
export const getAllUsers = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        const users = await prisma.userSiakad.findMany({
            orderBy: {createdAt: "desc"}
        })
        return successResponse(res, "All users fetched", users)
    } catch (error) {
        return errorResponse(res, "failed to fetch users", error.message, 500)
    }
}

// getUserById,
export const getUserById = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        const { id } = req.params;

        const user = await prisma.userSiakad.findUnique({
            where: {id},
        })
        if (!user) return errorResponse(res, "User not found", null, 404)
        return successResponse(res, "get user by id sucessfull", user)
    } catch (error) {
        return errorResponse(res, "failed to get user by id", error.message, 500)
    }
}

// getUsersByRole,
export const getUsersByRole = async(req,res) => {
    const { role } = req.params;
    
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        const user = await prisma.userSiakad.findMany({
            where: {role}
        })

        return successResponse(res, "get user by role sucessfull", user)
    } catch (error) {
        return errorResponse(res, "failed to get user by role", error.message, 500)
    }
}

// createUser,
export const createUser = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        const {name, email, password, role } = req.body

        const existed = await prisma.userSiakad.findUnique({where: {email}})
        if(existed) return errorResponse(res,"Email already used", null, 400)
        
        const hashed = await bcrypt.hash(password,10)

        const user = await prisma.userSiakad.create({
            data:{
                name,
                email,
                password: hashed,
                role
            }
        })

        return successResponse(res,"User created successfully", {
            id:user.id,
            name:user.name,
            email:user.email,
            role:user.role,
        })
    } catch (error) {
        return errorResponse(res, "failed to create", error.message, 500)
    }
}

// updateUser,
export const updateUser = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        
        const { id } = req.params;
        const {name, email, password, role } = req.body

        const user = await prisma.userSiakad.findUnique({where: {id}})
        if(!user) return errorResponse(res, "user not found", null, 404)
    
        const dataToUpdate = {name, email, role}
        if(password){
            const hashed = await bcrypt.hash(password, 10)
            dataToUpdate.password = hashed
        }

        const updatedUser = await prisma.userSiakad.update({
            where:{id},
            data: dataToUpdate
        })
        
        return successResponse(res,"user updated successfully", updatedUser)
    } catch (error) {
        return errorResponse(res, "failed to update", error.message, 500)
    }
}

// deleteUser,
export const deleteUser = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        
        const { id } = req.params;

        const user = await prisma.userSiakad.findUnique({where: {id}})
        if(!user) return errorResponse(res, "user not found", null, 404)

        const updatedUser = await prisma.userSiakad.delete({
            where:{id},
        })
        
        return successResponse(res,"user delete successfully", updatedUser)
    } catch (error) {
        return errorResponse(res, "failed to delete", error.message, 500)
    }
}