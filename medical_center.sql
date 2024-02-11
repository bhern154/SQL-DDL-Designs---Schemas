DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  gender TEXT NOT NULL,
  insurance_company TEXT,
  notes TEXT
);

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty TEXT
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors(id),
  patient_id INTEGER REFERENCES patients(id),
  visit_date DATE NOT NULL
);

CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits(id),
  disease_id INTEGER REFERENCES diseases(id),
  notes TEXT
);

-- ADD SOME DATA

INSERT INTO patients
  (name, date_of_birth, gender, insurance_company, notes)
VALUES
  ('Elliot Rodgers', '1994/04/23', 'Male', 'Blue Shield', 'Has common cold'),
  ('Vanessa Oliver', '1989/10/08', 'Female', 'Blue Shield', 'Has the flu'),
  ('Stella Wagner', '1991/02/20', 'Female', 'Blue Shield', 'Has Bronchitis');

INSERT INTO doctors
  (name, specialty)
VALUES
  ('Dr. Antonio Saunders', 'Surgery'),
  ('Dr. Mark Bridges', 'Psychiatry'),
  ('Dr. Antonio Saunders', 'Surgery');

INSERT INTO diseases
  (name, description)
VALUES
  ('Diabetes', 'Diabetes is a chronic condition that affects the bodys ability to regulate blood sugar levels.'),
  ('Bronchitis', 'Bronchitis is an inflammation of the bronchial tubes, which are the air passages that lead to the lungs.'),
  ('Heart Disease', 'Cardiovascular disease is any disease involving the heart or blood vessels.'),
  ('Flu', 'Your respiratory tract (mouth, nose, throat and lungs) is infected.'),
  ('Common Cold', 'The common cold or the cold is a viral infectious disease of the upper respiratory tract that primarily affects the respiratory mucosa of the nose, throat, sinuses, and larynx.'),
  ('Pneumonia', 'Your lungs contain hundreds of millions of tiny air sacs called alveoli.'),
  ('Gastroenteritis', 'Gastroenteritis, also known as stomach flu is an inflammation of the gastrointestinal tract that is usually caused by a bacterial or viral infection.');

INSERT INTO visits
  (doctor_id, patient_id, visit_date)
VALUES
  (1, 2, '2023/07/13'),
  (2, 3, '2023/11/05'),
  (3, 1, '2024/01/19');

INSERT INTO diagnosis
  (visit_id, disease_id, notes)
VALUES
  (1, 4, '2023/07/13'),
  (2, 2, '2023/11/05'),
  (3, 5, '2024/01/19');
