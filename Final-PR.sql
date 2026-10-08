CREATE DATABASE UniversityCourseManagement;

USE UniversityCourseManagement;
1.Create Departments Table


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');
SELECT * FROM Departments;
+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
+--------------+------------------+
2 rows in set (0.008 sec)

2.Create Students Table

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO Students
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-05-15', '2022-07-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-08-20', '2021-07-01');

SELECT * FROM Students;
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-05-15 | 2022-07-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-08-20 | 2021-07-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
2 rows in set (0.149 sec)

3.Create Courses Table

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Courses
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

SELECT * FROM Courses;
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
+----------+---------------------+--------------+---------+
2 rows in set (0.009 sec)

4.Create Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2);
 SELECT * FROM Instructors;
+--------------+-----------+----------+------------------------+--------------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID |
+--------------+-----------+----------+------------------------+--------------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 |
+--------------+-----------+----------+------------------------+--------------+
2 rows in set (0.006 sec)


5.Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments
VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');
SELECT * FROM Enrollments;
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
+--------------+-----------+----------+----------------+
2 rows in set (0.007 sec)

CRUD: INSERT
INSERT INTO Students
VALUES
(3, 'Mike', 'Brown', 'mike.brown@email.com', '2001-03-10', '2023-07-01');

CRUD: SELECT
SELECT * FROM Students;
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-05-15 | 2022-07-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-08-20 | 2021-07-01     |
|         3 | Mike      | Brown    | mike.brown@email.com | 2001-03-10 | 2023-07-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
3 rows in set (0.009 sec)

CRUD: UPDATE
UPDATE Students
SET FirstName = 'Michael'
WHERE StudentID = 3;

CRUD: DELETE
DELETE FROM Students
WHERE StudentID = 3;

Students Enrolled After 2022
SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';

Courses Offered by Mathematics Department, Limit 5
SELECT c.*
    -> FROM Courses c
    -> JOIN Departments d
    -> ON c.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = 'Mathematics'
    -> LIMIT 5;
+----------+-----------------+--------------+---------+
| CourseID | CourseName      | DepartmentID | Credits |
+----------+-----------------+--------------+---------+
|      102 | Data Structures |            2 |       4 |
+----------+-----------------+--------------+---------+
1 row in set (0.012 sec)

Number of Students in Each Course
SELECT c.CourseID,
       c.CourseName,
       COUNT(e.StudentID) AS StudentCount
FROM Courses c
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;

Students Enrolled in Both Courses
SELECT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;


Students Enrolled in Either Course

SELECT DISTINCT s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
+-----------+-----------+----------+
2 rows in set (0.143 sec)

Average Credits
SELECT AVG(Credits) AS AverageCredits
FROM Courses;
+----------------+
| AverageCredits |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.147 sec)

Count Students in Each Department
SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
JOIN Courses c
ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

+--------------+------------------+--------------+
| DepartmentID | DepartmentName   | StudentCount |
+--------------+------------------+--------------+
|            1 | Computer Science |            1 |
|            2 | Mathematics      |            1 |
+--------------+------------------+--------------+
2 rows in set (0.013 sec)

INNER JOIN
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
+-----------+-----------+----------+----------+---------------------+
| StudentID | FirstName | LastName | CourseID | CourseName          |
+-----------+-----------+----------+----------+---------------------+
|         1 | John      | Doe      |      101 | Introduction to SQL |
|         2 | Jane      | Smith    |      102 | Data Structures     |
+-----------+-----------+----------+----------+---------------------+
2 rows in set (0.158 sec)

LEFT JOIN
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
+-----------+-----------+----------+----------+---------------------+
| StudentID | FirstName | LastName | CourseID | CourseName          |
+-----------+-----------+----------+----------+---------------------+
|         1 | John      | Doe      |      101 | Introduction to SQL |
|         2 | Jane      | Smith    |      102 | Data Structures     |
+-----------+-----------+----------+----------+---------------------+
2 rows in set (0.144 sec)

Subquery
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

Extract Year from Enrollment Date
SELECT StudentID,
       FirstName,
       LastName,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
+-----------+-----------+----------+----------------+
| StudentID | FirstName | LastName | EnrollmentYear |
+-----------+-----------+----------+----------------+
|         1 | John      | Doe      |           2022 |
|         2 | Jane      | Smith    |           2021 |
+-----------+-----------+----------+----------------+
2 rows in set (0.157 sec)

Concatenate Instructor Name
SELECT CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;
+----------------+
| InstructorName |
+----------------+
| Alice Johnson  |
| Bob Lee        |
+----------------+
2 rows in set (0.145 sec)

Running Total
SELECT EnrollmentDate,
       COUNT(*) AS StudentsEnrolled,
       SUM(COUNT(*)) OVER (
           ORDER BY EnrollmentDate
       ) AS RunningTotal
FROM Enrollments
GROUP BY EnrollmentDate;
+----------------+------------------+--------------+
| EnrollmentDate | StudentsEnrolled | RunningTotal |
+----------------+------------------+--------------+
| 2021-08-01     |                1 |            1 |
| 2022-08-01     |                1 |            2 |
+----------------+------------------+--------------+
2 rows in set (0.187 sec)

Senior or Junior Using CASE
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

+-----------+-----------+----------+----------------+--------------+
| StudentID | FirstName | LastName | EnrollmentDate | StudentLevel |
+-----------+-----------+----------+----------------+--------------+
|         1 | John      | Doe      | 2022-07-01     | Senior       |
|         2 | Jane      | Smith    | 2021-07-01     | Senior       |
+-----------+-----------+----------+----------------+--------------+
2 rows in set (0.176 sec)






