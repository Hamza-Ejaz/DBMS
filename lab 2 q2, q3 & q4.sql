CREATE DATABASE EDUCATION
CREATE TABLE School
(
SchoolID INT PRIMARY KEY,
SchoolName VARCHAR(50) NOT NULL,
SchoolAddress VARCHAR(80) NOT NULL,
PostCode INT UNIQUE,
Phone INT UNIQUE
)

INSERT INTO School(SchoolID,SchoolName,SchoolAddress,PostCode,Phone)
VALUES(1,'Nasra','Karachi',79700,34505851),
(2,'Shah Wali Model Academy ','Multan',85633,34788371),
(3,'GOVT Boys','Lahore',34033,30794260);


CREATE TABLE Student
(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50) NOT NULL,
StudentNumber INT UNIQUE, 
TotalGrade VARCHAR (10) NOT NULL,
Address VARCHAR(80) NOT NULL,
Phone INT UNIQUE,
Email VARCHAR (30)
)

INSERT INTO Student(StudentID,StudentName,StudentNumber,TotalGrade,Address,Phone,Email)
VALUES(1,'Zain',347629,'A+','Gilgit',03115805851,'zainnn.454@gmail.com'),
(2,'Ali',4829213,'B+','Lahore',03034788371,'ali89@gmail.com');


CREATE TABLE Teacher
(
TeacherID INT PRIMARY KEY,
TeacherName VARCHAR(50) NOT NULL,
TeacherNumber INT UNIQUE
)

INSERT INTO Teacher(TeacherID,TeacherName,TeacherNumber)
VALUES(1,'Farzeen Ashfaq',76811111),
(2,'Badar Sami',400486300),
(3,'Humera Bashir',7529225672);


CREATE TABLE Course
(
CourseID INT UNIQUE,
CourseName VARCHAR(50) NOT NULL,
SchoolID INT PRIMARY KEY,
SchoolName VARCHAR(50) NOT NULL
)

INSERT INTO Course(CourseID,CourseName,SchoolID,SchoolName)
VALUES(313,'PST',1,'Nasra'),
(405,'Linear Algebra',2,'Shah Wali Academy');


CREATE TABLE Grade
(
GradeID INT UNIQUE,
StudentID INT PRIMARY KEY,
CourseID INT UNIQUE,
Grade VARCHAR (10) NOT NULL
)

INSERT INTO Grade(GradeID,StudentID,CourseID,Grade)
VALUES(1,1,405,'A+'),
(4,2,313,'B+');


CREATE TABLE StudentCourse
(
StudentID INT PRIMARY KEY,
CourseID INT UNIQUE
)

INSERT INTO StudentCourse(StudentID,CourseID)
VALUES(2,313),
(1,405);


CREATE TABLE TeacherCourse
(
TeacherID INT PRIMARY KEY,
CourseID INT UNIQUE
)

INSERT INTO TeacherCourse(TeacherID,CourseID)
VALUES(2,413),
(1,303),
(3,405);

SELECT * FROM School;
SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Grade;
SELECT * FROM StudentCourse;
SELECT * FROM TeacherCourse;