-- B5 — Functions in SQL
-- Demonstrates stored functions being called from a SELECT statement.

SET PAGESIZE 50;
SET LINESIZE 200;

SELECT
    e.employee_id,
    e.employee_name,
    e.monthly_salary,
    fn_annual_salary(e.employee_id) AS annual_salary,
    fn_years_of_service(e.employee_id) AS years_of_service,
    fn_dept_name(e.employee_id) AS department
FROM employees e
ORDER BY e.employee_id;
