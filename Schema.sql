-- Create Departments table
drop table departments;

create table departments (
	dept_no VARCHAR (5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR (30)
);

select * from departments;

-- Create Employees table
drop table employees;

create table employees (
	empl_no INT PRIMARY KEY NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	gender VARCHAR (5) NOT NULL,
	hire_date DATE NOT NULL
);

select * from employees;

-- Create Deaprtment_Employees table
drop table dept_employees;

create table dept_employees (
	empl_no INT NOT NULL,
	FOREIGN KEY (empl_no) REFERENCES employees(empl_no),
	dept_no VARCHAR (5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

select * from dept_employees;

-- Create Department_Managers table
drop table dept_managers

create table dept_managers (
	dept_no VARCHAR (5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	empl_no INT NOT NULL,
	FOREIGN KEY (empl_no) REFERENCES employees(empl_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

select * from dept_managers;

-- Create Salaries table
drop table salaries;

create table salaries (
	empl_no INT NOT NULL,
	FOREIGN KEY (empl_no) REFERENCES employees(empl_no),
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

select * from salaries;

-- Create Titles table
drop table titles;

create table titles (
	empl_no INT NOT NULL,
	FOREIGN KEY (empl_no) REFERENCES employees(empl_no),
	title VARCHAR (30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

select * from titles;
