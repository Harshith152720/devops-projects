// very simple test
const http = require('http');
http.get({host:'localhost', port:3000, path:'/'}, res => {
  console.log('status', res.statusCode);
});
