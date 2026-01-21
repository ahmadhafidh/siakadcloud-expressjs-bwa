import prisma from "../config/prisma.js"
import { successResponse, errorResponse } from "../utils/response.js"


// getAllTfGroups,
export const getAllTfGroups = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        const groups = await prisma.tfGroup.findMany({
            orderBy: {createdAt: "desc"}
        })
        return successResponse(res, "get all data successfully", groups)
    } catch (error) {
        return errorResponse(res,"failed get all data", error.message)
    }
}

// getTfGroupById,
export const getTfGroupById = async (req,res) => {
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
        const group = await prisma.tfGroup.findUnique({where: {id}})
        if (!group) return errorResponse(res, "TfGroup not found". null, 404);
        return successResponse(res, "get data by id successfully", group)
    } catch (error) {
        return errorResponse(res,"failed get data by id", error.message)
    }
}

// createTfGroup,
export const createTfGroup = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        const {group, amount} = req.body
        const created = await prisma.tfGroup.create({
            data: {group, amount}
        })
        return successResponse(res, "created successfully", created)
    } catch (error) {
        return errorResponse(res, "failed to create", error.message)
    }
}
// updateTfGroup,
export const updateTfGroup = async (req,res) => {
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
        const {group, amount} = req.body

        //cek if existed
        const existed = await prisma.tfGroup.findUnique({where:{id}})
        if (!existed) return errorResponse(res, "data not found", null, 404)

        const updated = await prisma.tfGroup.update({
            where: { id },
            data: {group, amount}
        })
        return successResponse(res, "updated successfully", updated)
    } catch (error) {
        return errorResponse(res, "failed to update", error.message)
    }
}
// deleteTfGroup,
export const deleteTfGroup = async (req,res) => {
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

        //cek if existed
        const existed = await prisma.tfGroup.findUnique({where:{id}})
        if (!existed) return errorResponse(res, "data not found", null, 404)

        const deleted = await prisma.tfGroup.delete({
            where: { id }
        })
        return successResponse(res, "deleted successfully", deleted)

    } catch (error) {
        return errorResponse(res, "failed to delete", error.message)
    }
}