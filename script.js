const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send(
    "The server lives!! It was hosted on vagrant vms with kubernetes and argo"
  );
});

// Add your script logic here, e.g., app.post('/run-script', ...)

app.listen(port, () => {
  console.log("A new Version has been deployed");
  console.log(`Server running on  http://localhost:${port}`);
});
