DROP DATABASE IF EXISTS numerosConsecutivos;
CREATE DATABASE numerosConsecutivos;
USE numerosConsecutivos;
CREATE TABLE logs_numeros(
id INT AUTO_INCREMENT,
num VARCHAR(20),
PRIMARY KEY(id)
);

INSERT INTO logs_numeros(num)
VALUES
('1'),
('1'),
('1'),
('2'),
('1'),
('2'),
('2');

SELECT DISTINCT num 
FROM logs_numeros AS L
WHERE num = (SELECT num FROM logs_numeros WHERE id = (L.id+1))
AND	num = (SELECT num FROM logs_numeros WHERE id = (L.id+2));