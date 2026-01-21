import express from "express";
import { verifyToken } from "../middlewares/verifyToken.js";

import {
    createLecture, //register
    loginLecture,
    logout,

    getLectureStats,//dashboard

    getCoursesByLectureId,
    getStudentByClassId,
    updateStudyPlanCourse,

    getScheduleByLectureId, //jadwal

    // //studyplan
    getStudyPlanCoursesByLectureId,
    updateStudyPlanById,
    updateStudyPlanScoreById,

} from "../controllers/managelecture.controller.js";

const router = express.Router();

router.post("/register", createLecture);
router.post("/login", loginLecture);
router.use(verifyToken);

// Semua endpoint dibawah ini pakai JWT token
router.get("/stats", getLectureStats); //dashboard

router.get("/courses", getCoursesByLectureId);
router.get("/courses/:courseId/class/:classId", getStudentByClassId);
router.put("/courses/studyplancourse/:id", updateStudyPlanCourse);

router.get("/schedules", getScheduleByLectureId);

// KRS
router.get("/study-plans", getStudyPlanCoursesByLectureId);
router.put("/study-plans/:id", updateStudyPlanById);
router.put("/study-plans/score/:id", updateStudyPlanScoreById);

router.post("/logout", logout);

export default router;
