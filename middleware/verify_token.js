const jwt = require("jsonwebtoken");
const verifyToken = async (req, res, next) => {
    const authHeader = req.headers["Authorization"] || req.headers["authorization"];
    if (!authHeader) {
        return res.status(401).json({ "status": "fail", "message": "you must sign in " })
    }
    const token = authHeader.split(" ")[1];
    try {
        jwt.verify(token, process.env.jwtSecretKey);
        next();

    } catch (error) {
        console.log("error" , error);
        return res.status(401). json({"status": "fail", "message" : "you must sign in"});
    }
    console.log("my token ---- ", token);

                                
}

module.exports = verifyToken;
