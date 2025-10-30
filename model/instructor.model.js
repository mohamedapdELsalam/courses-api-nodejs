const mongoose = require("mongoose");

const instructorSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    }, bio: {
        type: String
    }, email: {
        type: String,
        required: true,
    }, photo: {
        type: String
    }
});

module.exports = mongoose.model("Instructor",instructorSchema);