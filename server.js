const http = require("http");
const { exec } = require("child_process");

exec("ls -la"); // insecure test

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Secure CI/CD Pipeline Project 🚀");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
