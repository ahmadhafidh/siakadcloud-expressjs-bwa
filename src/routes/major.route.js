import express from "express"
import {
    getAllMajors,
    getMajorByFacultyID,
    getMajorById,
    createMajor,
    updateMajor,
    deleteMajor,
} from "../controllers/major.controller.js"
import { verifyToken } from "../middlewares/verifyToken.js"

const router = express.Router()
router.use(verifyToken)

router.get("/", getAllMajors)
router.get("/faculties/:id", getMajorByFacultyID)
router.get("/:id", getMajorById)
router.post("/", createMajor)

router.put("/:id", updateMajor)
router.delete("/:id", deleteMajor)

export default router

