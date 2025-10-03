
function create(req,res){
     if (!req.body.title) {
        return res.json({ "error": "you must add course name" });
    }
    if (!req.body.price) {
        return res.json({ "error": "you must add course price" });
    }
}
function edit(req,res){
    if(req.body.title == null && req.body.price == null){
       return  res.status(400).json({ "message": "you must add a new title or a new price" });}  
}


module.exports = { create, edit};