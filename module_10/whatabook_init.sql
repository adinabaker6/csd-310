/*
    Title: whatabook.init.sql
    Author: Adina Baker
    Date: Nov 9 2022
    Description: WhatABook database initialization script.
*/

-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('49 Park Terrace, Spring Valley, NY 10977');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('Living Emunah 1', 'Rabbi David Ashear', 'The First in the Series');

INSERT INTO book(book_name, author, details)
    VALUES('Living Emunah 2', 'Rabbi David Ashear', 'The Second in the Series');

INSERT INTO book(book_name, author, details)
    VALUES('Living Emunah 3', 'Rabbi David Ashear', 'The Third in the Series');

INSERT INTO book(book_name, author)
    VALUES('Harry Potter and the Sorcerers Stone', 'J.K. Rowling');

INSERT INTO book(book_name, author)
    VALUES('Stories that Warm The Heart', 'Michoel Pruzansky');

INSERT INTO book(book_name, author)
    VALUES("As Long As I Live", 'Tzvi Margulies');

INSERT INTO book(book_name, author)
    VALUES('All for the Boss', 'Ruchama Herman');

INSERT INTO book(book_name, author)
    VALUES('Kids Speak 12', 'Adam Davies');

INSERT INTO book(book_name, author)
    VALUES('Once We Were Brothers', 'Howard Prawer');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Sean', 'Hershman');

INSERT INTO user(first_name, last_name)
    VALUES('Alex', 'Walker');

INSERT INTO user(first_name, last_name)
    VALUES('Sam', 'Edelstein');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Sean'), 
        (SELECT book_id FROM book WHERE book_name = 'Once We Were Brothers')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Alex'),
        (SELECT book_id FROM book WHERE book_name = 'Living Emunah 3')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Sam'),
        (SELECT book_id FROM book WHERE book_name = 'All for the Boss')
    );
