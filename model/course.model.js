const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true
    }, image: {
        type: String,
        required: true,
    }, instructor: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Instructor",
        required:true
    }, language: {
        type: String,
    }, level: {
        type: String,
        enum: ["متقدم", "متوسط", "مبتدأ"]
    },duration:{
        type :String,
    },lessons:[{
        type : mongoose.Schema.Types.ObjectId,
        ref : "Lesson"
    }]
});
module.exports = mongoose.model("Course", courseSchema);