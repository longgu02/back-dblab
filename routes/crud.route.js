const express = require("express");
const router = express.Router();
const { pool, client, patient } = require("../db");

const {
  TABLES,
  getCreatedTime,
  convertQueryString,
} = require("../utils/index");

// TABLES.map((table) => {
//   router.get(`${table.replace("_", "-")}/:id`, async (req, res) => {
//     try {
//       const id = req.params.id;
//       const patient = await pool.query(`SELECT * from read_${table}(${id})`);
//       const result = patient.rows;
//       return res.json(result);
//     } catch (err) {
//       console.error(err.message);
//       return res.json(err);
//     }
//   });
// });

router.get("/:table/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const table = req.params.table;
    if (!TABLES.includes(table)) {
      throw new Error("Invalid table");
    }
    const patient = await pool.query(`SELECT * from read_${table}(${id})`);
    const result = patient.rows;
    return res.json({ result: result });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

router.get("/:table", async (req, res) => {
  try {
    const id = req.params.id;
    const table = req.params.table;
    if (!TABLES.includes(table)) {
      throw new Error("Invalid table");
    }
    const patient = await pool.query(
      `SELECT * from ${table.charAt(0).toUpperCase() + table.slice(1)}`
    );
    const result = patient.rows;
    return res.json({
      result: result,
      script: `SELECT * from ${table.charAt(0).toUpperCase() + table.slice(1)}`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

router.post("/:table/create", async (req, res) => {
  try {
    const body = req.body;
    const table = req.params.table;
    if (!TABLES.includes(table)) {
      throw new Error("Invalid table");
    }
    const script = `SELECT * from create_${table}(${convertQueryString(
      body,
      table
    )})`;
    console.log(script);
    const patient = await pool.query(
      `SELECT * from create_${table}(${convertQueryString(body, table)})`
    );
    return res.json({
      status: "success",
      script,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({
      status: "failed",
      message: err.message,
      ...err,
    });
  }
});

router.put("/:table/:id/update", async (req, res) => {
  try {
    const id = req.params.id;
    const body = req.body;
    const table = req.params.table;
    if (!TABLES.includes(table)) {
      throw new Error("Invalid table");
    }
    console.log(
      `SELECT * from update_${table}(${id}, ${convertQueryString(body, table)})`
    );
    const patient = await pool.query(
      `SELECT * from update_${table}(${id}, ${convertQueryString(body, table)})`
    );
    const result = patient.rows;
    return res.json({
      status: "success",
      script: `SELECT * from update_${table}(${id}, ${convertQueryString(
        body,
        table
      )})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

router.delete("/:table/:id/delete", async (req, res) => {
  try {
    const id = req.params.id;
    const table = req.params.table;
    if (!TABLES.includes(table)) {
      throw new Error("Invalid table");
    }
    const patient = await pool.query(`SELECT * from delete_${table}(${id})`);
    const result = patient.rows;
    return res.json({
      status: "success",
      script: `SELECT * from delete_${table}(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

module.exports = router;
