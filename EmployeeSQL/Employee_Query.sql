--1 . List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name,e.first_name, e.gender,s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no = s.emp_no;

--2 . List employees who were hired in 1986.

SELECT first_name, last_name ,hire_date FROM employees
WHERE hire_date < '1987-01-01' and hire_date > '1986-01-01';


-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dm.dept_no, d.dept_name , dm.emp_no, e.last_name,e.first_name,dm.from_date AS start_date, dm.to_date AS end_date
FROM (
	(dept_manager AS dm
	 INNER JOIN employees AS e ON dm.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = dm.dept_no
     );


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name,e.first_name, d.dept_name
FROM (
	(dept_emp AS de
	 INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = de.dept_no
    );

-- 5.List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number,last name, first name, and department name.

SELECT de.emp_no, e.last_name,e.first_name, d.dept_name
FROM (
	(dept_emp AS de
	 INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	 INNER JOIN departments AS d ON d.dept_no = de.dept_no
     )
WHERE d.dept_name = 'Sales' ; 

-- 7.List all employees in the Sales and Development departments,including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name,e.first_name, d.dept_name
FROM (
	   (dept_emp AS de
	    INNER JOIN employees AS e ON de.emp_no = e.emp_no)
	    INNER JOIN departments AS d ON d.dept_no = de.dept_no
      )
WHERE d.dept_name = 'Development'
OR d.dept_name = 'Sales' ;

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name , COUNT(emp_no) AS counts_of_last_names
FROM employees
GROUP BY last_name
ORDER BY last_name; 
