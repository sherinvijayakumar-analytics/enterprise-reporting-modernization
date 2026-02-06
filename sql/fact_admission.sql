-- Create Admissions Fact Table
DROP TABLE IF EXISTS fact_admissions;

CREATE TABLE fact_admissions AS
SELECT
    s.patient_id,
    s.admission_date,
    s.discharge_date,
    d.department_id,
    s.diagnosis,
    s.gender,
    s.age,
    s.admission_type,
    s.length_of_stay
FROM stg_hospital_admissions s
JOIN dim_department d
    ON s.department = d.department_name;
