-- Create table schema

-- department
CREATE TABLE department 
(
  	dept_no VARCHAR (10) NOT NULL,
 	dept_name VARCHAR (50) NOT NULL,
	PRIMARY KEY (dept_no)
);
 
--run Import/Export Data 
-- check schema and data
SELECT * FROM department;

-- title
CREATE TABLE title (
  	title_id VARCHAR (10) NOT NULL,
 	title VARCHAR (50) NOT NULL,
	PRIMARY KEY (title_id)
);

--run Import/Export Data 
-- check schema and data
SELECT * FROM title;

--------------------------------------------------------	

--employee
CREATE TABLE employee (
  	emp_no INT PRIMARY KEY,
 	emp_title_id VARCHAR (10) NOT NULL,	
    birth_date DATE NOT NULL,
	first_name VARCHAR (50)  NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	sex CHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title (title_id)
 );
 
ALTER DATABASE "employee_db" SET datestyle = "ISO, MDY";

--run Import/Export Data 
-- check schema and data
SELECT * FROM employee;
	
----------------------------------------------------------

--employee
CREATE TABLE dept_emp 
(
  	emp_no INT NOT NULL,
 	dept_no VARCHAR (10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)											 
);

--run Import/Export Data 
-- check schema and data
SELECT * FROM dept_emp;
	
--salary
CREATE TABLE salary 
(
  	emp_no INT NOT NULL,
 	salary decimal (12,2) NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

--run Import/Export Data 
-- check schema and data
SELECT * FROM salary;

--dept_manager
CREATE TABLE dept_manager
(
  	dept_no VARCHAR (10) NOT NULL,
 	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

--run Import/Export Data 
-- check schema and data
SELECT * FROM dept_manager;