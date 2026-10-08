-- A3 — Illegal GOTO and Fix
-- Part 1 is intentionally invalid: a GOTO cannot jump into an IF block.
-- Run the invalid example separately to capture the Oracle compile error.
-- Then run the corrected version below.

SET SERVEROUTPUT ON;

-- INTENTIONALLY INVALID EXAMPLE:
-- The label is inside the IF block, so the GOTO attempts to enter a
-- control structure from outside it.
--
-- DECLARE
-- BEGIN
--     GOTO inside_if;
--     IF 1 = 1 THEN
--         <<inside_if>>
--         DBMS_OUTPUT.PUT_LINE('Illegal jump.');
--     END IF;
-- END;
-- /

-- CORRECTED VERSION:
DECLARE
    v_number NUMBER := 10;
BEGIN
    IF v_number > 0 THEN
        GOTO positive_number;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Number is not positive.');
    GOTO finished;

    <<positive_number>>
    DBMS_OUTPUT.PUT_LINE('Number is positive.');

    <<finished>>
    DBMS_OUTPUT.PUT_LINE('Corrected GOTO completed.');
END;
/
