import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

// showTimeline,
export const showTimeline = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }

        const timelines = await prisma.timeLine.findMany({
            orderBy: {date:"desc"}
        })
        return successResponse(res,"get all Timeline successful", timelines)
    } catch (error) {
        console.error("Error fetching timeline:", error);
        return errorResponse(res, "Failed to getall timeline", error.message);
    }
}

// createTimeline,
export const createTimeline = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }
        const { name, date } = req.body;
        if (!name || !date) {
            return errorResponse(res, "Name and date are required");
        }

        const newTimeline = await prisma.timeLine.create({
            data: {
              name,
              date: new Date(date) // pastikan tipe DateTime
            }
        });
        return successResponse(res, "Timeline created successfully", newTimeline);
    } catch (error) {
        console.error("Error fetching timeline:", error);
        return errorResponse(res, "Failed to create timeline", error.message);
    }
}

// updateTimeline,
export const updateTimeline = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }
        const { id } = req.params;
        const { name, date } = req.body;

        const newTimeline = await prisma.timeLine.update({
            where:{id},
            data: {
                ...(name && { name }),
                ...(date && { date: new Date(date) })
            }
        });
        return successResponse(res, "Timeline updated successfully", newTimeline);
    } catch (error) {
        console.error("Error fetching timeline:", error);
        return errorResponse(res, "Failed to update timeline", error.message);
    }
}

// deleteTimeline
export const deleteTimeline = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }
        const { id } = req.params;

        const newTimeline = await prisma.timeLine.delete({
            where:{id},
        });
        return successResponse(res, "Timeline deleted successfully", newTimeline);
    } catch (error) {
        console.error("Error fetching timeline:", error);
        return errorResponse(res, "Failed to delete timeline", error.message);
    }
}