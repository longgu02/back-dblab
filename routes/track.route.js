const express = require("express");

const router = express.Router();

const { pool, client } = require("../db");

router.get("/epidemiology/track/:patientId", async (req, res) => {
  try {
    const id = req.params.patientId;
    const appointments = await pool.query(
      `SELECT * FROM track_epidemiology(${id})`
    );
    const people = await pool.query(
      `SELECT * FROM track_address_and_workplace(${id})`
    );
    const appointmentsResult = appointments.rows;
    const peopleResult = people.rows;
    return res.json({
      status: "success",
      appointments: appointmentsResult,
      people: peopleResult,
      script1: `SELECT * FROM track_epidemiology(${id})`,
      script2: `SELECT * FROM track_address_and_workplace(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

module.exports = router;
