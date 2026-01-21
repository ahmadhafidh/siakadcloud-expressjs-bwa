import express from "express"
import {
    getAllUsers,
    getUserById,
    getUsersByRole,
    createUser,
    updateUser,
    deleteUser,
} from "../controllers/usersiakad.controller.js"
import { verifyToken } from "../middlewares/verifyToken.js"

const router = express.Router()
router.use(verifyToken)

router.get("/", getAllUsers)
router.get("/:id", getUserById)
router.get("/role/:role", getUsersByRole)
router.post("/", createUser)
router.put("/:id", updateUser)
router.delete("/:id", deleteUser)

export default router
