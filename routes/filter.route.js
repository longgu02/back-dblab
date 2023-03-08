const express = require("express");

const router = express.Router();

const { pool, client } = require("../db");

router.get("/record/hospital/:hospitalId", async (req, res) => {
  try {
    const id = req.params.hospitalId;
    const filtered = await pool.query(
      `SELECT * FROM record_in_hospital(${id})`
    );
    return res.json({
      filtered: filtered.rows,
      script1: `SELECT * FROM record_in_hospital(${id})`,
    });
  } catch (err) {
    console.error(err.message);
    return res.json({ message: err.message, ...err });
  }
});

module.exports = router;
