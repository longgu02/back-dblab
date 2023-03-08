CREATE ROLE Admin WITH LOGIN PASSWORD 'admin';
ALTER USER Admin WITH SUPERUSER;

-- Ministry
CREATE ROLE Ministry WITH LOGIN PASSWORD '12345678';
GRANT EXECUTE ON FUNCTION read_patient(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_hospital(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_record(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_doctor_record(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_insurance(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_doctor(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_bill(INTEGER) TO Ministry;
GRANT EXECUTE ON FUNCTION read_prescript(INTEGER) TO Ministry;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO Hospital_Staff;

-- Hospital Staff
CREATE ROLE Hospital_Staff WITH LOGIN PASSWORD '123456';
GRANT EXECUTE ON FUNCTION read_patient(INTEGER) TO Hospital_Staff;
GRANT EXECUTE ON FUNCTION read_doctor(INTEGER) TO Hospital_Staff;
GRANT EXECUTE ON FUNCTION create_patient(VARCHAR, VARCHAR, enum_gender, DATE, VARCHAR, VARCHAR, VARCHAR, VARCHAR) to Hospital_Staff;
GRANT EXECUTE ON FUNCTION update_patient(INTEGER,VARCHAR, VARCHAR, enum_gender, DATE, VARCHAR, VARCHAR, VARCHAR, VARCHAR) to Hospital_Staff;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO Hospital_Staff;
GRANT CREATE ON ALL TABLES IN SCHEMA public TO Hospital_Staff;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO Hospital_Staff;



-- Patient 
CREATE ROLE patient WITH LOGIN PASSWORD '12345';
GRANT EXECUTE ON FUNCTION read_patient(INTEGER) TO Patient;
GRANT EXECUTE ON FUNCTION read_doctor_record(INTEGER) TO Patient;
GRANT EXECUTE ON FUNCTION read_insurance(INTEGER) TO Patient;
GRANT EXECUTE ON FUNCTION read_bill(INTEGER) TO Patient;
GRANT EXECUTE ON FUNCTION read_prescript(INTEGER) TO Patient;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO Patient;