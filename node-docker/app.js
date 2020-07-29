const express = require('express');
const mysql = require('mysql');

const app = express();

app.get('/', (req, res) => res.send('Welcome, Express!!'));

const connection = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
});

connection.connect(function (err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }

  console.log('MySQL connected! Connection id: ' + connection.threadId);
});

connection.end();

app.listen(3000, () => {
  console.log('Rest API is ruuning!');
});
