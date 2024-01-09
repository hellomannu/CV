# CV
My simple node application with hello world
and the file name is server.js and when we have run it then we fire this command node server.js

var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello World!");
}
var www = http.createServer(handleRequest);
www.listen(8080);
