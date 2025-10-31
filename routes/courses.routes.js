const express = require("express");
const router = express.Router();
const verifyToken = require("../middleware/verify_token");
const userRoles = require("../utls/user_roles");
const allowedTo = require("../functions/allowed_to");
router.use(express.json());
const courseController = require("../controller/courses_controller");


router.route("/")
    .get(courseController.getAllCourses)
    .post(verifyToken, courseController.createCourse)
    .delete(courseController.deleteAllCourses);
router.route("/commonCourses")
    .get(courseController.getCommonCourses)
router.route("/:id")
    .get(courseController.getCourse)
    .patch(verifyToken, courseController.editCourse)
    .delete(verifyToken, allowedTo(userRoles.admin, userRoles.manger), courseController.deleteCourse)

module.exports = router;