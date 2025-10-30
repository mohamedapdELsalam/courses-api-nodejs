
function add(req,res){
     if (!req.body.title) {
        return res.json({ "status": "fail", "message": "you must add lesson title" });
    }
    if (!req.body.course) {
        return res.json({ "status": "fail", "message": "you must add course lesson" });
    }
    if (!req.body.videoUrl) {
        return res.json({ "status": "fail", "message": "you must add lesson videoUrl" });
    }
    if (!req.body.duration) {
        return res.json({ "status": "fail", "message": "you must add lesson duration" });
    }
    if (!req.body.order) {
        return res.json({ "status": "fail", "message": "you must add lesson order" });
    }
}

function edit(req,res){
    if(req.body.title == null && req.body.price == null){
       return  res.status(400).json({ "message": "you must add a new title or a new price" });}  
}


module.exports = {add, edit};