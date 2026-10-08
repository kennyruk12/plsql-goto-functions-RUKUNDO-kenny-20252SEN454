-- Student: RUKUNDO Kenny
-- ID: 20252SEN454
-- Project: Company Payroll Management Database

SET SERVEROUTPUT ON;

-- Clean up old objects so the script can be rerun.
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE payroll CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100) NOT NULL,
    dept_id NUMBER NOT NULL,
    monthly_salary NUMBER(12,2) NOT NULL CHECK (monthly_salary > 0),
    hire_date DATE NOT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE payroll (
    payroll_id NUMBER PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    basic_salary NUMBER(12,2) NOT NULL CHECK (basic_salary > 0),
    tax NUMBER(12,2) NOT NULL CHECK (tax >= 0),
    net_salary NUMBER(12,2) NOT NULL CHECK (net_salary >= 0),
    payroll_month DATE NOT NULL,
    CONSTRAINT fk_payroll_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO departments VALUES (10, 'Software Development');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'Human Resources');
INSERT INTO departments VALUES (40, 'Marketing');

INSERT INTO employees VALUES (101, 'Alice', 10, 600000, DATE '2023-01-15');
INSERT INTO employees VALUES (102, 'Brian', 10, 850000, DATE '2021-06-10');
INSERT INTO employees VALUES (103, 'Claire', 20, 500000, DATE '2024-02-01');
INSERT INTO employees VALUES (104, 'David', 30, 700000, DATE '2020-09-20');
INSERT INTO employees VALUES (105, 'Emma', 40, 1200000, DATE '2019-04-12');

INSERT INTO payroll VALUES (1001, 101, 600000, 60000, 540000, DATE '2026-10-01');
INSERT INTO payroll VALUES (1002, 102, 850000, 85000, 765000, DATE '2026-10-01');
INSERT INTO payroll VALUES (1003, 103, 500000, 25000, 475000, DATE '2026-10-01');
INSERT INTO payroll VALUES (1004, 104, 700000, 70000, 630000, DATE '2026-10-01');
INSERT INTO payroll VALUES (1005, 105, 1200000, 180000, 1020000, DATE '2026-10-01');

COMMIT;

SELECT 'Setup completed successfully.' AS message FROM dual;
SELECT COUNT(*) AS department_count FROM departments;
SELECT COUNT(*) AS employee_count FROM employees;
SELECT COUNT(*) AS payroll_count FROM payroll;
