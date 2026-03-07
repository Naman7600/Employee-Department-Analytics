create database casestudy2
use casestudy2

create table location(Location_ID smallint PRIMARY KEY,
City varchar(50))
insert into location values(122,'New York'),(123,'Dallas'),
(124,'Chicago'),(167,'Boston')

select * from location

create table department(Department_ID smallint PRIMARY KEY,
Name varchar(50),Location_ID smallint,
FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID))

insert into department values(10,'Accounting',122),
(20,'Sales',124),
(30,'Research',123),
(40,'Operations',167)

create table job(JobId smallint PRIMARY KEY,
Designation varchar(50))

insert into job values(667,'Clerk'),(668,'Staff'),
(669,'Analyst'),(670,'Sales Person'),
(671,'Manager'),(672,'President')

create table employee(EmployeeId smallint,LastName varchar(20),
Firstname Varchar(50),Middlename varchar(50),JobID smallint,
hiredate date,salary decimal(10,2),Comm decimal(10,2),
DepartmentId smallint,
FOREIGN KEY (JOBID) REFERENCES JOB(JobId),
FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DEPARTMENT_ID))

insert into employee values(7499,'Allen','Kevin','J',670,'1985-02-20',
1600,300,30),
(755,'Doyle','Jean','K',671,'1985-04-04',2850,Null,30),

(756,'Dennis','Lynn','S',671,'1985-05-15',2750,Null,30),

(7499,'Baker','Leslie','D',671,'1985-06-10',2200,NULL,40),

(7521,'Wark','Cynthia','D',670,'1985-02-22',1250,50,30).

-- Simple Queries: 

--1. List all the employee details. 
select * from employee

--2. List all the department details.
select * from department

--3. List all job details.
select * from job


--4. List all the locations.
select * from location


--5. List out the First Name, Last Name, Salary, Commission for all Employees. 
select firstname,lastname,salary,comm from employee

--6. List out the Employee ID, Last Name, Department ID for all employees and 
--alias Employee ID as "ID of the Employee", 
--Last Name as "Name of the Employee", Department ID as "Dep_id". 
select employeeId AS 'ID OF EMPLOYEE',Lastname AS 'Name OF EMPLOYEE',
DepartmentID AS 'DEPT_ID' from employee


--7. List out the annual salary of the employees with their names only. 
select Firstname,Middlename,Lastname,salary,
salary*12 AS ANNUAL_SAL From employee


--WHERE Condition: 
--1. List the details about "Smith".
select * from employee where lastname='Smith'

--2. List out the employees who are working in department 20. 
select * from employee where DepartmentId=20

--3. List out the employees who are earning salary between 2000 and 3000. 
select * from employee where salary BETWEEN 2000 AND 3000


--4. List out the employees who are working in department 10 or 20. 
select * from employee where DepartmentId IN(10,20)


--5. Find out the employees who are not working in department 10 or 30.
select * from employee where DepartmentId NOT IN(10,30)


--6. List out the employees whose name starts with 'L'. 
select * from employee where firstname LIKE 'L%'

--7. List out the employees whose name starts with 'L' and ends with 'E'. 
select * from employee where firstname LIKE 'L%E'
SELECT * from employee where firstname LIKE 'L%' AND LASTNAME LIKE '%E'

--8. List out the employees whose name length is 4 and start with 'J'.
select * from employee where len(firstname)=4 AND FIRSTNAME LIKE 'J%' 

--9. List out the employees who are working in department 30 and draw the 
--salaries more than 2500. 
select * from employee where DepartmentId=30 and salary>2500

--10. List out the employees who are not receiving commission.
select * from employee where comm is null


--ORDER BY Clause: 
--1. List out the Employee ID and Last Name in ascending order based on the 
--Employee ID.
select employeeID,Lastname from employee order by employeeId asc

--2. List out the Employee ID and Name in descending order based on salary.
select employeeid,firstname,salary from employee order by salary desc

--3. List out the employee details according to their Last Name in ascending-order. 
select * from employee order by lastname asc


--4. List out the employee details according to their Last Name in ascending 
--order and then Department ID in descending order.
select * from employee order by lastname asc, DepartmentId desc


--GROUP BY and HAVING Clause: 
--1. List out the department wise maximum salary, minimum salary and 
--average salary of the employees. 
select max(salary) MAXm,min(salary) MINm,avg(salary) Avgs,DepartmentId from employee 
group by DepartmentId

--2. List out the job wise maximum salary, minimum salary and average 
--salary of the employees. 
select max(salary) MAXm,min(salary) MINm,avg(salary) Avgs,JobID from employee
group by JobID

--3.List out the number of employees who joined each month in ascending order. 
SELECT format(HireDate,'MMMM') AS Month,count(*) AS joinee
from Employee 
group by format(Hiredate,'MMMM')
order by format(hiredate,'MMMM') asc;

--4. List out the number of employees for each month and year in 
--ascending order based on the year and month. 
SELECT format(HireDate,'yyyy-MM') AS Month,count(*) AS joinee
from Employee 
group by format(Hiredate,'yyyy-MM')
order by format(hiredate,'yyyy-MM') asc;

--5. List out the Department ID having at least four employees. 
select departmentid from employee group by DepartmentId 
HAVING COUNT(*)>=4

--6. How many employees joined in February month.
select count(*) from employee 
where  MONTH(hiredate)=02

--7. How many employees joined in May or June month. 
select count(*) from employee
where MONTH(HIREDATE)=5 or MONTH(HIREDATE)=6

select count(*) from employee where hiredate like'%05%' or hiredate like'%06%'


--8. How many employees joined in 1985? 
select count(*) from employee 
where YEAR(HIREDATE)=1985

--9. How many employees joined each month in 1985? 
SELECT format(HireDate,'MMMM') AS Month,count(*) AS joinee
from Employee where YEAR(hiredate)=1985
group by format(Hiredate,'MMMM')


--10. How many employees were joined in April 1985? 
select count(*) AS 'April Joinee' from employee where Year(hiredate)=1985 AND Month(Hiredate)=4

--11. Which is the Department ID having greater than or equal to 3 employees 
--joining in April 1985?
select departmentid,count(*) from employee where YEAR(hiredate)=1985 
AND MONTH(Hiredate)=4
group by DepartmentId
HAVING COUNT(*)>=3

--Output: No deptID'S

select * from location
select * from department
select * from job
select * from employee
--Joins: 
--1. List out employees with their department names. 
select e.FirstName,e.lastname,d.Department_ID,d.name from employee e INNER JOIN Department d 
on e.DepartmentId=d.Department_ID

--2. Display employees with their designations. 
select e.FirstName,e.lastname,j.Designation from employee e INNER JOIN Job j 
on e.JobID=j.JobId

--3. Display the employees with their department names and city.
select e.FirstName,e.lastname,d.name AS DeptNmae,l.city from employee e INNER JOIN department d ON e.DepartmentId=d.Department_ID
INNER JOIN location l ON D.Location_ID=L.Location_ID 

--4. How many employees are working in different departments? Display with 
--department names. 
select d.name,count(e.employeeid) from employee e Left JOIN department d
ON e.DepartmentId=d.Department_ID
Group by d.name


--5. How many employees are working in the sales department? 
select d.name,count(e.employeeid) As empSales from employee e Left JOIN department d
ON e.DepartmentId=d.Department_ID
where d.name='sales'
Group by d.name

--6.Which is the department having greater than or equal to 3 employees and display the department names in 
--ascending order. 
select d.name,count(e.employeeid) as No_of_emp from employee e Left JOIN department d
ON e.DepartmentId=d.Department_ID
Group by d.name
having count(e.employeeid)>=3
order by d.name asc

--7. How many employees are working in 'Dallas'? 
select l.city,count(e.employeeid) from employee e inner join department d ON e.DepartmentId=d.Department_ID
inner join location l on d.Location_ID=l.Location_ID
where city='Dallas'
group by l.city

--8.Display all employees in sales or operation departments. 
select e.*,d.name from employee e LEFT JOIN department d on e.DepartmentId=d.Department_ID
where d.name='Sales' OR d.name='Operations'


--CONDITIONAL STATEMENT 
--1. Display the employee details with salary grades. Use conditional statement to create a grade column.
select e.employeeid,e.FirstName,e.LastName,e.salary ,
case
    when salary<=500 then 'A'
    when salary<=1500 then 'B'
    when salary<=3000 then 'C'
    else 'D'
END AS Salgrades
from employee e

--2. List out the number of employees grade wise. Use conditional statement to create a grade column. 
SELECT CASE
        WHEN salary <= 500 THEN 'A'
        WHEN salary <= 1500 THEN 'B'
        WHEN salary <= 3000 THEN 'C'
        ELSE 'D'
    END AS SalGrade,
    COUNT(*) AS EmployeeCoun FROM employee GROUP BY CASE
        WHEN salary <= 500 THEN 'A'
        WHEN salary <= 1500 THEN 'B'
        WHEN salary <= 3000 THEN 'C'
        ELSE 'D'
    END;

--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

select
case
    when salary<=500 then 'A'
    when salary<=1500 then 'B'
    when salary<=3000 then 'C'
    else 'D'
END AS Salgrades ,count(*)
from employee e
where E.salary BETWEEN 2000 AND 5000
group by case
 when salary<=500 then 'A'
    when salary<=1500 then 'B'
    when salary<=3000 then 'C'
    else 'D'
END
--********************

select * from location
select * from department
select * from job
select * from employee
--**************

--Subqueries: 
--1. Display the employees list who got the maximum salary.
select firstname,salary from employee where salary=(select max(salary) from employee)


--2. Display the employees who are working in the sales department. 
SELECT firstname,lastname FROM employee WHERE departmentid=(SELECT department_id FROM department WHERE name = 'sales')


--3. Display the employees who are working as 'Clerk'. 
select firstname,lastname from employee where JobID=(select jobid from job where Designation='Clerk' )

--4. Display the list of employees who are living in 'Boston'.
select concat(firstname,' ',lastname) from employee where DepartmentId=(select Department_Id from department where
Location_ID=(select Location_ID from location where city='Boston'))

--5. Find out the number of employees working in the sales department. 
select count(firstname) AS countSalesEmp from employee where DepartmentId=(select Department_Id from department where name='sales')


--6. Update the salaries of employees who are working as clerks on the basis of 10%. 
update employee set salary=salary+salary*.1 where JobId IN (select jobid from job where Designation='Clerk') 
select * from employee


--7. Display the second highest salary drawing employee details.
SELECT firstname, lastname, salary FROM employee WHERE salary=(SELECT MAX(salary) FROM employee
    WHERE salary<(SELECT MAX(salary) FROM employee));

SELECT firstname, lastname, salary FROM employee order by salary desc 
offset 1 rows
fetch next 1 rows only


--8.List out the employees who earn more than every employee in department 30. 
SELECT firstname, lastname, salary FROM employee
WHERE salary > (SELECT MAX(salary) FROM employee WHERE departmentid = 30);

--9. Find out which department has no employees. 
SELECT d.department_id, d.name AS DepartmentName FROM department d
LEFT JOIN employee e ON d.department_id = e.departmentid
WHERE e.employeeid IS NULL;

--10. Find out the employees who earn greater than the average salary for their department.
SELECT e.firstname, e.lastname, e.salary, e.departmentid FROM employee e WHERE e.salary>(SELECT AVG(salary)
    FROM employee
    WHERE departmentid = e.departmentid);




