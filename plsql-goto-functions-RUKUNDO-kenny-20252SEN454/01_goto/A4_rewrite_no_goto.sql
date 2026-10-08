-- A4 — Rewrite Without GOTO
-- The salary review from A2 rewritten using structured IF/ELSIF/ELSE.

SET SERVEROUTPUT ON;

DECLARE
    v_employee_id employees.employee_id%TYPE := 102;
    v_name employees.employee_name%TYPE;
    v_salary employees.monthly_salary%TYPE;
BEGIN
    SELECT employee_name, monthly_salary
    INTO v_name, v_salary
    FROM employees
    WHERE employee_id = v_employee_id;

    IF v_salary >= 800000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ': HIGH SALARY - ' || v_salary);
    ELSIF v_salary >= 500000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ': STANDARD SALARY - ' || v_salary);
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name || ': LOW SALARY - ' || v_salary);
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary review completed without GOTO.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/
