DROP DATABASE IF EXISTS ejercicio6;
CREATE DATABASE ejercicio6;
USE ejercicio6;

CREATE TABLE department(
id INT,
name_department VARCHAR(20),
PRIMARY KEY(id)
);

INSERT INTO department(id,name_department)
VALUES
('1','IT'),
('2','Sales');

CREATE TABLE employee(
id INT,
name_employee VARCHAR(20),
salary INT,
departmentId INT,
PRIMARY KEY(id),
FOREIGN KEY(departmentId) REFERENCES department(id)
);

INSERT INTO employee(id,name_employee,salary,departmentId)
VALUES
('1','Joe','85000','1'),
('2','Henry','80000','2'),
('3','Sam','60000','2'),
('4','Max','90000','1'),
('5','Janet','69000','1'),
('6','Randy','85000','1'),
('7','Will','70000','1');


SELECT D.name_department, E.name_employee, E.salary
FROM employee as E
INNER JOIN department as D on D.id = E.departmentId
WHERE E.salary IN
	(SELECT SWN.salary
	FROM 
		(SELECT e.salary, ROW_NUMBER() OVER(ORDER BY salary DESC) AS number_s
		FROM (
			SELECT DISTINCT e2.salary
			FROM employee AS e2
            WHERE e2.departmentId = D.id
		) AS e
        WHERE e.departmentId = D.id
		) AS SWN
	WHERE SWN.number_s <= 3
    )    
