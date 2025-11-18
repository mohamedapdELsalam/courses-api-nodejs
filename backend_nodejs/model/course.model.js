const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
<<<<<<< HEAD
    title: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: Number, required: true },
    image: { type: String, required: true },
    instructor: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    language: { type: String },
    level: { type: String, enum: [1,2,3] },
    duration: { type: String, default: 0 },
    lessons: [{ type: mongoose.Schema.Types.ObjectId, ref: "Lesson" }],
    enrolledCount: { type: Number, default: 0 },
    rating: { type: Number, default: 0 },
    category: { type: String }
}, { timestamps: true });

module.exports = mongoose.model("Course", courseSchema);
=======
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
        ref: "User",
        required:true
    }, language: {
        type: String,
    }, level: {
        type: String,
        enum: ["متقدم", "متوسط", "مبتدأ"]
    },duration:{
        type :String,
        default:0
    },lessons:[{
        type : mongoose.Schema.Types.ObjectId,
        ref : "Lesson"
    }]
});
module.exports = mongoose.model("Course", courseSchema);
>>>>>>> c04325d (Add frontend files and restructure project)
