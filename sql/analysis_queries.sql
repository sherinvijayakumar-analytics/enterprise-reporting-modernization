-- 1. Patient volume by department
SELECT
    d.department_name,
    COUNT(f.patient_id) AS total_patients
FROM fact_admissions f
JOIN dim_department d
    ON f.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_patients DESC;

-- 2. Average length of stay by department
SELECT
    d.department_name,
    ROUND(AVG(f.length_of_stay), 2) AS avg_length_of_stay
FROM fact_admissions f
JOIN dim_department d
    ON f.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_length_of_stay DESC;

-- 3. Emergency vs Planned admissions
SELECT
    admission_type,
    COUNT(*) AS admission_count
FROM fact_admissions
GROUP BY admission_type;

-- 4. Monthly admission trend
SELECT
    d.month_year,
    COUNT(f.patient_id) AS admissions
FROM fact_admissions f
JOIN dim_date d
    ON f.admission_date = d.date
GROUP BY d.month_year
ORDER BY d.month_year;

-- 5. Top diagnoses
SELECT
    diagnosis,
    COUNT(*) AS cases
FROM fact_admissions
GROUP BY diagnosis
ORDER BY cases DESC;
