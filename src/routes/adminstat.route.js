import express from "express"
import {getAdminStats} from "../controllers/adminstat.controller.js";
import { verifyToken } from "../middlewares/verifyToken.js";

const router = express.Router()
router.use(verifyToken)

router.get("/admin", getAdminStats)

export default router