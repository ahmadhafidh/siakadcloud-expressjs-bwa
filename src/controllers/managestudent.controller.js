import prisma from "../config/prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { successResponse, errorResponse } from "../utils/response.js";
import cookieOptions from "../utils/cookieOptions.js";

// ENV
const JWT_SECRET = process.env.JWT_SECRET || "secret";

export const registerStudent = async (req,res) => {
    try {

        const {studentNumber, password} = req.body

        // Validasi input
        if (!studentNumber || !password) {
            return errorResponse(
                res,
                "Student number and password are required",
                null,
                400
            );
        }

        // Cari student berdasarkan studentNumber
        const student = await prisma.student.findFirst({
            where: { studentNumber },
        });

        if (!student) {
            return errorResponse(res, "Student not found", null, 404);
        }
      
        // Cek apakah password sudah diisi sebelumnya
        if (student.password) {
            return errorResponse(res, "Password is already set", null, 400);
        }

        //hash password sebelum disimpan
        const hashed = await bcrypt.hash(password, 10)

        // simpan user baru
        const updated = await prisma.student.update({
            where: { id: student.id },
            data: { password: hashed },
        })

        return successResponse(res, "Password registered successfully", {
            id: updated.id,
            studentNumber: updated.studentNumber,
            role: updated.role,
            passwordSet: true,
        });
        
    } catch (error) {
        return errorResponse(
            res,
            "Failed to register password",
            { error: error.message },
            500
        );
    }
}

export const loginStudent = async (req,res) => {
    try {
        const { studentNumber, password } = req.body;
        
        // Validasi input
        if (!studentNumber || !password) {
            return errorResponse(
            res,
            "Student number and password are required",
            null,
            400
            );
        }

        // Cari student
        const student = await prisma.student.findFirst({
            where: { studentNumber },
        });
        if (!student) {
            return errorResponse(res, "Student number not found", null, 401);
        }

        // Cocokkan password
        const match = await bcrypt.compare(password, student.password);
        if (!match) {
            return errorResponse(res, "Incorrect password", null, 401);
        }
        
        // Buat JWT Token
        const token = jwt.sign(
            { id:student.id, role: student.role},
            JWT_SECRET,
            { expiresIn: "1d" }
        )

        // simpan token di cookie
        res.cookie("token", token, cookieOptions(req))

        return successResponse(res,"Login successful", {
            id:student.id,
            studentNumber:student.name,
            role:student.role,
            token:token,
        })
    } catch (error) {
        return errorResponse(res, "Failed to login", error.message, 500)
    }
}

export const getScheduleById = async(req,res) => {
    try {
        const tokenCredential = req.user;
        const { id } = tokenCredential;
    
        if (tokenCredential.role !== "student") {
          return res.status(403).json({
            success: false,
            message: "hanya role student yang dapat mengakses",
          });
        }
        console.log(tokenCredential)
        const schedules = await prisma.schedule.findMany({
            where: {
                class:{
                    student:{
                        some:{id:id}
                    }
                }
            },
            include:{
                class:{
                    include:{
                        year:true,
                        major:true
                    }
                },
                course: {
                    include: {
                      lecture: true,
                    },
                },
            }
        })

        if (!schedules || schedules.length === 0) {
            return errorResponse(res, "schedule not found", null, 404);
        }

        const formatted = schedules.map((item) => ({
            id: item.id,
            timestart: item.timeStart,
            timeend: item.timeEnd,
            day: item.day,
            classId: item.classId,
            courseId: item.courseId,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt,
            class: {
                id: item.class.id,
                name: item.class.name,
                majorId: item.class.majorId,
                yearId: item.class.yearId,
                createdAt: item.class.createdAt,
                updatedAt: item.class.updatedAt,
                year: item.class.year,
                major: {
                  id: item.class.major.id,
                  name: item.class.major.name,
                  code: item.class.major.code,
                  createdAt: item.class.major.createdAt,
                  updatedAt: item.class.major.updatedAt,
                },
            },
            course: {
                id: item.course.id,
                name: item.course.name,
                code: item.course.code,
                lectureId: item.course.lectureId,
                lectureName: item.course.lecture?.name || null,
                lectureNumber: item.course.lecture?.lectureNumber || null,
                credits: item.course.credits,
                createdAt: item.course.createdAt,
                updatedAt: item.course.updatedAt,
            },
        }));

        return successResponse(res, "Get schedule successful", formatted)
    } catch (error) {
        return errorResponse(
            res,
            "Failed to get schedule",
            { error: error.message },
            500
        );
    }
}

// createStudyPlan,
export const createStudyPlan = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        const { id } = tokenCredential;

        if (tokenCredential.role !== "student") {
            return res.status(403).json({
                success: false,
                message: "Only mahasiswa can access",
            });
        }

        const {courseId, ...rest} = req.body

        // bersihkan courseId, hilangkan spasi berlebih, filter kosong
        const courseIds = courseId
        ? courseId
            .split(",")
            .map((id) => id.trim())
            .filter((id) => id !== "")
        :[]

        if (courseIds.length === 0) {
            return errorResponse(res, "At least one course is required", null, 400);
        }

        //
        // 1. buat studyPlan
        const studyPlan = await prisma.studyPlan.create({
            data:{
                studentId: id,
                ...rest
            }
        })
  
        //2. masukkan data ke studyPlancourse
        const studyPlanCourses = courseIds.map(cid => ({
            studyPlanId: studyPlan.id,
            courseId: cid
        }))
    
        await prisma.studyPlanCourse.createMany({
            data: studyPlanCourses
        });
  
        return successResponse(res, "Study plan created", {
            ...studyPlan,
            courses: studyPlanCourses
        });
    } catch (error) {
        return errorResponse(res, "Failed to create Study", error.message, 500);
    }
}

// getStudyPlanById,
export const getStudyPlanById = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "student") {
            return res.status(403).json({
                    success: false,                
                    message: "Only mahasiswa can access",
            });
        }
        const {id} = tokenCredential
        const studyPlan = await prisma.studyPlan.findMany({
            where:{studentId: id},
            include: {
                student: {
                  include: {
                    class: {
                      include: {
                        year: true,
                      },
                    },
                  },
                },
                courses: {
                  include: {
                    course: {
                      include: {
                        lecture: true,
                      },
                    },
                  },
                },
            },
        });

        if (!studyPlan || studyPlan.length === 0) {
            return errorResponse(res, "Study plan not found", null, 404);
        }

        // Mapping data supaya aman dan sesuai format
        const formattedData = studyPlan.map((plan) => ({
            id: plan.id,
            status: plan.status,
            createdAt: plan.createdAt,
            studentId: plan.student.id,
            studentName: plan.student.name,
            studentNumber: plan.student.studentNumber,
            semester: plan.student.semester,
            year: plan.student.class?.year?.name,
            gpa: plan.gpa,

            courses: plan.courses.map((c) => ({
                id: c.id,
                code: c.course?.code || null,
                name: c.course?.name || null,
                credits: c.course?.credits || null, // sesuai request pakai "credits"
                score: c.score,
                lectureId: c.course.lecture.id,
                lectureName: c.course.lecture.name,
            })),
        }));

        return successResponse(
            res,
            "Study plan fetched successfully",
            formattedData
        );
    } catch (error) {
        return errorResponse(res,"failed to Get data by id")
    }
}

// getAllCourses
export const getAllCourses = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "student") {
            return res.status(403).json({
                    success: false,                
                    message: "Only mahasiswa can access",
            });
        }

        const student = await prisma.student.findUnique({
            where: {id: tokenCredential.id},
            include:{
                class:{include: {year:true}}
            }
        })

        if (!student) {
            return errorResponse(res, "Student not found", null, 404);
        }

        // Ambil semua course
        const courses = await prisma.course.findMany({
            include: {
                lecture: {
                    include: {
                        major: {
                            include: { faculty: true },
                        },
                    },
                },
            },
        });

        // Format data sesuai request
        const formattedData = courses.map((course)=> ({
            studentId: student.id,
            studentName: student.name,
            studentNumber: student.studentNumber,
            year: student.class?.year?.name || null,
            course:{
                id: course.id,
                code: course.code,
                name: course.name,
                credits: course.credits,
                lectureId: course.lecture.id,
                lectureName: course.lecture.name,
                majorName: course.lecture.major.name,
                facultyName: course.lecture.major.faculty.name,
            }
        }))
        return successResponse(res,"Get course successful", formattedData)
    } catch (error) {
        return errorResponse(res,"failed to Get all courses")
    }
}

// getPaymentById,
export const getPaymentById = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        const {id} = tokenCredential

        if (tokenCredential.role !== "student") {
            return res.status(403).json({
                    success: false,                
                    message: "Only mahasiswa can access",
            });
        }

        const data = await prisma.payment.findMany({
            where:{
                student:{id:id}
            },
            include:{
                student:{
                    include:{
                        tfGroup:true,
                        class:{
                            include:{
                                major:{
                                    include:{
                                        faculty:true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        })
        if (!data) return errorResponse(res, "Payment not found", null, 404);
        return successResponse(res, "Payment detail", data);
    } catch (error) {
        return errorResponse(res,"failed to getPaymentById")
    }
}

// UpdatePaymentById,
export const UpdatePaymentById = async(req,res) => {
    const { id } = req.params; // id = studyPlanId
    const { status } = req.body;
    const tokenCredential = req.user;

    try {
        // validasi tidak bisa melakukan operasi ini
        if (tokenCredential.role !== "student") {
            return res.status(403).json({
                    success: false,                
                    message: "Only mahasiswa can access",
            });
        }

        // Pastikan studyPlan ada
        const existingPayment = await prisma.payment.findUnique({
            where: { id },
        });

        if (!existingPayment) {
            return res.status(404).json({
              success: false,
              message: "Payment not found",
            });
        }

        const updatedPayment = await prisma.payment.update({
            where:{id},
            data:{
                ...(status !== undefined && { status }),
            }
        })
        return res.status(200).json({
            success: true,
            message: "Payment updated successfully",
            data: updatedPayment,
        });
    } catch (error) {
        return errorResponse(res,"failed to UpdatePaymentById")
    }
}

// getStudentStats
export const getStudentStats = async(req,res) => {
    const tokenCredential = req.user;
    const { id } = tokenCredential;
    try {
        // validasi tidak bisa melakukan operasi ini
        if (tokenCredential.role !== "student") {
            return res.status(403).json({
                    success: false,                
                    message: "Only mahasiswa can access",
            });
        }

        // Jalankan query paralel
        const [student, studyPlans, schedules, upcomingTimeline] = 
            await Promise.all([
                // 1. data student
                prisma.student.findUnique({
                    where: { id },
                    select: {
                        id: true,
                        name: true,
                        email: true,
                        class: {
                          select: {
                            id: true,
                            name: true,
                            major: {
                              select: {
                                id: true,
                                name: true,
                                faculty: { select: { id: true, name: true } },
                              },
                            },
                          },
                        },
                    },
                }),

                // 2. Ambil semua studyPlan + courses + attendance
                prisma.studyPlanCourse.findMany({
                    where: { studyPlan: { studentId: id } },
                    select: {
                      id: true,
                      attendance1: true,
                      attendance2: true,
                      attendance3: true,
                      attendance4: true,
                      attendance5: true,
                      attendance6: true,
                      attendance7: true,
                      attendance8: true,
                      attendance9: true,
                      attendance10: true,
                      attendance11: true,
                      attendance12: true,
                      attendance13: true,
                      attendance14: true,
                      attendance15: true,
                      attendance16: true,
                      course: {
                        select: {
                          id: true,
                          name: true,
                          code: true,
                          credits: true,
                          lecture: { select: { name: true } },
                        },
                      },
                      studyPlan: { select: { status: true } },
                    },
                }),

                // 3. Ambil schedules dari semua course yang diambil student
                prisma.schedule.findMany({
                    where: {
                        course: {
                            studyPlans: { some: { studyPlan: { studentId: id } } },
                        },
                    },
                    select: {
                        id: true,
                        day: true,
                        timeStart: true,
                        timeEnd: true,
                        class: { select: { name: true } },
                        course: { select: { name: true, code: true, credits: true } },
                    },
                }),

                // 4. Ambil upcoming timeline
                prisma.timeLine.findMany({
                    where: {
                    date: {
                        gte: new Date(), // hanya yang tanggal >= sekarang
                    },
                    },
                    orderBy: { date: "asc" }, // urutkan dari yang paling dekat
                }),
            ])

            // Format studyPlans
            const formattedStudyPlans = studyPlans.map((spc) => ({
                id: spc.course.id,
                name: spc.course.name,
                code: spc.course.code,
                credits: spc.course.credits,
                lecture: spc.course.lecture?.name,
                status: spc.studyPlan.status,
            }));

            // Format schedules
            const formattedSchedules = schedules.map((s) => ({
                id: s.id,
                courseName: s.course.name,
                courseCode: s.course.code,
                courseCredits: s.course.credits,
                class: s.class.name,
                day: s.day,
                timeStart: s.timeStart,
                timeEnd: s.timeEnd,
            }));

            // Hitung absensi (gabung semua studyPlanCourse)
            const allAttendances = studyPlans.flatMap((spc) => [
                spc.attendance1,
                spc.attendance2,
                spc.attendance3,
                spc.attendance4,
                spc.attendance5,
                spc.attendance6,
                spc.attendance7,
                spc.attendance8,
                spc.attendance9,
                spc.attendance10,
                spc.attendance11,
                spc.attendance12,
                spc.attendance13,
                spc.attendance14,
                spc.attendance15,
                spc.attendance16,
            ]);
        
            const absensiStudent = {
                jumlahHadir: allAttendances.filter((a) => a === "hadir").length,
                jumlahIzin: allAttendances.filter((a) => a === "izin").length,
                jumlahSakit: allAttendances.filter((a) => a === "sakit").length,
                jumlahAlfa: allAttendances.filter((a) => a === "alfa" || a === null)
                .length,
            };

            return successResponse(
                res, 
                "Get student stats successful",
                {   
                    profile: student,
                    schedules: formattedSchedules,
                    studyPlans: formattedStudyPlans,
                    absensiStudent: [absensiStudent],
                    upcomingTimeline,
                }
            )
    } catch (error) {
        return errorResponse(res,"failed to get dashboard student data")
    }
}