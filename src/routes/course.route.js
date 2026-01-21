import express from "express"

import { verifyToken } from "../middlewares/verifyToken.js"
import {
    getCourses,
    getCourse,
    createCourse,
    updateCourse,
    deleteCourse,
} from "../controllers/course.controller.js";

const router = express.Router()
router.use(verifyToken)

router.get("/", getCourses)
router.get("/:id", getCourse)
router.post("/", createCourse)
router.put("/:id", updateCourse)
router.delete("/:id", deleteCourse)

export default router