# Individual Assignment III — PL/SQL GOTO Statements and Functions

**Student:** RUKUNDO Kenny  
**Student ID:** 20252SEN454  
**Course:** Database Development with PL/SQL (INSY 8311)

## Project: Company Payroll Management Database

This project uses a small company payroll database to demonstrate:
- PL/SQL GOTO statements
- Stored functions
- Exception handling
- Functions used in SQL
- A combined payroll validation task

## Business tables
- `departments`
- `employees`
- `payroll`

## Salary/tax rules used in this project
- Monthly salary <= 500,000: 5% tax
- Monthly salary > 500,000 and <= 1,000,000: 10% tax
- Monthly salary > 1,000,000: 15% tax

## Run order
1. `00_setup/create_tables.sql`
2. All files in `02_functions/`
3. Files in `01_goto/`
4. Files in `03_tests/`

The screenshot files in `screenshots/` show the expected demonstration output for the assignment tasks.
