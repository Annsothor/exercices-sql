CREATE DATABASE IF NOT EXISTS colleclivre CHARSET utf8mb4;
USE colleclivre;

CREATE TABLE IF NOT EXISTS `account`(
id_account INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
`password` VARCHAR(100) NOT NULL,
created_at DATE NOT NULL,
`status` BOOLEAN NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS category(
id_category INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) UNIQUE NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS author(
id_author INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
pseudo VARCHAR(50) UNICODE NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book(
id_book INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
title VARCHAR(50) NOT NULL,
description VARCHAR(255) NOT NULL,
publication_date DATE NOT NULL UNIQUE,
cover VARCHAR(255) NOT NULL,
id_author INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS commentary(
id_commentary INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
content VARCHAR(255) NOT NULL,
created_at DATETIME NOT NULL,
enabled BOOLEAN NOT NULL,
id_account INT NOT NULL,
id_book INT NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book_category(
id_book INT NOT NULL,
id_category INT NOT NULL,
PRIMARY KEY(id_book, id_category)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book_account(
id_book INT NOT NULL,
id_account INT NOT NULL,
PRIMARY KEY(id_book, id_account)
)ENGINE=InnoDB;

ALTER TABLE book
ADD CONSTRAINT fk_write_author
FOREIGN KEY(id_author)
REFERENCES author(id_author)
ON DELETE CASCADE;

ALTER TABLE commentary
ADD CONSTRAINT fk_post_account
FOREIGN KEY(id_account)
REFERENCES `account`(id_account)
ON DELETE CASCADE;

ALTER TABLE commentary
ADD CONSTRAINT fk_add_book
FOREIGN KEY(id_book)
REFERENCES book(id_book)
ON DELETE CASCADE;

ALTER TABLE book_account
ADD CONSTRAINT fk_possess_book
FOREIGN KEY(id_book)
REFERENCES book(id_book);

ALTER TABLE book_account
ADD CONSTRAINT fk_possess_account
FOREIGN KEY(id_account)
REFERENCES `account`(id_account);

ALTER TABLE book_category
ADD CONSTRAINT fk_detailed_book
FOREIGN KEY(id_book)
REFERENCES book(id_book);

ALTER TABLE book_category
ADD CONSTRAINT fk_detailed_category
FOREIGN KEY(id_category)
REFERENCES category(id_category);

ALTER TABLE `account`
ADD COLUMN account_img VARCHAR(255) DEFAULT 'defaultpng' NOT NULL;

ALTER TABLE book
ADD COLUMN back_cover VARCHAR(255);

ALTER TABLE commentary
ADD COLUMN note INT DEFAULT 0 NOT NULL;

ALTER TABLE book
MODIFY COLUMN publication_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL;

INSERT INTO category(category_name)
VALUES 
('cat1'),
('cat2'),
('cat3'),
('cat4'),
('cat5');

INSERT INTO `account`(firstname, lastname, email, `password`, created_at, `status`)
VALUES
('nom1', 'prenom1', 'email1@mail.fr', '1234', current_timestamp(), TRUE),
('nom2', 'prenom2', 'email2@mail.fr', '1234', current_timestamp(), TRUE),
('nom3', 'prenom3', 'email3@mail.fr', '1234', current_timestamp(), TRUE);

INSERT INTO author(firstname, lastname, pseudo)
VALUES
('auth1', 'auth1name', 'pseudauth1'),
('auth2', 'auth2name', 'pseudauth2'),
('auth3', 'auth3name', 'pseudauth3'),
('auth4', 'auth4name', 'pseudauth4'),
('auth5', 'auth5name', 'pseudauth5');

INSERT INTO book(title, description, cover, id_author)
VALUES
('book1', 'description1', 'image1',1),
('book2', 'description2', 'image2',2),
('book3', 'description3', 'image3',3),
('book4', 'description4', 'image4',4),
('book5', 'description5', 'image5',5),
('book6', 'description6', 'image6',1),
('book7', 'description7', 'image7',2),
('book8', 'description8', 'image8',3),
('book9', 'description9', 'image9',4),
('book10', 'description10', 'image10',5),
('book11', 'description11', 'image11',1),
('book12', 'description12', 'image12',2),
('book13', 'description13', 'image13',3),
('book14', 'description14', 'image14',4),
('book15', 'description15', 'image15',5);

INSERT INTO book_category(id_book, id_account)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1),
(7,2),
(8,3),
(9,4),
(10,5),
(11,1),
(12,2),
(13,3),
(14,4),
(15,5);

INSERT INTO book_account(id_book, id_account)
VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,4);

INSERT INTO commentary(content, created_at, `enable`, id_account, id_book)
VALUES
('content1', current_timestamp(), TRUE, 1,1),
('content1', current_timestamp(), TRUE, 1,2),
('content1', current_timestamp(), TRUE, 2,3),
('content1', current_timestamp(), TRUE, 3,4),
('content1', current_timestamp(), TRUE, 4,5),
('content1', current_timestamp(), TRUE, 4,6);

