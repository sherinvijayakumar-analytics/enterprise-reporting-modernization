-- Create Date Dimension
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date AS
SELECT DISTINCT
    admission_date AS date,
    CAST(strftime('%Y', admission_date) AS INTEGER) AS year,
    CAST(strftime('%m', admission_date) AS INTEGER) AS month,
    strftime('%m', admission_date) || '-' || strftime('%Y', admission_date) AS month_year
FROM stg_hospital_admissions;
