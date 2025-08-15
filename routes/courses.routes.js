const express = require("express");
const router = express.Router();

const courseController = require("../controller/courses_controller");

router.route("/")
    .get(courseController.getAllCourses)
    .post(courseController.createCourse)
router.route("/:id")
    .get(courseController.getCourse)
    .patch(courseController.editCourse)
    .delete(courseController.deleteCourse)

module.exports = router;