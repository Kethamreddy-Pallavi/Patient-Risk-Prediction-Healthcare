
CREATE TABLE fact_patient_risk (
    patient_id INT PRIMARY KEY,
    age FLOAT,
    source TEXT,
    risk_label INT
);


CREATE TABLE dim_patient (
    patient_id INT PRIMARY KEY,
    age FLOAT
);


CREATE TABLE dim_hospital (
    hospital_id INT PRIMARY KEY,
    hospital_name TEXT
);


CREATE TABLE dim_diagnosis (
    diagnosis_id INT PRIMARY KEY,
    disease TEXT
);


-- Insert into dim_patient
INSERT INTO dim_patient (patient_id, age) VALUES
(1, 45.0),
(2, 60.5),
(3, 30.2);

-- Insert into dim_hospital
INSERT INTO dim_hospital (hospital_id, hospital_name) VALUES
(101, 'Apollo Hospital'),
(102, 'Fortis Healthcare'),
(103, 'Manipal Hospital');

-- Insert into dim_diagnosis
INSERT INTO dim_diagnosis (diagnosis_id, disease) VALUES
(201, 'Diabetes'),
(202, 'Hypertension'),
(203, 'Asthma');

-- Insert into fact_patient_risk
INSERT INTO fact_patient_risk (patient_id, age, source, risk_label) VALUES
(1, 45.0, 'Referral', 1),
(2, 60.5, 'Walk-in', 2),
(3, 30.2, 'Online', 0);


SELECT * FROM fact_patient_risk;
SELECT * FROM dim_patient;
SELECT * FROM dim_hospital;
SELECT * FROM dim_diagnosis;

 ALTER TABLE fact_patient_risk ADD COLUMN hospital_id INT;
ALTER TABLE fact_patient_risk ADD COLUMN diagnosis_id INT;

ALTER TABLE fact_patient_risk ADD FOREIGN KEY (hospital_id) REFERENCES dim_hospital(hospital_id);
ALTER TABLE fact_patient_risk ADD FOREIGN KEY (diagnosis_id) REFERENCES dim_diagnosis(diagnosis_id);


SELECT risk_label, COUNT(*) AS count
FROM fact_patient_risk
GROUP BY risk_label;

SELECT age, risk_label
FROM fact_patient_risk
ORDER BY age;

UPDATE fact_patient_risk SET hospital_id = 101 WHERE patient_id = 1;
UPDATE fact_patient_risk SET hospital_id = 102 WHERE patient_id = 2;
UPDATE fact_patient_risk SET hospital_id = 103 WHERE patient_id = 3;

SELECT patient_id, hospital_id FROM fact_patient_risk;

SELECT h.hospital_name, COUNT(*) AS patient_count
FROM fact_patient_risk f
JOIN dim_hospital h ON f.hospital_id = h.hospital_id
GROUP BY h.hospital_name;
