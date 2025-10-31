
function create(req,res){
     if (!req.body.title) {
        return res.json({ "status": "fail", "message": "you must add course name" });
    }
    if (!req.body.price) {
        return res.json({ "status": "fail", "message": "you must add course price" });
    }
    if (!req.body.file) {
        return res.json({ "status": "fail", "message": "you must add course image" });
    }
    if (!req.body.description) {
        return res.json({ "status": "fail", "message": "you must add course description" });
    }
    if (!req.body.duration) {
        return res.json({ "status": "fail", "message": "you must add course duration" });
    }
    if (!req.body.instructor) {
        return res.json({ "status": "fail", "message": "you must add course instructor" });
    }
}

function edit(req,res){
    if(!req.body){
       return  res.status(400).json({ "message": "you must edit anyting" });}  
}


module.exports = { create, edit};