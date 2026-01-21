import express from "express"
import { verifyToken } from "../middlewares/verifyToken.js"

import {
    getYears,
    getYear,
    createYear,
    updateYear,
    deleteYear
} from "../controllers/year.controller.js"

const router = express.Router();
router.use(verifyToken)

router.get("/", getYears)
router.get("/:id", getYear)
router.post("/", createYear)
router.put("/:id", updateYear)
router.delete("/:id", deleteYear)

export default router