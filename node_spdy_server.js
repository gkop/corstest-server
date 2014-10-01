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
  var sum, headers, a, b;
  if (req.method === "OPTIONS") {
    headers = {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "x-a, x-b"
    };
    res.writeHead(200, headers);
    res.end();
  }
  else {
    var headers = {
      "Access-Control-Allow-Origin": "*"
    };
    var parsed_url = url.parse(req.url, true);
    if (parsed_url.query.a && parsed_url.query.b) {
      // params passed in query string
      a = parsed_url.query.a;
      b = parsed_url.query.b;
    }
    else {
      // params passed in headers
      a = req.headers['x-a'];
      b = req.headers['x-b'];
    }

    sum = parseInt(a) + parseInt(b);

    if (req.url.match(/eventsource/)) {
      headers["Content-Type"] = "text/event-stream; charset=utf-8";
      res.writeHead(200, headers);
      res.write("event: a\ndata: "+a+"\n\n");
      res.write("event: b\ndata: "+b+"\n\n");
      res.write("event: sum\ndata: "+sum+"\n\n");
    }
    else {
      var response = {
        spdy: (req.socket._httpMessage.isSpdy === true), sum: sum
      }; 
      res.writeHead(200, headers);
      res.end(JSON.stringify(response));
    }
  }
});

server.listen(4002);
