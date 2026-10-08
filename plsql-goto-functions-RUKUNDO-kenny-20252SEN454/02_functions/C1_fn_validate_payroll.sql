-- C1 — Payroll Validator Function
-- A payroll row is valid when:
-- 1. Basic salary is positive.
-- 2. Tax is not negative.
-- 3. Net salary equals basic salary minus tax.

CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_basic_salary IN NUMBER,
    p_tax          IN NUMBER,
    p_net_salary   IN NUMBER
) RETURN VARCHAR2
IS
BEGIN
    IF p_basic_salary IS NULL OR p_basic_salary <= 0 THEN
        RETURN 'INVALID: Basic salary must be greater than zero.';
    ELSIF p_tax IS NULL OR p_tax < 0 THEN
        RETURN 'INVALID: Tax cannot be negative.';
    ELSIF p_net_salary IS NULL THEN
        RETURN 'INVALID: Net salary is required.';
    ELSIF ROUND(p_basic_salary - p_tax, 2) <> ROUND(p_net_salary, 2) THEN
        RETURN 'INVALID: Net salary must equal basic salary minus tax.';
    ELSE
        RETURN 'VALID';
    END IF;
END;
/

SHOW ERRORS;
