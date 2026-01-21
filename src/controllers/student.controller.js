import prisma from "../config/prisma.js"
import { successResponse, errorResponse } from "../utils/response.js"

// getStudents,
export const getStudents = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        const students = await prisma.student.findMany({
            include: {
              class: {
                include: {
                  major: {
                    include: {
                      faculty: true
                    }
                  },
                  year: true
                }
              },
              tfGroup: true
            }
        });

        return successResponse(res, "get student successful", students)
    } catch (error) {
        console.error(error);
        return errorResponse(res, "failed to get students", { error: error.message }, 500);
    }
}

// getStudent,
export const getStudent = async(req,res) => {
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
        
        const student = await prisma.student.findUnique({
            where: { id },
            include: {
                class: {
                  include: {
                    major: {
                      include: {
                        faculty: true
                      }
                    },
                    year: true
                  }
                },
                tfGroup: true
            }
        })

        if (!student) return errorResponse(res, "student not found", null, 401)

        return successResponse(res, "Get student successful", student)
    } catch (error) {
        return errorResponse(res, "failed to get student by id", { error: error.message }, 500);
    }
}

// createStudent,
export const createStudent = async(req,res) => {
    const { name, email, semester, classOf, tfGroupId, classId } = req.body;
    if (!name || !email || !semester || !classOf || !tfGroupId || !classId) {
        return errorResponse(res, "Data can't be empty", null, 400);
    }

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        //Generate studentNumber uniq
        let studentNumber
        let exists = true

        while (exists) {
            const now = new Date()
            const year = now.getFullYear()
            const month = String(now.getMonth()+1).padStart(2,"0")
            const day = String(now.getDate()).padStart(2, "0");
            const randomDigits = Math.floor(1000000 + Math.random() * 9000000); // 7 digit random

            studentNumber = `${year}${month}${day}${randomDigits}`; // 20251107 1234567

            const check = await prisma.student.findUnique({
                where:{studentNumber}
            })
            if (!check) exists = false
        }

        // Save Student Data
        const student = await prisma.student.create({
            data: {
                name,
                email,
                studentNumber,
                semester: Number(semester),
                classOf: Number(classOf),
                tfGroupId,
                classId,
            },
        });

        return successResponse(res,"Student created", student)
    } catch (error) {
        return errorResponse(res, "failed to create", { error: error.message }, 500);
    }
}

// updateStudent,
export const updateStudent = async(req,res) => {

    const { id } = req.params;
    const {name, email, studentNumber, semester, classOf, tfGroupId, classId} = req.body

    // Validasi field wajib (kecuali studentNumber)
    if (!name || !email || !semester || !classOf || !tfGroupId || !classId) {
        return errorResponse(res, "Required fields can't be empty", null, 400);
    }

    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "hanya role admin yang dapat mengakses",
            });
        }

        //check if existed
        const existing = await prisma.student.findUnique({where: {id}})
        if (!existing) {
            return errorResponse(res, "student not found", null, 404)
        }

        const updateData = {
            name,
            email,
            semester: Number(semester),
            classOf: Number(classOf),
            tfGroupId,
            classId
        }

        // Hanya update studentNumber jika dikirim
        if (studentNumber !== undefined && studentNumber !== "") {
            updateData.studentNumber = studentNumber;
        }

        // update student
        const student = await prisma.student.update({
            where: {id},
            data: updateData
        })

        return successResponse(res,"student updated", student)
    } catch (error) {
        return errorResponse(res, "failed to update", { error: error.message }, 500);
    }
}

// deleteStudent,
export const deleteStudent = async(req,res) => {

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

        //check if existed
        const existing = await prisma.student.findUnique({where: {id}})
        if (!existing) {
            return errorResponse(res, "student not found", null, 404)
        }

        // update student
        const student = await prisma.student.delete({where: {id}})

        return successResponse(res,"student deleted", student)
    } catch (error) {
        return errorResponse(res, "failed to deleted", { error: error.message }, 500);
    }
}
