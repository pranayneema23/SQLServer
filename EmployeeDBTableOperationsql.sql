----USE DATABASE--------------------------
USE EmployeeDatabase;
----SELECT ALL EMPLOYEE-------------------
SELECT * FROM employees;
---------INSERT NEW DATA IN EMPLOYEE-------------------
SET IDENTITY_INSERT employees ON;

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (209,'Pranay','Neema','pranay.neema@sqltutorial.org','515.123.8181','2005-09-07',1,9500.00,205,15);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (207,'Rucc','Wilsion','rucc.wilsion@sqltutorial.org','515.123.8181','1994-06-07',1,8400.00,205,11);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (208,'Rebaccaca','Luis','rebaccaca.luis@sqltutorial.org','515.123.8181','1994-06-07',1,6400.00,201,11);
------------INSERT NEW DATA IN DEPARTMENT--------------------------------
SET IDENTITY_INSERT departments OFF;

INSERT INTO departments(department_id,department_name,location_id) 
VALUES (12,'SECURITY',1800);

INSERT INTO departments(department_id,department_name,location_id) 
VALUES (13,'CLEANER',2400);

INSERT INTO departments(department_id,department_name,location_id) 
VALUES (14,'TECHNECIAN',2400);
---------------------------------------------------------------

SELECT first_name FROM employees WHERE first_name like '%c%C%' AND first_name  NOT like '%c%c%C%';

 
SELECT * FROM employees ORDER BY manager_id,department_id desc;
SELECT SUM(manager_id) FROM employees;
SELECT MIN(hire_date) AS first_hire,MAX(hire_date) AS last_hire FROM employees;
SELECT COUNT(manager_id) FROM employees;
SELECT AVG(manager_id) FROM employees;

SELECT sum(x.EmployeeUnderManager) FROM (SELECT COUNT(manager_id) AS EmployeeUnderManager,manager_id FROM employees GROUP BY manager_id)x;
SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary) > 10000;
SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary) > 10000;

--Nested Query
--1st highest salary
SELECT first_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);
--2nd highest salary
SELECT first_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary != (SELECT MAX(salary) FROM employees));
--3rd highest salary
SELECT first_name FROM employees WHERE salary = 
(SELECT MAX(salary) FROM employees WHERE salary < 
(SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees)));
---------SELECT Department	
SELECT * FROM departments

--JOINTS
SELECT * FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id;
SELECT * FROM employees AS e LEFT OUTER JOIN departments AS d ON e.department_id = d.department_id;
SELECT * FROM employees AS e RIGHT OUTER JOIN departments AS d ON e.department_id = d.department_id;
SELECT * FROM departments AS d LEFT OUTER JOIN employees AS e ON d.department_id = e.department_id;

--PRIMARY KEY
SELECT first_name FROM employees WHERE (salary,department_id) IN (SELECT MAX(salary) as salary,department_id FROM employees GROUP BY department_id);

--SELF-JOIN
SELECT E1.first_name,E2.first_name FROM employees AS E1 INNER JOIN employees AS E2 ON E1.manager_id = E2.employee_id;
SELECT E1.first_name,E2.first_name FROM employees AS E1, employees AS E2 WHERE E1.employee_id = E2.manager_id;
SELECT * FROM employees AS E1 INNER JOIN employees AS E2 ON E1.manager_id = E2.employee_id;
--CO-RELATED SUBQUERY
SELECT E1.first_name FROM employees AS E1 WHERE salary = 
(SELECT MAX(salary) FROM employees WHERE department_id = E1.department_id)