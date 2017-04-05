# AGGREGATE FUNCTIONS


SELECT COUNT(*) from students WHERE students.age > 25; 
- selects number of students meeting whatever is in the "where" criteria. 

SELECT SUM(charge) from payments; 
- sums charge field of all of the payments.  

SELECT AVG(age) from students;
- averages the age of all students. 


Most commonly used aggregate functions: 
AVG() - Returns the average value.

COUNT() - Returns the number of rows.

MAX() - Returns the largest value.

MIN() - Returns the smallest value.

SUM() - Returns the sum


-----
GROUP BY is a way to group results into sets.  It's typically used in conjunction with aggregate functions 
http://www.postgresqltutorial.com/postgresql-group-by/



