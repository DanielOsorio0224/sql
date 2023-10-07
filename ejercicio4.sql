DROP DATABASE IF EXISTS salarios;
CREATE DATABASE salarios;
USE salarios;
CREATE TABLE Employee(
	id INT,
    salary INT
);

INSERT INTO Employee(id,salary)
VALUES
('1','100'),
('2','200'),
('3','300');

SELECT salary FROM Employee
UNION SELECT NULL as salary
ORDER BY salary DESC 
LIMIT 1,1;
