const mongoose = require("mongoose");
const userRoles = require("../utls/user_roles");
const { verify } = require("jsonwebtoken");


const userSchema = new mongoose.Schema({
    firstName: {
        type: String,
        required: true
    },
    lastName: {
        type: String,
        required: true

    },
    email: {
        type: String,
        required: true,
        // unique: true,
        // validate: [,"this email is wrong , make sure your email !"]
    },
    password: {
        type: String,
        required: true
    },
    token: {
        type: String
    },
    role: {
        type: String,
        enum: [userRoles.user, userRoles.admin, userRoles.manger],
        default: userRoles.user
    },
    avatar: {
        type: String,
        default: "profile.jpg"
    },
    otp: {
        type: Number,
    },
    verified: {
        type: Boolean,
        default: false
    },
    lastResendTime:{
        type: Date,
        default: null
    },
    resendCount:{
        type : Number,
        default :0
    }

})

module.exports = mongoose.model("User", userSchema);