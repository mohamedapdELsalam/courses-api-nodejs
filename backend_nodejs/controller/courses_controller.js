const courseValidation = require("../functions/course_validation.js");
const courseModel = require("../model/course.model");
const asyncWrapper = require("../middleware/async_wrapper.js");
const appError = require("../utls/app_errors.js");


const getAllCourses = asyncWrapper(async (req, res) => {
    let page = req.query.page;
    let limit = req.query.limit;
    const myHeader = req.headers;
    console.log("myHeader", myHeader);
    const skip = (page - 1) * limit;
    const courses = await courseModel.find({}, { "__v": false }).limit(limit).skip(skip);
    res.json({ "status": "success", "data": courses });
}
);
const getCommonCourses = asyncWrapper(async (req, res) => {
    const courses = await courseModel.find({}, { "__v": false })
        .populate("instructor", "firstName lastName email").populate("lessons","discription title duration");

    res.json({ "status": "success", "data": courses });
}
);
const deleteAllCourses = asyncWrapper(async (req, res) => {
    await courseModel.deleteMany({  });
    res.json({ "status": "success" });
}
);
const getCourse = asyncWrapper(async (req, res, next) => {
    const courseId = req.params.id;
    const course = await courseModel.findById(courseId);
    if (!course) {
        const error = appError.create("this course not found", 404, "fail");
        return next(error);
    }

    res.json({ "status": "success", "data": course });

});




const createCourse = asyncWrapper(async (req, res) => {
    // courseValidation.create(req, res);
    console.log("mohamed : ",req.body);
    const newCourse = new courseModel({ ...req.body, image: req.file ? req.file.path : "profile.jpg" });
    await newCourse.save();
    res.status(201).json({ "status": "success", "data": newCourse });
});

const editCourse = asyncWrapper(async (req, res, next) => {

    courseValidation.edit(req, res);
    const courseId = req.params.id;
    const courseBody = req.body;
    const course = await courseModel.findById(courseId);
    if (!course) {
        console.log("------------- mohamed iam here -----");
        const error = appError.create("this course not found", 404, "fail");
        return next(error);
    }
    const editedCourse = await courseModel.updateOne({ _id: courseId }, { $set: { ...courseBody } });
    if (editedCourse.acknowledged) {
        res.json({ "status": "success", "data": editedCourse });
    } else {
        res.json({ "status": "fail", "data": editedCourse.modifiedCount });
    }
});

const deleteCourse = asyncWrapper(async (req, res, next) => {
    const courseId = req.params.id;
    const course = await courseModel.findOneAndDelete({ _id: courseId });
    if (!course) {
        const error = appError.create("this course not found", 404, "fail");
        return next(error);
    }
    res.json({ "status": "success", "data": null });
});

module.exports = {
    getAllCourses,
    getCommonCourses,
    getCourse,
    createCourse,
    editCourse,
    deleteCourse,
    deleteAllCourses
}