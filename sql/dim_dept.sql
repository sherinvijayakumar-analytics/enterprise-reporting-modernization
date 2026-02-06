-- Create Department Dimension
DROP TABLE IF EXISTS dim_department;

CREATE TABLE dim_department AS
SELECT
    ROW_NUMBER() OVER (ORDER BY department) AS department_id,
    department AS department_name
FROM (
    SELECT DISTINCT department
    FROM stg_hospital_admissions
);
