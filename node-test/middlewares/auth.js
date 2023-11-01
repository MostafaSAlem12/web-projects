const jwt = require("jsonwebtoken");
const { config } = require("dotenv");
config();

const authorization = function (req, res, next) {
  try {
    const { authorization } = req.headers;
    if (!authorization)
      next(
        res.status(401).json({
          status: "Fail",
          error: true,
          code: 401,
          message: "Unauthenticated",
          data: null,
        })
      );

    if (!authorization.startsWith("Bearer"))
      next(
        res.status(401).json({
          status: "Fail",
          error: true,
          code: 401,
          message: "Unauthenticated",
          data: null,
        })
      );

    const token = authorization.split(" ")[1];
    const isValid = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
    if (!isValid)
      next(
        res.status(401).json({
          status: "Fail",
          error: true,
          code: 401,
          message: "Unauthenticated",
          data: null,
        })
      );

    next();
  } catch (err) {
    if (err.message === "jwt expired") {
      res.status(400).json({
        status: "Fail",
        error: true,
        code: 400,
        message: "Session expired you must login again",
        data: null,
      });
    } else
      res.status(500).json({
        status: "Fail",
        error: true,
        code: 500,
        message: err.message,
        data: null,
      });
  }
};

module.exports = authorization;
