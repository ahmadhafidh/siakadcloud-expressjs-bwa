import express from "express"
import {
    getFaculties, 
    getFaculty, 
    createFaculty,
    updateFaculty,
    deleteFaculty,
} from "../controllers/faculty.controller.js"
import { verifyToken } from "../middlewares/verifyToken.js"

const router = express.Router()
router.use(verifyToken)

router.get("/", getFaculties)
router.get("/:id", getFaculty)
router.post("/", createFaculty)
router.put("/:id", updateFaculty)
router.delete("/:id", deleteFaculty)

export default router

