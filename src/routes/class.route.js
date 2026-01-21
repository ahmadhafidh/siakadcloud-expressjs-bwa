import express from "express"

import { verifyToken } from "../middlewares/verifyToken.js"
import {
    getclasses,
    getclassroom,
    createClassroom,
    updateClassroom,
    deleteClassroom,
} from "../controllers/class.controller.js"

const router = express.Router();
router.use(verifyToken);

router.get("/", getclasses)
router.get("/:id", getclassroom)
router.post("/", createClassroom)
router.put("/:id", updateClassroom)
router.delete("/:id", deleteClassroom)

export default router;