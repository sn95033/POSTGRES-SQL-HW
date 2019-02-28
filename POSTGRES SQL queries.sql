DROP TABLE salaries;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE titles;
DROP TABLE employees;
DROP TABLE departments;

-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/S3gYBf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).



SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;



SELECT emp_no, first_name, last_name, gender
FROM employees;

-- 1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON 
e.emp_no = s.emp_no
ORDER BY emp_no;

-- 2. List employees who were hired in 1986.

SELECT hire_date FROM employees;

SELECT emp_no, first_name, last_name, hire_date
FROM employees 
WHERE hire_date LIKE '1986______';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments as d
ON dm.dept_no = d.dept_no
JOIN employees as e
on dm.emp_no = e.emp_no
;

-- Check the result
-- SELECT * FROM dept_manager;
--SELECT emp_no, last_name, first_name FROM employees
--WHERE emp_no >110021 AND emp_no < 111950;


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no
FROM dept_emp de
JOIN employees as e
on de.emp_no = e.emp_no
JOIN departments as d
on de.dept_no = d.dept_no
ORDER BY de.emp_no;

-- Check the result
--SELECT * FROM departments;

--5. List all employees 
--whose first name is "Hercules" and last names begin with "B."

Select first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%' ;

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e
ON de.emp_no = e.emp_no 
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no; 


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e
ON de.emp_no = e.emp_no 
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY de.emp_no; 


--8. In descending order, 
--list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Frequency of last name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of last name" DESC;



