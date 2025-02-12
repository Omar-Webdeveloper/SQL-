
CREATE TABLE Courses (
    ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
	description VARCHAR(100),
	Resource VARCHAR(100)
);
CREATE TABLE Student (
    ID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Birthdate DATE,
	Address VARCHAR(100),
	Email VARCHAR(100)
);
CREATE TABLE Enrollment (
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (Student_ID) REFERENCES Student(ID),
    CONSTRAINT FK_Enrollment_Course FOREIGN KEY (Course_ID) REFERENCES Courses(ID),
);

create table Family_info(
ID int primary key,
Guardian varchar(100),
Student_ID int unique,
CONSTRAINT FK_Student_Family_info FOREIGN KEY (Student_ID) REFERENCES Student(ID)
);
create table Attendance(
ID int primary key,
attendance_date date,
Type_of_absence varchar(100),
Student_ID int,
CONSTRAINT FK_Student_Attendance FOREIGN KEY (Student_ID) REFERENCES Student(ID)
);
create table Assignments(
ID int primary key,
name varchar(100),
description varchar(100),
due_date date,
States varchar(10)
);
create table Student_Assignments(
Student_ID int,
Assignments_ID int,
    CONSTRAINT FK_1_Student_Assignments FOREIGN KEY (Student_ID) REFERENCES Student(ID),
    CONSTRAINT FK_2_Student_Assignments FOREIGN KEY (Assignments_ID) REFERENCES Assignments(ID),
);
create table Classes(
ID int primary key,
code int,
room_number varchar(100),
schedule datetime
);
create table Student_Classes(
Classes_ID int,
Student_ID int,
 CONSTRAINT FK_1_Student_Classes FOREIGN KEY (Student_ID) REFERENCES Student(ID),
 CONSTRAINT FK_2_Student_Classes FOREIGN KEY (Classes_ID) REFERENCES Classes(ID),
);

INSERT INTO Courses (ID, Course_Name, description, Resource) VALUES 
(1, 'Mathematics', 'Basic math concepts', 'Textbook'),
(2, 'Physics', 'Introduction to Physics', 'Lecture Notes'),
(3, 'Chemistry', 'Organic Chemistry', 'Lab Manual'),
(4, 'Biology', 'Human Anatomy', 'Textbook'),
(5, 'Computer Science', 'Programming Basics', 'Online Resources');

INSERT INTO Student (ID, Full_Name, Birthdate, Address, Email) VALUES 
(101, 'John Doe', '2000-01-01', '123 Elm St', 'john.doe@example.com'),
(102, 'Jane Smith', '2001-02-02', '456 Oak St', 'jane.smith@example.com'),
(103, 'Alice Johnson', '2002-03-03', '789 Pine St', 'alice.johnson@example.com'),
(104, 'Bob Brown', '2003-04-04', '321 Maple St', 'bob.brown@example.com'),
(105, 'Carol White', '2004-05-05', '654 Birch St', 'carol.white@example.com');

INSERT INTO Enrollment (Student_ID, Course_ID, Enrollment_Date) VALUES 
(101, 1, '2025-01-15'),
(102, 2, '2025-02-20'),
(103, 3, '2025-03-10'),
(104, 4, '2025-04-05'),
(105, 5, '2025-05-01');

INSERT INTO Family_info (ID, Guardian, Student_ID) VALUES 
(1, 'Michael Doe', 101),
(2, 'Laura Smith', 102),
(3, 'Thomas Johnson', 103),
(4, 'Susan Brown', 104),
(5, 'Nancy White', 105);

INSERT INTO Attendance (ID, attendance_date, Type_of_absence, Student_ID) VALUES 
(1, '2025-01-20', 'Sick', 101),
(2, '2025-02-25', 'Personal', 102),
(3, '2025-03-15', 'Medical', 103),
(4, '2025-04-10', 'Vacation', 104),
(5, '2025-05-05', 'Other', 105);

INSERT INTO Attendance (ID, attendance_date, Type_of_absence, Student_ID) VALUES (7,'2025-02-17','other',109);

INSERT INTO Assignments (ID, name, description, due_date, States) VALUES 
(1, 'Math Homework', 'Chapter 1 Exercises', '2025-01-25', 'Open'),
(2, 'Physics Lab Report', 'Experiment 2', '2025-02-28', 'Open'),
(3, 'Chemistry Essay', 'Organic Compounds', '2025-03-20', 'Open'),
(4, 'Biology Presentation', 'Human Body Systems', '2025-04-15', 'Open'),
(5, 'Programming Project', 'Build a Website', '2025-05-10', 'Open');

insert INTO Assignments (ID, name, description, due_date, States) VALUES (6,'master peice', 'Build a Website', '2025-05-10', 'Passed');
insert INTO Assignments (ID, name, description, due_date, States) VALUES (7,'master peice', 'Build a Website', '2025-05-10', 'Submitted');
INSERT INTO Student_Assignments (Student_ID, Assignments_ID) VALUES 
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);
INSERT INTO Student_Assignments (Student_ID, Assignments_ID) VALUES (109,6);

INSERT INTO Classes (ID, code, room_number, schedule) VALUES 
(1, 101, 'Room 101', '2025-01-10 08:00:00'),
(2, 102, 'Room 102', '2025-02-12 09:00:00'),
(3, 103, 'Room 103', '2025-03-14 10:00:00'),
(4, 104, 'Room 104', '2025-04-16 11:00:00'),
(5, 105, 'Room 105', '2025-05-18 12:00:00');

INSERT INTO Student_Classes (Classes_ID, Student_ID) VALUES 
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);

SELECT * FROM Courses;
SELECT * FROM Student;
SELECT * FROM Enrollment;
SELECT * FROM Family_info;
SELECT * FROM Attendance;
SELECT * FROM Assignments;
SELECT * FROM Student_Assignments;
SELECT * FROM Classes;
SELECT * FROM Student_Classes;

SELECT * 
FROM Student 
INNER JOIN Attendance ON Student.ID = Attendance.Student_ID
WHERE Attendance.attendance_date BETWEEN '2025-02-16' AND '2025-02-20';

SELECT * 
FROM Student 
INNER JOIN Student_Assignments ON Student.ID = Student_Assignments.Student_ID
INNER JOIN Assignments ON Student_Assignments.Assignments_ID = Assignments.ID
WHERE Assignments.States = 'Submitted' or Assignments.States ='Passed';

SELECT * 
FROM Student 
INNER JOIN Enrollment ON Student.ID = Enrollment.Student_ID
INNER JOIN Courses ON Enrollment.Course_ID = Courses.ID
WHERE Courses.Course_Name = 'Mathematics';


SELECT * 
FROM Student 
INNER JOIN Family_info ON Student.ID = Family_info.Student_ID 
WHERE Family_info.Student_ID IS NOT NULL;

insert into Student values(109,'Omar Abo Jolban','2002-03-09','Amman-Jordan','Omar@gmail.com');
ALTER TABLE Student ADD Gender VARCHAR(10);

select * from Courses where Course_Name ='Biology';
select * from Student where Birthdate = '2000-01-01' ;

