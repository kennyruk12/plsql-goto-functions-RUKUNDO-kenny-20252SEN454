-- B4 — Department Name Function

CREATE OR REPLACE FUNCTION fn_dept_name (
    p_employee_id IN employees.employee_id%TYPE
) RETURN VARCHAR2
IS
    v_department_name departments.dept_name%TYPE;
BEGIN
    SELECT d.dept_name
    INTO v_department_name
    FROM employees e
    JOIN departments d ON d.dept_id = e.dept_id
    WHERE e.employee_id = p_employee_id;

    RETURN v_department_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'UNKNOWN DEPARTMENT';
END;
/

SHOW ERRORS;
