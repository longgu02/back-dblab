const Pool = require("pg").Pool;
const { Client } = require("pg");

const pool = new Pool({
  user: "postgres",
  password: "admin",
  host: "localhost",
  port: 5432,
  database: "MRDB",
});

const client = new Client({
  user: "postgres",
  password: "admin",
  host: "localhost",
  port: 5432,
  database: "MRDB",
});

const patient = new Client({
  user: "patient",
  password: "12345",
  host: "localhost",
  port: 5432,
  database: "MRDB",
});

module.exports = { pool, client, patient };
