DROP DATABASE IF EXISTS clientes;
CREATE DATABASE clientes;
USE clientes;
CREATE TABLE usuario(
id INT,
name_user varchar(20),
referee_id INT
);

INSERT INTO usuario(id,name_user,referee_id)
VALUES
('1','Will',null),
('2','Jane',null),
('3','Alex','2'),
('4','Bill',null),
('5','Zack','1'),
('6','Mark','2');

SELECT name_user FROM usuario
WHERE referee_id != 2 
OR referee_id IS NULL;