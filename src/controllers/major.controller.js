import prisma from "../config/prisma.js"
import { successResponse,errorResponse } from "../utils/response.js"

// getAllMajors,
export const getAllMajors = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }

        const majors = await prisma.major.findMany({
            include: {faculty:true}
        })

        return successResponse(res, "Get all Majors successful", majors)
    } catch (error) {
        return errorResponse(res, "Get Major failed", {error : error.message}, 500)
    }
}

// getMajorByFacultyID,
export const getMajorByFacultyID = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }

        const { id } = req.params
        const major = await prisma.major.findMany({
            where: { facultyId: id },
        });

        if (!major || major.length === 0) {
            return errorResponse(
            res,
            "No majors found for this faculty",
            null,
            404
            );
        }

        return successResponse(
            res,
            "Get majors by FacultyID successful",
            major
        );
    } catch (error) {
        return errorResponse(res, "Get major by faculyID failed", {error: error.message}, 500)
    }
}

// getMajorById,
export const getMajorById = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }

        const { id } = req.params
        const major = await prisma.major.findUnique({
            where: {id},
            include: {faculty:true}
        })
        if (!major){
            return errorResponse(res,"major not found", null, 404)
        }

        return successResponse(res, "Get all by id successful", major)
    } catch (error) {
        return errorResponse(res, "Get Major failed", {error : error.message}, 500)
    }
}

// createMajor,
export const createMajor = async (req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                success: false,                
                message: "Only admin can access",
            });
        }

        const { name, code, facultyId } = req.body;

        const major = await prisma.major.create({
            data: {
                name, code, facultyId
            }
        })
        
        return successResponse(res, "Create Major successful", major);
    } catch (error) {
        return errorResponse(res, "Create Major failed", {error : error.message}, 500)
    }
}

// updateMajor,
export const updateMajor = async (req,res) => {
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
        const { name, code, facultyId } = req.body;

        //chek if existed
        const major = await prisma.major.findUnique({ where: { id } })
        if (!major) return errorResponse(res,"major not found", null, 404)

        // Data yang akan diupdate
        const updatedData = {
            name,
            code,
            facultyId,
        }

        //update data
        const updatedMajor = await prisma.major.update({
            where: {
              id
            },
            data: updatedData
        })
        
        return successResponse(res, "Update Major successful", updatedMajor);
    } catch (error) {
        return errorResponse(res, "Update Major failed", {error : error.message}, 500)
    }
}

// deleteMajor,
export const deleteMajor = async (req,res) => {
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

        //chek if existed
        const major = await prisma.major.findUnique({ where: { id } })
        if (!major) return errorResponse(res,"major not found", null, 404)

        //update data
        const updatedMajor = await prisma.major.delete({
            where: {
              id
            }
        })
        
        return successResponse(res, "Delete Major successful", updatedMajor);
    } catch (error) {
        return errorResponse(res, "Delete Major failed", {error : error.message}, 500)
    }
}