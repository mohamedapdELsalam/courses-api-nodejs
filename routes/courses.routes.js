const express = require("express");
const router = express.Router();
const verifyToken = require("../middleware/verify_token");
const userRoles = require("../utls/user_roles");
const allowedTo = require("../functions/allowed_to");
const courseController = require("../controller/courses_controller");
const path = require("node:path");
const appError = require("../utls/app_errors");
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const multer = require("multer");
const cloudinary = require("cloudinary").v2;


cloudinary.config({
  cloud_name: process.env.CloudName,
  api_key: process.env.cloudApiKey,
  api_secret: process.env.cloudApiSecret
});

const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "courses",
    allowed_formats: ["jpg", "png", "jpeg"]
  },
});

const upload = multer({ storage });



router.route("/")
    .get(courseController.getAllCourses)
    .post(upload.single("file"), courseController.createCourse)
    .delete(courseController.deleteAllCourses);
router.route("/commonCourses")
    .get(courseController.getCommonCourses)
router.route("/:id")
    .get(courseController.getCourse)
    .patch(verifyToken, courseController.editCourse)
    .delete(verifyToken, allowedTo(userRoles.admin, userRoles.manger), courseController.deleteCourse)

module.exports = router;