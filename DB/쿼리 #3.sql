
gametest

CREATE TABLE items(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NOT NULL,
	DESCRIPTION TEXT,
	VALUE INT DEFAULT 0
)

INSERT INTO items(name, DESCRIPTION, VALUE) VALUES
('안승현', ' 기분 다운', 10)

SELECT * FROM items


CREATE TABLE inventories(
	inventory_id INT AUTO_INCREMENT PRIMARY KEY,
	player_id INT,
	item_id INT,
	quantity INT DEFAULT 1,
	FOREIGN KEY(player_id) REFERENCES players(player_id),
	FOREIGN KEY(item_id) REFERENCES items(item_id)
)

INSERT INTO inventories(player_id, item_id, quantity) VALUES
(1,4,1),
(1,3,5),
(2,2,1)


SELECT p.username, i.name, inv.quantity
FROM players p
JOIN inventories inv ON p.player_id = inv.player_id
JOIN items i ON inv.item_id = i.item_id


--실습1
INSERT INTO items(name, DESCRIPTION, VALUE) VALUES
('안승현', ' 기분 다운', 10)

INSERT INTO inventories(player_id, item_id, quantity) VALUES
(1,4,1)

SELECT name, VALUE FROM items ORDER BY value DESC LIMIT 1;
SELECT * FROM items ORDER BY `value` DESC LIMIT 1;

--


CREATE TABLE quests(
	quest_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	DESCRIPTION TEXT,
	reward_exp INT DEFAULT 0,
	reward_item_id INT,
	FOREIGN KEY (reward_item_id) REFERENCES items(item_id)
)

INSERT INTO quests(title, description, reward_exp, reward_item_id) VALUES
('초보자 퀘스트', '첫번째 퀘스트를 완료 하세요', 100 , 3 ),
('용사의 검', '전설의 검을 찾아보세요', 500 ,1)

CREATE TABLE player_quests(
	player_id INT,
	quest_id INT,
	STATUS ENUM('시작', '진행중', '완료') DEFAULT '시작',
	start_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	completed_at TIMESTAMP NULL,
	PRIMARY KEY (player_id, quest_id),
	FOREIGN KEY (player_id) REFERENCES players(player_id),
	FOREIGN KEY (quest_id) REFERENCES quests(quest_id)
)


INSERT INTO player_quests(player_id, quest_id) VALUES
(1,1),
(2,2)



SELECT p.username, q.title, pq.status
FROM players p
JOIN player_quests pq ON p.player_id = pq.player_id
JOIN quests q ON pq.quest_id = q.quest_id
WHERE pq.status != '완료'



UPDATE player_quests
SET status = '완료', completed_at = CURRENT_TIMESTAMP
WHERE player_id = 1 AND quest_id = 1;



--실습 2

INSERT INTO quests(title, description, reward_exp, reward_item_id) VALUES
('안승현을 찾아라', '안승현을 찾으세요', 1 , 4 )


INSERT INTO player_quests(player_id, quest_id) VALUES
(1,3)


SELECT q.title, pq.status FROM player_quests pq
JOIN quests q ON pq.quest_id = q.quest_id WHERE pq.player_id = 1

SELECT p.username, q.title, pq.status
FROM players p
JOIN player_quests pq ON p.player_id = pq.player_id
JOIN quests q ON pq.quest_id = q.quest_id
WHERE username = 'hero163'


SELECT * FROM quests ORDER BY `reward_exp` DESC LIMIT 1;
--




