const express = require("express");
const router = express.Router();
const verifyToken = require("../middleware/verify_token");
const userRoles = require("../utls/user_roles");
const allowedTo = require("../functions/allowed_to");

const courseController = require("../controller/courses_controller");


router.route("/")
    .get(courseController.getAllCourses)
    .post(verifyToken, courseController.createCourse)
router.route("/commonCourses")
    .get(verifyToken, courseController.getCommonCourses)
router.route("/:id")
    .get(courseController.getCourse)
    .patch(verifyToken, courseController.editCourse)
    .delete(verifyToken, allowedTo(userRoles.admin, userRoles.manger), courseController.deleteCourse)

module.exports = router;