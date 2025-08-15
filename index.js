const express = require("express");
const app = express();
app.use(express.json());
const mongoose = require("mongoose");
const coursesRouter = require("./routes/courses.routes");
const url = "mongodb+srv://mohammadapdelsalam:flutterNodjes65@mohamed.ziame88.mongodb.net/courses?retryWrites=true&w=majority&appName=mohamed";

mongoose.connect(url).then(() => {
    console.log("mongo db server started with mongoose");
});

app.use("/api/courses", coursesRouter);

app.all(/.*/, (req, res, next) => {
    return res.status(404).json({ "status": "error", "message": "this resource not found" });
});

app.use((error, req, res, next) => {
    res.status(error.statusCode || 400).json({ "status": "fail", "message": error.message, "statusCode": error.statusCode });
});


app.listen("3000", () => {
    console.log("hello, iam node and listing in port 3000");
});