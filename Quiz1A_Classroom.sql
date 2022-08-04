CREATE DATABASE classroom;

CREATE TABLE teachers (
  teacherID serial PRIMARY KEY NOT NULL,
  teacherName text NOT NULL
);
INSERT INTO teachers (teacherName) VALUES ('Ms. Minchin');
INSERT INTO teachers (teacherName) VALUES ('Prof. Oak');
INSERT INTO teachers (teacherName) VALUES ('Prof. Anna Keating');

CREATE TABLE students (
  studentID serial PRIMARY KEY NOT NULL,
  studentName text NOT NULL
);
INSERT INTO students (studentName) VALUES ('Lavinia');
INSERT INTO students (studentName) VALUES ('Ash Ketchem');
INSERT INTO students (studentName) VALUES ('Wes Gibbins');

SELECT * FROM students;

UPDATE students SET studentname = 'Ash Ketchum' WHERE studentID = 2; --updated value of student # 2.

SELECT * FROM students;

CREATE TABLE classes (
  classID int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  className text NOT NULL,
  teacherid int REFERENCES teachers(teacherID)
  );

INSERT INTO classes (className, teacherID) VALUES ('Trigonometry', 1);
INSERT INTO classes (className, teacherID) VALUES ('Physics', 2);
INSERT INTO classes (className, teacherID) VALUES ('Chemistry', 2);
INSERT INTO classes (className, teacherID) VALUES ('Criminal Law', 3);
INSERT INTO classes (className, teacherID) VALUES ('Trigonometry', 1);

SELECT * FROM classes;

DELETE FROM classes WHERE classid = 5; --deletes row

SELECT * FROM classes;

CREATE TABLE classSched (
  classID int REFERENCES classes(classID),
  studentID int REFERENCES students(studentID)
);

INSERT INTO classSched (classID, studentid) VALUES (1,2);
INSERT INTO classSched (classID, studentid) VALUES (3,1);
INSERT INTO classSched (classID, studentid) VALUES (2,2);
INSERT INTO classSched (classID, studentid) VALUES (1,3);
INSERT INTO classSched (classID, studentid) VALUES (3,1);
INSERT INTO classSched (classID, studentid) VALUES (1,1);
INSERT INTO classSched (classID, studentid) VALUES (4,3);
INSERT INTO classSched (classID, studentid) VALUES (4,2);

SELECT * FROM classSched;

SELECT classid, studentname FROM classSched
INNER JOIN
students ON classSched.studentID = students.studentid;

SELECT classSched.classid, classSched.studentid, teachers.teacherid FROM classSched
LEFT JOIN
teachers ON classSched.classid = teachers.teacherid;