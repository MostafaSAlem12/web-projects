const express = require("express");
const app = express();
const socketIO = require("socket.io");
const mongoose = require("mongoose");
const limiter = require("./middlewares/request_limiter");
const https = require("https");
const fs = require("fs");
const cors = require("cors");
const { config } = require("dotenv");
const httpsOptions = {
  key: fs.readFileSync("./cert/key.pem"),
  cert: fs.readFileSync("./cert/cert.pem"),
};

const index = require("./routes/index");

const server = https.createServer(httpsOptions, app);

const io = socketIO(server);

config();

console.log("Mode:", process.env.NODE_ENV);

const port = process.env.PORT ?? 3000;
mongoose
  .connect("mongodb://127.0.0.1:27017/nodeTest")
  .then(() => {
    console.log("DB connected");
  })
  .catch((err) => {
    console.log("DB not connectd:", err);
  });

app.use(cors());
app.use(limiter);
app.use(express.json());
app.use("/api/v1", index);
app.get("/", (req, res) => {
  res.status(200).json({
    status: "success",
    error: false,
    code: 200,
    message: "request is fine",
  });
});

io.on("connection", (socket) => {
  socket.on("connection", (data) => {
    socket.user = data.user;
    socket.join(socket.user);
    console.log(socket.user, "connected");
  });
  socket.on("disconnect", () => {
    socket.leave(socket.user);
    io.emit("user-disconnected", `${socket.user} disconnected`);
    console.log(socket.user, "disconnected");
  });
  socket.on("message", function (data) {
    console.log(data);
    socket.emit("message", data);
  });
});

server.listen(port, "0.0.0.0", () => {
  console.log("Server running on port:", port);
});
