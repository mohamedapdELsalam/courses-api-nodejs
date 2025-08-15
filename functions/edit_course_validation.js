
function editCourseValidation(req,res){
    if(!req.body){
        return res.status(400).json({ message: "you must add a new title or a new price" });
    }
    if (req.body.title == null && req.body.price == null) {
     return res.status(400).json({ message: "you must add a new title or a new price" });
}
  
}

module.exports = {editCourseValidation: editCourseValidation};