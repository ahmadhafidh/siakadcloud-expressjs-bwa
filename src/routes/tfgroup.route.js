import express from "express";

import {
    createTfGroup,
    getAllTfGroups,
    getTfGroupById,
    updateTfGroup,
    deleteTfGroup,   
} from "../controllers/tfgroup.controller.js"
import { verifyToken } from "../middlewares/verifyToken.js";

const router = express.Router()
router.use(verifyToken);

router.get("/", getAllTfGroups)
router.get("/:id", getTfGroupById)
router.post("/", createTfGroup)
router.put("/:id", updateTfGroup)
router.delete("/:id", deleteTfGroup)

export default router