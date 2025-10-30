require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());
app.use(express.json());
const mongoose = require("mongoose");
const coursesRouter = require("./routes/courses.routes");
const usersRouter = require("./routes/users.routes");
const adminRouter = require("./routes/admin.routes");
const path = require("node:path");
const lessonRouter = require("./routes/lesson.routes");

mongoose.connect(process.env.mongoUrl).then(() => {
    console.log("mongo db server started with mongoose");
});
 
app.use("/uploads" , express.static(path.join(__dirname,"uploads")))
app.use("/api/courses", coursesRouter);
app.use("/api/lessons", lessonRouter);
app.use("/api/users", usersRouter);
app.use("/api/admins", adminRouter);

app.all(/.*/, (req, res, next) => {
    return res.status(404).json({ "status": "error", "message": "this resource not found" });
});

app.use((error, req, res, next) => {
    res.status(error.statusCode || 404).json({ "status": error.statusText || "fail", "message": error.message, "statusCode": error.statusCode });
});

app.listen(process.env.port, () => {
    console.log("hello, iam node and listing in port 3000");
});