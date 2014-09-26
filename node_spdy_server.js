var spdy = require('spdy'),
    fs = require('fs'),
    url = require('url');

var options = {
  key: fs.readFileSync("/home/gabe/corstest-api_coshx_com.key"),
  cert: fs.readFileSync("/home/gabe/corstest-api_coshx_com_bundle.crt"),

  // **optional** SPDY-specific options
  windowSize: 1024 * 1024, // Server's window size

  // **optional** if true - server will send 3.1 frames on 3.0 *plain* spdy
  autoSpdy31: false
};

var server = spdy.createServer(options, function(req, res) {
  res.writeHead(200, {"Access-Control-Allow-Origin": "*"});
  var parsed_url = url.parse(req.url, true);
  var sum = parseInt(parsed_url.query.a) + parseInt(parsed_url.query.b);
  var response = {spdy: (req.socket._httpMessage.isSpdy === true), sum: sum}; 
  res.end(JSON.stringify(response));
});

server.listen(4002);
