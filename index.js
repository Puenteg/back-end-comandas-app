const express = require('express');
var cors = require('cors');
const connection = require('./connection');
const comandaRoute = require('./routes/comanda')
const app = express();

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use('/comandaRoute', comandaRoute);

module.exports = app;
