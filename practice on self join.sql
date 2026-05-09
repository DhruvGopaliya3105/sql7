-- Self join

create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);



/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/
-- self emp manager_id must be shown in another emp_id  to see the our 
-- emp ka manager_id not equal t0 another manager id
-- notebook llM 
select * from employees;
Select empl.emp_id,empl.emp_name,empl.manager_id from employees as empl; -- individual check
Select mngr.emp_id,mngr.emp_name,mngr.manager_id from employees as mngr; -- individual check


select empl.emp_id,empl.emp_name,empl.manager_id,mngr.emp_id,mngr.emp_name
from employees as empl
join employees as mngr
where empl.manager_id=mngr.emp_id; -- it check empl manager id with manager empid not with manager managerid

select e.emp_id,e.emp_name,e.department from employees as e;
select m.emp_id,m.emp_name,m.department from employees as m;


select e.emp_id,e.emp_name,e.department,e.manager_id,m.emp_id,m.emp_name,m.department from employees as e
join employees as m
where e.manager_id=m.emp_id and e.department=m.department;
-- find the emp_name and its salary if it is greater than the salary of its manager
select * from employees;
select e.emp_name,e.salary ,m.emp_name,m.salary,e.salary,m.salary from employees as e
join employees as m
where e.salary = m.salary  and e.salary>m.salary ; -- individual check salary or  and use if condition
-- show all the emp_name with the manager_name
select * from employees;
-- because i want all emp_name that why i put left join 
select e.emp_name as employee_name,m.emp_name as manager_name from employees as e 
left join employees as m  on  e.manager_id = m.emp_id;

-- show the emp  with its grandmanager
select * from employees;
SELECT e.emp_name  AS employee,
       m.emp_name  AS manager,
       gm.emp_name AS grandmanager
FROM employees as e
LEFT JOIN employees  as m
    ON e.manager_id = m.emp_id
LEFT JOIN employees as  gm
    ON m.manager_id = gm.emp_id;
-- find the emp who are also the manager




