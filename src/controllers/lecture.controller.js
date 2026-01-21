import prisma from "../config/prisma.js"
import { successResponse, errorResponse } from "../utils/response.js"

// getLectures,
export const getLectures = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const lectures = await prisma.lecture.findMany({
            include: {
                major:{
                    include: {
                        faculty: true
                    }
                }
            }
        })

        return successResponse(res, "get lecture successful", lectures)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get Lestures", { error: error.message }, 500);
    }
}

// getLecture,
export const getLecture = async (req,res) => {
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

        const lecture = await prisma.lecture.findUnique({
            where: {id},
            include: {
                major:{
                    include: {
                        faculty: true
                    }
                }
            }
        })

        if(!lecture){
            return errorResponse(res, "lecture not found", null, 404)
        }
        return successResponse(res, "Get lecture successful", lecture)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get Lesture", { error: error.message }, 500);
    }
}

// createLecture,
export const createLecture = async (req,res) => {
    const {name, email, lectureNumber, position, majorId} = req.body
    if(!name || !email || !lectureNumber || !position || !majorId) {
        return errorResponse(res,"Data can't be empty", null, 400)
    }

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const lecture = await prisma.lecture.create({
            data: {
                name,
                email,
                lectureNumber: Number(lectureNumber),
                position,
                majorId,
            }
        })

        return successResponse(res, "lecture created", lecture)        
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to create", { error: error.message }, 500);
    }
}

// updateLecture,
export const updateLecture = async (req,res) => {
  const { id } = req.params;

    const {name, email, lectureNumber, position, majorId} = req.body
    if(!name || !email || !lectureNumber || !position || !majorId) {
        return errorResponse(res,"Data can't be empty", null, 400)
    }

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        // Cek apakah lecture dengan id tersebut ada
        const existing = await prisma.lecture.findUnique({ where: { id } });
        if (!existing) {
            return errorResponse(res, "lecture not found", null, 404);
        }
        
        const lecture = await prisma.lecture.update({
            where: {id},
            data: {
                name,
                email,
                lectureNumber,
                position,
                majorId,
            }
        })

        return successResponse(res, "lecture update", lecture)        
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to update", { error: error.message }, 500);
    }
}

// deleteLecture,
export const deleteLecture = async (req,res) => {
    const { id } = req.params;
  
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        // Cek apakah lecture dengan id tersebut ada
        const existing = await prisma.lecture.findUnique({ where: { id } });
        if (!existing) {
            return errorResponse(res, "lecture not found", null, 404);
        }
        
        const lecture = await prisma.lecture.delete({
            where: {id},
        })

        return successResponse(res, "lecture delete", lecture)        
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to delete", { error: error.message }, 500);
    }
}