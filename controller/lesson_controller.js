
const lessonModel = require("../model/lesson.model");
const courseModel = require("../model/course.model");
const lessonValidaion = require("../functions/lesson_validation");

const getLesson = async (req, res, next) => {
 const lessonId = req.params.id;
  const lesson =  await lessonModel.findById(lessonId);
   if(!lesson ){
        const error =  appError.create("this lesson not found",404,"fail");
        return next(error);
    }
    res.json({ "status": "success", "data": lesson });
}

const addLesson = async (req, res, next) => {
    lessonValidaion.add(req,res);
    const lesson = req.body;
    const newLesson = new lessonModel(lesson);
     await courseModel.findByIdAndUpdate(lesson.course, {
      $push: { lessons: newLesson._id }   
    });
    await newLesson.save();
    res.status(201).json({ "status": "success", "data": newLesson });
}





module.exports = {addLesson ,getLesson};