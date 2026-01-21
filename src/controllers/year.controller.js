import prisma from "../config/prisma.js"
import { successResponse, errorResponse } from "../utils/response.js"

// getYears,
export const getYears = async (req,res) => {
    try {
        // Validasi hanya admin yang bisa akses
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,
                message: "Hanya role admin yang dapat mengakses",
            });
        }

        const years = await prisma.academyYear.findMany();
        return successResponse(res, "Get All years successful", years)
    } catch (error) {
        return errorResponse(res, "Failed to fetch academy years", error.message)
    }
}
// getYear,
export const getYear = async (req,res) => {
    try {
        // Validasi hanya admin yang bisa akses
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,
                message: "Hanya role admin yang dapat mengakses",
            });
        }
        const { id } = req.params
        const year = await prisma.academyYear.findUnique({where:{id}});

        // cek if existed
        if(!year){
            return errorResponse(res, "ID not found", null, 404)
        }

        return successResponse(res, "Get year by id successful", year)
    } catch (error) {
        return errorResponse(res, "Failed to fetch academy years", error.message)
    }
}

// createYear,
export const createYear = async (req,res) => {
    const { name, dateStart, dateEnd, status } = req.body

    if(!name || !dateStart || !dateEnd || status === undefined){
        return errorResponse(res, "data Can't empty", null, 401)
    }

    try {
        // Validasi hanya admin yang bisa akses
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,
                message: "Hanya role admin yang dapat mengakses",
            });
        }

        const year = await prisma.academyYear.create({
            data:{
                name,
                dateStart: new Date(dateStart),
                dateEnd: new Date(dateEnd),
                status
            }
        })
        
        return successResponse(res, "Academy Year Created", year)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "Academy Year Create Failed", error.message, 500);
    }
}

// updateYear,
export const updateYear = async (req,res) => {
    const {id} = req.params
    const { name, dateStart, dateEnd, status } = req.body

    if(!name || !dateStart || !dateEnd || status === undefined){
        return errorResponse(res, "data Can't empty", null, 401)
    }

    try {
        // Validasi hanya admin yang bisa akses
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,
                message: "Hanya role admin yang dapat mengakses",
            });
        }


        // cek if existed
        const existing = await prisma.academyYear.findUnique({where: {id}})
        if (!existing){
            return errorResponse(res, "year not found", null, 404)
        }

        const year = await prisma.academyYear.update({
            where: { id },
            data:{
                name,
                dateStart: dateStart ? new Date(dateStart) : existing.dateStart,
                dateEnd: dateEnd ? new Date(dateEnd) : existing.dateEnd,
                status
            }
        })
        
        return successResponse(res, "Academy Year updated", year)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "Academy Year updated Failed", error.message, 500);
    }
}

// deleteYear
export const deleteYear = async (req,res) => {
    const {id} = req.params

    try {
        // Validasi hanya admin yang bisa akses
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,
                message: "Hanya role admin yang dapat mengakses",
            });
        }


        // cek if existed
        const existing = await prisma.academyYear.findUnique({where: {id}})
        if (!existing){
            return errorResponse(res, "year not found", null, 404)
        }

        const year = await prisma.academyYear.delete({ where: { id } })
        
        return successResponse(res, "Academy Year deleted", year)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "Academy Year deleted Failed", error.message, 500);
    }
}