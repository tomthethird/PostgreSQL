-- Create a basic database for a classroom system. The tables should include the student table, the teacher table, and a classroom table.

-- Teachers can have many classes but a class can only have one teacher.
-- The students can have many classes as well.
-- Apply normalization techniques


-- CREATE DATABASE classroom;

-- CREATE TABLE teachers (
--   teacherID serial PRIMARY KEY NOT NULL,
--   teacherName text NOT NULL
-- );
-- INSERT INTO teachers (teacherName) VALUES ('Ms. Minchin');
-- INSERT INTO teachers (teacherName) VALUES ('Prof. Oak');
-- INSERT INTO teachers (teacherName) VALUES ('Prof. Anna Keating');

-- CREATE TABLE students (
--   studentID serial PRIMARY KEY NOT NULL,
--   studentName text NOT NULL
-- );
-- INSERT INTO students (studentName) VALUES ('Lavinia');
-- INSERT INTO students (studentName) VALUES ('Ash Ketchem');
-- INSERT INTO students (studentName) VALUES ('Wes Gibbins');

-- SELECT * FROM students;

-- UPDATE students SET studentname = 'Ash Ketchum' WHERE studentID = 2; --updated value of student # 2.

-- SELECT * FROM students;

-- CREATE TABLE classes (
--   classID int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
--   className text NOT NULL,
--   teacherid int REFERENCES teachers(teacherID)
--   );

INSERT INTO classes (className, teacherID) VALUES ('Trigonometry', 1);
INSERT INTO classes (className, teacherID) VALUES ('Physics', 2);
INSERT INTO classes (className, teacherID) VALUES ('Chemistry', 2);
INSERT INTO classes (className, teacherID) VALUES ('Criminal Law', 3);

SELECT * FROM classes;
