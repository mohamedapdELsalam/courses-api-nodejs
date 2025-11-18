const mongoose = require("mongoose");

const userLessonQuizSchema = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true
    },
    lessonId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Lesson",
        required: true
    },
    score: {
        type: Number,
        required: true
    },
    completedAt: {
        type: Date,
        default: Date.now
    }
});

userLessonQuizSchema.index({ userId: 1, lessonId: 1 }, { unique: true });

module.exports = mongoose.model("UserLessonQuiz", userLessonQuizSchema);
