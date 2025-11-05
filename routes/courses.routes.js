const express = require("express");
const router = express.Router();
const verifyToken = require("../middleware/verify_token");
const userRoles = require("../utls/user_roles");
const allowedTo = require("../functions/allowed_to");
const courseController = require("../controller/courses_controller");
const appError = require("../utls/app_errors");
const multer = require("multer");
const diskStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/courses');
    },

    filename: function (req, file, cb) {
        const ext = file.mimetype.split("/")[1];
        const fileName = "user-" + Date.now() + "." + ext
        cb(null, fileName);

    }
})
const fileFilter = function (req, file, cb) {
    imageType = file.mimetype.split("/")[0];
    if(imageType == "image"){
        return cb(null,true);
    }else{
        return cb(appError.create(`avatar must be an image (${imageType}))`,400,"error"))
    }

}
const upload = multer({ storage: diskStorage, fileFilter });


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