-- MODULE 7 CHALLENGE

-- Deliverable 1 - Retirement Titles table (January 1, 1952 to December 31, 1955).

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date

INTO retirees_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirees_titles;

-- Use DISTINCT with ORDER BY to remove duplicate rows
-- Unique Titles table that contains the employee 
-- number, first and last name, and most recent title.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirees_titles AS rt
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;


-- Table 3 - RETIRING TITLES
-- the number of titles filled by employees who are retiring
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2
-- Mentorship Eligibility table
-- holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (e.emp_no) 
    	e.emp_no,
	   e.first_name,
    	e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

DROP TABLE mentorship_eligibility;
SELECT * FROM mentorship_eligibility;
