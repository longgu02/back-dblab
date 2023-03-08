const express = require("express");

const router = express.Router();

const { pool, client } = require("../db");

router.put("/record/submit/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const appointments = await pool.query(`SELECT * FROM submit_record(${id})`);
    return res.json({
      status: "success",
      script2: `SELECT * FROM submit_record(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

router.put("/record/dead/:patientId", async (req, res) => {
  try {
    const id = req.params.patientId;
    const appointments = await pool.query(
      `SELECT * FROM handle_dead_patient(${id}, DATE(\'2023-2-25\'), \'cash\', 100, 1200)`
    );
    return res.json({
      status: "success",
      script1: `SELECT * FROM handle_dead_patient(${id}, DATE(\'2023-2-25\'), \'cash\', 100, 1200)`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

router.get("/patient/:patientId/info", async (req, res) => {
  try {
    const id = req.params.patientId;
    const patient = await pool.query(`SELECT * FROM get_patient_info(${id})`);
    const info = patient.rows;
    return res.json({
      status: "success",
      information: info,
      script2: `SELECT * FROM get_patient_info(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

router.get("/record/:recordId/doctor_record", async (req, res) => {
  try {
    const id = req.params.recordId;
    const patient = await pool.query(`SELECT * FROM get_doctor_record(${id})`);
    const info = patient.rows;
    return res.json({
      status: "success",
      result: info,
      script2: `SELECT * FROM get_doctor_record(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

module.exports = router;
