import express from "express";

import { verifyToken } from "../middlewares/verifyToken.js";

import {
    getSchedules,
    getSchedule,
    createSchedule,
    updateSchedule,
    deleteSchedule,
} from "../controllers/schedule.controller.js";

const router = express.Router()
router.use(verifyToken)

router.get("/", getSchedules)
router.get("/:id", getSchedule)
router.post("/", createSchedule)
router.put("/:id", updateSchedule)
router.delete("/:id", deleteSchedule)

export default router