-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary
-- Perform an INNER JOIN on the two tables
SELECT employees.empl_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.empl_no=salaries.empl_no;

-- shortened solution (for practice):
SELECT e.empl_no, e.first_name, e.last_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.empl_no=s.empl_no;


--2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN ('01-01-1986')
AND ('01-01-1987');

--3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT e.empl_no, e.first_name, e.last_name, d.dept_no, d.dept_name, m.from_date, m.to_date
FROM departments AS d
JOIN dept_managers AS m ON
m.dept_no=d.dept_no
JOIN employees AS e ON 
e.empl_no=m.empl_no;

--query/sub-query (for practice)

4--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.empl_no, e.first_name, e.last_name, d.dept_name
FROM departments AS d
JOIN dept_employees AS de ON
de.dept_no=d.dept_no
JOIN employees AS e ON 
e.empl_no=de.empl_no;

5--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

6--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
SELECT e. empl_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de ON
de.empl_no=e.empl_no
JOIN departments AS d ON 
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales';

--Via query/sub-query (for practice)
SELECT empl_no, first_name, last_name
FROM employees
WHERE empl_no IN
(
  SELECT empl_no
  FROM dept_employees de
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departments d
    WHERE dept_name = 'Sales'
  )
);



7--List all employees in the Sales and Development departments, including
--their employee number, last name, first name, and department name.
SELECT e. empl_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de ON
de.empl_no=e.empl_no
JOIN departments AS d ON 
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--Via query/sub-query (for practice)
SELECT empl_no, first_name, last_name
FROM employees
WHERE empl_no IN
(
  SELECT empl_no
  FROM dept_employees de
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departments d
    WHERE dept_name = 'Sales' 
	OR dept_name = 'Development'
  )
);

8--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name count"
FROM employees
GROUP BY last_name
ORDER BY "last_name count" DESC;

