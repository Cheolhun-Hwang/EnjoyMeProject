var mysql = require('mysql');

var client = mysql.createConnection({
     host:'localhost',
     port:3306,
     user : 'hooney',
     password : 'hch1458741!',
     database : 'enjoyme'
});


module.exports = client;