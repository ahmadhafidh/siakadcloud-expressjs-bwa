import prisma from "../config/prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { successResponse, errorResponse } from "../utils/response.js";
import cookieOptions from "../utils/cookieOptions.js";


// ENV
const JWT_SECRET = process.env.JWT_SECRET || "secret";

// createLecture, //register
export const createLecture = async(req,res) => {
    try {
        const {email, password} = req.body

        // validate input
        if(!email || !password){
            return errorResponse(res,"email and password are required", null, 400)
        }

        // cek lecture berdasarkan email
        const lecture = await prisma.lecture.findFirst({
            where: {email},
        })

        if(!lecture) errorResponse(res, "lecture not found", null, 404);

        // cek apakah password sudah diisi sebelumnya
        if(lecture.password){
          return errorResponse(res, "Password is already set", null, 400);
        }

        // Hash password baru
        const hashed = await bcrypt.hash(password, 10);

        //update password
        const updated = await prisma.lecture.update({
            where: { id: lecture.id },
            data: { password: hashed },
        })

        return successResponse(res, "Password registered successfully", {
            id: updated.id,
            email: updated.email,
            role: updated.role,
            passwordSet: true
        });
    } catch (error) {
        return errorResponse(res, "Failed to register password", { error: err.message }, 500);
    }
}

// loginLecture,
export const loginLecture = async (req,res) => {
    try {
        const { email, password } = req.body;

        //validate input
        if (!email || !password){
            return errorResponse(res, "email and password are required", null, 400)
        }

        //cari user
        const user = await prisma.lecture.findFirst({where:{email}})
        if (!user){
            return errorResponse(res, "Email not found", null, 401);
        }

        //Buat JWT Token
        const token = jwt.sign(
            { id: user.id, role: user.role },
            JWT_SECRET,
            { expiresIn: "1d" }
        )

        // Simpan token di cookie
        res.cookie("token", token, cookieOptions(req));

        return successResponse(res, "Login successful", {
            userId: user.id,
            email: user.email,
            role: user.role,
            token: token,
          });
    } catch (error) {
        return errorResponse(res, "Failed to login", error.message, 500);
    }
}

// logout,
export const logout = (req,res) => {
    res.clearCookie("token", {
        ...cookieOptions(req),
        maxAge: undefined,
    });
    return successResponse(res, "Logout successful");
}

// getLectureStats
export const getLectureStats = async(req,res) => {
    const tokenCredential = req.user;
    const { id } = tokenCredential;

    try {
        // Validasi role
        if (tokenCredential.role !== "lecture") {
            return res.status(403).json({
            success: false,
            message: "Only lecture can access this data",
            });
        }

        //jalankan semua query secara paralel
        const [
            lecture,
            totalStudents,
            totalCredits,
            totalSchedules,
            uniqueClassess,
            schedules,
            studyPlans
        ] = await Promise.all([
            // 1. data Lecture
            prisma.lecture.findUnique({
                where:{id},
                select:{
                    id:true,
                    name: true,
                    email: true
                }
            }),

            // 2. Total student yang dipegang dosen
            prisma.student.count({
                where:{
                    class:{
                        schedule:{
                            some:{
                                course:{
                                    lectureId: id
                                }
                            }
                        }
                    }
                }
            }),

            // 3. Total SKS dari semua course milik lecture
            prisma.course.aggregate({
                where: { lectureId: id },
                _sum: { credits: true }
            }),

            // 4. Total schedule join course milik lecture
            prisma.schedule.count({
                where:{
                    course:{
                        lectureId:id
                    }
                }
            }),

            // 5. Class unik dari schedule
            prisma.schedule.findMany({
                where: {
                  course: {
                    lectureId: id
                  }
                },
                select: { classId: true }
            }),

            // 6. Ambil semua schedules
            prisma.schedule.findMany({
                where: {
                  course: {
                    lectureId: id
                  }
                },
                select: {
                  id: true,
                  day: true,
                  timeStart: true,
                  timeEnd: true,
                  class: {
                    select: {
                      id: true,
                      name: true,
                    }
                  },
                  course: {
                    select: {
                      id: true,
                      name: true,
                      code: true,
                      credits: true,
                    }
                  }
                }
            }),

            // 7. Ambil studyplan untuk lecture ini
            prisma.studyPlanCourse.findMany({
                where: {
                  course: {
                    lectureId: id
                  }
                },
                select: {
                  studyPlan: {
                    select: {
                      status: true,
                      student: {
                        select: {
                          name: true
                        }
                      }
                    }
                  },
                  course: {
                    select: {
                      name: true
                    }
                  }
                }
            })
        ])

        const upcomingTimeline = await prisma.timeLine.findMany({
            where:{
                date: {
                    gte: new Date() // hanya yang tanggal >= sekarang
                }
            },
            orderBy: { date: "asc" } // urutkan dari yang paling dekat
        })

        const totalClasses = new Set(uniqueClassess.map(c=> c.classId))

        // format studyplans supaya lebih rapi
        const formattedStudyPlans = studyPlans.map(spc => ({
            courseName: spc.course.name,
            studentName: spc.studyPlan.student.name,
            status: spc.studyPlan.status,
        }))

        return successResponse(
            res, 
            "Get dashboard lecture successful",
            {
                ...lecture,
                totalStudents,
                totalClasses,
                totalSks: totalCredits._sum.credits ?? 0,
                totalSchedules,
                schedules,
                studyPlans: formattedStudyPlans,
                upcomingTimeline
            }
        )
    } catch (error) {
        return errorResponse(res,"Failed to get lecture stats", error.message)
    }
}

// Get courses by lecture ID
export const getCoursesByLectureId = async(req,res) => {
    try {
        const tokenCredential = req.user;
        const { id } = tokenCredential;
    
        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }

        const lecture = await prisma.lecture.findUnique({
            where:{id},
            select:{
                id:true,
                name:true,
                major: {
                    select: {
                      id: true,
                      name: true,
                      faculty: {
                        select: {
                          id: true,
                          name: true
                        }
                      }
                    }
                },
                course: {
                    select: {
                        id: true,
                        name: true,
                        credits: true,
                        schedule: {
                            select: {
                                class: {
                                    select: {
                                        id:true,
                                        name: true,
                                        student: {
                                            select: { semester: true }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        })
        
        if (!lecture) {
            return errorResponse(res, "lecture not found", null, 404)
        }

        // Format courses
        const formattedCourses = lecture.course.map(c => {
            const classIds = c.schedule.map(sch => sch.class.id);
            const classNameList = c.schedule.map(sch => sch.class.name); 
            const semesters = c.schedule.flatMap(sch =>
              sch.class.student.map(stu => stu.semester)
            );
      
            const uniqueClassIds = [...new Set(classIds)];
            const uniqueClassNames = [...new Set(classNameList)];
            const uniqueSemesters = [...new Set(semesters)].sort((a, b) => a - b);
      
            return {
                id: c.id,
                name: c.name,
                credits: c.credits, //sks
                classId:
                    uniqueClassIds.length === 1
                    ? uniqueClassIds[0]
                    : uniqueClassIds,
                classNames:
                    uniqueClassNames.length === 1
                    ? uniqueClassNames[0]
                    : uniqueClassNames,
                semester:
                    uniqueSemesters.length === 1
                    ? uniqueSemesters[0]
                    : uniqueSemesters
            };
        });

        //response major & faculty
        const responseData = {
            id: lecture.id,
            name: lecture.name,
            majorId: lecture.major?.id || null,
            majorName: lecture.major?.name || null,
            facultyId: lecture.major?.faculty?.id || null,
            facultyName: lecture.major?.faculty?.name || null,
            courses: formattedCourses
        }

        return successResponse(
            res,
            "Get lecture with major, faculty, and courses successful",
            responseData
        )
    } catch (error) {
        return errorResponse(res, "Failed to get lecture data", { error: error.message }, 500);
    }
}

export const getStudentByClassId = async(req,res) => {
    try {
        const tokenCredential = req.user;

        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }
        const {courseId, classId} = req.params // sesuai URL /courses/:courseId/class/:classId

        if(!classId || !courseId) {
            return errorResponse(res, "courseId and classId are required")
        }

        const student = await prisma.student.findMany({
            where:{
                classId: classId,
                studyPlan: {
                    some:{
                        courses: {
                            some: {
                              courseId: courseId,
                            },
                        },
                    }
                }
            },
            select:{
                id:true,
                name:true,
                studentNumber: true, //NIM
                studyPlan:{
                    select:{
                        id:true,
                        courses:{
                          where:{
                            courseId:courseId,
                          }
                        }
                    }
                }
            }
        })

        return successResponse(res, "Students fetched successfully", student)
    } catch (error) {
        console.error("Error fetching students:", error);
        return res.status(500).json({
            success: false,
            message: "Internal server error",
        });
    }
}

export const updateStudyPlanCourse = async(req,res) => {
    try {
        const tokenCredential = req.user;

        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }
        const {id} = req.params;
        const updateData = req.body;

        if(!id) {
            return errorResponse(res,"StudyPlanCourse id is required")
        }

        // do update
        const updated = await prisma.studyPlanCourse.update({
            where:{id},
            data:updateData
        })

        return successResponse(res, "StudyPlanCourse updated successfully", updated)
    } catch (error) {
        console.error("Error updating StudyPlanCourse", error);
        return res.status(500).json({
          success: false,
          message: "Internal server error",
        });
    }   
}

export const getScheduleByLectureId = async(req,res) => {
    try {
        const tokenCredential = req.user;
        const { id } = tokenCredential 

        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }

        const lecture = await prisma.lecture.findUnique({
            where:{id},
            select:{
                course:{
                    select:{
                        id:true,
                        name:true,
                        credits:true,
                        schedule:{
                            select:{
                                id:true,
                                classId:true,
                                timeStart:true,
                                timeEnd:true,
                                day:true,
                                class:{
                                  select:{
                                    id:true,
                                    name:true
                                  }
                                }
                            }
                        }
                    }
                }
            }
        })

        if (!lecture) {
            return errorResponse(res, "lecture not found", null, 404);
        }

        const formattedCourses = lecture.course.map(course => ({
            id: course.id,
            name: course.name,
            credits: course.credits,
            schedules: course.schedule.map(sch => ({
              id: sch.id,
              classId: sch.classId,
              className: sch.class?.name || null,
              timeStart: sch.timeStart,
              timeEnd: sch.timeEnd,
              day: sch.day
            }))
        }));

        const responseData = {
            courses: formattedCourses
        };

        return successResponse(res, "Get Lecture successful", responseData)
    } catch (error) {
        console.error("Error get data ScheduleByLectureId", error);
        return res.status(500).json({
          success: false,
          message: "Internal server error",
        });
    }
}

export const getStudyPlanCoursesByLectureId = async(req,res) => {
    try {
        const tokenCredential = req.user;
        const { id } = tokenCredential 

        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }

        const studyPlanCourses = await prisma.studyPlanCourse.findMany({
            where: {
                course: {
                    lectureId: id
                }
            },
            select: {
                course: {
                    include: {
                        lecture: true
                    }
                },
                studyPlan: {
                    include: {
                        student: {
                            include: {
                                class: {
                                    include: {
                                        year: true,
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });

        if(!studyPlanCourses.length){
            return errorResponse(res,"No study plan courses found for this lecture", null,404)
        }

        const mergedData = []
        studyPlanCourses.forEach(spc => {
            let existingPlan = mergedData.find(item => item.studyplan.id === spc.studyPlan.id)

            const courseData = {
                id: spc.course.id,
                name: spc.course.name,
                code: spc.course.code,
                credits: spc.course.credits,
                lectureName: spc.course.lecture?.name || null // ambil nama lecture
            }

            if(existingPlan){
                existingPlan.courses.push(courseData);
            }else {
                mergedData.push({
                    id: spc.id,
                    score: spc.score,
                    createdAt: spc.createdAt,
                    updatedAt: spc.updatedAt,
                    studyPlan: {
                        id: spc.studyPlan.id,
                        status: spc.studyPlan.status,
                        gpa: spc.studyPlan.gpa,
                        createdAt: spc.studyPlan.createdAt,
                        updatedAt: spc.studyPlan.updatedAt,
                        studentId: spc.studyPlan.student.id,
                        name: spc.studyPlan.student.name,
                        studentNumber: spc.studyPlan.student.studentNumber,
                        yearId: spc.studyPlan.student.class.year.id,
                        yearName: spc.studyPlan.student.class.year.name,
                    },
                    courses: [courseData]
                })
            }
        })
        return successResponse(res,"Get study plan courses successful", mergedData)
    } catch (error) {
        return errorResponse(res, "Failed to get study plan courses", { error: error.message }, 500);
    }
}

// updateStudyPlanById,
export const updateStudyPlanById = async(req,res)=>{
    const { id } = req.params; // id = studyPlanId
    const { status, gpa } = req.body;

    try {
        const tokenCredential = req.user;
        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }

        const existingStudyPlan = await prisma.studyPlan.findUnique({
            where:{id},
            include:{student:true}
        })

        if (!existingStudyPlan) return errorResponse(res, "StudyPlan not found")
        
        // Update hanya kolom yang diizinkan
        const updatedStudyPlan = await prisma.studyPlan.update({
            where: { id },
            data: {
                ...(status !== undefined && { status }),
                ...(gpa !== undefined && { gpa })
                // studentId tidak di-update
            },
            include: {
                student: {
                    include: {
                        class: {
                            include: { year: true }
                        }
                    }
                }
            }
        });
        return successResponse(res, "StudyPlan updated successfully", updatedStudyPlan)
    } catch (error) {
        return errorResponse(res, "Failed to update study plan", error.message)
    }
}

// updateStudyPlanScoreById,
export const updateStudyPlanScoreById = async(req,res)=>{
    const { id } = req.params; // id = studyPlanCourseId
    const { score } = req.body;

    try {
        const tokenCredential = req.user;
        if (tokenCredential.role !== "lecture") {
          return res.status(403).json({
            success: false,
            message: "Only lecture can access",
          });
        }
        
        const existingSPC = await prisma.studyPlanCourse.findUnique({
            where:{id}
        })

        if(!existingSPC) return errorResponse(res,"StudyPlanCourse not found")

        //update score saja
        const updateSPC = await prisma.studyPlanCourse.update({
            where:{id},
            data:{score}
        })

        return successResponse(res, "score updated successfully", updateSPC)
    } catch (error) {
        return errorResponse(res,"failed to update score")
    }
}