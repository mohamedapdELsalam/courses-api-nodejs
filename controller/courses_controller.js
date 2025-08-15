// let { courses } = require("../data/courses");
const { courseValidation } = require("../functions/course_validation");
const { editCourseValidation } = require("../functions/edit_course_validation");
const courseModel = require("../model/course.model");
const asyncWrapper = require("../middleware/async_wrapper.js");
const appError = require("../utls/app_errors.js");


const getAllCourses = async (req, res) => {
    let page = req.query.page;
    let limit = req.query.limit;
    const skip = (page - 1) * limit;
    const courses = await courseModel.find({}, { "__v": false }).limit(limit).skip(skip);

    res.json({ "status": "success", "data": courses });

}

const getCourse = asyncWrapper(async (req, res,next) => {
    const courseId = req.params.id;
    const course = await courseModel.findById(courseId);
    if(!course || course == null || course == []){
        console.log("------------- mohamed iam here -----");
        const error =  appError.create("this course not found",404,"fail");
        return next(error);
    }
    console.log("------------- mohamed iam not here -----");
    res.json({ "status": "success", "data": course });

    // try {
        // }
        // catch (e) {
    //     return res.status(400).json({ "status": "error", "message": e.message });

    // };

});




const createCourse = async (req, res) => {
    courseValidation(req, res);
    const newCourse = new courseModel(req.body);
    await newCourse.save();
    res.status(201).json({ "status": "success", "data": newCourse });
};

const editCourse = async (req, res) => {
    const courseId = req.params.id;
    const courseBody = req.body;

    editCourseValidation(req, res);
    try {
        const editedCourse = await courseModel.updateOne({ _id: courseId }, { $set: { ...courseBody } });
        if (editedCourse.acknowledged) {
            res.json({ "status": "success", "data": editedCourse });
        } else {
            res.json({ "status": "fail", "data": editedCourse.modifiedCount });

        }
    } catch (e) {
        res.json({ "status": "error", "message": e.message });
    }

};

const deleteCourse = async (req, res) => {
    const courseId = req.params.id;
    try {
        await courseModel.deleteOne({ _id: courseId });
        res.json({ "status": "success", "data": null });
    } catch (e) {
        res.json({ "status": "error", "message": e.message });

    }

};

module.exports = {
    getAllCourses,
    getCourse,
    createCourse,
    editCourse,
    deleteCourse
}