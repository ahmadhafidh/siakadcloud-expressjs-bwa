import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

// getAllStudyPlans,
export const getAllStudyPlans = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const studyPlans = await prisma.studyPlan.findMany({
            include: {
                student:{
                  select:{
                    id:true,
                    name:true,
                    studentNumber:true,
                    semester:true,
                    class:{
                      select:{
                        year:{
                          select:{
                            id:true,
                            name:true
                          }
                        }
                      }
                    }
                  }
                },
                courses:{
                  select:{
                    id:true,
                    score:true,
                    studyPlanId:true,
                    courseId:true,
                    course:{
                      include:{
                        lecture:{
                          select:{
                            id:true,
                            name:true,
                            lectureNumber:true,
                          }
                        }
                      }
                    }
                  }
                }
              },
            });

            const formattedStudyPlans = studyPlans.map(sp => ({
                id: sp.id,
                studentId: sp.studentId,
                status: sp.status,
                gpa: sp.gpa,
                createdAt: sp.createdAt,
                updatedAt: sp.updatedAt,

                  // student data
                studentId: sp.student.id,
                studentName: sp.student.name,
                studentNumber: sp.student.studentNumber,
                studentYearId: sp.student.class?.year?.id ?? null,
                studentSemester: sp.student.semester,
                studentYearName: sp.student.class?.year?.name ?? null,

                courses: sp.courses.map(c => ({
                    id: c.id,
                    studyPlanId: c.studyPlanId,
                    courseId: c.courseId,
                    courseName: c.course.name,
                    courseCode: c.course.code,
                    courseScore: c.score,
                    credits: c.course.credits,
                    lectureId: c.course.lecture?.id ?? null,
                    lectureName: c.course.lecture?.name ?? null,
                    lectureNumber: c.course.lecture?.lectureNumber ?? null,
                }))
            }))

            return successResponse(res, "Get all successful", formattedStudyPlans)
    } catch (error) {
        return errorResponse(res,"failed to Get all data")
    }
}

// getStudyPlanById,
export const getStudyPlanById = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }
        const {id} = req.params
        const studyPlans = await prisma.studyPlan.findUnique({
            where:{id},
            include: {
                student:{
                  select:{
                    id:true,
                    name:true,
                    studentNumber:true,
                    semester:true,
                    class:{
                      select:{
                        year:{
                          select:{
                            id:true,
                            name:true
                          }
                        }
                      }
                    }
                  }
                },
                courses:{
                  select:{
                    id:true,
                    score:true,
                    studyPlanId:true,
                    courseId:true,
                    course:{
                      include:{
                        lecture:{
                          select:{
                            id:true,
                            name:true,
                            lectureNumber:true,
                          }
                        }
                      }
                    }
                  }
                }
              },
        });

        if(!studyPlans) return errorResponse(res,"data not found", null, 404)

        const formattedStudyPlans = {
            id: studyPlans.id,
            studentId: studyPlans.studentId,
            status: studyPlans.status,
            gpa: studyPlans.gpa,
            createdAt: studyPlans.createdAt,
            updatedAt: studyPlans.updatedAt,

            // student data
            studentId: studyPlans.student.id,
            studentName: studyPlans.student.name,
            studentNumber: studyPlans.student.studentNumber,
            studentYearId: studyPlans.student.class?.year?.id ?? null,
            studentYearName: studyPlans.student.class?.year?.name ?? null,

            courses: studyPlans.courses.map(c => ({
                id: c.id,
                studyPlanId: c.studyPlanId,
                courseId: c.courseId,
                courseName: c.course.name,
                courseCode: c.course.code,
                credits: c.course.credits,
                lectureId: c.course.lecture?.id ?? null,
                lectureName: c.course.lecture?.name ?? null,
                lectureNumber: c.course.lecture?.lectureNumber ?? null,
            }))
        }

        return successResponse(res, "Get data by id successful", formattedStudyPlans)
    } catch (error) {
        return errorResponse(res,"failed to Get data by id")
    }
}

// createStudyPlan,
export const createStudyPlan = async (req,res) => {
  try {
    // validasi tidak bisa melakukan operasi ini
    const tokenCredential = req.user;
    if (tokenCredential.role !== "admin") {
      return res.status(403).json({
            success: false,                
            message: "Only admin can access",
      });
    }

    const { courseId, ...rest} = req.body
    if (!rest.status && (rest.gpa === undefined || rest.gpa === null)) {
      return errorResponse(res, "Data can't be empty", null, 400);
    }

    // Bersihkan courseId: hilangkan spasi berlebih, filter kosong
    const courseIds = courseId
      ? courseId.split(",").map(id => id.trim()).filter(id => id !== "")
    : [];

    if (courseIds.length === 0){
      return errorResponse(res, "At least one courseId is required", null, 400);
    }

    // 1. buat studyPlan
    const studyPlan = await prisma.studyPlan.create({
      data:{
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

// updateStudyPlan,
export const updateStudyPlan = async(req,res) => {
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
    const { courseId, ...rest } = req.body;

    // Validasi
    if (!rest.status && (rest.gpa === undefined || rest.gpa === null)) {
      return errorResponse(res, "Data can't be empty", null, 400);
    }
    
    // Bersihkan courseId
    const courseIds = courseId
      ? courseId.split(",").map(id => id.trim()).filter(id => id !== "")
      : [];

    if (courseIds.length === 0) {
      return errorResponse(res, "At least one courseId is required", null, 400);
    }

    // 1. Update StudyPlan
    const updatedStudyPlan = await prisma.studyPlan.update({
      where: { id },
      data: { ...rest }
    });

    // 2. Hapus dulu relasi lama
    await prisma.studyPlanCourse.deleteMany({
      where: { studyPlanId: id }
    });
    
    // 3. Masukkan relasi baru
    const studyPlanCourses = courseIds.map(cid => ({
      studyPlanId: id,
      courseId: cid
    }));

    await prisma.studyPlanCourse.createMany({
      data: studyPlanCourses
    });
    
    return successResponse(res, "Study plan updated", {
      ...updatedStudyPlan,
      courses: studyPlanCourses
    });
  } catch (error) {
    return errorResponse(res, "Failed to update", error.message, 500);
  }
}

// deleteStudyPlan,
export const deleteStudyPlan = async (req,res) => {
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

    //cek if exist
    const studyPlan = await prisma.studyPlan.findUnique({
      where: { id },
      include: { courses: true } // jika relasi di prisma pakai nama "courses"
    })

    if(!studyPlan) {
      return errorResponse(res,"StudyPlan not found", null, 4040)
    }

    // 1. Hapus semua relasi course dulu
    await prisma.studyPlanCourse.deleteMany({
      where: { studyPlanId: id }
    })

    // 2. Hapus study plan
    await prisma.studyPlan.delete({
      where: { id }
    });

    return successResponse(res, "Study plan deleted successfully", {
      deletedId: id
    });
    
  } catch (error) {
    return errorResponse(res, "Failed to delete", error.message, 500);
  }
}