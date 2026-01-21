import express from "express"
import cookieParser from "cookie-parser"
import dotenv from "dotenv"
import cors from "cors"

import authSiakadRoutes from "./routes/authsiakad.route.js"
import facultyRoutes from "./routes/faculty.route.js"
import majorRoutes from "./routes/major.route.js"
import yearRoutes from "./routes/year.route.js"
import classRoutes from "./routes/class.route.js"
import tfGroupRoutes from "./routes/tfgroup.route.js"
import studentRoutes from "./routes/student.route.js"
import lectureRoutes from "./routes/lecture.route.js"
import courseRoutes from "./routes/course.route.js"
import scheduleRoutes from "./routes/schedule.route.js"
import userSiakadRoutes from "./routes/usersiakad.route.js";
import tuitionFeeRoutes from "./routes/tuitionfee.route.js"
import paymentRoutes from "./routes/payment.route.js";
import studyPlanRoutes from "./routes/studyplan.route.js";
import adminStatRoutes from "./routes/adminstat.route.js"
import timeLineRoutes from "./routes/timeline.route.js";

import manageStudentRoutes from "./routes/managestudent.route.js"
import manageLectureRoutes from "./routes/managelecture.route.js";

dotenv.config()
const app = express()
const PORT = process.env.PORT || 5000

// Middleware
app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

// Routes
app.use("/api/authsiakad", authSiakadRoutes)
app.use("/api/faculties", facultyRoutes)
app.use("/api/majors", majorRoutes)
app.use("/api/years", yearRoutes)
app.use("/api/classes", classRoutes)
app.use("/api/tf-groups", tfGroupRoutes)
app.use("/api/students", studentRoutes)
app.use("/api/lectures", lectureRoutes);
app.use("/api/courses", courseRoutes);
app.use("/api/schedules", scheduleRoutes);
app.use("/api/users", userSiakadRoutes);
app.use("/api/tuition-fees", tuitionFeeRoutes);
app.use("/api/payments", paymentRoutes);
app.use("/api/study-plans", studyPlanRoutes);
app.use("/api/stats", adminStatRoutes);
app.use("/api/time-line", timeLineRoutes);
app.use("/api/manage-students", manageStudentRoutes);
app.use("/api/manage-lectures", manageLectureRoutes);

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
  