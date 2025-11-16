function login(req, res) {
    if (!req.body) {
        return res.json({ "status": "error", "msg": "you must add your email and password1" });
    } else if (!req.body.email && !req.body.password) {
        return res.json({ "status": "error", "msg": "you must add your email and password2" });
    }
    else if (!req.body.email) {
        return res.json({ "status": "error", "msg": "you must add your email" });
    } else if (!req.body.password) {
        return res.json({ "status": "error", "msg": "you must add your password" });
    }
};

function register(req, res) {
    if (!req.body) {
        return res.json({ "status": "error", "msg": "you must add your data (firstName , lastName, email , password )" });
    } 
    let fields = [];
    if(!req.body.firstName){
        fields += "firstName" + " ,";
    }
    if(!req.body.lastName){
        fields += "lastName" + " ,"; 
    }
    if(!req.body.email){
        fields += "email"+ " ,";
    }
    if(!req.body.password){
        fields += "password"+ "";
    }
    if(fields.length > 0){
        return res.json({ "status": "error", "msg": 'you must add your : ' + fields  });
    }
};


module.exports = {  login , register};