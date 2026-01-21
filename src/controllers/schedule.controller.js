import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

// getSchedules,
export const getSchedules = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "hanya role admin yang dapat mengakses",
            });
        }

        const schedules = await prisma.schedule.findMany({
            include:{
                class:{
                    include:{
                        year: true,
                        major:{
                            include:{
                                faculty:true
                            }
                        }
                    }
                },
                course: {
                    include: {
                        lecture: true
                    }
                }
            }
        })

        return successResponse(res,"get schedules successful", schedules)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get schedules", { error: error.message }, 500);
    }
}

// getSchedule,
export const getSchedule = async (req,res) => {
    const { id } = req.params;

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "hanya role admin yang dapat mengakses",
            });
        }

        const schedule = await prisma.schedule.findUnique({
            where: {id},
            include:{
                class:{
                    include:{
                        year: true,
                        major:{
                            include:{
                                faculty:true
                            }
                        }
                    }
                },
                course: {
                    include: {
                        lecture: true
                    }
                }
            }
        })

        if (!schedule) return errorResponse(res,"schedule not found", null,404)
        
        return successResponse(res,"get schedule by id successful", schedule)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get schedule by id", { error: error.message }, 500);
    }
}

// createSchedule,
export const createSchedule = async (req,res) => {
    const { timeStart, timeEnd, day, classId, courseId } = req.body;
    
    if (!timeStart || !timeEnd || !day || !classId || !courseId)
    return errorResponse(res, "Data can't be empty", null, 401);

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "hanya role admin yang dapat mengakses",
            });
        }

        const startDate = new Date(timeStart);
        const endDate = new Date(timeEnd);

        const schedule = await prisma.schedule.create({
            data: {
                timeStart: startDate,
                timeEnd: endDate,
                day,
                classId,
                courseId,
            },
        })
        
        return successResponse(res,"create schedule successful", schedule)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to create schedule", { error: error.message }, 500);
    }
}

// updateSchedule,
export const updateSchedule = async (req,res) => {
    const { id } = req.params;
    const { timeStart, timeEnd, day, classId, courseId } = req.body;
    
    if (!timeStart || !timeEnd || !day || !classId || !courseId)
    return errorResponse(res, "Data can't be empty", null, 401);

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "hanya role admin yang dapat mengakses",
            });
        }

        const existing = await prisma.schedule.findUnique({where:{id}})
        if(!existing) return errorResponse(res, "schedule not foudn", null, 404)

        const startDate = new Date(timeStart);
        const endDate = new Date(timeEnd);

        const schedule = await prisma.schedule.update({
            where:{id},
            data: {
                timeStart: startDate,
                timeEnd: endDate,
                day,
                classId,
                courseId,
            },
        })
        
        
        return successResponse(res,"schedule updated", schedule)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "schedule updated", { error: error.message }, 500);
    }
}

// deleteSchedule,
export const deleteSchedule = async (req,res) => {
    const { id } = req.params;

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "hanya role admin yang dapat mengakses",
            });
        }

        const existing = await prisma.schedule.findUnique({where:{id}})
        if(!existing) return errorResponse(res, "schedule not foudn", null, 404)
        
        const schedule = await prisma.schedule.delete({
            where:{id}
        })
        
        return successResponse(res,"schedule deleted", schedule)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "schedule deleted", { error: error.message }, 500);
    }
}