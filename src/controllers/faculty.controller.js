import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

// getFaculties, 
export const getFaculties = async (req,res) => {
    try {
        // validate role must be admin
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin"){
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            })
        }
        // console.log(tokenCredential)
        const faculties = await prisma.faculty.findMany()
        return successResponse(res, "Get faculty successful", faculties)
    } catch (error) {
        return errorResponse(res, "Failed to get faculties", error.message, 500)
    }
}

// getFaculty, 
export const getFaculty = async (req,res) => {
    try {
        // validate role must be admin
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin"){
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            })
        }
        const { id } = req.params
        const faculty = await prisma.faculty.findUnique({ where: { id } })

        if (!faculty){
            return errorResponse(res,"ID not found", null, 404)
        }

        return successResponse(res, "Get faculty successful", faculty)
    } catch (error) {
        return errorResponse(res, "Failed to get faculties", error.message, 500)
    }
}

// createFaculty,
export const createFaculty = async (req, res) => {
    try {
        // validate role must be admin
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin"){
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            })
        }
        const {name, code} = req.body

        if(!name || !code) {
            return errorResponse(res, "name & code can't be null", null)
        }

        const faculty = await prisma.faculty.create({
            data: {name, code}
        })
        return successResponse(res, "Faculty created", faculty, 201)

    } catch (error) {
        return errorResponse(res, "Failed to create faculty", error.message, 500)
    }

}

// updateFaculty,
export const updateFaculty = async (req, res) => {
    const { id } = req.params
    const { name, code } = req.body

    try {
        // validate role must be admin
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin"){
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            })
        }

        //check if existed
        const existing = await prisma.faculty.findUnique( { where: { id } } )
        if(!existing){
            return errorResponse(res, "faculty not found", null, 404)
        }

        //update data
        const faculty = await prisma.faculty.update({
            where: {id},
            data: {name, code}

        })

        return successResponse(res, "faculty updated", faculty)
    } catch (error) {
        return errorResponse(res, "failed", {error:error.message}, 500)
    }
}

// deleteFaculty,
export const deleteFaculty = async (req, res) => {
    const { id } = req.params

    try {
        // validate role must be admin
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin"){
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            })
        }

        //check if existed
        const existing = await prisma.faculty.findUnique( { where: { id } } )
        if(!existing){
            return errorResponse(res, "faculty not found", null, 404)
        }

        //delete data
        const faculty = await prisma.faculty.delete({ where: { id } })
        return successResponse(res, "faculty deleted", faculty)
    } catch (error) {
        return errorResponse(res, "Failed to delete faculty", {error:error.message}, 500)
    }
}