CREATE DATABASE `GameTest` /*!40100 COLLATE 'utf8mb4_090gametest0_ai_ci' */;

CREATE TABLE `players` (
	`player_id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL DEFAULT '0',
	`email` VARCHAR(50) NOT NULL DEFAULT '0',
	`password_hash` VARCHAR(255) NOT NULL DEFAULT '0',
	`created_at` TIMESTAMP NOT NULL,
	`last_login` TIMESTAMP NULL,
	PRIMARY KEY (`player_id`),
	UNIQUE INDEX `username` (`username`),
	UNIQUE INDEX `email` (`email`)
)

INSERT INTO players(username, email, password_hash) VALUES
('hero163', 'hero163@gmail.com', 'hashed_password5'),
('hero512', 'hero512@gmail.com', 'hashed_password6'),
('hero987', 'hero987@gmail.com', 'hashed_password7'),
('hero756', 'hero756@gmail.com', 'hashed_password8')

SELECT * FROM players
SELECT username, last_login FROM players

UPDATE players SET last_login = CURRENT_TIMESTAMP WHERE username = 'hero123'

SELECT username, email FROM players WHERE username LIKE '%hero5%'

DELETE FROM players WHERE username = 'hero123'

ALTER TABLE players ADD COLUMN `level` INT DEFAULT 1

UPDATE players SET `level` = `level` + 1

SELECT username, `level` FROM players ORDER BY `level` DESC LIMIT 1