const mysql = require('mysql');
require('dotenv').config();

var connection = mysql.createConnection({
    port: process.env.DB_PORT,
    host: process.env.DB_HOST,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

connection.connect((err)=> {
    if(!err) {
        console.log("Servidor Funcionando!");
    } else {
        console.log("No esta conectada padrino :(", err);
    }
});

module.exports = connection;