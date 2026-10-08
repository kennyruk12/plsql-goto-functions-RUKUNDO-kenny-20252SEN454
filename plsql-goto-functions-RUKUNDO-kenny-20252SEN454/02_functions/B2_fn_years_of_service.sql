-- B2 — Years of Service Function

CREATE OR REPLACE FUNCTION fn_years_of_service (
    p_employee_id IN employees.employee_id%TYPE
) RETURN NUMBER
IS
    v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT hire_date
    INTO v_hire_date
    FROM employees
    WHERE employee_id = p_employee_id;

    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SHOW ERRORS;
