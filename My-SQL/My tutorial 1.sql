CREATE DATABASE DB1;
CREATE DATABASE DB2;
CREATE DATABASE DB3;
CREATE DATABASE DB4;

DROP DATABASE DB2;
drop DATABASE db3;
drop database db4;

--- Creating a table
USE db1;
CREATE TABLE Student(
student_id VARCHAR(10) NOT NULL,
student_name VARCHAR(150) NOT NULL,
age INT NOT NULL,
place VARCHAR(100) NOT NULL,
PRIMARY KEY(student_id)

);


--- Q.1. Insert records in table

select * from student;

INSERT into student(student_id, student_name, age, place)
VALUE('s1', 'Akhil',20, 'Trivandrum');

INSERT INTO student
VALUES
('s2', 'Manju', 18, 'Ernakulam'),
('s3', 'Shareef', 13, 'Palakkad'),
('s4', 'Praveen', 32, 'Thrissur'),
('s5', 'John', 20, 'Trivandrum'),
('s6', 'Akhil', 20, 'Ernakulam'),
('s7', 'Aneesh', 14, 'Kottayam'),
('s8', 'Lekshmi', 20, 'Kozhikode'),
('s9', 'Cyril', 12, 'Ernakulam'),
('s10', 'Santhosh', 28, 'Malapurram');

---- Q.2. Update Records

UPDATE student
SET place= 'Kannur'
WHERE student_id= 's1';

SELECT * FROM student;


UPDATE student
SET age= '25'
WHERE student_id= 's10';

---- Q.3. copy table

CREATE TABLE student1 like student;
INSERT student1 SELECT * from student;

select * from student1;


----- Q.4. Delete a record

DELETE FROM student1
WHERE student_id= 's2';


----- Q.5. Select statement

SELECT student_name,place from student;


--- Q.6. Clauses statement

SELECT * FROM STUDENT
where age<20;


---- Q .7 Distinct clause

SELECT DISTINCT place from student;


---- Q.8 order by clause

SELECT * from student
ORDER BY age asc;


----- Q.9 Add or modify columns

SELECT * from student1;
ALTER TABLE student1
MODIFY contact VARCHAR(15) null;

--- Q.10. Rename/ Delete column

ALTER TABLE student1
RENAME COLUMN contact TO student_contact;

ALTER TABLE student1
DROP COLUMN student_contact;

SELECT * FROM STUDENT1;


---- Q.11. Truncate

TRUNCATE student1;

DROP TABLE student1;


----- Q.12. First & Last Record

SELECT * FROM student
ORDER BY student_id DESC
LIMIT 3;

----- Q.13. Random Records
SELECT * FROM student
ORDER BY rand()
limit 2;


----- Q 14. Teporary change

SELECT * FROM student;

SELECT student_name AS 'first_name',
age AS 'student_age', place
from student;



----- Q.15. Arithmatic Operators

SELECT 10+20 as result;
SELECT 10/20 as result;
SELECT 20%3 as result;
SELECT 10=20 AS RESULT;
SELECT 20<>20 AS RESULT;

USE db1;
SELECT * FROM STUDENT
WHERE AGE> 20;


SELECT * FROM STUDENT
WHERE AGE<> 20;


----- Q.15. logical Operators

SELECT * from student
WHERE age=20 AND place = 'Ernakulam';



----- Q.16 Subquery     ( Using Exist)

SELECT * FROM student
WHERE EXISTS( SELECT age from student where age >30);

SELECT * from student
WHERE place IN ('Malapurram', 'Trivandrum');

SELECT * from student
WHERE place IN ('Malapurram' , 'Trivandrum', 'Thrissur');

----- Q.16.1 like Operators

SELECT * FROM student
WHERE student_name LIKE 'John';

SELECT * FROM student
WHERE student_name LIKE 'a%';

SELECT * FROM student
WHERE student_name LIKE '%u';


SELECT * FROM student
WHERE student_name LIKE '%o%';

select * from student
where age NOT LIKE 20;


----- Q.16.1 or Operators

SELECT * FROM student
WHERE place= 'Trivandrum' OR age > 20;

SELECT * FROM student
WHERE place= 'Kannur' and age = 20;


------ Q.17 Build in functions

SELECT * FROM student;

SELECT place, char_length(place) AS length
FROM student;



------ Q.17.1 Build in functions/ Concat

SELECT concat(student_name, " ", place) AS full_details
FROM student;



------ Q.17.2 Build in functions/ Format

SELECT format(2154165.1546, 2) as new_number;



------ Q.17.3 Build in functions/ Insert

SELECT insert("Google", 1,1, 'f');
SELECT insert("Google", 1,1, 'f');

SELECT upper("hello world") AS new_string;
SELECT lower("hello world") AS new_string;
SELECT reverse("hello ") AS new_string;
SELECT repeat("hello",5) AS new_string;
SELECT left("hello",4) AS new_string;
SELECT right("hello",3) AS new_string;
SELECT length("hellouuuu") AS new_string;



---- Q 18 date and time

SELECT current_timestamp()AS time_stamp;
SELECT day("2024/7/12")AS new_stamp;
SELECT month("2024/7/12")AS new_stamp;
SELECT year("2024/7/12")AS new_stamp;
SELECT sysdate();
SELECT curdate();
SELECT current_time();
SELECT now();



---- Q 18 Table with foreign key

use db1;

CREATE TABLE COURSES(
course_id VARCHAR(5) NOT NULL,
course_name VARCHAR(50) NOT NULL,
PRIMARY KEY (course_id)
);


INSERT into courses
VALUES
('c1', 'Computer Hardware'),
('c2', 'Networking'),
('c3', 'Web Designing'),
('c4', 'Graphic Designing'),
('c6', 'Java');


INSERT INTO courses
VALUE
('c7', 'Java');



select * from courses;
select* from student;


---- Make another table

use db1;

CREATE TABLE enrolment(
enrolment_id VARCHAR(100) NOT NULL,
student_id VARCHAR(10),
course_id VARCHAR(10),
PRIMARY KEY (enrolment_id),
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO enrolment
VALUES
('e1', 's2', 'c1'),
('e2', 's7', 'c4'),
('e3', 's6', 'c2'),
('e4', 's5', 'c1'),
('e5', 's4', 'c6'),
('e6', 's2', 'c4'),
('e7', 's2', 'c6'),
('e8', 's3', 'c2'),
('e9', 's2', 'c4'),
('e10', 's4', 'c3');

select * from enrolment;



------ Q 19. Table Joins


CREATE DATABASE DB2;

USE db2;

CREATE TABLE country(
country_code VARCHAR(10) NOT NULL,
country_name VARCHAR(100),
PRIMARY KEY(country_code)
);

INSERT INTO country
VALUES
('IN', 'India'),
('SL', 'Srilanka'),
('PK', 'Pakistan'),
('BN', 'Bangladesh'),
('NP', 'Nepal');


CREATE TABLE capital(
capital_id VARCHAR(10) NOT NULL,
country_code VARCHAR(10),
country_name VARCHAR(100),
PRIMARY KEY(capital_id),
FOREIGN KEY(country_code) REFERENCES country(country_code)
);

ALTER TABLE capital
RENAME COLUMN country_name TO capital_name;


INSERT INTO capital
VALUES
('c1', 'IN', 'New Delhi'),
('c2', 'PK', 'Islamabad'),
('c3', 'NP', 'Kathmandu');


select * from capital;
select * from country;

---- INNER JOIN

SELECT country.country_name, capital.capital_name
FROM country INNER JOIN capital
ON country.country_code= capital.country_code;


---- LEFT JOIN

SELECT *
FROM country LEFT JOIN capital
ON country.country_code= capital.country_code;


---- RIGHT JOIN

SELECT *
FROM country RIGHT JOIN capital
ON country.country_code= capital.country_code;


---- FULL JOIN ( WILL USE UNION SINCE FULL IN NOT AVALABLE)

SELECT *
FROM country LEFT JOIN capital
ON country.country_code= capital.country_code
UNION
SELECT *
FROM country RIGHT JOIN capital
ON country.country_code= capital.country_code;

---- 20. If function


SELECT if(10>20, "Value1", "Value2") AS result ;
SELECT if(10<20, "Value1", "Value2") AS result ;

use db1;

SELECT student_name, age,
IF (age >= 18, "Adult", "Minor") AS type
FROM student;


----- 21. If Null function

SELECT ifnull(2, "Hello") as result;
SELECT ifnull(null, "Hello") as result;

use db2;


SELECT country.country_name, capital.capital_name
FROM country LEFT JOIN capital
ON country.country_code= capital.country_code;

SELECT country.country_name,
ifnull(capital.capital_name,"Blank") AS capital_name
FROM country LEFT JOIN capital 
ON country.country_code= capital.country_code;




----- 21. IS Null function

SELECT isnull(null) as result;
SELECT isnull(2) as result;

use db2;

SELECT country.country_name, capital.capital_name,
isnull(capital.capital_name) as capital_name
FROM country LEFT JOIN capital 
ON country.country_code= capital.country_code;



----- 22. CASE function


use db2;

SELECT country_name,
CASE
   WHEN country_name = "India" THEN "Hindi" 
   WHEN country_name = "Bangladesh" THEN "Bangali"
   WHEN country_name = "Pakistan" THEN "Urdu"
   WHEN country_name = "Nepal" THEN "Nepali"
   ELSE "Others" 
END  as official_language FROM country;
