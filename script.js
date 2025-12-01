const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello from testscript.zzyra.io! Your JS script is live.");
});

// Add your script logic here, e.g., app.post('/run-script', ...)

app.listen(port, () => {
  console.log(`Server running on  http://localhost:${port}`);
});
