import prisma from "../config/prisma.js";
import { successResponse, errorResponse } from "../utils/response.js";

export const getAdminStats = async(req,res) => {
    try {
        // validasi tidak bisa melakukan operasi ini
        const tokenCredential = req.user;
        if (tokenCredential.role !== "admin") {
            return res.status(403).json({
                    success: false,                
                    message: "Only admin can access",
            });
        }

        const [
            totalStudents,
            totalFaculties,
            totalMajors,
            totalClasses,
            studyPlanApproved,
            studyPlanRejected,
            studyPlanOnProcess
        ] = await Promise.all([
            prisma.student.count(),
            prisma.faculty.count(),
            prisma.major.count(),
            prisma.class.count(),
            prisma.studyPlan.count({ where: { status: "approved" } }),
            prisma.studyPlan.count({ where: { status: "rejected" } }),
            prisma.studyPlan.count({ where: { status: "onprocess" } })
        ])

        // Ambil semua fakultas
        const faculties = await prisma.faculty.findMany({
            select: { id: true, name: true }
        });
        
        // Ambil semua student dengan relasi sampai fakultas
        const studentsPerFaculty = await prisma.student.findMany({
            select:{
                id:true,
                class:{
                    select:{
                        major:{
                            select:{
                               faculty:{
                                    select: { id: true, name: true }
                               } 
                            }
                        }
                    }
                }
            }
        })

        // Inisialisasi semua fakultas dengan 0 student
        const facultyMap = new Map();
        faculties.forEach(fac => {
            facultyMap.set(fac.id, {
                facultyId: fac.id,
                facultyName: fac.name,
                totalStudents: 0
            })
        })

        // Update jumlah student per faculty
        studentsPerFaculty.forEach(student =>{
            const faculty = student.class?.major?.faculty
            if (faculty) {
                facultyMap.get(faculty.id).totalStudents += 1;
            }
        })
        const facultyStats = Array.from(facultyMap.values())

        // Payment lewat student -> tfGroup -> amount
        const payments = await prisma.payment.findMany({
            select:{
                status:true,
                student:{
                    select:{
                        tfGroup:{
                            select:{amount:true}
                        }
                    }
                }
            }
        })

        // Ambil semua studyplan dengan relasi student, course, dan lecture
        const studyPlans = await prisma.studyPlanCourse.findMany({
            select: {
              studyPlan: {
                select: {
                  status: true,
                  student: {
                    select: { name: true }
                  }
                }
              },
              course: {
                select: {
                  name: true,
                  lecture: {
                    select: { name: true }
                  }
                }
              }
            }
        });

        // Format biar rapih
        const formattedStudyPlans = studyPlans.map(sp => ({
            courseName: sp.course?.name ?? null,
            studentName: sp.studyPlan?.student?.name ?? null,
            lectureName: sp.course?.lecture?.name ?? null,
            status: sp.studyPlan?.status ?? null
        }))

        // Hitung paid & unpaid
        let paidCount = 0;
        let unpaidCount = 0;
        let paidAmount = 0;
        let unpaidAmount = 0;

        payments.forEach(p => {
            if (p.status.toLowerCase() === "paid") {
                paidCount++;
                paidAmount += p.student?.tfGroup?.amount ?? 0;
            } else if (p.status.toLowerCase() === "unpaid") {
                unpaidCount++;
                unpaidAmount += p.student?.tfGroup?.amount ?? 0;
            }
        })

        // Ambil timeline yang akan datang
        const upcomingTimeline = await prisma.timeLine.findMany({
            where: {
            date: {
                gte: new Date() // hanya yang tanggal >= sekarang
            }
            },
            orderBy: { date: "asc" } // urutkan dari yang paling dekat
        });
        return successResponse(res, "statistics fetched successful", {
            totalStudents,
            totalFaculties,
            totalMajors,
            totalClasses,
            studyPlan: {
                approved: studyPlanApproved,
                rejected: studyPlanRejected,
                onprocess: studyPlanOnProcess
            },
            studentPerFaculty: facultyStats,
            payment: {
                paidCount,
                paidSum: paidAmount,
                unpaidCount,
                unpaidSum: unpaidAmount
            },
            studyPlans: formattedStudyPlans,
            upcomingTimeline
        })
    } catch (error) {
        console.error("Error fetching statistics:", error);
        return errorResponse(res, "Failed to fetch statistics", error.message);
    }
}