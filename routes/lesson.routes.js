const express = require("express");
const router = express.Router();
const lessonController = require("../controller/lesson_controller");


router.route("/").post(lessonController.addLesson);
router.route("/:id").get(lessonController.getLesson);
module.exports = router;
