CREATE DATABASE CAMPUS;
USE CAMPUS;
CREATE TABLE College(
	college_code VARCHAR(15) PRIMARY KEY,
	college_name VARCHAR(50),
	address VARCHAR(50)
);
CREATE TABLE Faculty(
	college_code VARCHAR(15),
	faculty_code VARCHAR(15) PRIMARY KEY,
	faculty_name VARCHAR(15),  
	qualification VARCHAR(15),
	experience INT,
	department VARCHAR(10),
	address VARCHAR(50),
	FOREIGN KEY (college_code) REFERENCES College(college_code)
);



INSERT INTO College VALUES("KTE","Rajiv Gandhi Institute of Technology Kottayam","Velloor PO, Pampady, Kottayam-686501");
INSERT INTO College VALUES("TVE","College of Engineering Trivandrum","Sreekaryam PO, Thiruvananathapuram, Kerala-695016");
INSERT INTO College VALUES("IDK","Government Engineering College Idukki","Painavu, Idukki,Kerala-685603");
INSERT INTO College VALUES("TCR","Government Engineering College, Thrissur","Thrissur-680009, Kerala, India");
INSERT INTO College VALUES("TKM","T K M College of Engineering, Kollam","Karicode, Kollam-691005,Kerala");



INSERT INTO Faculty VALUES("KTE","123","Kavitha N","MTECH","20","CSE","Kottayam-686501");
INSERT INTO Faculty VALUES("KTE","124","Anil Kumar S","MTECH","20","CSE","Kottayam-686501");
INSERT INTO Faculty VALUES("KTE","125","Arun V","BTECH","3","EC","Ernakulam-682011");
INSERT INTO Faculty VALUES("TVE","136","Ummer","MTECH","18","EEE","Thiruvananathapuram-695016");
INSERT INTO Faculty VALUES("TVE","155","Janvi","MTECH","8","CE","Thiruvananathapuram-695016");
INSERT INTO Faculty VALUES("IDK","137","Amal","BTECH","16","EEE","Idukki-685603");
INSERT INTO Faculty VALUES("IDK","138","Saira","MTECH","13","EEE","Idukki-685603");
INSERT INTO Faculty VALUES("IDK","139","Shamil","MTECH","10","CSE","Idukki-685603");
INSERT INTO Faculty VALUES("IDK","140","Archana","BTECH","9","CSE","Idukki-685603");
INSERT INTO Faculty VALUES("TKM","141","Mini","MTECH","9","CSE","Kollam-691005");
INSERT INTO Faculty VALUES("TKM","142","Jaleel","BTECH","5","EC","Kollam-691005");
INSERT INTO Faculty VALUES("TKM","144","Jimli","BTECH","12","CE","Kollam-691005");
INSERT INTO Faculty VALUES("TCR","143","Sajan","MTECH","10","ME","Kollam-691005");



SELECT "COLLEGE DETAILS" AS " ";

SELECT *
FROM College;

SELECT "FACULTY DETAILS" AS " ";

SELECT *
FROM Faculty;





SELECT "All faulty members of a specified college(RIT) whose experience is greater than or equal to 10 years" AS " ";

SELECT faculty_name,experience
FROM College AS C,Faculty as F
WHERE C.college_name="Rajiv Gandhi Institute of Technology Kottayam" AND experience>=10 AND C.college_code=F.college_code;





SELECT "All Faculty Members of a specified college who have at least 10 years of experience but not having M.Tech Degree" AS " ";

SELECT faculty_name,qualification,experience
FROM College AS C,Faculty AS F
WHERE C.college_name="Government Engineering College Idukki" AND experience>=10 AND qualification!="MTECH" AND C.college_code=F.college_code ;





SELECT "Faculty of a specified college department wise in non decreasing order of their seniority" AS " ";

SELECT faculty_name,department,experience
FROM (Faculty AS F JOIN College AS C ON F.college_code=C.college_code)
WHERE C.college_name="Government Engineering College Idukki"
ORDER BY department,experience;





SELECT "Names of the Colleges having more than a specified number of faculty members" AS " ";

SELECT college_name AS "College name",COUNT(*) AS "No of faculties"
FROM (Faculty AS F JOIN College AS C ON F.college_code=C.college_code)
GROUP BY C.college_name
HAVING COUNT(*)>2;





SELECT "Names of the colleges having the least number of faculties and the largest number of faculty" AS " ";

(SELECT C.college_name,COUNT(*) AS "No of faculties"
FROM (Faculty AS F JOIN College AS C ON F.college_code=C.college_code)
GROUP BY C.college_name
ORDER BY COUNT(*) LIMIT 1)
UNION
(SELECT C.college_name,COUNT(*) AS "No of faculties"
FROM (Faculty AS F JOIN College AS C ON F.college_code=C.college_code)
GROUP BY C.college_name
ORDER BY COUNT(*) DESC LIMIT 1);




DROP TABLE Faculty;
DROP TABLE College;
DROP DATABASE CAMPUS;