import express from "express"

import { verifyToken } from "../middlewares/verifyToken.js"
import {
    getLectures,
    getLecture,
    createLecture,
    updateLecture,
    deleteLecture,
} from "../controllers/lecture.controller.js"

const router = express.Router()
router.use(verifyToken)

router.get("/", getLectures);
router.get("/:id", getLecture);
router.post("/",  createLecture);
router.put("/:id",  updateLecture);
router.delete("/:id",  deleteLecture);

export default router