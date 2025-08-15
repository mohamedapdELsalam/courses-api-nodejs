

const mongoose = require("mongoose");
const { validate } = require("./course.model");

const userSchema = new mongoose.Schema({
    firstName: {
        type: String,
        require: true
    },
    secondName: {           
        type: String,
        require: true
        
    },
    email: {
        type: String,
        require: true,
        unique: true,
    },
    password: {
        type: String,
        require: true
    },
})

module.exports = mongoose.model("User", userSchema);