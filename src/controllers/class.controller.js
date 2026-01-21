import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

// getclasses,
export const getclasses = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }
        const classrooms = await prisma.class.findMany({
            include: {
                major: true,
                year: true,
            }
        })
        return successResponse(res, "get classroom successful",classrooms)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get classrooms", { error: error.message }, 500);
    }
}

// getclassroom,
export const getclassroom = async (req,res) => {
    const { id } = req.params

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }
        const classroom = await prisma.class.findUnique({
            where: {id},
            include: {
                major: true,
                year: true,
            }
        })

        if(!classroom) {
            return errorResponse(res, "Classroom not found", null, 404)
        }

        return successResponse(res, "Get classroom successful",classroom)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get classroom", { error: error.message }, 500);
    }
}
// createClassroom,
export const createClassroom = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const {name, majorId, yearId } = req.body
        if (!name || !majorId || !yearId){
            return errorResponse(res, "Data can't be empty", null, 401)
        }

        const classroom = await prisma.class.create({
            data: {name, majorId, yearId}
        })

        return successResponse(res, "classroom created succesfully", classroom)

    } catch (error) {
        return errorResponse(res, "Failed to create classroom", error.message, 500)
    }
}
// updateClassroom,
export const updateClassroom = async(req,res) => {
    const { id } = req.params
    const {name, majorId, yearId} = req.body
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const existing = await prisma.class.findUnique({where:{id}})

        if (!existing){
            return errorResponse(res, "classroom not found", null, 404);
        }

        const classroom = await prisma.class.update({
            where: {id},
            data: {name, majorId, yearId}
        })

        return successResponse(res, "classroom updated", classroom)
    } catch (error) {
        return errorResponse(res, "failed update", {error: error.message}, 500)
    }
}

// deleteClassroom,
export const deleteClassroom = async(req,res) => {
    const { id } = req.params
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const existing = await prisma.class.findUnique({where:{id}})

        if (!existing){
            return errorResponse(res, "classroom not found", null, 404);
        }

        const classroom = await prisma.class.delete({
            where: {id}
        })

        return successResponse(res, "classroom deleted", classroom)
    } catch (error) {
        return errorResponse(res, "failed delete", {error: error.message}, 500)
    }
}