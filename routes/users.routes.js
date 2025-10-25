const express = require("express");
const router = express.Router();
const usersController = require("../controller/users_controller");
const appError = require("../utls/app_errors");
const multer = require("multer");
const diskStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads');
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
        return cb(appError.create("avatar must be an image",400,"error"))
    }

}
const upload = multer({ storage: diskStorage, fileFilter });

router.route("/").get(usersController.getAllUsers);
router.route("/login").post(usersController.login);
router.route("/register").post(upload.single("avatar"), usersController.register);
router.route("/checkOtp").post( usersController.checkOtp);
router.route("/resindOtp").post( usersController.resindOtp);

module.exports = router;


