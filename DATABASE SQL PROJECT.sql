-- Create the database
CREATE DATABASE IF NOT EXISTS StudentDB;

-- Use the newly created database
USE StudentDB;
show databases;
show tables;
-- Create the Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT primary KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact VARCHAR(20)
);

insert into Students(student_id,name,address,contact) values
(100,'Arif','Gulshan_e_iqbal block 6',0123456789),
(101,'Israr','Gulshan_e_hadeed block 5',012345678),
(102,'Qamar','Numaish chowrangi',01234567),
(103,'Hasnain','Saddar Mobile Market',0123456),
(104,'Muzamil','Shaheen Complex',012345);
 
select *from Students;

-- Create the Courses table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    duration INT
);

insert into Courses(course_id,title,description,duration) values
('104','OOP','Object Oriented Programming','6'),
('106','DBS','Databse System','6'),
('108','DLD','Digital Logic Design','6'),
('102','MVC','Multivariable Calculas','6'),
('201','LA','Linear Algebra','6');
Select *from Courses;

-- Create the Enrollments table
CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

insert into Enrollments(enrollment_id,student_id,course_id,enrollment_date) Values
('4138','100','104','2024-03-01'),
('4938','101','106','2024-03-13'),
('4972','102','108','2024-03-11'),
('4133','103','102','2024-03-05'),
('4143','104','201','2024-03-02');

Select *from Enrollments;
delete from Enrollments where student_id= 104;

-- Create the Grades table
CREATE TABLE IF NOT EXISTS Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade FLOAT,
    date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

insert into	Grades(grade_id,student_id,course_id,grade) values 
(NULL,'100','104','75.00'),
(NULL,'101','106','80.00'),
(NULL,'102','108','71.00'),
(NULL,'103','102','65.00'),
(NULL,'104','201','90.00');

Select *from Grades;
delete from Grades;
-- Create the Teachers table
CREATE TABLE IF NOT EXISTS Teachers (
    teacher_id INT ,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(20)
);
insert into Teachers(teacher_id,name,contact) values
('5001','Amjad khuwaja','0112233'),
('5002','Adnan Ali','011223344'),
('5003','Saeed Ali','01122334455');

Select *from Teachers;

-- Create the Departments table
CREATE TABLE IF NOT EXISTS Departments (
    department_id INT ,
    name VARCHAR(100) NOT NULL,
    hod VARCHAR(100),
    contact VARCHAR(20)
);
insert into Departments(department_id,name,hod,contact) values
('123','Computer Science','Aftab Ahmed Shaikh','03XXXXX'),
('121','Software Engineering','Abdul Hafeez Khan','031XXX'),
('122','Information Technology','Muhammad Malook Rind','0312XXX');

Select *from Departments;

-- Create the Attendance table
CREATE TABLE IF NOT EXISTS Attendance (
    attendance_id INT ,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

insert into Attendance(attendance_id,student_id,course_id,date,status) values
('053','100','104','2024-02-01','Present'),
('054','101','106','2024-02-01','Absent'),
('055','102','108','2024-02-02','Absent'),
('056','103','102','2024-02-02','Present'),
('057','104','201','2024-02-03','Absent');

Select *from Attendance;

-- Create the Assignments table
CREATE TABLE IF NOT EXISTS Assignments (
    assignment_id INT ,
    course_id INT,
    student_id INT,
    submission_date DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

insert into Assignments(assignment_id,course_id,student_id,submission_date) values
('1','104','100','2024-03-11'),
('2','106','101','2024-04-11'),
('3','108','102','2024-05-11'),
('4','102','103','2024-06-11'),
('5','201','104','2024-06-11');

select *from Assignments;

-- Create the Library table
CREATE TABLE IF NOT EXISTS Library (
    transaction_id INT ,
    student_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
    -- Assuming there's a Books table for book details, but it's not defined here
);

insert into Library(transaction_id,student_id,book_id,borrow_date,return_date) values
('1001','100','15000','2024-05-13','2024-06-13'),
('1002','101','14002','2024-05-10','2024-06-10'),
('1003','102','13000','2024-05-09','2024-06-09'),
('1004','103','12001','2024-05-01','2024-06-01'),
('1005','104','11003','2024-05-05','2024-06-05');

select *from Library;

-- Create the Fees table
CREATE TABLE IF NOT EXISTS Fees (
    fee_id INT ,
    student_id INT,
    fee_type VARCHAR(100),
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

insert into Fees(fee_id,student_id,fee_type,amount,payment_date) values
('010','100','Semester fee','48000','2024-05-05'),
('011','101','Semester fee','42000','2024-04-05'),
('012','102','Semester fee','36000','2024-02-15'),
('013','103','Semester fee','23000','2024-04-29'),
('014','104','Semester fee','48000','2024-01-05');

select *from Fees;
