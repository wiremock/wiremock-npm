const express = require("express");

const app = express();
const port = 8082;

app.get("*", function(req, res) {
  res.send(req.path + "\n\nThe frontend! Try browsing to /api/example");
});
app.listen(port, function() {
  console.log("Frontend at port", port);
});
