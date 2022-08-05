CREATE DATABASE subquery;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  first_name varchar(20), last_name varchar(20), salary int
);

INSERT INTO employees
VALUES ('Tj','Olson',50000),
('Steven','Markle',30000),
('Jake','The Dog',3002),
('Jake','The Dog',3002),
('Finn','The Human',300002),
('Alexander','The Great',320),
('Son','Goku',30000),
('Tj','Olsones',4550000),
('Steven','Markleses',530000),
('Jake','The Dog 4',300222),
('Jake','The Dog 3',3002);

SELECT * FROM employees;

SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT max(salary) FROM employees
  WHERE first_name = 'Jake');