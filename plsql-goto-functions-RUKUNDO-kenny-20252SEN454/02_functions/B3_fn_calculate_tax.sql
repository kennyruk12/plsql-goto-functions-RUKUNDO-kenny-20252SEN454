-- B3 — Tax Calculator Function
-- Tax rules for this project:
-- <= 500,000       : 5%
-- 500,001-1,000,000: 10%
-- > 1,000,000      : 15%

CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_salary IN NUMBER
) RETURN NUMBER
IS
BEGIN
    IF p_salary IS NULL OR p_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be NULL or negative.');
    ELSIF p_salary <= 500000 THEN
        RETURN ROUND(p_salary * 0.05, 2);
    ELSIF p_salary <= 1000000 THEN
        RETURN ROUND(p_salary * 0.10, 2);
    ELSE
        RETURN ROUND(p_salary * 0.15, 2);
    END IF;
END;
/

SHOW ERRORS;
