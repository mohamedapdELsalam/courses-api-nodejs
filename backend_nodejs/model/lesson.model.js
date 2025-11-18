const mongoose = require("mongoose");

const lessonSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    }, discription: {
        type: String
    }, duration: {
        type: String,
        required: true
    }, videoUrl: {
        type: String,
        required: true,
    }, order: {
        type: Number,
        required :true,
    }, image: {
        type: String
    }, summaryFile: {
        type: String
    }, course: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Course",
        required:true
    },
    quiz: [
    {
        question: String,
        options: [String],   
        correctAnswer: Number 
    }
]
});

module.exports = mongoose.model("Lesson",lessonSchema);