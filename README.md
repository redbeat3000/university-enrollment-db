# University Course & Enrollment System

A relational SQL database project for managing student enrollments, course schedules, and instructor assignments.

Repository: [https://github.com/redbeat3000/university-enrollment-db](https://github.com/redbeat3000/university-enrollment-db)

---

## ✅ Key Features

* Student and instructor registration
* Course creation and term scheduling
* Enrollment logic with duplicate prevention
* Indexing for faster lookups
* Foreign key constraints for data consistency

---

## 📦 Installation Guide (MySQL)

### 1. Install MySQL Server

* Ubuntu: `sudo apt install mysql-server`
* Windows/macOS: [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)

### 2. Clone the Repository

```bash
git clone https://github.com/redbeat3000/university-enrollment-db.git
cd university-enrollment-db
```

### 3. Login to MySQL

```bash
mysql -u root -p
```

### 4. Create the Database

```sql
CREATE DATABASE university_enrollment;
USE university_enrollment;
```

### 5. Import Schema

```bash
mysql -u root -p university_enrollment < university-enrollment-schema.sql
```

---

## 🔍 Notes

* SQL script: `university-enrollment-schema.sql` must be in the root directory.
* Consider adding views or stored procedures for reports.
* Extend schema to support grading and prerequisites.

---

## 🤝 Contributions

Pull requests are welcome! Suggestions to expand the schema, add data samples, or implement grading logic are appreciated.

---

## 📄 License

This project is open-source and available under the MIT License.
