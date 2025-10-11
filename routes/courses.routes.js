const express = require("express");
const router = express.Router();
const verifyToken = require("../middleware/verify_token");

const courseController = require("../controller/courses_controller");

// api/courses/ (get)  => getAllCourses
// api/courses/ (post)  => createCourse
// api/courses/akdlj
// api/courses/id
// api/courses/id/kdjs/kjdkls/kdjskl


router.route("/")
    .get(verifyToken, courseController.getAllCourses)
    .post( verifyToken,courseController.createCourse)
router.route("/:id")
    .get(courseController.getCourse)
    .patch(courseController.editCourse)
    .delete(courseController.deleteCourse)

module.exports = router;