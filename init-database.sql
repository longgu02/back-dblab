create type enum_pay_type as enum('cash', 'credit card');

create table if not exists Bill(
  bill_id SERIAL primary key,
  payment_type enum_pay_type,
  payment_date date,
  insurance_payment int,
  total_price int
);

create table if not exists Doctor(
  doctor_id SERIAL primary key,
  first_name varchar(50),
  last_name varchar(50),
  specialization varchar(50)
);

create table if not exists Prescript(
  prescript_id SERIAL primary key,
  med_name varchar(50),
  date_ordered date,
  instruction varchar(200),
  quantity int
);

create table if not exists Hospital(
  hospital_id SERIAL primary key,
  hospital_name varchar(50),
  province varchar(50),
  address varchar(50),
  capacity int
);

create type enum_gender as enum('male', 'female');

create table if not exists Patient(
  patient_id SERIAL primary key,
  first_name varchar(100),
  last_name varchar(100),
  gender enum_gender,
  dob date,
  phone varchar(12),
  address varchar(100),
  employment varchar(50),
  work_place varchar(100)
);

create table if not exists Insurance(
  insurance_id SERIAL primary key,
  patient_id INT,
  policy_number varchar(20),
  start_date date,
  end_date date check (start_date <= end_date),
  foreign key (patient_id) references patient(patient_id)
);

create type enum_rtype as enum('normal', 'dead');

create type enum_status as enum('pending', 'approved', 'open');

create table if not exists Record(
  record_id SERIAL primary key,
  hospital_id INT,
  patient_id INT,
  bill_id INT,
  type enum_rtype,
  created_time date,
  status enum_status,
  foreign key (hospital_id) references hospital(hospital_id),
  foreign key (patient_id) references patient(patient_id),
  foreign key (bill_id) references bill(bill_id)
);

create table if not exists DoctorRecord(
  doctor_record_id SERIAL primary key,
  record_id INT,
  doctor_id INT,
  prescript_id INT,
  examination varchar(1000),
  disease varchar(100),
  pathological_process varchar(1000),
  foreign key (record_id) references record(record_id),
  foreign key (doctor_id) references doctor(doctor_id),
  foreign key (prescript_id) references prescript(prescript_id)
);

INSERT INTO
  Patient(
    first_name,
    last_name,
    gender,
    dob,
    phone,
    address,
    employment,
    work_place
  )
VALUES
  (
    'John',
    'Doe',
    'male',
    '1995-01-01',
    '1234567890',
    '123 Main St.',
    'Software Engineer',
    'OpenAI'
  ),
  (
    'Jane',
    'Doe',
    'female',
    '1997-02-01',
    '1234567891',
    '456 Main St.',
    'Teacher',
    'ABC School'
  ),
  (
    'Jim',
    'Smith',
    'male',
    '1999-03-01',
    '1234567892',
    '789 Main St.',
    'Doctor',
    'XYZ Hospital'
  ),
  (
    'Sarah',
    'Brown',
    'female',
    '2000-04-01',
    '1234567893',
    '321 Main St.',
    'Engineer',
    'DEF Company'
  ),
  (
    'Tom',
    'Wilson',
    'male',
    '2002-05-01',
    '1234567894',
    '654 Main St.',
    'Nurse',
    'GHI Clinic'
  ),
  (
    'Kim',
    'Miller',
    'female',
    '2003-06-01',
    '1234567895',
    '987 Main St.',
    'Police Officer',
    'JKL Police Dept.'
  ),
  (
    'David',
    'Davis',
    'male',
    '2004-07-01',
    '1234567896',
    '246 Main St.',
    'Firefighter',
    'MNO Fire Dept.'
  ),
  (
    'Emily',
    'Anderson',
    'female',
    '2005-08-01',
    '1234567897',
    '369 Main St.',
    'Teacher',
    'PQR School'
  ),
  (
    'William',
    'Taylor',
    'male',
    '2006-09-01',
    '1234567898',
    '159 Main St.',
    'Mechanic',
    'STU Garage'
  ),
  (
    'Elizabeth',
    'Thomas',
    'female',
    '2007-10-01',
    '1234567899',
    '753 Main St.',
    'Lawyer',
    'VWX Law Firm'
  ),
  (
    'Michael',
    'Moore',
    'male',
    '2008-11-01',
    '1234567800',
    '951 Main St.',
    'Accountant',
    'YZ Accounting'
  ),
  (
    'Sophia',
    'Jackson',
    'female',
    '2009-12-01',
    '1234567801',
    '147 Main St.',
    'Architect',
    'BCD Architecture'
  ),
  (
    'Alexander',
    'Lewis',
    'male',
    '2010-01-01',
    '1234567802',
    '258 Main St.',
    'Surgeon',
    'EFG Hospital'
  ),
  (
    'Mia',
    'Young',
    'female',
    '2011-02-01',
    '1234567803',
    '369 Main St.',
    'Veterinarian',
    'HIJ Vet Clinic'
  ),
  (
    'Joshua',
    'Allen',
    'male',
    '2012-03-01',
    '1234567804',
    '159 Main St.',
    'Dentist',
    'KLM Dental'
  ),
  (
    'Ava',
    'King',
    'female',
    '2013-04-01',
    '1234567805',
    '753 Main St.',
    'Physician',
    'NOP Medical'
  ),
  (
    'Daniel',
    'Wright',
    'male',
    '2014-05-01',
    '1234567806',
    '951 Main St.',
    'Optometrist',
    'QRS Eye Care'
  ),
  (
    'Evelyn',
    'Scott',
    'female',
    '2015-06-01',
    '1234567807',
    '147 Main St.',
    'Pharmacist',
    'TUV Pharmacy'
  ),
  (
    'Christopher',
    'Green',
    'male',
    '2016-07-01',
    '1234567808',
    '258 Main St.',
    'Chiropractor',
    'WXY Wellness'
  ),
  (
    'Isabelle',
    'Baker',
    'female',
    '2017-08-01',
    '1234567809',
    '369 Main St.',
    'Physical Therapist',
    'ZAB Therapy'
  ),
  (
    'Nicholas',
    'Adams',
    'male',
    '2018-09-01',
    '1234567810',
    '159 Main St.',
    'Psychologist',
    'CDE Mental Health'
  ),
  (
    'Natalie',
    'Nelson',
    'female',
    '2019-10-01',
    '1234567811',
    '753 Main St.',
    'Therapist',
    'FGH Care'
  ),
  (
    'Matthew',
    'Carter',
    'male',
    '2020-11-01',
    '1234567812',
    '951 Main St.',
    'Nutritionist',
    'IJK Health'
  ),
  (
    'Avery',
    'Mitchell',
    'female',
    '2021-12-01',
    '1234567813',
    '147 Main St.',
    'Speech Therapist',
    'LMN Speech'
  ),
  (
    'Jacob',
    'Perez',
    'male',
    '2022-01-01',
    '1234567814',
    '258 Main St.',
    'Audiologist',
    'OPQ Hearing'
  ),
  (
    'Ella',
    'Roberts',
    'female',
    '2022-02-01',
    '1234567815',
    '369 Main St.',
    'Podiatrist',
    'RST Foot Care'
  ),
  (
    'William',
    'Turner',
    'male',
    '2022-03-01',
    '1234567816',
    '159 Main St.',
    'Acupuncturist',
    'UVW Healing'
  ),
  (
    'Natalie',
    'Phillips',
    'female',
    '2022-04-01',
    '1234567817',
    '753 Main St.',
    'Massage Therapist',
    'WXY Relaxation'
  ),
  (
    'Michael',
    'Campbell',
    'male',
    '2022-05-01',
    '1234567818',
    '951 Main St.',
    'Rehab Specialist',
    'ZAB Rehab'
  ),
  (
    'Lily',
    'Parker',
    'female',
    '2022-06-01',
    '1234567819',
    '147 Main St.',
    'Occupational Therapist',
    'CDE Occupation'
  ),
  (
    'Brandon',
    'Evans',
    'male',
    '2022-07-01',
    '1234567820',
    '258 Main St.',
    'Sports Medicine Doctor',
    'FGH Sports'
  ),
  (
    'Ava',
    'Edwards',
    'female',
    '2022-08-01',
    '1234567821',
    '369 Main St.',
    'Orthopedic Surgeon',
    'IJK Bones'
  ),
  (
    'Ethan',
    'Collins',
    'male',
    '2022-09-01',
    '1234567822',
    '159 Main St.',
    'Physical Medicine Doctor',
    'LMN Medicine'
  ),
  (
    'Sophia',
    'Stewart',
    'female',
    '2022-10-01',
    '1234567823',
    '753 Main St.',
    'Chiropractor',
    'OPQ Wellness'
  ),
  (
    'Alexander',
    'Sanchez',
    'male',
    '2022-11-01',
    '1234567824',
    '951 Main St.',
    'Occupational Therapist',
    'RST Occupation'
  ),
  (
    'Charlotte',
    'Morris',
    'female',
    '2022-12-01',
    '1234567825',
    '147 Main St.',
    'Orthopedic Surgeon',
    'UVW Bones'
  ),
  (
    'Daniel',
    'Rogers',
    'male',
    '2023-01-01',
    '1234567826',
    '258 Main St.',
    'Physical Medicine Doctor',
    'WXY Medicine'
  ),
  (
    'Aria',
    'Reed',
    'female',
    '2023-02-01',
    '1234567827',
    '369 Main St.',
    'Sports Medicine Doctor',
    'ZAB Sports'
  ),
  (
    'Evan',
    'Cook',
    'male',
    '2023-03-01',
    '1234567828',
    '159 Main St.',
    'Chiropractor',
    'CDE Wellness'
  ),
  (
    'Avery',
    'Bailey',
    'female',
    '2023-04-01',
    '1234567829',
    '753 Main St.',
    'Physical Therapist',
    'FGH Therapy'
  ),
  (
    'Nathan',
    'Bell',
    'male',
    '2023-05-01',
    '1234567830',
    '951 Main St.',
    'Podiatrist',
    'IJK Foot Care'
  ),
  (
    'Avery',
    'Cooper',
    'female',
    '2023-06-01',
    '1234567831',
    '147 Main St.',
    'Acupuncturist',
    'LMN Healing'
  ),
  (
    'Noah',
    'Richardson',
    'male',
    '2023-07-01',
    '1234567832',
    '258 Main St.',
    'Massage Therapist',
    'OPQ Relaxation'
  ),
  (
    'Isabelle',
    'Cox',
    'female',
    '2023-08-01',
    '1234567833',
    '369 Main St.',
    'Orthopedic Surgeon',
    'RST Bones'
  ),
  (
    'Mason',
    'Howard',
    'male',
    '2023-09-01',
    '1234567834',
    '159 Main St.',
    'Physical Medicine Doctor',
    'UVW Medicine'
  ),
  (
    'Evelyn',
    'Ward',
    'female',
    '2023-10-01',
    '1234567835',
    '753 Main St.',
    'Chiropractor',
    'WXY Wellness'
  ),
  (
    'Jacob',
    'Torres',
    'male',
    '2023-11-01',
    '1234567836',
    '951 Main St.',
    'Occupational Therapist',
    'ZAB Occupation'
  ),
  (
    'Mia',
    'Peterson',
    'female',
    '2023-12-01',
    '1234567837',
    '147 Main St.',
    'Orthopedic Surgeon',
    'CDE Bones'
  ),
  (
    'William',
    'Gray',
    'male',
    '2024-01-01',
    '1234567838',
    '258 Main St.',
    'Physical Medicine Doctor',
    'FGH Medicine'
  ),
  (
    'Ella',
    'Ramirez',
    'female',
    '2024-02-01',
    '1234567839',
    '369 Main St.',
    'Sports Medicine Doctor',
    'IJK Sports'
  ),
  (
    'Michael',
    'James',
    'male',
    '2024-03-01',
    '1234567840',
    '159 Main St.',
    'Chiropractor',
    'LMN Wellness'
  ),
  (
    'Emily',
    'Watson',
    'female',
    '2024-04-01',
    '1234567841',
    '753 Main St.',
    'Physical Therapist',
    'OPQ Therapy'
  ),
  (
    ' Benjamin',
    'Brooks',
    'male',
    '2024-05-01',
    '1234567842',
    '951 Main St.',
    'Podiatrist',
    'RST Foot Care'
  ),
  (
    'Abigail',
    'Kelly',
    'female',
    '2024-06-01',
    '1234567843',
    '147 Main St.',
    'Acupuncturist',
    'UVW Healing'
  ),
  (
    'Alexander',
    'Price',
    'male',
    '2024-07-01',
    '1234567844',
    '258 Main St.',
    'Orthopedic Surgeon',
    'WXY Bones'
  ),
  (
    'Sophia',
    'Bennett',
    'female',
    '2024-08-01',
    '1234567845',
    '369 Main St.',
    'Physical Medicine Doctor',
    'ZAB Medicine'
  ),
  (
    'Matthew',
    'Wood',
    'male',
    '2024-09-01',
    '1234567846',
    '159 Main St.',
    'Chiropractor',
    'CDE Wellness'
  ),
  (
    'Avery',
    'Barnes',
    'female',
    '2024-10-01',
    '1234567847',
    '753 Main St.',
    'Physical Therapist',
    'FGH Therapy'
  ),
  (
    'Daniel',
    'Ross',
    'male',
    '2024-11-01',
    '1234567848',
    '951 Main St.',
    'Sports Medicine Doctor',
    'IJK Sports'
  ),
  (
    'Madison',
    'Henderson',
    'female',
    '2024-12-01',
    '1234567849',
    '147 Main St.',
    'Orthopedic Surgeon',
    'LMN Bones'
  ),
  (
    'Lucas',
    'Coleman',
    'male',
    '2025-01-01',
    '1234567850',
    '258 Main St.',
    'Physical Medicine Doctor',
    'OPQ Medicine'
  ),
  (
    'Aaliyah',
    'Jenkins',
    'female',
    '2025-02-01',
    '1234567851',
    '369 Main St.',
    'Chiropractor',
    'RST Wellness'
  ),
  (
    'William',
    'Perry',
    'male',
    '2025-03-01',
    '1234567852',
    '159 Main St.',
    'Physical Therapist',
    'UVW Therapy'
  ),
  (
    'Natalie',
    'Harrison',
    'female',
    '2025-04-01',
    '1234567853',
    '753 Main St.',
    'Sports Medicine Doctor',
    'WXY Sports'
  );

INSERT INTO
  Hospital(
    hospital_name,
    province,
    address,
    capacity
  )
VALUES
  (
    'Grace Hospital',
    'Ontario',
    '123 Main St.',
    100
  ),
  (
    'St. Joseph Hospital',
    'Ontario',
    '456 Main St.',
    200
  ),
  (
    'Holy Cross Hospital',
    'Alberta',
    '789 Main St.',
    150
  ),
  (
    'Sunnybrook Hospital',
    'Ontario',
    '246 Main St.',
    250
  ),
  (
    'Children Hospital',
    'Alberta',
    '369 Main St.',
    300
  ),
  (
    'Toronto General Hospital',
    'Ontario',
    '159 Main St.',
    400
  ),
  (
    'Mount Sinai Hospital',
    'Ontario',
    '753 Main St.',
    200
  ),
  (
    'London Health Sciences Centre',
    'Ontario',
    '951 Main St.',
    250
  ),
  (
    'Queensway Carleton Hospital',
    'Ontario',
    '147 Main St.',
    150
  ),
  (
    'The Ottawa Hospital',
    'Ontario',
    '258 Main St.',
    300
  );

INSERT INTO
  Insurance(
    patient_id,
    policy_number,
    start_date,
    end_date
  )
VALUES
  (
    1,
    '2gKU8Il6HbwJ15jfN67a',
    '2022-06-01',
    '2022-12-01'
  ),
  (
    2,
    'uE6oAJHxR1L9sTzNg3qK',
    '2022-07-01',
    '2023-01-01'
  ),
  (
    3,
    'Zjg9OPpS7R0dH1N8a5vK',
    '2022-08-01',
    '2023-02-01'
  ),
  (
    4,
    'W7b8nmvG0d1L5zK9x6pj',
    '2022-09-01',
    '2023-03-01'
  ),
  (
    5,
    'x1Qn9zN8jK4o7L6b0pRd',
    '2022-10-01',
    '2023-04-01'
  ),
  (
    6,
    'q3rK1J2gT8L6wN0d7x9a',
    '2022-11-01',
    '2023-05-01'
  ),
  (
    7,
    'e5N7gT0d6r1wK2j3r9z8',
    '2022-12-01',
    '2023-06-01'
  ),
  (
    8,
    'i1j6wK2g7r3xN9e0d8z5',
    '2023-01-01',
    '2023-07-01'
  ),
  (
    9,
    'b5z9xN8jK7o3L1q6p0rD',
    '2023-02-01',
    '2023-08-01'
  ),
  (
    10,
    'j9K3o7L6b8n1vG0d5z2x',
    '2023-03-01',
    '2023-09-01'
  ),
  (
    11,
    'g6r1wK2j3r7N9e0d8z5t',
    '2023-04-01',
    '2023-10-01'
  ),
  (
    12,
    'p0rD5z9xN7jK3o1L6b8q',
    '2023-05-01',
    '2023-11-01'
  ),
  (
    13,
    'vG0d5z2xJ9K7o3L1b8n9',
    '2023-06-01',
    '2023-12-01'
  ),
  (
    14,
    'wJ2g7r3xN9e0d6r1k8z5',
    '2023-07-01',
    '2024-01-01'
  ),
  (
    15,
    'o7L6b8n1vG0d5z2xJ9K3',
    '2023-08-01',
    '2024-02-01'
  ),
  (
    16,
    'r1wK2j3r7N9e0d8z5t6g',
    '2023-09-01',
    '2024-03-01'
  ),
  (
    17,
    'xN8jK7o3L1q6p0rD5z9b',
    '2023-10-01',
    '2024-04-02'
  );

INSERT INTO
  Bill(
    payment_date,
    payment_type,
    insurance_payment,
    total_price
  )
VALUES
  ( '2022-07-01', 'cash', 50, 100),
  ( '2022-07-02', 'credit card', 75, 150),
  ( '2022-07-03', 'cash', 60, 120),
  ( '2022-07-04', 'credit card', 70, 140),
  ( '2022-07-05', 'cash', 55, 110),
  ( '2022-07-06', 'credit card', 65, 130),
  ( '2022-07-07', 'cash', 80, 160),
  ('2022-07-08', 'credit card', 90, 180),
  ('2022-07-09', 'cash', 95, 190),
  ('2022-07-10', 'credit card', 100, 200),
  ('2022-07-11', 'cash', 40, 80),
  ('2022-07-12', 'credit card', 30, 60),
  ('2022-07-13', 'cash', 20, 40),
  ('2022-07-14', 'credit card', 10, 20),
  ('2022-07-15', 'cash', 70, 140),
  ('2022-07-16', 'credit card', 75, 150),
  ('2022-07-17', 'cash', 80, 160),
  ('2022-07-18', 'credit card', 85, 170),
  ('2022-07-19', 'cash', 90, 180),
  ('2022-07-20', 'credit card', 95, 190),
  ('2022-07-21', 'cash', 100, 200),
  ('2022-07-22', 'credit card', 105, 210),
  ('2022-07-23', 'cash', 110, 220),
  ('2022-07-24', 'credit card', 115, 230),
  ('2022-07-25', 'cash', 120, 240),
  ('2022-07-26', 'credit card', 125, 250),
  ('2022-07-27', 'cash', 130, 260),
  ('2022-07-28', 'credit card', 135, 270),
  ('2022-07-29', 'cash', 140, 280),
  ('2022-07-30', 'credit card', 145, 290),
  ('2022-07-31', 'cash', 150, 300),
  ('2022-08-01', 'credit card', 155, 310),
  ('2022-08-02', 'cash', 160, 320);

INSERT INTO
  Record(
    hospital_id,
    patient_id,
    bill_id,
    type,
    created_time,
    status
  )
VALUES
  (1, 2, 1, 'normal', '2022-06-01', 'pending'),
  (3, 45, 2, 'dead', '2022-06-02', 'approved'),
  (5, 1, 3, 'normal', '2022-06-03', 'open'),
  (6, 42, 4, 'dead', '2022-06-04', 'pending'),
  (7, 10, 5, 'normal', '2022-06-05', 'approved'),
  (10, 49, 6, 'dead', '2022-06-06', 'open'),
  (2, 20, 7, 'normal', '2022-06-07', 'pending'),
  (4, 35, 8, 'dead', '2022-06-08', 'approved'),
  (1, 5, 9, 'normal', '2022-06-09', 'open'),
  (8, 18, 10, 'dead', '2022-06-10', 'pending'),
  (6, 7, 11, 'normal', '2022-06-11', 'approved'),
  (9, 44, 12, 'dead', '2022-06-12', 'open'),
  (2, 3, 13, 'normal', '2022-06-13', 'pending'),
  (5, 26, 14, 'dead', '2022-06-14', 'approved'),
  (7, 50, 15, 'normal', '2022-06-15', 'open'),
  (10, 8, 16, 'dead', '2022-06-16', 'pending'),
  (3, 14, 17, 'normal', '2022-06-17', 'approved'),
  (6, 23, 18, 'dead', '2022-06-18', 'open'),
  (2, 38, 19, 'normal', '2022-06-19', 'pending'),
  (8, 42, 20, 'dead', '2022-06-20', 'approved'),
  (4, 21, 21, 'normal', '2022-06-21', 'open'),
  (10, 6, 22, 'dead', '2022-06-22', 'pending'),
  (1, 28, 23, 'normal', '2022-06-23', 'approved'),
  (7, 49, 24, 'dead', '2022-06-24', 'open'),
  (3, 15, 25, 'normal', '2022-06-25', 'pending'),
  (9, 25, 26, 'dead', '2022-06-26', 'approved'),
  (5, 7, 27, 'normal', '2022-06-27', 'open'),
  (6, 30, 28, 'dead', '2022-06-28', 'pending'),
  (2, 44, 29, 'normal', '2022-06-29', 'approved'),
  (8, 1, 30, 'dead', '2022-06-30', 'open'),
  (4, 37, 31, 'normal', '2022-07-01', 'pending'),
  (10, 50, 32, 'dead', '2022-07-02', 'approved'),
  (1, 17, 33, 'normal', '2022-07-03', 'open');

INSERT INTO
  Doctor(
    first_name,
    last_name,
    specialization
  )
VALUES
  ('John', 'Doe', 'Pediatrics'),
  ('Jane', 'Smith', 'Surgery'),
  ('Michael', 'Johnson', 'Cardiology'),
  ('William', 'Jones', 'Orthopedics'),
  ('Emily', 'Brown', 'Dermatology'),
  ('Jacob', 'Davis', 'Neurology'),
  ('Sophia', 'Miller', 'Oncology'),
  ('Olivia', 'Wilson', 'Gastroenterology'),
  ('Ava', 'Anderson', 'Radiology'),
  ( 'Isabella', 'Thomas', 'Anesthesiology'),
  (
    'Mia',
    'Jackson',
    'Obstetrics and Gynecology'
  ),
  ('Charlotte', 'White', 'Ophthalmology'),
  ('Amelia', 'Harris', 'Urology'),
  ('Harper', 'Martin', 'Psychiatry'),
  (
    
    'Evelyn',
    'Thompson',
    'Physical Medicine and Rehabilitation'
  ),
  ( 'Abigail', 'Young', 'Pulmonology'),
  ('Elizabeth', 'Allen', 'Infectious Diseases'),
  ( 'Sofia', 'King', 'Endocrinology'),
  ('Avery', 'Wright', 'Nephrology'),
  ( 'Ella', 'Scott', 'Hematology');

-- Cardiology
-- Pediatrics
-- Neurology
-- Orthopedics
-- Oncology
-- Anesthesiology
-- Obstetrics and Gynecology
-- Ophthalmology
-- Dermatology
-- Radiology
-- Emergency Medicine
-- Gastroenterology
-- Geriatrics
-- Hematology
-- Infectious Disease
-- Internal Medicine
-- Rheumatology
-- Psychiatry
-- Pulmonology
-- Surgery.
INSERT INTO
  Prescript(med_name, quantity, date_ordered, instruction)
VALUES
  (
    'Acetaminophen',
    10,
    '2022-09-01',
    'Take 2 pills every 6 hours with a glass of water.'
  ),
  (
    'Ibuprofen',
    12,
    '2022-10-15',
    'Take 1 pill every 4 hours with a glass of water.'
  ),
  (
    'Aspirin',
    15,
    '2022-11-05',
    'Take 2 pills every 12 hours with a glass of water.'
  ),
  (
    'Naproxen',
    20,
    '2022-12-01',
    'Take 1 pill every 8 hours with a glass of water.'
  ),
  (
    'Metformin',
    30,
    '2022-01-15',
    'Take 1 pill every morning with a glass of water.'
  ),
  (
    'Lisinopril',
    25,
    '2022-02-10',
    'Take 1 pill every morning with a glass of water.'
  ),
  (
    'Amoxicillin',
    50,
    '2022-03-01',
    'Take 2 pills every 8 hours with a glass of water.'
  ),
  (
    'Clindamycin',
    35,
    '2022-04-15',
    'Take 2 pills every 12 hours with a glass of water.'
  ),
  (
    'Prednisone',
    40,
    '2022-05-05',
    'Take 1 pill every morning with a glass of water.'
  ),
  (
    'Doxycycline',
    45,
    '2022-06-01',
    'Take 2 pills every 12 hours with a glass of water.'
  ),
  (
    'Atorvastatin',
    60,
    '2022-07-15',
    'Take 1 pill every evening with a glass of water.'
  ),
  (
    'Hydrochlorothiazide',
    50,
    '2022-08-10',
    'Take 1 pill every morning with a glass of water.'
  ),
  (
    'Metoprolol',
    55,
    '2022-09-01',
    'Take 1 pill every morning with a glass of water.'
  ),
  (
    'Amlodipine',
    65,
    '2022-10-15',
    'Take 1 pill every evening with a glass of water.'
  );

INSERT INTO
  DoctorRecord(
    record_id,
    doctor_id,
    prescript_id,
    examination,
    disease,
    pathological_process
  )
VALUES
  (
    1,
    4,
    1,
    'The patient reported having severe headaches and dizziness. After conducting a thorough examination, it was found that the patient was suffering from a migraine. The patient was prescribed pain medication and advised to rest.',
    'Migraine',
    'The patient has a history of migraines and was diagnosed based on their symptoms and medical history. The pathological process of migraines is still not well understood, but it is believed to be related to changes in brain chemicals and blood flow.'
  ),
  (
    2,
    7,
    2,
    'The patient reported having pain in the lower back and difficulty standing. After conducting a physical examination, it was determined that the patient was suffering from lower back pain. The patient was prescribed physical therapy and pain medication.',
    'Lower Back Pain',
    'The cause of the patient lower back pain is unknown, but it may be related to degenerative changes in the spine, injury, or a herniated disc. The pathological process involves inflammation and/or compression of the nerves in the lower back.'
  ),
  (
    3,
    2,
    3,
    'The patient reported having shortness of breath and chest pain. After conducting a thorough examination, it was found that the patient was suffering from pneumonia. The patient was prescribed antibiotics and advised to rest.',
    'Pneumonia',
    'Pneumonia is an infection of the lungs caused by bacteria, viruses, or fungi. The pathological process involves inflammation and fluid accumulation in the lungs, making it difficult to breathe.'
  ),
  (
    4,
    18,
    4,
    'The patient reported having a persistent cough and fatigue. After conducting a thorough examination, it was found that the patient was suffering from bronchitis. The patient was prescribed antibiotics and advised to rest.',
    'Bronchitis',
    'Bronchitis is an inflammation of the bronchial tubes, which can be caused by a viral or bacterial infection. The pathological process involves inflammation and mucus production in the bronchial tubes, making it difficult to breathe.'
  ),
  (
    5,
    15,
    5,
    'The patient reported having a high fever and body aches. After conducting a thorough examination, it was found that the patient was suffering from the flu. The patient was prescribed antiviral medication and advised to rest.',
    'Flu',
    'The flu is a viral infection that attacks the respiratory system. The pathological process involves the replication of the virus in the respiratory system, leading to inflammation and fluid accumulation.'
  ),
  (
    6,
    10,
    6,
    'The patient reported having abdominal pain and diarrhea. After conducting a thorough examination, it was found that the patient was suffering from food poisoning. The patient was prescribed antibiotics and advised to rest.',
    'Food Poisoning',
    'Food poisoning is caused by consuming contaminated food or water. The pathological process involves the growth of harmful bacteria in the digestive system, leading to inflammation and fluid loss.'
  ),
  (
    7,
    6,
    7,
    'The patient reported having a rash and joint pain. After conducting a thorough examination, it was found that the patient was suffering from Lyme disease. The patient was prescribed antibiotics and advised to rest.',
    'Lyme Disease',
    'Lyme disease is caused by the bite of an infected tick. The pathological process involves the spread of bacteria from the tick bite to other parts of the body, leading to inflammation and tissue damage.'
  ),
  (
    8,
    12,
    8,
    'The patient reported having a headache and neck pain. After conducting a thorough examination, it was found that the patient was suffering from a tension headache. The patient was prescribed pain medication and advised to rest.',
    'Tension Headache',
    'Tension headaches are caused by muscle tension and stress. The pathological process involves the contraction of muscles in the head and neck, leading to headache and neck pain.'
  ),
  (
    32,
    16,
    9,
    'The patient was diagnosed with high blood pressure. During the examination, the patient blood pressure was measured at 140/90 mmHg. Further tests were conducted to rule out any underlying conditions. The results of the tests were normal.',
    'Hypertension',
    'Hypertension is a condition in which the force of the blood against the artery walls is high enough that it may eventually cause health problems, such as heart disease.'
  ),
  (
    33,
    11,
    10,
    'The patient was diagnosed with a sore throat. During the examination, the patient throat was observed to be red and inflamed. A culture was taken to determine the cause of the infection. The results showed that the patient was suffering from a streptococcal infection.',
    'Strep Throat',
    'Strep throat is an infection caused by Streptococcus bacteria. It is a highly contagious condition that can cause a sore throat, fever, and other symptoms.'
  ),
  (
    9,
    6,
    11,
    'The patient was diagnosed with a broken arm. During the examination, an X-ray was taken of the patient arm. The results showed a clean break in the patient arm near the elbow. The doctor placed a cast on the patient arm to immobilize the broken bones.',
    'Broken Arm',
    'A broken arm is a common injury that occurs when one or more bones in the arm are fractured. It is usually caused by a fall, a direct blow, or excessive force on the arm.'
  ),
  (
    10,
    13,
    12,
    'The patient was diagnosed with a headache. During the examination, the patient reported a continuous headache for the past 3 days. The doctor performed a neurological examination to rule out any underlying conditions. The results were normal.',
    'Headache',
    'A headache is a common condition that can be caused by various factors, such as stress, tension, a headache, dehydration, or an underlying medical condition. Headaches can range from mild to severe and can be accompanied by other symptoms, such as nausea or sensitivity to light.'
  ),
  (
    11,
    17,
    13,
    'The patient was diagnosed with a skin rash. During the examination, the doctor observed a red, itchy rash on the patient skin. A sample of the rash was taken for testing. The results showed that the patient was suffering from a reaction to a new soap.',
    'Skin Rash',
    'A skin rash is a common condition that is characterized by a change in the color or texture of the skin. Rashes can be caused by various factors, including infections, allergies, and irritants.'
  ),
  (
    12,
    18,
    14,
    'The patient was diagnosed with a urinary tract infection. During the examination, the doctor performed a urine test. The results showed that the patient had a high level of white blood cells, indicating a urinary tract infection.',
    'Urinary Tract Infection',
    'A urinary tract infection is an infection that occurs in any part of the urinary system, including the bladder, ureters, kidneys, or urethra. It is most commonly caused by bacteria'
  );