DROP DATABASE IF EXISTS twitter_db;

CREATE DATABASE twitter_db;

USE twitter_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id INT AUTO_INCREMENT,
    user_handle VARCHAR(50) NOT NULL UNIQUE,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phonenumber CHAR(10) UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(user_id)
);

INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
('user1', 'user1@gmail.com', 'nombre1', 'apellido1', '123456789'),
('user2', 'user2@gmail.com', 'nombre2', 'apellido2', '223456789'),
('user3', 'user3@gmail.com', 'nombre3', 'apellido3', '122456789'),
('user4', 'user4@gmail.com', 'nombre4', 'apellido4', '123356789'),
('user5', 'user5@gmail.com', 'nombre5', 'apellido5', '123556789');

DROP TABLE IF EXISTS followers;

CREATE TABLE followers(
	follower_id INT NOT NULL,
    following_id INT NOT NULL,
    FOREIGN KEY(following_id) REFERENCES users(user_id),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, following_id)
);

ALTER TABLE followers
ADD CONSTRAINT check_follower_id
CHECK (follower_id <> following_id);

INSERT INTO followers(follower_id, following_id)
values
(1,2),
(2,1),
(3,1),
(4,2),
(5,4);

SELECT follower_id, following_id FROM followers;
SELECT follower_id FROM followers WHERE following_id = 1;
SELECT COUNT(follower_id) AS followers FROM followers WHERE following_id = 1;

SELECT following_id, COUNT(follower_id) AS followers
FROM followers
GROUP BY following_id
ORDER BY followers DESC
LIMIT 3;

SELECT users.user_id, users.user_handle, users.first_name, following_id, COUNT(follower_id) AS followers
FROM followers
JOIN users ON users.user_id = followers.following_id
GROUP BY following_id
ORDER BY followers DESC
LIMIT 3;

CREATE TABLE tweets(
	tweet_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_text VARCHAR(280) NOT NULL,
    num_likes INT DEFAULT 0,
    num_retweets INT DEFAULT 0,
    num_comments INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	PRIMARY KEY (tweet_id)
);

INSERT INTO tweets(user_id, tweet_text)
values(
	(1, 'texto1'),
    (2, 'texto2'),
    (3, 'texto3'),
    (4, 'texto4')
);    

SELECT user_id, COUNT(*) AS tweet_count
FROM tweets
GROUP BY user_id;

SELECT tweet_id, tweet_text, user_id
FROM tweets
WHERE user_id IN (
		SELECT following_id
        FROM followers
        GROUP BY following_id
        HAVING COUNT(*) > 2
);

DELETE FROM tweets WHERE tweet_id = 1;
DELETE FROM tweets WHERE user_id = 1;

DELETE FROM tweets WHERE tweet_text LIKE '%texto1%';

UPDATE tweets SET num_comments = num_comments + 1 WHERE tweet_id = 4;

UPDATE tweets SET tweet_text = REPLACE(tweet_text, 'texto2', 'texto0');

CREATE TABLE tweet_likes(
	user_id INT NOT NULL,
    tweet_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
    PRIMARY KEY (user_id, tweet_id)
);

INSERT INTO tweet_likes (user_id, tweet_id)
VALUES
(2, 4), (3,3);

SELECT tweet_id, COUNT(*) AS like_count
FROM tweet_likes
GROUP BY tweet_id;

    