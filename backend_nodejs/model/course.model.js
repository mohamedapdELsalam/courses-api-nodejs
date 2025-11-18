const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
    title: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: Number, required: true },
    image: { type: String, required: true },
    instructor: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    language: { type: String },
    level: { type: Number, enum: [1,2,3] },
    duration: { type: String, default: 0 },
    lessons: [{ type: mongoose.Schema.Types.ObjectId, ref: "Lesson" }],
    enrolledCount: { type: Number, default: 0 },
    rating: { type: Number, default: 0 },
    category: { type: String }
}, { timestamps: true });

module.exports = mongoose.model("Course", courseSchema);
