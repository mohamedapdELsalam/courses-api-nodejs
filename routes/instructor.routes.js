const express = require("express");
const router = express.Router();
const instructorController = require("../controller/instructor_controller");
router.use(express.json());


router.route("/")
    .get(instructorController.getAllInstructors)
    .post(instructorController.addInstructor);


 module.exports = router;