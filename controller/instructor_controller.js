
const instructorModel = require("../model/instructor.model");
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

module.exports = {getAllInstructors,addInstructor};