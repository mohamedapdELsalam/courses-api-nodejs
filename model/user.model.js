const mongoose = require("mongoose");
const validator = require("validator");
const userRoles = require("../utls/user_roles");


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
        unique: true,
        validate: [validator.isEmail,"this email is wrong , make sure your email !"]
    },
    password: {
        type: String,
        require: true
    },
    token:{
        type: String
    },
    role:{
        type:String,
        enum:[userRoles.user,userRoles.admin,userRoles.manger],
        default: userRoles.user
    },
    avatar :{
        type : String,
        default : "profile.jpg"
    }
})

module.exports = mongoose.model("User", userSchema);