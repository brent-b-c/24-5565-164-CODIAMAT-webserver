USE school;

--create table for enrollment
CREATE TABLE enrollments(
    enrollement_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

--add foreign keys
ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

--display students and courses
SELECT * FROM students;
SELECT * FROM courses;

--insert enrollment records
INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-10-07'),
(1, 2, '2026-10-07'),
(2, 1, '2026-10-07'),
(2, 3, '2026-10-07'),
(4, 2, '2026-10-07'),
(4, 6, '2026-10-07'),
(5, 1, '2026-10-07'),
(5, 5, '2026-10-07'),
(6, 3, '2026-10-07'),
(6, 7, '2026-10-07'),
(7, 4, '2026-10-07'),
(8, 8, '2026-10-07'),
(9, 6, '2026-10-07');

--display enrollment records
SELECT * FROM enrollments;

--basic join
SELECT
    students.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id;

--filter where 
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
WHERE courses.course_name = "CC5";

-- sort alphabetically
SELECT 
    students.name,
    courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

--count total students
SELECT COUNT(*) AS total_students
FROM students;

-- count total enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments;

-- count student per course
SELECT 
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

--most popular course
SELECT 
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;

-- student report 
SELECT 
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id 
ORDER BY students.name;

