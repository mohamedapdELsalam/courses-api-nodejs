var jwt = require('jsonwebtoken');


module.exports = async(payload)=>{
    const token =await jwt.sign(payload, process.env.jwtSecretKey,{expiresIn:"5m"});
    return token;
}
;