const express = require("express");
const router = express.Router();
const verifyToken = require("../middleware/verify_token");

const courseController = require("../controller/courses_controller");

router.route("/")
    .get(verifyToken, courseController.getAllCourses)
    .post(courseController.createCourse)
router.route("/:id")
    .get(courseController.getCourse)
    .patch(courseController.editCourse)
    .delete(courseController.deleteCourse)

module.exports = router;