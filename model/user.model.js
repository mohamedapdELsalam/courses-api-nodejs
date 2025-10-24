const mongoose = require("mongoose");
const userRoles = require("../utls/user_roles");
const { verify } = require("jsonwebtoken");


const userSchema = new mongoose.Schema({
    firstName: {
        type: String,
        require: true
    },
    lastName: {
        type: String,
        require: true

    },
    email: {
        type: String,
        require: true,
        // unique: true,
        // validate: [,"this email is wrong , make sure your email !"]
    },
    password: {
        type: String,
        require: true
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
    }

})

module.exports = mongoose.model("User", userSchema);