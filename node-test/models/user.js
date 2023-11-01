const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const Schema = mongoose.Schema;
const user = new Schema(
  {
    name: {
      type: String,
      required: [true, "Required"],
    },
    email: {
      type: String,
      required: [true, "Required"],
      unique: [true, "Email already taken"],
    },
    password: {
      type: String,
      required: [true, "Required"],
    },
    lastLogin: Date,
  },
  { timestamps: true, versionKey: false }
);

user.pre("save", function (next) {
  if (!this.isModified("password")) return next();
  this.password = bcrypt.hashSync(this.password, 10);
  next();
});
const User = mongoose.model("User", user);
module.exports = User;
