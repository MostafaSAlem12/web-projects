const { Router } = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { config } = require("dotenv");
const router = new Router();

const User = require("../models/user");

const auth = require("../middlewares/auth");

config();

router.post("/signup", async function (req, res) {
  try {
    const { name, email, password } = req.body;
    const user = await User.create({ name, email, password });
    res.status(200).json({
      status: "OK",
      error: false,
      code: 200,
      message: "Success",
      data: user,
    });
  } catch (err) {
    res.status(500).json({
      status: "Fail",
      error: true,
      code: 500,
      message: err.message,
      data: null,
    });
  }
});

router.post("/login", async function (req, res) {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user)
      return res.status(400).json({
        status: "OK",
        error: false,
        code: 400,
        message: "Invalid email or password",
        data: null,
      });
    const hasMatch = bcrypt.compareSync(password, user.password);
    if (!hasMatch)
      return res.status(400).json({
        status: "OK",
        error: false,
        code: 400,
        message: "Invalid email or password",
        data: null,
      });
    user.lastLogin = Date.now();
    await user.save();
    const payload = { _id: user._id, name: user.name, email: user.email };
    const accessToken = jwt.sign(payload, process.env.ACCESS_TOKEN_SECRET, {
      expiresIn: "1m",
    });
    const refreshToken = jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET, {
      expiresIn: "1y",
    });
    res.status(200).json({
      status: "OK",
      error: false,
      code: 200,
      message: "Success",
      data: { accessToken, refreshToken },
    });
  } catch (err) {
    res.status(500).json({
      status: "Fail",
      error: true,
      code: 500,
      message: err.message,
      data: null,
    });
  }
});

router.post("/renewAccessToken", function (req, res) {
  try {
    const { token } = req.body;
    if (!token)
      return res.status(400).json({
        status: "Fail",
        error: true,
        code: 400,
        message: "Token is required",
        data: null,
      });
    const isValid = jwt.verify(token, process.env.REFRESH_TOKEN_SECRET);
    if (!isValid)
      return res.status(400).json({
        status: "Fail",
        error: true,
        code: 400,
        message: "Session expired you must login again",
        data: null,
      });
    const user = jwt.decode(token, process.env.REFRESH_TOKEN_SECRET);
    const payload = { _id: user._id, name: user._name, email: user._email };
    const accessToken = jwt.sign(payload, process.env.ACCESS_TOKEN_SECRET, {
      expiresIn: "1m",
    });
    res.status(200).json({
      status: "OK",
      error: false,
      code: 200,
      message: "Success",
      data: { accessToken },
    });
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
});

router.get("/", auth, function (req, res) {
  try {
    res.status(200).json({
      status: "OK",
      error: false,
      code: 200,
      message: "Success",
      data: null,
    });
  } catch (err) {
    res.status(500).json({
      status: "Fail",
      error: true,
      code: 500,
      message: err.message,
      data: null,
    });
  }
});

router.use(function (req, res) {
  res.status(404).json({
    status: "Fail",
    error: true,
    code: 404,
    message: "Not Found",
    data: null,
  });
});

module.exports = router;
