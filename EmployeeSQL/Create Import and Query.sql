-- Table import order: departments, titles, employees, salaries, dept_emp, dept_manager. 
-- Importing tables in this order will avoid foreign key error.

-- Details of each employee: employee number, last name, first name, sex, and salary

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- Employees hired in 1986: first_name, last_name, and hire_date

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date like '%1986';

-- Department of each Manager with department number, department name, manager employee number, last name, first name

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments as d
JOIN dept_manager as dm
ON d.dept_no = dm.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no;


-- Employee department with employee number, last name,  first name and department name

SELECT e.emp_no, last_name, first_name, dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no;

-- First name, last name and sex for employees with first name "Hercules" and last name starts with "B"

SELECT first_name, last_name, sex
FROM employees
where first_name = 'Hercules' and last_name like 'B%';

-- Employees in Sales department with employee number, last name, first name, and department name

SELECT e.emp_no, last_name, first_name, dept_name
FROM departments as d
JOIN dept_emp as de
ON d.dept_no = de.dept_no
JOIN employees as e
ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

-- Employees in Sales and Development departments with employee number, last name, first name, and departments

SELECT e.emp_no, last_name, first_name, dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_name in ('Sales', 'Development');

-- count employees that share the same last name in descending ORDER

SELECT last_name 
COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name desc;




