-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" varchar(5)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employees" (
    "empl_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(5)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "empl_no"
     )
);

CREATE TABLE "Dept_employees" (
    "empl_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Dept_managers" (
    "dept_no" varchar   NOT NULL,
    "empl_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Salaries" (
    "empl_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "titles" (
    "empl_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "Dept_employees" ADD CONSTRAINT "fk_Dept_employees_empl_no" FOREIGN KEY("empl_no")
REFERENCES "Employees" ("empl_no");

ALTER TABLE "Dept_employees" ADD CONSTRAINT "fk_Dept_employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_managers" ADD CONSTRAINT "fk_Dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_managers" ADD CONSTRAINT "fk_Dept_managers_empl_no" FOREIGN KEY("empl_no")
REFERENCES "Employees" ("empl_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_empl_no" FOREIGN KEY("empl_no")
REFERENCES "Employees" ("empl_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_empl_no" FOREIGN KEY("empl_no")
REFERENCES "Employees" ("empl_no");

