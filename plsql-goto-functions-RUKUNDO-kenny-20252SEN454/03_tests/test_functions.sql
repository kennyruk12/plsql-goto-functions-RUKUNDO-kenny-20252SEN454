-- Function tests

SET SERVEROUTPUT ON;

DECLARE
    v_annual_salary NUMBER;
    v_years NUMBER;
    v_tax NUMBER;
    v_department VARCHAR2(100);
BEGIN
    v_annual_salary := fn_annual_salary(102);
    v_years := fn_years_of_service(102);
    v_tax := fn_calculate_tax(850000);
    v_department := fn_dept_name(102);

    DBMS_OUTPUT.PUT_LINE('B1 Annual salary for employee 102: ' || v_annual_salary);
    DBMS_OUTPUT.PUT_LINE('B2 Years of service for employee 102: ' || v_years);
    DBMS_OUTPUT.PUT_LINE('B3 Tax on 850000: ' || v_tax);
    DBMS_OUTPUT.PUT_LINE('B4 Department for employee 102: ' || v_department);

    IF v_annual_salary = 10200000 THEN
        DBMS_OUTPUT.PUT_LINE('B1 TEST: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B1 TEST: FAIL');
    END IF;

    IF v_tax = 85000 THEN
        DBMS_OUTPUT.PUT_LINE('B3 TEST: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B3 TEST: FAIL');
    END IF;

    IF v_department = 'Software Development' THEN
        DBMS_OUTPUT.PUT_LINE('B4 TEST: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B4 TEST: FAIL');
    END IF;
END;
/
