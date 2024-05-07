CREATE DATABASE prj1;

USE prj1;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    writer   VARCHAR(100)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

SELECT *
FROM board;

CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(100) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);

ALTER TABLE member
    ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();

SELECT *
FROM member;

INSERT INTO board
    (title, content, writer)
SELECT title, content, writer
FROM board;

# board Table 수정
# writer Column 삭제
# member_id Column 추가 ( INT REFERENCES member(id) )

ALTER TABLE board
    DROP COLUMN writer;

ALTER TABLE board
    ADD COLUMN member_id INT REFERENCES member (id);

UPDATE board
SET member_id = 16
WHERE id > 0;

CREATE TABLE authority
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT         NOT NULL REFERENCES member (id),
    name      VARCHAR(20) NOT NULL
);
INSERT INTO authority
    (member_id, name)
VALUES (15, 'admin');

SELECT *
FROM member m
         LEFT JOIN authority a ON m.id = a.member_id;


