const express = require("express");
const app = express();
const port = 1234;
const { pool, client, patient } = require("./db");
const cors = require("cors");
const bodyParser = require("body-parser");

// client.connect();
patient.connect();

app.use(cors());
app.use(express.json());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

app.get("/", (req, res) => {
  return res.json({ message: "Hello" });
});

const trackRoute = require("./routes/track.route");
const crudRoute = require("./routes/crud.route");
const recordRoute = require("./routes/record.route");
const medicineRoute = require("./routes/medicine.route");
const filterRoute = require("./routes/filter.route");

app.use("/api/v1/", trackRoute);
app.use("/api/v1/", crudRoute);
app.use("/api/v1/", recordRoute);
app.use("/api/v1/", medicineRoute);
app.use("/api/v1/", filterRoute);

app.post("/staff/insert", async (req, res) => {
  const { name, age } = req.body;
  try {
    const newStaff = pool.query(
      `INSERT INTO staff (name, age) VALUES ('${name}', ${age}) RETURNING * ;`
    );
    // result = newStaff.rows;
    // resultDisplay = result.slice(0, 10);
    return res.json(newStaff.rows);
  } catch (err) {
    console.error(err.message);
    return res.json(err);
  }
});

app.get("/record", async (req, res) => {
  try {
    const staff = await pool.query("SELECT * FROM Record");
    const result = staff.rows;
    const resultDisplay = result.slice(0, 100);
    return res.json(resultDisplay);
  } catch (err) {
    console.error(err.message);
    return res.json(err);
  }
});

app.get("/patient/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const patient = await pool.query(`SELECT * from read_patient(${id})`);
    const result = patient.rows;
    return res.json(result);
  } catch (err) {
    console.error(err.message);
    return res.json(err);
  }
});

app.get("/doctor-record/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const patient = await pool.query(`SELECT * from read_doctor_record(${id})`);
    const result = patient.rows;
    return res.json(result);
  } catch (err) {
    console.error(err.message);
    return res.json(err);
  }
});

app.listen(port, () => {
  console.log(`Server listening on ${port}`);
});
