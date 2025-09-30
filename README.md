# 🎓 Student DB Management System – SQL Project  

This project is a **Student Database Management System** implemented in **MySQL**.  
It covers essential aspects of database design and management for an educational institute,  
including students, courses, enrollments, grades, teachers, departments, attendance, assignments, library, and fees.  

---

## 📌 Features  
- Manage **Students** with personal details.  
- Store and organize **Courses** offered.  
- Record **Enrollments** of students in courses.  
- Maintain **Grades** of students.  
- Keep track of **Teachers** and their details.  
- Define **Departments** and their HODs.  
- Track **Attendance** of students.  
- Manage **Assignments** submissions.  
- Handle **Library** transactions.  
- Manage **Fees** records and payments.  

---

## 🛠️ Technologies Used  
- **MySQL** (SQL queries, constraints, relationships)  
- **Relational Database Design** with primary keys, foreign keys, and relationships.  

---

## 📂 Database Schema  

The project contains the following tables:  

1. **Students**  
   - Stores student details.  

2. **Courses**  
   - Stores course information.  

3. **Enrollments**  
   - Many-to-many relationship between Students and Courses.  

4. **Grades**  
   - Stores grades assigned to students in courses.  

5. **Teachers**  
   - Teacher details.  

6. **Departments**  
   - Department details with Head of Department.  

7. **Attendance**  
   - Tracks student attendance in each course.  

8. **Assignments**  
   - Tracks assignment submissions.  

9. **Library**  
   - Stores book borrowing/return transactions.  

10. **Fees**  
    - Records fee payments.  

---


## ▶️ How to Run  

1. Clone the repository: 
   git clone https://github.com/your-username/Student-DB-Management-System-SQL-Project.git
   cd Student-DB-Management-System-SQL-Project

2. Open MySQL and run the script:

   ```sql
   SOURCE student_db.sql;
   ```

3. Verify the database:

   ```sql
   SHOW DATABASES;
   USE StudentDB;
   SHOW TABLES;
   ```

4. Run queries to test data:

   ```sql
   SELECT * FROM Students;
   SELECT * FROM Courses;
   ```

---

## 📈 Example Queries

* Get all students enrolled in "Database Systems":

  ```sql
  SELECT s.name, c.title 
  FROM Students s
  JOIN Enrollments e ON s.student_id = e.student_id
  JOIN Courses c ON e.course_id = c.course_id
  WHERE c.title = 'DBS';
  ```

* Get students who are absent:

  ```sql
  SELECT s.name, a.date, a.status
  FROM Attendance a
  JOIN Students s ON a.student_id = s.student_id
  WHERE a.status = 'Absent';
  ```

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first
to discuss what you would like to change.

---

## 📝 License

This project is for **educational purposes** and not intended for production use.
