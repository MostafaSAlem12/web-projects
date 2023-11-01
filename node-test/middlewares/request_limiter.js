const expressLimiter = require("express-rate-limit");
const limiter = expressLimiter({
  windowMs: 60 * 60 * 60 * 1000,
  limit: 1000,
  message: {
    status: "failure",
    error: true,
    code: 429,
    message: "Too many requests try again later",
  },
});

module.exports = limiter;
