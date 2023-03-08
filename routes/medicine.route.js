const express = require("express");

const router = express.Router();

const { pool, client } = require("../db");

router.get("/medicine/most-prescribe", async (req, res) => {
  try {
    const id = req.params.patientId;
    const MostPrescribed = await pool.query(
      `SELECT * FROM get_most_prescribed_medication(${id})`
    );
    return res.json({
      mostPrescribed: MostPrescribed,
      script1: `SELECT * FROM get_most_prescribed_medication(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

module.exports = router;
