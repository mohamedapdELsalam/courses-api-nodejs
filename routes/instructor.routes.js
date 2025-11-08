const express = require("express");
const router = express.Router();
const instructorController = require("../controller/instructor_controller");
router.use(express.json());


router.route("/")
    .get(instructorController.getMyCourses)
    .post(instructorController.addInstructor);
router.route("/:id")
    .get(instructorController.getMyCourses)
 


 module.exports = router;