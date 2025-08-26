# Patient Risk Prediction – Healthcare

## Domain
Healthcare Analytics

## Goal
Identify patients at high risk of chronic diseases using EMR & lab test data.

## Technology Stack
- Apache Spark (Scala/Python) for preprocessing
- MLlib for logistic regression modeling
- PostgreSQL for structured data warehouse
- MongoDB for unstructured clinical notes

## Data Modeling
Star schema:
- Fact Table: fact_patient_risk
- Dimension Tables: dim_patient, dim_hospital, dim_diagnosis

## Folder Structure
- `data/` : Raw and processed datasets
- `notebooks/` : Jupyter notebooks for exploration and modeling
- `scripts/` : Python/Scala scripts for preprocessing and training
- `models/` : Saved models and evaluation metrics
- `docs/` : Documentation and reports
