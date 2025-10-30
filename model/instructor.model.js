const mongoose = require("mongoose");

const instructorSchema = new mongoose.Schema({
    name: {
        type: String,
        require: true
    }, bio: {
        type: String
    }, email: {
        type: String,
        required: true,
        unique:true
    }, photo: {
        type: String
    }
});

module.exports = mongoose.model("Instructor",sinstructorSchema);