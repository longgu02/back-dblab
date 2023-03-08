const CONFIG = {
  record: {
    type: "normal",
    status: "open",
  },
};

const TABLES = [
  "insurance",
  "patient",
  "record",
  "bill",
  "hospital",
  "doctor_record",
  "prescript",
  "doctor",
];

function getCreatedTime() {
  const dateObj = new Date();
  const month = dateObj.getMonth() + 1;
  const day = String(dateObj.getDate()).padStart(2, "0");
  const year = dateObj.getFullYear();
  const output = year + "-" + month + "-" + day;
  return output;
}

const convertQueryString = (body, table) => {
  switch (table) {
    case "insurance":
      return `${body.patient_id}, \'${body.policy_number}\', \'${body.start_date}\', \'${body.end_date}\'`;
    case "patient":
      return `\'${body.first_name}\', \'${body.last_name}\', \'${body.gender}\', \'${body.dob}\', \'${body.phone}\', \'${body.address}\', \'${body.employment}\', \'${body.work_place}\'`;
    case "record":
      return `${body.patient_id}, ${body.hospital_id}, ${body.bill_id}, \'${
        CONFIG.record.type
      }\', DATE(\'${getCreatedTime()}\'), \'${CONFIG.record.status}\'`;
    case "bill":
      return `\'${body.payment_date}\', \'${body.payment_type}\',${body.insurance_payment}, ${body.total_price}`;
    case "hospital":
      return `\'${body.hospital_name}\', \'${body.province}\', \'${body.address}\', ${body.capacity}`;
    case "doctor_record":
      return `${body.record_id}, ${body.doctor_id}, ${body.prescript_id}, \'${body.examination}\', \'${body.disease}\', \'${body.pathological_process}\'`;
    case "prescript":
      return `\'${body.med_name}\', ${body.quantity}, \'${body.date_ordered}\', \'${body.instruction}\'`;
    case "doctor":
      return `\'${body.first_name}\', \'${body.last_name}\', \'${body.specialization}\'`;
    default:
      return "";
  }
};

module.exports = { TABLES, getCreatedTime, convertQueryString };
