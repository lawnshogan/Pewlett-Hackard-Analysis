-- DROP TABLES
DROP TABLE departments
DROP TABLE employees
DROP TABLE dept_manager
DROP TABLE salaries
DROP TABLE dept_employee
DROP TABLE titles


-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4)NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	UNIQUE (dept_name)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM dept_employees;
SELECT * FROM titles;

-- Select employees whos birthdays are Between X and X
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';






-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- CREATE NEW TABLE - Save employee retirement into new table using INTO
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;
DROP TABLE retirement_info;







-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;












-- JOINS VVVVVVV


-- INNER JOIN - Joining departments and dept_manager tables -- USING ALIAS
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;




-- LEFT JOIN - Joining retirement_info and dept_emp tables -- NOT USING ALIAS
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_employees.to_date
FROM retirement_info
LEFT JOIN dept_employees
ON retirement_info.emp_no = dept_employees.emp_no;
---------------------------------------------------------------------------------------
-- LEFT JOIN - Joining retirement_info and dept_emp tables -- USING ALIASES
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
-- Create table to hold info
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no
-- Add a filter with the date 9999-01-01
WHERE de.to_date = ('9999-01-01');	

SELECT * FROM current_emp; 
TABLE DROP current_emp;
-------------------------------------------------------------------------------------	

-- Count, Group By, and Order By	
-- Employee count by department number - join the current_emp and dept_emp tables
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_info_dept
FROM current_emp as ce
LEFT JOIN dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

DROP TABLE retirement_info_dept;
SELECT * FROM retirement_info_dept;

-------------------------------------------------------------------------------------
-- Employee List
-- Salaries - Employee Number, FName, LName, Gender, to_date, Salary
SELECT * FROM salaries
ORDER BY to_date DESC;

-- Reuse code and add gender
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    s.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

	
	
	
	
	
	
	


WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Third Join
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (de.to_date = '9999-01-01');

DROP TABLE emp_info;
SELECT * FROM emp_info




























