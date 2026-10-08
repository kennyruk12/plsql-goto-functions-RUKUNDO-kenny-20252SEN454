-- C1 Payroll Validator Tests

SET SERVEROUTPUT ON;

DECLARE
    v_result VARCHAR2(200);
BEGIN
    v_result := fn_validate_payroll(850000, 85000, 765000);
    DBMS_OUTPUT.PUT_LINE('Valid payroll test: ' || v_result);

    v_result := fn_validate_payroll(850000, 85000, 700000);
    DBMS_OUTPUT.PUT_LINE('Invalid payroll test: ' || v_result);

    v_result := fn_validate_payroll(-100, 0, -100);
    DBMS_OUTPUT.PUT_LINE('Invalid salary test: ' || v_result);
END;
/
