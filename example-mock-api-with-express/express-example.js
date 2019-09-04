const request = require("request");
const express = require("express");

const app = express();
const port = 8080;

// https://stackoverflow.com/questions/10435407/proxy-with-express-js
const use = (path, uriBase) => {
  app.use(path, (req, res, next) => {
    var method, r;
    method = req.method.toLowerCase().replace(/delete/, "del");
    switch (method) {
      case "get":
      case "post":
      case "del":
      case "put":
        const json = req.body;
        const uri = uriBase + req.baseUrl;
        r = request[method]({
          uri: uri,
          qs: req.query,
          json: json
        });
        console.log(
          req.baseUrl + " -> " + method + ": " + uri + " " + (json ? json : "")
        );
        break;
      default:
        return res.send("invalid method");
    }
    return req.pipe(r).pipe(res);
  });
};

use("/api/*", "http://localhost:8081");
use("*", "http://localhost:8082");

app.listen(port, function() {
  console.log("Express at port", port);
});

process.on("uncaughtException", err => {});
