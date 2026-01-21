import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

// getCourses
export const getCourses = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const courses = await prisma.course.findMany({
            include: {
                lecture: {
                    include : {
                        major: {
                            include:{
                                faculty:true
                            }
                        }
                    }
                }
            }
        })

        return successResponse(res, "get course successful", courses)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get courses", { error: error.message }, 500);
    }
}

// getCourse,
export const getCourse = async(req,res) => {
    const {id} = req.params
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const course = await prisma.course.findUnique({
            where: { id },
            include: {
                lecture: {
                    include : {
                        major: {
                            include:{
                                faculty:true
                            }
                        }
                    }
                }
            }
        })
        if (!course) return errorResponse(res, "course not found", null, 404)

        return successResponse(res, "Get course by id successful", course)

    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get course by id", { error: error.message }, 500);
    }
}

// createCourse,
export const createCourse = async(req,res) => {
    const {name, code, lectureId, credits} = req.body
    if (!name || !code || !lectureId || !credits) {
        return errorResponse(res, "Data can't be empty", null, 400);
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

        const course = await prisma.course.create({
            data:{
                name,
                code, 
                lectureId, 
                credits : Number(credits)
            }
        })

        return successResponse(res, "course created", course)

    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to create", { error: error.message }, 500);
    }
}

// updateCourse,
export const updateCourse = async(req,res) => {
    const { id } = req.params
    const {name, code, lectureId, credits} = req.body
    if (!name || !code || !lectureId || !credits) {
        return errorResponse(res, "Data can't be empty", null, 400);
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

        // Cek apakah course dengan id tersebut ada
        const existing = await prisma.course.findUnique({ where: { id } });
        if (!existing) {
            return errorResponse(res, "course not found", null, 404);
        }

        const course = await prisma.course.update({
            where: {id},
            data:{
                name,
                code, 
                lectureId, 
                credits : Number(credits)
            }
        })

        return successResponse(res, "course updated", course)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to update", { error: error.message }, 500);
    }
}

// deleteCourse,
export const deleteCourse = async(req,res) => {
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

        // Cek apakah course dengan id tersebut ada
        const existing = await prisma.course.findUnique({ where: { id } });
        if (!existing) {
            return errorResponse(res, "course not found", null, 404);
        }

        const course = await prisma.course.delete({
            where: {id},
        })

        return successResponse(res, "course deleted", course)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to delete", { error: error.message }, 500);
    }
}