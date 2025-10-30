
const userModel = require("../model/user.model");


const deleteAllUsers = async(req,res,next)=>{
  await  userModel.deleteMany({role:"user"});
  res.json({"status" : "success"})

}

module.exports = {deleteAllUsers};