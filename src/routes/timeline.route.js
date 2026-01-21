import express from "express";
import {
  showTimeline,
  createTimeline,
  updateTimeline,
  deleteTimeline
} from "../controllers/timeline.controller.js";
import { verifyToken } from "../middlewares/verifyToken.js";

const router = express.Router();
// router.use(verifyToken)

router.get("/",verifyToken, showTimeline);
router.post("/", verifyToken, createTimeline);

router.put("/:id", verifyToken, updateTimeline);
router.delete("/:id", verifyToken, deleteTimeline);

export default router;
