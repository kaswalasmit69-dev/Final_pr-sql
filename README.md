# 🎓 University Course Management System

<div align="center">

# 📚 UNIVERSITY COURSE MANAGEMENT SYSTEM

### 🗄️ SQL Database Project

**Designed & Developed by**

# 👨‍💻 Sumit

### Under the Guidance of

# 👨‍🏫 Girish Sir

---

### 🚀 Database Management • SQL • CRUD • Joins • Subqueries • Functions

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge)
![Database](https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge)
![Project](https://img.shields.io/badge/Project-University%20Management-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

</div>

---

# 🌟 Project Overview

The **University Course Management System** is a SQL-based database project designed to manage important academic information related to a university.

The database stores and manages information about:

* 🏢 Departments
* 👨‍🎓 Students
* 📚 Courses
* 👨‍🏫 Instructors
* 📝 Enrollments

The project demonstrates practical implementation of **SQL Database Management System concepts** such as:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Data insertion
* Data retrieval
* Data updating
* Data deletion
* CRUD operations
* INNER JOIN
* LEFT JOIN
* GROUP BY
* HAVING
* Aggregate functions
* Subqueries
* Date functions
* String functions
* CASE statements
* Window functions
* Running totals

The complete database is created under the database name:

```sql
UniversityCourseManagement
```

The SQL file begins by creating and selecting this database.

---

# 👨‍💻 Student Information

| Detail              | Information                         |
| ------------------- | ----------------------------------- |
| 👤 Student Name     | **Sumit**                           |
| 👨‍🏫 Faculty / Sir | **Girish Sir**                      |
| 💻 Project Type     | SQL Database Project                |
| 🗄️ Database        | MySQL                               |
| 📌 Project          | University Course Management System |
| 📄 Main File        | `Final-PR.sql`                      |

---

# 🎯 Project Objectives

The main objectives of this project are:

1. To understand relational databases.
2. To create a structured university database.
3. To understand relationships between tables.
4. To practice primary and foreign keys.
5. To perform CRUD operations.
6. To retrieve meaningful information using SQL queries.
7. To understand different types of joins.
8. To use aggregate functions for data analysis.
9. To understand subqueries.
10. To work with SQL date and string functions.
11. To understand conditional statements using `CASE`.
12. To understand SQL window functions.
13. To gain practical experience in MySQL.

---

# 🏗️ Database Architecture

The database consists of **five main tables**:

```text
                 ┌─────────────────────┐
                 │     Departments      │
                 │─────────────────────│
                 │ DepartmentID (PK)   │
                 │ DepartmentName      │
                 └──────────┬──────────┘
                            │
             ┌──────────────┴──────────────┐
             │                             │
             ▼                             ▼
   ┌──────────────────┐          ┌──────────────────┐
   │     Courses      │          │    Instructors   │
   │──────────────────│          │──────────────────│
   │ CourseID (PK)    │          │ InstructorID(PK) │
   │ CourseName       │          │ FirstName        │
   │ DepartmentID(FK) │          │ LastName         │
   │ Credits          │          │ Email            │
   └────────┬─────────┘          │ DepartmentID(FK) │
            │                    └──────────────────┘
            │
            ▼
   ┌──────────────────┐
   │   Enrollments    │
   │──────────────────│
   │ EnrollmentID(PK) │
   │ StudentID (FK)   │
   │ CourseID (FK)    │
   │ EnrollmentDate   │
   └────────┬─────────┘
            │
            ▼
   ┌──────────────────┐
   │     Students     │
   │──────────────────│
   │ StudentID (PK)   │
   │ FirstName        │
   │ LastName         │
   │ Email            │
   │ BirthDate        │
   │ EnrollmentDate   │
   └──────────────────┘
```

---

# 🗂️ Database Tables

## 1️⃣ Departments Table

The `Departments` table stores university department information.

### Columns

| Column         | Data Type    | Key         |
| -------------- | ------------ | ----------- |
| DepartmentID   | INT          | Primary Key |
| DepartmentName | VARCHAR(100) | —           |

The project creates departments such as **Computer Science** and **Mathematics**.

### Example

```sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
```

---

# 2️⃣ Students Table 👨‍🎓

The `Students` table stores student information.

### Columns

| Column         | Data Type    |
| -------------- | ------------ |
| StudentID      | INT          |
| FirstName      | VARCHAR(50)  |
| LastName       | VARCHAR(50)  |
| Email          | VARCHAR(100) |
| BirthDate      | DATE         |
| EnrollmentDate | DATE         |

The project initially inserts students such as John Doe and Jane Smith.

### Example

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);
```

---

# 3️⃣ Courses Table 📚

The `Courses` table stores information about courses offered by departments.

### Columns

| Column       | Data Type    | Key         |
| ------------ | ------------ | ----------- |
| CourseID     | INT          | Primary Key |
| CourseName   | VARCHAR(100) | —           |
| DepartmentID | INT          | Foreign Key |
| Credits      | INT          | —           |

The database contains courses including:

* Introduction to SQL
* Data Structures

The `DepartmentID` connects courses with the `Departments` table.

---

# 4️⃣ Instructors Table 👨‍🏫

The `Instructors` table stores instructor details.

### Columns

| Column       | Data Type    | Key         |
| ------------ | ------------ | ----------- |
| InstructorID | INT          | Primary Key |
| FirstName    | VARCHAR(50)  | —           |
| LastName     | VARCHAR(50)  | —           |
| Email        | VARCHAR(100) | —           |
| DepartmentID | INT          | Foreign Key |

The project contains instructor records such as Alice Johnson and Bob Lee.

---

# 5️⃣ Enrollments Table 📝

The `Enrollments` table connects students with courses.

### Columns

| Column         | Data Type | Key         |
| -------------- | --------- | ----------- |
| EnrollmentID   | INT       | Primary Key |
| StudentID      | INT       | Foreign Key |
| CourseID       | INT       | Foreign Key |
| EnrollmentDate | DATE      | —           |

This table establishes relationships between students and courses.

---

# 🔗 Relationships

The database uses foreign keys to maintain relationships between tables.

### Department → Course

```text
Departments
     │
     └──── DepartmentID
                │
                ▼
             Courses
```

### Department → Instructor

```text
Departments
     │
     └──── DepartmentID
                │
                ▼
           Instructors
```

### Student → Enrollment

```text
Students
   │
   └──── StudentID
              │
              ▼
         Enrollments
```

### Course → Enrollment

```text
Courses
   │
   └──── CourseID
              │
              ▼
         Enrollments
```

---

# 🛠️ SQL Concepts Implemented

## 🔹 1. Database Creation

```sql
CREATE DATABASE UniversityCourseManagement;

USE UniversityCourseManagement;
```

This creates the database and selects it for further operations.

---

# 🔹 2. Table Creation

The project demonstrates table creation using:

```sql
CREATE TABLE
```

Primary keys and foreign keys are used to establish database relationships.

---

# 🔹 3. INSERT Operation

New records are added using:

```sql
INSERT INTO
```

Example:

```sql
INSERT INTO Students
VALUES
(3, 'Mike', 'Brown',
 'mike.brown@email.com',
 '2001-03-10',
 '2023-07-01');
```

The project demonstrates adding a third student through a CRUD operation.

---

# 🔹 4. SELECT Operation

Data can be retrieved using:

```sql
SELECT * FROM Students;
```

This displays records stored in the Students table.

---

# 🔹 5. UPDATE Operation

The project demonstrates updating student information:

```sql
UPDATE Students
SET FirstName = 'Michael'
WHERE StudentID = 3;
```

This changes the first name of the student whose ID is `3`.

---

# 🔹 6. DELETE Operation

Records can be removed using:

```sql
DELETE FROM Students
WHERE StudentID = 3;
```

This demonstrates the **DELETE** operation of CRUD.

---

# 📊 CRUD Operations

CRUD stands for:

| Operation | SQL Command | Purpose     |
| --------- | ----------- | ----------- |
| 🟢 Create | `INSERT`    | Add data    |
| 🔵 Read   | `SELECT`    | View data   |
| 🟡 Update | `UPDATE`    | Modify data |
| 🔴 Delete | `DELETE`    | Remove data |

---

# 🔍 Data Filtering

The project also demonstrates filtering students based on enrollment date.

```sql
SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';
```

This query returns students whose enrollment date is after December 31, 2022.

---

# 🔗 JOIN Operations

JOINs are one of the important parts of this database project.

They allow information from multiple tables to be combined.

---

## 🟢 INNER JOIN

The project uses `INNER JOIN` to display students and their courses.

```sql
SELECT s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseID,
       c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;
```

The result connects each enrolled student with their corresponding course.

---

# 🔵 LEFT JOIN

The project also demonstrates a `LEFT JOIN`.

```sql
SELECT s.StudentID,
       s.FirstName,
       s.LastName,
       c.CourseID,
       c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;
```

This starts with all students and attempts to match their enrollment and course information.

---

# 📈 Aggregate Functions

Aggregate functions are used to perform calculations on data.

This project demonstrates:

* `COUNT()`
* `AVG()`
* `SUM()`

---

## 📌 Average Credits

```sql
SELECT AVG(Credits) AS AverageCredits
FROM Courses;
```

The output in the supplied SQL execution is:

```text
AverageCredits
--------------
3.5000
```

---

# 👥 Students Per Department

The project calculates the number of students associated with each department.

```sql
SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
JOIN Courses c
ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;
```

The supplied output shows one student associated with each of the two departments.

---

# 🎯 GROUP BY and HAVING

The project uses:

```sql
GROUP BY
```

to group records and:

```sql
HAVING
```

to filter grouped results.

Example:

```sql
SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID) AS StudentCount
FROM Courses c
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;
```

This query identifies courses having more than five enrolled students.

---

# 🔎 Subquery

The project also demonstrates nested queries.

```sql
SELECT *
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);
```

This demonstrates how one SQL query can be placed inside another query.

---

# 📅 Date Functions

The project uses the `YEAR()` function to extract the enrollment year.

```sql
SELECT StudentID,
       FirstName,
       LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
```

The supplied output shows enrollment years for the students.

---

# 🔤 String Function

The `CONCAT()` function is used to combine first and last names.

```sql
SELECT CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;
```

Example output:

```text
Alice Johnson
Bob Lee
```

---

# 📊 Running Total

The project demonstrates a SQL **window function** for calculating a running total.

```sql
SELECT EnrollmentDate,
       COUNT(*) AS StudentsEnrolled,
       SUM(COUNT(*)) OVER (
           ORDER BY EnrollmentDate
       ) AS RunningTotal
FROM Enrollments
GROUP BY EnrollmentDate;
```

The supplied output produces running totals of `1` and then `2` across the enrollment dates.

---

# 🧠 CASE Statement

A `CASE` expression is used to classify students as **Senior** or **Junior**.

```sql
SELECT StudentID,
       FirstName,
       LastName,
       EnrollmentDate,
       CASE
           WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
           THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students;
```

This applies a condition to the enrollment date and generates a student-level category.

---

# 📚 Courses by Department

The project demonstrates how to find courses offered by a particular department.

```sql
SELECT c.*
FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;
```

The supplied output shows **Data Structures** as the Mathematics department course.

---

# 🎓 Student Course Queries

The project includes queries for finding students enrolled in:

### Both Courses

```sql
SELECT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID,
         s.FirstName,
         s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;
```

### Either Course

```sql
SELECT DISTINCT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN
('Introduction to SQL', 'Data Structures');
```

The supplied result for the second query includes John Doe and Jane Smith.

---

# 🖥️ Project Execution

## Step 1 — Install MySQL

Install a MySQL-compatible environment such as:

* MySQL Server
* MySQL Workbench
* XAMPP
* phpMyAdmin

---

## Step 2 — Open SQL Environment

Open your MySQL editor or SQL terminal.

---

## Step 3 — Open the SQL File

Open:

```text
Final-PR.sql
```

---

## Step 4 — Execute the Script

Run the SQL statements from top to bottom.

The database is created using:

```sql
CREATE DATABASE UniversityCourseManagement;
```

Then:

```sql
USE UniversityCourseManagement;
```

---

## Step 5 — Check Tables

After execution, the database should contain:

```text
UniversityCourseManagement
│
├── Departments
├── Students
├── Courses
├── Instructors
└── Enrollments
```

---

# 📸 Project Screenshots

## 🖥️ Database Creation

> Add your screenshot here if required.

```text
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                DATABASE CREATION SCREENSHOT                 │
│                                                             │
│                    📷 INSERT IMAGE HERE                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🗂️ Tables Screenshot

> Add screenshot of the database tables here.

```text
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                    TABLES SCREENSHOT                        │
│                                                             │
│                    📷 INSERT IMAGE HERE                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 👨‍🎓 Students Table Output

```text
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                  STUDENTS TABLE OUTPUT                      │
│                                                             │
│                    📷 INSERT IMAGE HERE                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔗 JOIN Query Output

```text
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                    JOIN QUERY OUTPUT                        │
│                                                             │
│                    📷 INSERT IMAGE HERE                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 📊 Aggregate / Group By Output

```text
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                GROUP BY / AGGREGATE OUTPUT                  │
│                                                             │
│                    📷 INSERT IMAGE HERE                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🏆 Final Project Output

```text
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                     FINAL OUTPUT                            │
│                                                             │
│                    📷 INSERT IMAGE HERE                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

# 🧩 Key SQL Concepts Learned

Through this project, the following concepts were practiced:

```text
                    SQL DATABASE
                         │
          ┌──────────────┼──────────────┐
          │              │              │
       TABLES          CRUD          RELATIONS
          │              │              │
          │              │         Primary Key
          │              │         Foreign Key
          │              │
          │       INSERT / SELECT
          │       UPDATE / DELETE
          │
     ┌────┴─────┐
     │          │
   JOINS    FUNCTIONS
     │          │
 INNER JOIN   COUNT
 LEFT JOIN    AVG
              SUM
              CONCAT
              YEAR
              CASE
              WINDOW
```

---

# 💡 Important SQL Commands Used

| Command           | Purpose            |
| ----------------- | ------------------ |
| `CREATE DATABASE` | Create database    |
| `USE`             | Select database    |
| `CREATE TABLE`    | Create table       |
| `INSERT INTO`     | Insert records     |
| `SELECT`          | Retrieve records   |
| `UPDATE`          | Modify records     |
| `DELETE`          | Delete records     |
| `WHERE`           | Filter records     |
| `JOIN`            | Combine tables     |
| `GROUP BY`        | Group records      |
| `HAVING`          | Filter groups      |
| `LIMIT`           | Limit results      |
| `COUNT()`         | Count records      |
| `AVG()`           | Calculate average  |
| `SUM()`           | Calculate total    |
| `CONCAT()`        | Join text          |
| `YEAR()`          | Extract year       |
| `CASE`            | Conditional logic  |
| `OVER()`          | Window calculation |

---

# 🌟 Project Highlights

### ✅ Relational Database Design

The project uses multiple related tables instead of keeping everything in one table.

### ✅ Primary Keys

Every major table has an identifying primary key.

### ✅ Foreign Keys

Foreign keys connect departments, courses, instructors, students, and enrollments.

### ✅ CRUD Operations

The project demonstrates all four basic database operations.

### ✅ Multiple Table Queries

Students, courses, departments, and enrollments can be combined using joins.

### ✅ Data Analysis

Aggregate functions are used to calculate counts and averages.

### ✅ Advanced SQL

The project goes beyond basic SQL by including:

* Subqueries
* Window functions
* Running totals
* CASE statements
* Date functions
* String functions

---

# 🎯 Learning Outcomes

After completing this project, I gained practical understanding of:

* How databases are created
* How tables are designed
* How primary keys work
* How foreign keys create relationships
* How data is inserted
* How data is retrieved
* How records are updated
* How records are deleted
* How multiple tables are joined
* How grouped data is analyzed
* How aggregate functions work
* How subqueries work
* How date functions work
* How string functions work
* How conditional SQL works
* How window functions can calculate running totals

---

# 🚀 Future Improvements

This project can be extended in the future by adding:

### 🔐 User Authentication

Add login functionality for administrators, instructors, and students.

### 📊 Dashboard

Create an interactive dashboard showing:

* Total students
* Total courses
* Department-wise students
* Course enrollments
* Instructor information

### 📈 Advanced Reports

Generate reports for:

* Student performance
* Course popularity
* Department statistics
* Enrollment trends

### 📝 Attendance Management

Add student attendance records.

### 🏆 Result Management

Add examination and result tables.

### 📅 Timetable Management

Add class schedules and classroom information.

---

# 📁 Project Structure

```text
University-Course-Management/
│
├── 📄 Final-PR.sql
│
└── 📄 README.md
```

---

# 🧑‍💻 Author

<div align="center">

## 👨‍💻 Sumit

### B.Tech Student

**SQL Database Project**

---

### 👨‍🏫 Guided By

# Girish Sir

---

### ⭐ University Course Management System ⭐

**Learning • Practicing • Building • Improving**

</div>

---

# 🙏 Acknowledgement

I would like to sincerely thank **Girish Sir** for providing guidance and support during the development of this SQL database project.

This project helped me understand practical database concepts and improve my SQL query-writing skills.

I am grateful for the opportunity to learn through practical implementation.

---

# 📜 Conclusion

The **University Course Management System** successfully demonstrates the practical implementation of SQL and relational database concepts.

The project starts with database and table creation and progresses through data insertion, retrieval, modification, deletion, relationships, joins, aggregate functions, subqueries, date functions, string functions, conditional statements, and window functions.

The project provides a strong practical foundation for understanding how SQL can be used to organize and analyze university-related data.

---

<div align="center">

# 💙 THANK YOU 💙

### Made with 💻 + ☕ + SQL

## 👨‍💻 Sumit

### Under the Guidance of

## 👨‍🏫 Girish Sir

---

**⭐ University Course Management System ⭐**

</div>
