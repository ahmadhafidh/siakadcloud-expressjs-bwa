import express from "express"
import {
    getAllTuitionFees,
    getTuitionFeeById,
    createTuitionFee,
    updateTuitionFee,
    deleteTuitionFee,
} from "../controllers/tuitionfee.controller.js"
import { verifyToken } from "../middlewares/verifyToken.js"

const router = express.Router()
router.use(verifyToken)

router.get("/", getAllTuitionFees);
router.get("/:id", getTuitionFeeById);
router.post("/", createTuitionFee);
router.put("/:id", updateTuitionFee);
router.delete("/:id", deleteTuitionFee);

export default router