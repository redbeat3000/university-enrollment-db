-- University Course & Enrollment System

-- Drop if exists (for development purposes)
DROP DATABASE IF EXISTS university_db;
CREATE DATABASE university_db;
USE university_db;

-- Students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    enrollment_year YEAR
);

-- Professors table
CREATE TABLE professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50)
);

-- Courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    capacity INT,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

-- Prerequisites table
CREATE TABLE prerequisites (
    course_id INT,
    prerequisite_id INT,
    PRIMARY KEY(course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (prerequisite_id) REFERENCES courses(course_id)
);

-- Enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- View for transcripts
CREATE VIEW student_transcript AS
SELECT 
    s.student_id,
    s.full_name,
    c.course_name,
    e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- GPA calculation view
CREATE VIEW student_gpa AS
SELECT 
    student_id,
    ROUND(AVG(
        CASE grade
            WHEN 'A' THEN 4.0
            WHEN 'B' THEN 3.0
            WHEN 'C' THEN 2.0
            WHEN 'D' THEN 1.0
            ELSE 0.0
        END), 2) AS gpa
FROM enrollments
GROUP BY student_id;
