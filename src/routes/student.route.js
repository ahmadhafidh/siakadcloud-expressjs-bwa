import express from "express"

import { verifyToken } from "../middlewares/verifyToken.js"
import {
    getStudents,
    getStudent,
    createStudent,
    updateStudent,
    deleteStudent,
} from "../controllers/student.controller.js";

const router = express.Router()
router.use(verifyToken)

router.get("/", getStudents)
router.get("/:id", getStudent)
router.post("/", createStudent)
router.put("/:id", updateStudent)
router.delete("/:id", deleteStudent)

export default router