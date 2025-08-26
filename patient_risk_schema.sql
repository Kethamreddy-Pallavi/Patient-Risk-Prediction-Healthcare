

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
