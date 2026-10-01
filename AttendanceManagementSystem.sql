-- ============================================================
-- ATTENDANCE MANAGEMENT SYSTEM
-- ============================================================
CREATE DATABASE  AttendanceManagementSystem;

USE AttendanceManagementSystem;

-- ============================================================
-- Q1. CREATE TABLES
-- Write an SQL statement to create all tables with the specified columns.
-- ============================================================
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    Department VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    `Date` DATE NOT NULL,
    CheckInTime DATETIME,
    CheckOutTime DATETIME,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);

CREATE TABLE Holidays (
    HolidayID INT PRIMARY KEY,
    HolidayDate DATE NOT NULL,
    HolidayName VARCHAR(100) NOT NULL
);

CREATE TABLE LeaveRequests (
    LeaveRequestID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    LeaveType VARCHAR(30) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_leave_employee
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);

CREATE TABLE WorkSchedules (
    ScheduleID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    ScheduleDate DATE NOT NULL,
    CONSTRAINT fk_schedule_employee
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);

-- ============================================================
-- Q2. INSERT RECORDS
-- Insert at least 10 records in all the tables.
-- ============================================================
INSERT INTO Employees
(EmployeeID, FirstName, LastName, Email, Phone, Department, HireDate)
VALUES
(101, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876510001', 'HR', '2021-03-15'),
(102, 'Diya', 'Patel', 'diya.patel@example.com', '9876510002', 'Sales', '2019-07-10'),
(103, 'Rohan', 'Mehta', 'rohan.mehta@example.com', '9876510003', 'IT', '2022-01-20'),
(104, 'Ananya', 'Joshi', 'ananya.joshi@example.com', '9876510004', 'Finance', '2020-08-05'),
(105, 'Kabir', 'Singh', 'kabir.singh@example.com', '9876510005', 'Marketing', '2023-02-12'),
(106, 'Ishita', 'Kulkarni', 'ishita.kulkarni@example.com', '9876510006', 'Sales Operations', '2021-11-18'),
(107, 'Vivaan', 'Deshmukh', 'vivaan.deshmukh@example.com', '9876510007', 'Customer Support', '2024-04-22'),
(108, 'Meera', 'Nair', 'meera.nair@example.com', '9876510008', 'Administration', '2020-12-01'),
(109, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876510009', 'Research and Development', '2022-06-14'),
(110, 'Sara', 'Khan', 'sara.khan@example.com', '9876510010', 'Legal', '2021-09-30'),
(111, 'Aditya', 'Verma', 'aditya.verma@example.com', '9876510011', 'Operations', '2020-05-18'),
(112, 'Kiara', 'Shah', 'kiara.shah@example.com', '9876510012', 'Engineering', '2022-09-12'),
(113, 'Reyansh', 'Gupta', 'reyansh.gupta@example.com', '9876510013', 'Procurement', '2021-01-25'),
(114, 'Anvi', 'Mishra', 'anvi.mishra@example.com', '9876510014', 'Quality Assurance', '2023-06-08'),
(115, 'Atharv', 'Pawar', 'atharv.pawar@example.com', '9876510015', 'Training', '2024-01-15'),
(116, 'Ira', 'Kapoor', 'ira.kapoor@example.com', '9876510016', 'HR', '2022-02-11'),
(117, 'Neil', 'Iyer', 'neil.iyer@example.com', '9876510017', 'Sales', '2021-04-19'),
(118, 'Myra', 'Bose', 'myra.bose@example.com', '9876510018', 'IT', '2023-08-07'),
(119, 'Yash', 'Malhotra', 'yash.malhotra@example.com', '9876510019', 'Finance', '2018-11-21'),
(120, 'Aanya', 'Desai', 'aanya.desai@example.com', '9876510020', 'Marketing', '2022-03-16'),
(121, 'Rudra', 'Chavan', 'rudra.chavan@example.com', '9876510021', 'Sales Operations', '2020-10-09'),
(122, 'Navya', 'Bhat', 'navya.bhat@example.com', '9876510022', 'Customer Support', '2021-12-13'),
(123, 'Krish', 'Sethi', 'krish.sethi@example.com', '9876510023', 'Administration', '2023-01-17'),
(124, 'Tara', 'Menon', 'tara.menon@example.com', '9876510024', 'Research and Development', '2024-02-20'),
(125, 'Dev', 'Patil', 'dev.patil@example.com', '9876510025', 'Legal', '2022-07-04'),
(126, 'Riya', 'Kulkarni', 'riya.kulkarni@example.com', '9876510026', 'Operations', '2021-05-27'),
(127, 'Om', 'Jadhav', 'om.jadhav@example.com', '9876510027', 'Engineering', '2020-06-30'),
(128, 'Saanvi', 'Rane', 'saanvi.rane@example.com', '9876510028', 'Procurement', '2023-04-14'),
(129, 'Vihaan', 'Naik', 'vihaan.naik@example.com', '9876510029', 'Quality Assurance', '2022-10-18'),
(130, 'Mahi', 'Kadam', 'mahi.kadam@example.com', '9876510030', 'Training', '2024-05-06');

INSERT INTO Departments
(DepartmentID, DepartmentName, Location)
VALUES
(1, 'HR', 'Mumbai'),
(2, 'Sales', 'Pune'),
(3, 'IT', 'Bengaluru'),
(4, 'Finance', 'Mumbai'),
(5, 'Marketing', 'Delhi'),
(6, 'Sales Operations', 'Pune'),
(7, 'Customer Support', 'Hyderabad'),
(8, 'Administration', 'Mumbai'),
(9, 'Research and Development', 'Bengaluru'),
(10, 'Legal', 'Delhi'),
(11, 'Operations', 'Chennai'),
(12, 'Engineering', 'Bengaluru'),
(13, 'Procurement', 'Pune'),
(14, 'Quality Assurance', 'Hyderabad'),
(15, 'Training', 'Mumbai');

INSERT INTO Attendance
(AttendanceID, EmployeeID, `Date`, CheckInTime, CheckOutTime, Status)
VALUES
(1,101,'2026-09-01','2026-09-01 09:05:00','2026-09-01 17:30:00','Late'),
(2,101,'2026-09-02','2026-09-02 08:55:00','2026-09-02 17:25:00','Present'),
(3,101,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(4,102,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(5,102,'2026-09-02','2026-09-02 09:15:00','2026-09-02 18:00:00','Late'),
(6,102,'2026-09-03','2026-09-03 09:00:00','2026-09-03 18:00:00','Present'),

(7,103,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(8,103,'2026-09-02','2026-09-02 09:20:00','2026-09-02 18:10:00','Late'),
(9,103,'2026-09-03','2026-09-03 09:00:00','2026-09-03 18:00:00','Present'),

(10,104,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(11,104,'2026-09-02','2026-09-02 09:10:00','2026-09-02 17:40:00','Late'),
(12,104,'2026-09-03',NULL,NULL,'Absent'),

(13,105,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(14,105,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(15,105,'2026-09-03','2026-09-03 09:15:00','2026-09-03 17:45:00','Late'),

(16,106,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(17,106,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(18,106,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(19,107,'2026-08-15','2026-08-15 09:10:00','2026-08-15 17:30:00','Present'),
(20,107,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(21,107,'2026-09-02','2026-09-02 09:15:00','2026-09-02 17:45:00','Late'),

(22,108,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:00:00','Present'),
(23,108,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:00:00','Present'),
(24,108,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:00:00','Present'),

(25,109,'2026-09-01','2026-09-01 09:15:00','2026-09-01 18:00:00','Late'),
(26,109,'2026-09-02','2026-09-02 09:00:00','2026-09-02 18:00:00','Present'),
(27,109,'2026-09-03','2026-09-03 09:00:00','2026-09-03 18:00:00','Present'),

(28,110,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(29,110,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(30,110,'2026-08-15','2026-08-15 09:10:00','2026-08-15 17:30:00','Present'),

(31,111,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(32,111,'2026-09-02','2026-09-02 09:15:00','2026-09-02 17:45:00','Late'),
(33,111,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(34,112,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(35,112,'2026-09-02','2026-09-02 09:00:00','2026-09-02 18:00:00','Present'),
(36,112,'2026-09-03','2026-09-03 09:15:00','2026-09-03 18:10:00','Late'),

(37,113,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(38,113,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(39,113,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(40,114,'2026-09-01','2026-09-01 09:15:00','2026-09-01 17:45:00','Late'),
(41,114,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(42,114,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(43,115,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(44,115,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(45,115,'2026-08-15','2026-08-15 09:10:00','2026-08-15 17:30:00','Present'),

(46,116,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(47,116,'2026-09-02','2026-09-02 09:15:00','2026-09-02 17:45:00','Late'),
(48,116,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(49,117,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(50,117,'2026-09-02','2026-09-02 09:00:00','2026-09-02 18:00:00','Present'),
(51,117,'2026-09-03','2026-09-03 09:15:00','2026-09-03 18:00:00','Late'),

(52,118,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(53,118,'2026-09-02','2026-09-02 09:00:00','2026-09-02 18:00:00','Present'),
(54,118,'2026-09-03','2026-09-03 09:00:00','2026-09-03 18:00:00','Present'),

(55,119,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(56,119,'2026-09-02','2026-09-02 09:15:00','2026-09-02 17:45:00','Late'),
(57,119,'2026-09-03',NULL,NULL,'Absent'),

(58,120,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(59,120,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(60,120,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(61,121,'2026-09-01','2026-09-01 09:15:00','2026-09-01 17:45:00','Late'),
(62,121,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(63,121,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(64,122,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(65,122,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(66,122,'2026-09-03','2026-09-03 09:15:00','2026-09-03 17:45:00','Late'),

(67,123,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:00:00','Present'),
(68,123,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:00:00','Present'),
(69,123,'2026-08-28','2026-08-28 09:10:00','2026-08-28 17:30:00','Present'),

(70,124,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(71,124,'2026-09-02','2026-09-02 09:15:00','2026-09-02 18:10:00','Late'),
(72,124,'2026-09-03','2026-09-03 09:00:00','2026-09-03 18:00:00','Present'),

(73,125,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(74,125,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(75,125,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(76,126,'2026-09-01','2026-09-01 09:15:00','2026-09-01 17:45:00','Late'),
(77,126,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(78,126,'2026-10-02','2026-10-02 09:10:00','2026-10-02 17:30:00','Present'),

(79,127,'2026-09-01','2026-09-01 09:00:00','2026-09-01 18:00:00','Present'),
(80,127,'2026-09-02','2026-09-02 09:00:00','2026-09-02 18:00:00','Present'),
(81,127,'2026-09-03','2026-09-03 09:15:00','2026-09-03 18:10:00','Late'),

(82,128,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(83,128,'2026-09-02','2026-09-02 09:15:00','2026-09-02 17:45:00','Late'),
(84,128,'2026-09-03',NULL,NULL,'Absent'),

(85,129,'2026-09-01','2026-09-01 09:00:00','2026-09-01 17:30:00','Present'),
(86,129,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(87,129,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(88,130,'2026-09-01','2026-09-01 09:15:00','2026-09-01 17:45:00','Late'),
(89,130,'2026-09-02','2026-09-02 09:00:00','2026-09-02 17:30:00','Present'),
(90,130,'2026-09-03','2026-09-03 09:00:00','2026-09-03 17:30:00','Present'),

(91,104,'2026-09-10',NULL,NULL,'Absent'),
(92,119,'2026-09-10',NULL,NULL,'Absent'),
(93,128,'2026-09-10',NULL,NULL,'Absent'),
(94,107,'2026-09-10','2026-09-10 09:05:00','2026-09-10 17:30:00','Late');

INSERT INTO Holidays
(HolidayID, HolidayDate, HolidayName)
VALUES
(1,'2026-01-26','Republic Day'),
(2,'2026-03-04','Holi'),
(3,'2026-04-14','Ambedkar Jayanti'),
(4,'2026-05-01','Maharashtra Day'),
(5,'2026-08-15','Independence Day'),
(6,'2026-08-28','Janmashtami'),
(7,'2026-09-02','Ganesh Chaturthi'),
(8,'2026-10-02','Gandhi Jayanti'),
(9,'2026-10-20','Dussehra'),
(10,'2026-11-09','Diwali'),
(11,'2026-01-14','Makar Sankranti'),
(12,'2026-02-19','Shivaji Jayanti'),
(13,'2026-08-26','Onam'),
(14,'2026-09-17','Vishwakarma Puja'),
(15,'2026-12-25','Christmas'),
(16,'2026-11-24','Guru Nanak Jayanti'),
(17,'2026-08-17','Parsi New Year'),
(18,'2026-03-27','Ram Navami'),
(19,'2026-03-31','Mahavir Jayanti'),
(20,'2026-10-25','Karwa Chauth');

INSERT INTO LeaveRequests
(LeaveRequestID, EmployeeID, StartDate, EndDate, LeaveType, Status)
VALUES
(1,101,'2026-01-10','2026-01-11','Sick','Approved'),
(2,101,'2026-02-15','2026-02-16','Vacation','Approved'),
(3,101,'2026-04-10','2026-04-11','Vacation','Pending'),
(4,101,'2026-06-05','2026-06-06','Sick','Approved'),
(5,101,'2026-07-15','2026-07-16','Vacation','Approved'),

(6,102,'2026-01-12','2026-01-13','Sick','Approved'),
(7,102,'2026-03-12','2026-03-12','Sick','Approved'),
(8,102,'2026-05-10','2026-05-11','Vacation','Pending'),
(9,102,'2026-07-20','2026-07-21','Vacation','Approved'),
(10,102,'2026-08-10','2026-08-11','Sick','Approved'),

(11,103,'2026-05-20','2026-05-22','Vacation','Rejected'),
(12,103,'2026-07-10','2026-07-11','Vacation','Approved'),

(13,104,'2026-07-01','2026-07-02','Sick','Pending'),
(14,105,'2026-08-10','2026-08-12','Vacation','Approved'),
(15,106,'2026-08-18','2026-08-18','Sick','Approved'),
(16,107,'2026-09-10','2026-09-11','Sick','Pending'),
(17,108,'2026-02-10','2026-02-11','Vacation','Approved'),
(18,109,'2026-03-15','2026-03-16','Sick','Rejected'),
(19,110,'2026-04-05','2026-04-06','Vacation','Approved'),
(20,111,'2026-05-05','2026-05-06','Sick','Pending'),
(21,112,'2026-06-10','2026-06-11','Vacation','Approved'),
(22,113,'2026-07-05','2026-07-06','Sick','Approved'),
(23,114,'2026-07-20','2026-07-21','Vacation','Rejected'),
(24,115,'2026-08-01','2026-08-02','Sick','Approved'),
(25,116,'2026-08-05','2026-08-06','Vacation','Pending'),
(26,117,'2026-08-12','2026-08-13','Sick','Approved'),
(27,118,'2026-08-15','2026-08-16','Vacation','Approved'),
(28,119,'2026-08-20','2026-08-21','Sick','Rejected'),
(29,120,'2026-08-25','2026-08-26','Vacation','Approved'),
(30,121,'2026-09-01','2026-09-02','Sick','Pending'),
(31,122,'2026-09-03','2026-09-04','Vacation','Approved'),
(32,123,'2026-09-05','2026-09-06','Sick','Approved'),
(33,124,'2026-09-07','2026-09-08','Vacation','Pending'),
(34,125,'2026-09-09','2026-09-10','Sick','Approved'),
(35,126,'2026-09-11','2026-09-12','Vacation','Rejected'),
(36,127,'2026-09-13','2026-09-14','Sick','Approved'),
(37,128,'2026-09-15','2026-09-16','Vacation','Approved'),
(38,129,'2026-09-17','2026-09-18','Sick','Pending'),
(39,130,'2026-09-19','2026-09-20','Vacation','Approved'),
(40,110,'2026-08-05','2026-08-05','Sick','Pending');

INSERT INTO WorkSchedules
(ScheduleID, EmployeeID, StartTime, EndTime, ScheduleDate)
VALUES
(1,101,'09:00:00','17:30:00','2026-09-01'),
(2,102,'09:00:00','18:00:00','2026-09-01'),
(3,103,'09:00:00','18:00:00','2026-09-01'),
(4,104,'09:00:00','17:30:00','2026-09-01'),
(5,105,'09:00:00','17:30:00','2026-09-01'),
(6,106,'09:00:00','17:30:00','2026-09-01'),
(7,107,'09:00:00','17:30:00','2026-09-01'),
(8,108,'09:00:00','17:00:00','2026-09-01'),
(9,109,'09:00:00','18:00:00','2026-09-01'),
(10,110,'09:00:00','17:30:00','2026-09-01'),
(11,111,'09:00:00','17:30:00','2026-09-01'),
(12,112,'09:00:00','18:00:00','2026-09-01'),
(13,113,'09:00:00','17:30:00','2026-09-01'),
(14,114,'09:00:00','17:30:00','2026-09-01'),
(15,115,'09:00:00','17:30:00','2026-09-01'),
(16,116,'09:00:00','17:30:00','2026-09-01'),
(17,117,'09:00:00','18:00:00','2026-09-01'),
(18,118,'09:00:00','18:00:00','2026-09-01'),
(19,119,'09:00:00','17:30:00','2026-09-01'),
(20,120,'09:00:00','17:30:00','2026-09-01'),
(21,121,'09:00:00','17:30:00','2026-09-01'),
(22,122,'09:00:00','17:30:00','2026-09-01'),
(23,123,'09:00:00','17:00:00','2026-09-01'),
(24,124,'09:00:00','18:00:00','2026-09-01'),
(25,125,'09:00:00','17:30:00','2026-09-01'),
(26,126,'09:00:00','17:30:00','2026-09-01'),
(27,127,'09:00:00','18:00:00','2026-09-01'),
(28,128,'09:00:00','17:30:00','2026-09-01'),
(29,129,'09:00:00','17:30:00','2026-09-01'),
(30,130,'09:00:00','17:30:00','2026-09-01');

SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Attendance;
SELECT * FROM Holidays;
SELECT * FROM LeaveRequests;
SELECT * FROM WorkSchedules;

-- ============================================================
-- Q3.Select Records
-- Write a query to select all attendance records from the Attendance table where the Status is 'Late'.
-- ============================================================
SELECT * FROM Attendance
WHERE Status = 'Late';

-- ============================================================
-- Q4.Where Clause (AND)
-- Write a query to select all employees from the Employees table who work in the 'HR' department and were hired after January 1, 2020.
-- ============================================================
SELECT * FROM Employees
WHERE Department = 'HR'
  AND HireDate > '2020-01-01';

-- ============================================================
-- Q5.LIKE Operator
-- Write a query to select all departments where the DepartmentName contains 'Sales'.
-- ============================================================
SELECT * FROM Departments
WHERE DepartmentName LIKE '%Sales%';

-- ============================================================
-- Q6.Case Statement
-- Write a query to select CheckInTime, CheckOutTime, and a new column AttendanceDuration from the Attendance table. 
-- Calculate AttendanceDuration as the difference between CheckOutTime and CheckInTime.
-- ============================================================
SELECT AttendanceID, EmployeeID, CheckInTime, CheckOutTime,
    CASE
        WHEN CheckInTime IS NOT NULL
         AND CheckOutTime IS NOT NULL
        THEN TIMEDIFF(CheckOutTime, CheckInTime)
        ELSE NULL
    END AS AttendanceDuration
FROM Attendance;

-- ============================================================
-- Q7. SUBQUERY
-- Write a query to find all employees who have at least one 'Approved' leave request. Use a subquery in the WHERE clause to find these EmployeeIDs.
-- ============================================================
SELECT * FROM Employees
WHERE EmployeeID IN
(
    SELECT EmployeeID
    FROM LeaveRequests
    WHERE Status = 'Approved'
);

-- ============================================================
-- Q8.GROUP BY
-- Write a query to get the total number of days each employee was present in the current month. Group the results by EmployeeID.
-- ============================================================
SELECT EmployeeID,
    COUNT(*) AS PresentDays
FROM Attendance
WHERE Status = 'Present'
  AND YEAR(`Date`) = YEAR(CURDATE())
  AND MONTH(`Date`) = MONTH(CURDATE())
GROUP BY EmployeeID
ORDER BY EmployeeID;


-- ============================================================
-- Q9. HAVING CLAUSE
-- Write a query to get the total number of leave requests for each employee, but only include employees with more than 3 leave requests. Use the HAVING clause.
-- ============================================================
SELECT
    EmployeeID,
    COUNT(*) AS TotalLeaveRequests
FROM LeaveRequests
GROUP BY EmployeeID
HAVING COUNT(*) > 3;

-- ============================================================
-- Q10.LIMIT
-- Write a query to select the top 5 employees with the most number of 'Absent' statuses in the past year.
-- ============================================================
SELECT EmployeeID,
    COUNT(*) AS AbsentCount
FROM Attendance
WHERE Status = 'Absent'
  AND `Date` >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY EmployeeID
ORDER BY AbsentCount DESC
LIMIT 5;

-- ============================================================
-- Q11. INNER JOIN 
-- Write a query to join Employees with Departments to get a list of all employees with their department names.
-- ============================================================
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, d.Location
FROM Employees e
INNER JOIN Departments d
    ON e.Department = d.DepartmentName;


-- ============================================================
-- Q12. OUTER JOIN
-- Write a query to get a list of all employees and any associated LeaveRequests. Include employees who might not have any leave requests.
-- ============================================================
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    lr.LeaveRequestID,
    lr.StartDate,
    lr.EndDate,
    lr.LeaveType,
    lr.Status
FROM Employees e
LEFT JOIN LeaveRequests lr
    ON e.EmployeeID = lr.EmployeeID
ORDER BY e.EmployeeID, lr.StartDate;


-- ============================================================
-- Q13. JOIN WITH AGGREGATION
-- Write a query to get the average number of hours worked per day for each employee. Use an INNER JOIN between WorkSchedules and Attendance, and group by EmployeeID.
-- ============================================================
SELECT e.EmployeeID,e.FirstName,e.LastName,
    ROUND( AVG(TIMESTAMPDIFF(MINUTE,a.CheckInTime,a.CheckOutTime) / 60),
        2
    ) AS AverageHoursWorkedPerDay
FROM Employees e
INNER JOIN WorkSchedules ws
    ON e.EmployeeID = ws.EmployeeID
INNER JOIN Attendance a
    ON ws.EmployeeID = a.EmployeeID
   AND ws.ScheduleDate = a.`Date`
WHERE a.CheckInTime IS NOT NULL
  AND a.CheckOutTime IS NOT NULL
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY e.EmployeeID;

-- ============================================================
-- Q14. SUBQUERY WITH JOIN
-- Write a query to find all employees who have worked on days that are holidays. Use a subquery to filter dates that are in the Holidays table.
-- ============================================================
SELECT DISTINCT e.EmployeeID,e.FirstName,e.LastName,a.`Date`,a.Status
FROM Employees e
INNER JOIN Attendance a
    ON e.EmployeeID = a.EmployeeID
WHERE a.`Date` IN
(
    SELECT HolidayDate
    FROM Holidays
);

-- ============================================================
-- Q15. ADVANCED JOIN
-- Write a query to list FirstName, LastName, DepartmentName, and HolidayName for all employees who have their CheckInTime on a holiday. 
-- Use INNER JOIN and LEFT JOIN as necessary to get all required details.
-- ============================================================
SELECT
    e.FirstName,
    e.LastName,
    d.DepartmentName,
    h.HolidayName
FROM Employees e
INNER JOIN Attendance a
    ON e.EmployeeID = a.EmployeeID
INNER JOIN Departments d
    ON e.Department = d.DepartmentName
LEFT JOIN Holidays h
    ON a.`Date` = h.HolidayDate
WHERE h.HolidayID IS NOT NULL
  AND a.CheckInTime IS NOT NULL;