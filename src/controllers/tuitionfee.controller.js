import prisma from "../config/prisma.js";
import { successResponse,errorResponse } from "../utils/response.js";

// getAllTuitionFees,
export const getAllTuitionFees = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        const data = await prisma.tuitionFee.findMany({
            include: {
              student: {
                include: {
                  class: true
                }
              }
            },
            orderBy: { createdAt: "desc" },
        });
        return successResponse(res,"get all data successful", data)
    } catch (error) {
        return errorResponse(res, "Failed to getAll Tuition Fee", error.message);
    }
}

// getTuitionFeeById,
export const getTuitionFeeById = async(req,res) => {
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
        const data = await prisma.tuitionFee.findUnique({
            where:{id},
            include: {
              student: {
                include: {
                  class: true
                }
              }
            },
        });

        if (!data) return errorResponse(res,"data not found", null, 404)

        return successResponse(res,"get data byid successful", data)

    } catch (error) {
        return errorResponse(res, "Failed to get byid", error.message);
    }
}

// createTuitionFee,
export const createTuitionFee = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }
        const { studentId, status } = req.body;
        const created = await prisma.tuitionFee.create({
            data:{
                studentId,
                status
            }
        })
        return successResponse(res, "Tuition Fee created", created)
    } catch (error) {
        return errorResponse(res, "Failed to create Tuition Fee", error.message);
    }
}

// updateTuitionFee,
export const updateTuitionFee = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        const {id} = req.params
        const {studentId, status} = req.body

        const existed = await prisma.tuitionFee.findUnique({where:{id}})
        if (!existed) return errorResponse(res, "data not found", 404)

        const updated = await prisma.tuitionFee.update({
            where:{id},
            data:{
                studentId,
                status,
            },
        })
        return successResponse(res, "Tuition Fee updated", updated);
    } catch (error) {
        return errorResponse(res, "Failed to update Tuition Fee", error.message);
    }
}

// deleteTuitionFee,
export const deleteTuitionFee = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        const {id} = req.params

        const existed = await prisma.tuitionFee.findUnique({where:{id}})
        if (!existed) return errorResponse(res, "data not found", 404)
        
        const deleted = await prisma.tuitionFee.delete({
            where:{id},
        })
        return successResponse(res, "Tuition Fee deleted", deleted);
    } catch (error) {
        return errorResponse(res, "Failed to delete Tuition Fee", error.message);
    }
}