
const userModel = require("../model/user.model");
const appError = require("../utls/app_errors");
const userValidation = require("../functions/user_validation");
const bcrypt = require("bcrypt");
const generateToken = require("../functions/generate_jwt_token");
const async_wrapper = require("../middleware/async_wrapper");
const validator = require("validator");



const login = async (req, res) => {

    userValidation.login(req, res);
    const { email, password } = req.body;
    const user = await userModel.findOne({ email: email });
    if (!user) {
        res.json({ "status": "fail", "message": "your email or password is mistake" })
    }

    const isPasswordTrue = await bcrypt.compare(password, user.password);
    if (user && isPasswordTrue) {
        token = await generateToken({ email: user.email, id: user.id, role: user.role });
        user.token = token;
        user.save();
        return res.status(200).json({ "status": "success", "msg": "you are logged in successfully", "data": user })
    }
    res.json({ "status": "fail", "message": "your email or password is mistake" })
};

const register = async_wrapper(async (req, res, next) => {
    userValidation.register(req, res);
    const { firstName, lastName, email, password, role } = req.body;
    if(!validator.isEmail(email)){
   return res.status(200).json({ "status": "fail", "message":"check your email"  })
    }
    const oldUser = await userModel.findOne({ email: email });
    if (oldUser) {
        const error = appError.create("the email already exist", 400);
        return next(error);
    }
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const newUser = new userModel({
        firstName, lastName, email, password: hashedPassword, role,   avatar: req.file ? req.file.filename : "boy.jpg"

    });
    const token = await generateToken({ email: newUser.email, id: newUser.id, role: newUser.role });
    newUser.token = token;
    await newUser.save();
    res.status(201).json({ "status": "success", "data": newUser })

}) 

const verifyEmail = () => { };
const changePassword = () => { };
const getAllUsers = () => { };


module.exports = { login, register, verifyEmail, changePassword, getAllUsers };