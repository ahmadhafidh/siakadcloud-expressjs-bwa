import express from "express";
import { verifyToken } from "../middlewares/verifyToken.js";
import {
    registerStudent,
    loginStudent,
    getScheduleById,

    createStudyPlan,
    getStudyPlanById,
    getAllCourses,

    getPaymentById,
    UpdatePaymentById,

    getStudentStats

} from "../controllers/managestudent.controller.js";

const router = express.Router();

// Regsist Login
router.post("/register", registerStudent);
router.post("/login", loginStudent);

router.use(verifyToken); // Semua endpoint dibawah ini dilindungi oleh JWT

// dashboard
router.get("/stats", getStudentStats);

// Route Schedule Mahasiswa
router.get("/schedules", getScheduleById);

router.post("/studyplan", createStudyPlan); // create studyplan mahasiswa
router.get("/studyplan", getStudyPlanById); // get studyplan by id mahasiswa
router.get("/allcourse", getAllCourses);

// get payment by id mahasiswa
router.get("/payment", getPaymentById);
router.put("/payment/:id", UpdatePaymentById);

export default router;
