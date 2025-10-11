require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());
app.use(express.json());
const mongoose = require("mongoose");
const coursesRouter = require("./routes/courses.routes");
const usersRouter = require("./routes/users.routes");

mongoose.connect(process.env.mongoUrl).then(() => {
    console.log("mongo db server started with mongoose");
});


app.use("/api/courses", coursesRouter);
app.use("/api/users", usersRouter);

app.all(/.*/, (req, res, next) => {
    return res.status(404).json({ "status": "error", "message": "this resource not found" });
});

app.use((error, req, res, next) => {
    res.status(error.statusCode || 404).json({ "status": "fail", "message": error.message, "statusCode": error.statusCode });
});

app.listen(process.env.port, () => {
    console.log("hello, iam node and listing in port 3000");
});