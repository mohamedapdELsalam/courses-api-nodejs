const mongoose = require("mongoose");
const validator = require("validator");

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
    }
})

module.exports = mongoose.model("User", userSchema);