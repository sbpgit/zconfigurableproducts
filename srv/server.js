"use strict";

const cds = require("@sap/cds");
const proxy = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap", app => app.use(proxy()));

module.exports = cds.server;

//const https = require("https");
//const port = process.env.PORT || 3000;
//const server = require("http").createServer();