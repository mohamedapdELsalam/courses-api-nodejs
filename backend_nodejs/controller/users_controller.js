
const userModel = require("../model/user.model");
const appError = require("../utls/app_errors");
const userValidation = require("../functions/user_validation");
const bcrypt = require("bcrypt");
const generateToken = require("../functions/generate_jwt_token");
const async_wrapper = require("../middleware/async_wrapper");
const validator = require("validator");
const nodeMailer = require("nodemailer");
const { sendOtp } = require("../functions/send_otp");
const {brevoSendOtp} = require("../functions/brevo_send_otp");
const { user } = require("../utls/user_roles");



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
        return res.status(200).json({ "status": "success", "message": "you are logged in successfully", "data": user })
    }
    res.json({ "status": "fail", "message": "your email or password is mistake" })
};

const register = async_wrapper(async (req, res, next) => {
    userValidation.register(req, res);
    const { firstName, lastName, email, password, role } = req.body;
    if (!validator.isEmail(email)) {
        return res.status(200).json({ "status": "fail", "message": "check your email" })
    }
    const oldUser = await userModel.findOne({ email: email });
    if (oldUser) {
        const error = appError.create("the email already exist", 400);
        return next(error);
    }
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    const newUser = new userModel({
        firstName, lastName, email, password: hashedPassword, role, avatar: req.file ? req.file.filename : "boy.jpg"

    });
    const token = await generateToken({ email: newUser.email, id: newUser.id, role: newUser.role });
    newUser.token = token;
    try {
        otp = await brevoSendOtp(newUser.email,req,res,next);
        newUser.otp = otp || 0;
    } catch (error) {
        res.status(201).json({ "status": "error", "message": error.message })
    }

    await newUser.save();

    res.status(201).json({ "status": "success", "data": newUser })

})


const resindOtp = async (req,res,next) => {
    try{
          const {email,timeLimit,maxCount} = req.body;
   const user = await userModel.findOne({email});
   const now = Date.now();
   const timePassed =  (now - user.lastResendTime) /1000;

   if(timePassed < timeLimit && user.resendCount  >= maxCount){
    return res.status(429).json({
          "status" : "fail",
          "message" : "Too many resend attempts. Try again later.",
           "statusCode" : 429
    })
   }
   
    otp = await brevoSendOtp(email,req,res,next);
    user.lastResendTime = Date.now();
    user.resendCount = timePassed > timeLimit ? 1 :user.resendCount+1
    user.otp = otp;
    await user.save();
    res.json({"status" : "success" , "otp" : otp});
    
}catch(error){
        res.json({"status" : "error" , "error" : error.message });
    }
  
};

const checkOtp = async (req, res) => {
    const { email, otp } = req.body;
    user = await userModel.findOne({ email: email });
    if (user.otp == otp) {
        user.verified = true;
        await user.save();
        res.status(200).json({ "status": "success", "message": "you verified successfully" });
    } else {
        res.status(200).json({ "status": "fail", "message": "your otp is mistake" });
    }
};
const changePassword = () => { };
const getAllUsers = () => { };


module.exports = { login, register, resindOtp, checkOtp, changePassword, getAllUsers };