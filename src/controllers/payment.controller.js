import prisma from "../config/prisma.js"
import { successResponse, errorResponse } from "../utils/response.js"

// getAllPayments,
export const getAllPayments = async(req, res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }
        const data = await prisma.payment.findMany({
            include: { 
              student: {
                include: {
                  tfGroup: true,
                  class: {
                    include: {
                      year: true,
                    },
                  },
                  studyPlan: {
                    include: {
                      courses: true,
                    },
                  },
                },
              },
            },
            orderBy: { id: "desc" },
        });
        return successResponse(res, "Get all payment successful", data)
    } catch (error) {
        return errorResponse(res, "Failed to get Payment", error.message);
    }
}

// getPaymentById,
export const getPaymentById = async(req, res) => {
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
        const data = await prisma.payment.findUnique({
            where: {id},
            include: { 
              student: {
                include: {
                  tfGroup: true,
                  class: {
                    include: {
                      year: true,
                    },
                  },
                  studyPlan: {
                    include: {
                      courses: true,
                    },
                  },
                },
              },
            },
        });
        if(!data) return errorResponse(res, "Payment not found", null, 404)
        return successResponse(res, "Get payment by id successful", data)
    } catch (error) {
        return errorResponse(res, "Failed to get Payment by id", error.message);
    }
}

// createPayment,
export const createPayment = async(req, res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }
        const { studentId, code, status } = req.body;

        const updated = await prisma.payment.create({
            data: { studentId, code, status },
        });
        return successResponse(res, "Payment created", updated);
    } catch (error) {
        return errorResponse(res, "Failed to create Payment", error.message);
    }
}

// updatePayment,
export const updatePayment = async(req, res) => {
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
        const { studentId, code, status } = req.body;

        const existed = await prisma.payment.findUnique({where:{id}})
        if(!existed) return errorResponse(res, "data not found", null, 404)

        const updated = await prisma.payment.update({
            where: { id },
            data: { studentId, code, status },
        });
        return successResponse(res, "Payment updated", updated);
    } catch (error) {
        return errorResponse(res, "Failed to update Payment", error.message);
    }
}

// deletePayment,
export const deletePayment = async(req, res) => {
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
        
        const existed = await prisma.payment.findUnique({where:{id}})
        if(!existed) return errorResponse(res, "data not found", null, 404)

        const data = await prisma.payment.delete({
            where: {id},
        });

        return successResponse(res, "delete payment successful", data)
    } catch (error) {
        return errorResponse(res, "Failed to delete Payment", error.message);
    }
}