# Employee-Department-Analytics 📊

## Overview

This repository contains a **sample relational database project** designed to practice and demonstrate core **SQL concepts** such as table creation, relationships, joins, and analytical queries.

The project models a simple **HR management system** with four main entities:

* **Location**
* **Department**
* **Job**
* **Employee**

Using this schema, we can perform various **business-oriented SQL analyses** such as:

* Salary distribution across departments
* Department-wise employee counts
* City-wise workforce allocation
* Identifying top performers
* Understanding commission structures
* Analyzing department growth trends

The project highlights the use of:

* SQL **Joins**
* **Subqueries**
* **Aggregate functions**
* **Conditional logic**

---

# Database Schema 🗄️

## 1. Location Table

Stores information about office locations.

```sql
CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES 
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');
```

---

## 2. Department Table

Stores department details and links each department to a location.

```sql
CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES 
(10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);
```

---

## 3. Job Table

Defines job roles within the organization.

```sql
CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

INSERT INTO JOB VALUES
(667, 'CLERK'),
(668, 'STAFF'),
(669, 'ANALYST'),
(670, 'SALES_PERSON'),
(671, 'MANAGER'),
(672, 'PRESIDENT');
```

---

## 4. Employee Table

Stores employee information and connects employees to jobs and departments.

```sql
CREATE TABLE EMPLOYEE (
  EMPLOYEE_ID INT,
  LAST_NAME VARCHAR(20),
  FIRST_NAME VARCHAR(20),
  MIDDLE_NAME CHAR(1),
  JOB_ID INT FOREIGN KEY REFERENCES JOB(JOB_ID),
  MANAGER_ID INT,
  HIRE_DATE DATE,
  SALARY INT,
  COMM INT,
  DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENT(DEPARTMENT_ID)
);

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULL,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30);
```

---

# Key Learning Objectives 🎯

This project helps practice and understand:

* Designing **relational database schemas**
* Implementing **primary keys and foreign keys**
* Writing **SQL queries for data analysis**
* Using **JOIN operations** to combine multiple tables
* Applying **GROUP BY and aggregate functions**
* Performing **business-oriented SQL queries**

---

# Example Analytical Questions 🔍

Using this dataset, you can answer questions such as:

* Which department has the **highest number of employees**?
* What is the **average salary per department**?
* Which **city has the most employees**?
* Who are the **top-paid employees**?
* Which employees receive **commission**?
* Which departments are **growing the fastest**?

---

# Setup Instructions ⚙️

1. Clone the repository

```bash
git clone https://github.com/your-username/employee-department-analytics.git
```

2. Open your SQL environment (MySQL, PostgreSQL, SQL Server, etc.).

3. Run the provided SQL scripts in order:

   * Create tables
   * Insert sample data

4. Start writing and testing **analytical SQL queries**.

---

# Future Improvements 🚀

Possible extensions to make the project more realistic:

* Add a **PROJECT table** to track employee assignments.
* Add a **BONUS table** for incentive management.
* Include **performance ratings**.
* Build **SQL dashboards or reports**.
* Connect the database with **Python or Power BI** for analytics.

---

⭐ *This project is ideal for beginners learning SQL, database design, and business analytics queries.*
