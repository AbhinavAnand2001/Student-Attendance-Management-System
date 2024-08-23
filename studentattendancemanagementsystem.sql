-- Create the database
CREATE DATABASE IF NOT EXISTS studentattendancemanagementsystem;

-- Use the database
USE studentattendancemanagementsystem;

-- Create the Student table
CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Department VARCHAR(255)
);

-- Insert sample data into the Student table
INSERT INTO Student (StudentID, FirstName, LastName, Email, Department) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'Physics'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Chemistry'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 'Biology'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 'Mathematics'),
(5, 'Sarah', 'Lee', 'sarah.lee@example.com', 'History'),
(6, 'Mike', 'Davis', 'mike.davis@example.com', 'Geography'),
(7, 'Emily', 'Wilson', 'emily.wilson@example.com', 'English'),
(8, 'Alex', 'Martinez', 'alex.martinez@example.com', 'Computer Science'),
(9, 'Olivia', 'Anderson', 'olivia.anderson@example.com', 'Economics'),
(10, 'Liam', 'Thomas', 'liam.thomas@example.com', 'Sociology');

-- Create the Teacher table
CREATE TABLE IF NOT EXISTS Teacher (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Department VARCHAR(255)
);

-- Insert sample data into the Teacher table
INSERT INTO Teacher (TeacherID, FirstName, LastName, Email, Department) VALUES
(1, 'David', 'White', 'david.white@example.com', 'Physics'),
(2, 'Lisa', 'Adams', 'lisa.adams@example.com', 'Chemistry'),
(3, 'Michael', 'Clark', 'michael.clark@example.com', 'Biology'),
(4, 'Sarah', 'Lewis', 'sarah.lewis@example.com', 'Mathematics'),
(5, 'Peter', 'Hill', 'peter.hill@example.com', 'History'),
(6, 'Mary', 'Wright', 'mary.wright@example.com', 'Geography'),
(7, 'John', 'Allen', 'john.allen@example.com', 'English'),
(8, 'Anna', 'Scott', 'anna.scott@example.com', 'Computer Science'),
(9, 'James', 'Baker', 'james.baker@example.com', 'Economics'),
(10, 'Emma', 'Reed', 'emma.reed@example.com', 'Sociology');

-- Create the Class table
CREATE TABLE IF NOT EXISTS Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(255),
    Schedule VARCHAR(255),
    Room VARCHAR(255)
);

-- Insert sample data into the Class table
INSERT INTO Class (ClassID, ClassName, Schedule, Room) VALUES
(1, 'Physics 101', 'Mon 9:00 AM', '101'),
(2, 'Chem Lab', 'Tue 2:00 PM', 'Lab A'),
(3, 'Bio Lecture', 'Wed 11:00 AM', '203'),
(4, 'Math 201', 'Thu 10:00 AM', '105'),
(5, 'History 101', 'Fri 1:00 PM', '307'),
(6, 'Geo Lab', 'Mon 1:00 PM', 'Lab B'),
(7, 'English Lit', 'Tue 9:00 AM', '102'),
(8, 'Comp Sci 301', 'Wed 3:00 PM', 'Lab C'),
(9, 'Econ 202', 'Thu 2:00 PM', '205'),
(10, 'Socio 101', 'Fri 11:00 AM', '304');

-- Create the Attendance table
CREATE TABLE IF NOT EXISTS Attendance (
    AttendanceID INT PRIMARY KEY,
    ClassID INT,
    StudentID INT,
    Status VARCHAR(255),
    Date DATE,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Insert sample data into the Attendance table
INSERT INTO Attendance (AttendanceID, ClassID, StudentID, Status, Date) VALUES
(1, 1, 1, 'Present', '2024-04-01'),
(2, 1, 2, 'Present', '2024-04-01'),
(3, 1, 3, 'Absent', '2024-04-01'),
(4, 1, 4, 'Present', '2024-04-01'),
(5, 1, 5, 'Present', '2024-04-01'),
(6, 1, 6, 'Absent', '2024-04-01'),
(7, 1, 7, 'Present', '2024-04-01'),
(8, 1, 8, 'Present', '2024-04-01'),
(9, 1, 9, 'Absent', '2024-04-01'),
(10, 1, 10, 'Present', '2024-04-01');

-- Create the LeaveRequest table
CREATE TABLE IF NOT EXISTS LeaveRequest (
    LeaveReqID INT PRIMARY KEY,
    StudentID INT,
    Status VARCHAR(255),
    RequestDate DATE,
    StartDate DATE,
    EndDate DATE,
    Reason VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Insert sample data into the LeaveRequest table
INSERT INTO LeaveRequest (LeaveReqID, StudentID, Status, RequestDate, StartDate, EndDate, Reason) VALUES
(1, 1, 'Pending', '2024-04-01', '2024-04-05', '2024-04-07', 'Family Emergency'),
(2, 2, 'Approved', '2024-04-01', '2024-04-03', '2024-04-04', 'Doctor''s Appointment'),
(3, 3, 'Rejected', '2024-04-01', '2024-04-06', '2024-04-06', 'Personal Reasons'),
(4, 4, 'Pending', '2024-04-01', '2024-04-10', '2024-04-15', 'Vacation'),
(5, 5, 'Approved', '2024-04-01', '2024-04-03', '2024-04-03', 'Wedding Ceremony'),
(6, 6, 'Rejected', '2024-04-01', '2024-04-02', '2024-04-02', 'Illness'),
(7, 7, 'Pending', '2024-04-01', '2024-04-08', '2024-04-10', 'Personal'),
(8, 8, 'Approved', '2024-04-01', '2024-04-03', '2024-04-03', 'Conference'),
(9, 9, 'Rejected', '2024-04-01', '2024-04-05', '2024-04-05', 'Unforeseen Event'),
(10, 10, 'Pending', '2024-04-01', '2024-04-07', '2024-04-09', 'Family Function');

-- Display the tables
SHOW TABLES;

-- Display the data in each table
SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Class;
SELECT * FROM Attendance;
SELECT * FROM LeaveRequest;
