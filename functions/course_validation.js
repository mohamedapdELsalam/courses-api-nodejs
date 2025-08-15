
function courseValidation(req,res){
     if (!req.body.title) {
        return res.json({ "error": "you must add course name" });
    }
    if (!req.body.price) {
        return res.json({ "error": "you must add course price" });
    }
}

module.exports = {courseValidation};