CREATE DATABASE reciclaje;
USE reciclaje;
CREATE TABLE alimentos(
	product_id INT,
    low_fats ENUM('Y','N'),
    recyclable ENUM('Y','N')
);

INSERT INTO alimentos(product_id,low_fats,recyclable)
VALUES
('1','Y','Y'),
('2','N','Y'),
('3','Y','N'),
('4','Y','Y'),
('5','Y','Y');

SELECT product_id FROM alimentos
WHERE low_fats = 'Y' AND recyclable = 'Y';
