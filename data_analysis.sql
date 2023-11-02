--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.hire_date,
	s.salary
FROM employee AS e
JOIN salary As s ON
	e.emp_no = s.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	emp_no,
	first_name,
	last_name,
	hire_date
FROM employee 
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
	--t.title,
	dm.dept_no, 
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm 
	JOIN department AS d ON dm.dept_no = d.dept_no
	JOIN employee AS e ON dm.emp_no = e.emp_no
	JOIN title AS t ON e.emp_title_id = t.title_id;
			

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp AS de 
	JOIN employee AS e ON de.emp_no = e.emp_no
	JOIN department AS d ON de.dept_no = d.dept_no;
		
--5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name,
	last_name,
	sex	
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;
	
--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	d.dept_name,	
	de.emp_no,
	e.last_name,
	e.first_name
FROM department AS d 
	JOIN dept_emp AS de ON d.dept_no = de.dept_no
	JOIN employee AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

		
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name	
FROM department AS d 
	JOIN dept_emp AS de ON d.dept_no = de.dept_no
	JOIN employee AS e ON de.emp_no = e.emp_no
WHERE d.dept_name in ('Sales', 'Development');
	
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT DISTINCT last_name, 
COUNT (last_name)
FROM employee
GROUP BY last_name
ORDER BY COUNT DESC;