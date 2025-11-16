const express = require("express");
const router = express.Router();

const adminController = require("../controller/admin_controller");


router.route(("/deleteAllUsers")).post(adminController.deleteAllUsers);
module.exports = router;
