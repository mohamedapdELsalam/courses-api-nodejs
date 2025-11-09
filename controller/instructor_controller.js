
const instructorModel = require("../model/instructor.model");
const courseModel = require("../model/course.model");
const app_errors = require("../utls/app_errors");

const getAllInstructors = async(req,res,next)=>{
 const instructors  = await instructorModel.find({});
 if(!instructors){
    const error = app_errors.create("an error","400","fail");
    return next(error);
 }else{
    res.json({"status" :"success" , "data": instructors});
}
};

const addInstructor = async(req,res,next)=>{
    const instructor = new instructorModel(req.body);
    await instructor.save();
    res.json({"status" :"success" , "data": instructor});
};

const getMyCourses = async(req,res,next)=>{
    console.log("aha");
    const {id} = req.body;
    console.log("id",id);
    const courses = await courseModel.find({instructor:id});
    if (!courses) {
        const error = appError.create("you haven't any courses", 404, "fail");
        return next(error);
    }
    res.json({ "status": "success", "data": courses });

};




module.exports = {getAllInstructors,addInstructor,getMyCourses};