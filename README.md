<p align="center">
    Pewlett-Hackard-Analysis
</p>

<p align="center">
    Module 7 for Data Science Bootcamp - SQL
</p>


##  **Project Overview**
- Pewlett-Hackard needs to conduct an analysis to plan for, and determine which employees will be retiring in the near future. This is important because the company needs to be ready for this, especially if many are about to retire at once. We also need to develop a mentor initiative to train our new staff. 

- We've created our data based on birth dates ranging from 1952-1955 and hired dates from 1985-1988.

<p align="center">
     Company data and its purpose
</p>

    1. Why are we analyzing this data?
    2. What is the goal and possible outcomes?
    3. What pieces of data can help build toward and obtain our goal(s)?


## **Results**
It was important starting out to create an ERD (Entity Relationship Diagram) in order to easily visualize the relationship of the tables. It's very important to analyze the tables and understand what is in each, and how they can be related to one another to provoke and answer more questions.

<p align="center">
  <img src="https://github.com/lawnshogan/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png" width="700"/>
</p>

Our results show us that right around 64% of of staff will soon retire, which will create significant issues if they are not proactive. Here is the results of total employees retiring categorized into job title.

Syntax: 

- SELECT COUNT(ut.emp_no), ut.title
- INTO retiring_titles
- FROM unique_titles as ut
- GROUP BY title
- ORDER BY COUNT(title) DESC;
- SELECT * FROM retiring_titles;

<p align="center">
  <img src="https://github.com/lawnshogan/Pewlett-Hackard-Analysis/blob/main/Title_Retiring_Count.png" width="700"/>
</p>

It's important we have a plan in place to replenish these positions and then establish mentors throughout the organization to transition new employees in. Here are my results for that:

Syntax:
- SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
- INTO mentorship_eligibility
- FROM employees as e
- INNER JOIN dept_employees as de
- ON (e.emp_no = de.emp_no)
- INNER JOIN titles as ti
- ON (e.emp_no = ti.emp_no)
- WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
- AND (de.to_date = '9999-01-01')
- ORDER BY e.emp_no, ti.from_date DESC;
- DROP TABLE mentorship_eligibility;
- SELECT * FROM mentorship_eligibility;


<p align="center">
  <img src="https://github.com/lawnshogan/Pewlett-Hackard-Analysis/blob/main/Mentors.png" width="700"/>
</p>



## **Summary**

**How many roles will need to be filled as the "silver tsunami" begins to make an impact?**
- 57,668 postions will need filled.

**Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**
- No

## **Additional Analysis**
1) Another analysis we could do would be to find the average salary of each retiree. From that we can be proactive in coming up with figures that we can use to negotiate for our next line on employees who are hired.

2) We can find age and gender demographics about our current employees and look ahead even further for their retirements. If we wanted to make our workspace more diverse, it could be determined how through another analysis.