const appError = require("../utls/app_errors");

module.exports = (...roles) => {
    return (req, res, next) => {
        if (!roles.includes(req.currentUser.role)) {
            return next(appError.create("your role is not authorized , this is limit only for : " + roles, 401,"error"));
        }
        next();
    };
}

