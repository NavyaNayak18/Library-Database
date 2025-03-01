-- Create a database for the library
CREATE DATABASE library_db;
USE library_db;

-- Create a table to store information about books
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    quantity INT NOT NULL,
    publisher_id INT,
    publication_year INT,
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

-- Create a table to store information about users (library patrons)
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT
);

-- Create a table to store information about book transactions (checkouts and returns)
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    checkout_date DATE,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Create a table to store information about authors
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);

-- Create a table to link books with authors in a many-to-many relationship
CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create a table to store information about publishers
CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) NOT NULL
);

-- Create a table to store information about copies of books
CREATE TABLE book_copies (
    copy_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    copy_status ENUM('Available', 'Checked Out', 'On Hold') NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert data into the authors table
INSERT INTO authors (author_name) VALUES
('John Smith'),
('Alice Johnson'),
('David Williams'),
('J.K. Rowling'),
('Stephen King'),
('Chimamanda Ngozi Adichie'),
('Neil Gaiman'),
('Celeste Ng'),
('Haruki Murakami'),
('Margaret Atwood'),
('F. Scott Fitzgerald'),
('Tara Westover'),
('J.D. Salinger'),
('Michelle Obama');

-- Insert data into the publishers table
INSERT INTO publishers (publisher_name) VALUES
('Tech Publications'),
('Acme Books'),
('Fiction House'),
('Penguin Random House'),
('HarperCollins'),
('Simon & Schuster'),
('Macmillan Publishers'),
('Hachette Book Group'),
('Scholastic Corporation'),
('Bloomsbury Publishing');

-- Insert data into the books table
INSERT INTO books (title, author, isbn, quantity, publisher_id, publication_year) VALUES
('Introduction to SQL', 'John Smith', '1234567890', 5, 1, 2022),
('Programming in Python', 'Alice Johnson', '9876543210', 8, 2, 2021),
('The Martian', 'David Williams', '3456789012', 3, 3, 2014),
('Harry Potter and the Sorcerers Stone', 'J.K. Rowling', '9780590353427', 100, 1, 1997),
('The Shining', 'Stephen King', '9780385121675', 75, 2,	1977),
('Americanah', 'Chimamanda Ngozi Adichie', '9780307455925', 50,	3, 2013),
('American Gods', 'Neil Gaiman', '9780060558123', 60, 4, 2001),
('Little Fires Everywhere', 'Celeste Ng', '9780735224315', 80,	5,	2017),
('Norwegian Wood', 'Haruki Murakami', '9780375704024', 65,	6,	1987),
('The Testaments', 'Margaret Atwood', '9780385543781', 55,	7,	2019),
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 70, 8,	1951),
('Becoming', 'Michelle Obama', '9781524763138', 90,	9,	2018),
('The Hunger Games', 'Suzanne Collins', '9780439023481', 85, 10, 2008),
('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', '9780439064872', 110, 1, 1998),
('The Stand', 'Stephen King', '9780307743688', 90,	2,	1978),
('Half of a Yellow Sun', 'Chimamanda Ngozi Adichie', '9781400095209', 70,	3,	2006),
('Coraline', 'Neil Gaiman', '9780380807345', 80, 4,	2002),
('Everything I Never Told You', 'Celeste Ng', '9781594205712', 85,	5,	2014),
('Kafka on the Shore', 'Haruki Murakami', '9781400079278', 95,	6,	2002),
('Alias Grace', 'Margaret Atwood', '9780385490443', 75, 7,	1996),
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 100,	8,	1925),
('Educated', 'Tara Westover' '9780399590504', 105,	9,	2018),
('Catching Fire', 'Suzanne Collins', '9780439023498', 120,	10,	2009),
('Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', '9780439136365', 115,	1,	1999),
('Misery', 'Stephen King', '9780451169525', 85,	2,	1987),
('Purple Hibiscus', 'Chimamanda Ngozi Adichie', '9781616202415', 75, 3,	2003),
('Stardust', 'Neil Gaiman', '9780061689246', 90, 4,	1999),
('Everything, Everything', 'Celeste Ng', '9780553496642', 80, 5, 2015),
('1Q84', 'Haruki Murakami', '9780307593313', 100, 6, 2009),
('The Handmaids Tale', 'Margaret Atwood', '9780385490818', 95, 7, 1985),
('To Kill a Mockingbird', 'F. Scott Fitzgerald', '9780061120084', 110,	8,	1960),
('Where the Crawdads Sing', 'Tara Westover', '9780735219090', 125,	9,	2018),
('Mockingjay', 'Suzanne Collins', '9780439023511', 115,	10,	2010),
('Harry Potter and the Goblet of Fire', 'J.K. Rowling', '9780439139601', 120, 1, 2000),
('Pet Sematary', 'Stephen King', '9780743412278', 85, 2, 1983),
('Dear Ijeawele, or A Feminist Manifesto in Fifteen Suggestions', 'Chimamanda Ngozi Adichie', '9781524733131', 70,	3,	2017),
('Neverwhere', 'Neil Gaiman', '9780062821331', 95,	4,	1996),
('The Silent Patient', 'Celeste Ng', '9781250301697', 100,	5,	2019),
('Colorless Tsukuru Tazaki and His Years of Pilgrimage', 'Haruki Murakami', '9780385681846', 90, 6,	2013),
('The Test', 'Margaret Atwood', '9780385543780', 85,	7,	2019),
('The Road', 'F. Scott Fitzgerald', '9780307387899', 105, 8, 2006),
('The Night Circus', 'Tara Westover', '9780307744432', 110,	9, 2011),
('The Ballad of Songbirds and Snakes', 'Suzanne Collins', '9781338635171', 115,	10,	2020),
('Harry Potter and the Order of the Phoenix', 'J.K. Rowling', '9780439358071', 125,	1,	2003),
('It', 'Stephen King', '9781501142970', 95,	2,	1986),
('Purple', 'Chimamanda Ngozi Adichie', '9781616202410', 85, 3,	2003),
('Good Omens: The Nice and Accurate Prophecies of Agnes Nutter Witch', 'Neil Gaiman', '9780060853969', 90, 4, 1990),
('Little Fires', 'Celeste Ng', '9780735224310', 100,	5, 2017),
('Kafka on the Shore', 'Haruki Murakami', '9781400079270', 105,	6, 2002),
('The Handmaids', 'Margaret Atwood', '9780385490810', 95,	7,	1985),
('Becoming', 'F. Scott Fitzgerald', '9781524763130', 120, 8, 2018),
('Games', 'Tara Westover', '9780439023480', 115, 9,	2008),
('The Catcher in the Rye', 'Suzanne Collins', '9780316769480', 105,	10,	1951),
('Sapiens: A Brief History of Humankind', 'J.K. Rowling', '9780062316097', 110,	1, 2011),
('Shoe Dog', 'Stephen King', '9781501135910', 100,	2,	2016),
('1984', 'Chimamanda Ngozi Adichie', '9780451524935', 95, 3, 1949),
('The Power of Habit', 'Neil Gaiman', '9780812981605', 105,	4, 2012),
('The Circus', 'Celeste Ng', '9780062315007', 120,	5, 1988);

-- Link books with authors in the book_authors table
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);
INSERT INTO book_authors (book_id, author_id) VALUES
(4,	1),
(7,	4),
(8,	5),
(9,	6),
(10, 7),
(11,	8),
(12,	9),
(13,	10),
(14,	13),
(15,	14),
(16,	1),
(567,	4),
(568,	5),
(569,	6),
(570,	7),
(571,	8),
(572,	9),
(573,	10),
(574,	11),
(575,	12),
(576,	1),
(577,	4),
(578,	5),
(579,	6),
(580,	7),
(581,	8),
(582,	9),
(583,	10),
(584,	11),
(585,	12),
(586,	1),
(587,	4),
(588,	5),
(589,	6),
(590,	7),
(591,	8),
(592,	9),
(593,	10),
(594,	11),
(595,	12),
(596,	1),
(597,	4),
(598,	5),
(599,	6),
(600,	7),
(601,	8),
(602,	9),
(603,	10),
(604,	11),
(605,	12),
(606,	1),
(607,	4),
(608,	5),
(609,	6),
(610,	7),
(611,	8);


-- Insert data into the users table
INSERT INTO users (name, email, phone_number, address) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Ave'),
('Smith', 'smith.a@example.com', '987-123-3210', '856 Hill Ave'),
('Jill', 'jill.s@example.com', '123-654-3210', '996 River Ave'),
('Jack', 'jack.m@example.com', '987-987-3210', '123 1 Ave'),
('Mary', 'mary.s@example.com', '987-654-9876', '345 Hills');

-- Insert data into the transactions table
INSERT INTO transactions (user_id, book_id, checkout_date, return_date) VALUES
(1, 1, '2023-01-01', '2023-01-15'),
(2, 2, '2023-02-01', NULL),
(3, 4, '2023-03-01', '2023-03-15'),
(3, 10, '2023-04-01', '2023-04-15'),
(4, 589, '2023-05-02', '2023-05-15'),
(5, 601, '2023-06-03', '2023-06-15'),
(6, 12, '2023-07-03', '2023-07-15'),
(6, 589, '2023-08-04', '2023-08-15'),
(4, 610, '2023-09-05', '2023-09-15'),
(4, 12, '2023-10-05', '2023-10-15'),
(5, 12, '2023-11-06', '2023-11-15'),
(1, 15, '2023-12-07', '2023-12-15'),
(1, 589, '2023-04-08', '2023-04-15');

-- Insert data into the book_copies table
INSERT INTO book_copies (book_id, copy_status) VALUES
(1, 'Available'),
(1, 'Checked Out'),
(2, 'Available'),
(3, 'Available'),
(3, 'Checked Out'),
(4, 'Available'),
(4, 'Checked Out'),
(7, 'Available'),
(8, 'Available'),
(8, 'Checked Out'),
(9, 'Available'),
(10, 'Available'),
(11, 'Available'),
(11, 'Checked Out'),
(12, 'Available'),
(13, 'Available'),
(14, 'Available'),
(15, 'Available'),
(16, 'Available'),
(16, 'Checked Out'),
(567, 'Available'),
(568, 'Available'),
(569, 'Available'),
(569, 'Checked Out'),
(570, 'Available'),
(571, 'Available'),
(572, 'Available'),
(573, 'Available'),
(574, 'Available'),
(575, 'Available'),
(576, 'Available'),
(576, 'Checked Out'),
(577, 'Available'),
(578, 'Available'),
(579, 'Available'),
(580, 'Available'),
(581, 'Available'),
(582, 'Available'),
(583, 'Available'),
(583, 'Checked Out'),
(584, 'Available'),
(585, 'Available'),
(586, 'Available'),
(586, 'Checked Out'),
(587, 'Available'),
(588, 'Available'),
(589, 'Available'),
(590, 'Available'),
(591, 'Available'),
(592, 'Available'),
(593, 'Available'),
(594, 'Available'),
(595, 'Available'),
(596, 'Available'),
(597, 'Available'),
(598, 'Available'),
(598, 'Checked Out'),
(599, 'Available'),
(600, 'Available'),
(601, 'Available'),
(602, 'Available'),
(603, 'Available'),
(604, 'Available'),
(605, 'Available'),
(606, 'Available'),
(607, 'Available'),
(608, 'Available'),
(609, 'Available'),
(610, 'Available'),
(611, 'Available');

-- Example SELECT statement
SELECT * FROM book_authors;

-- Update information for a book
UPDATE books
SET quantity = 18, publication_year = 2020
WHERE isbn = '9876543210';

-- Delete a book
DELETE FROM book_authors
WHERE book_id = 1;

-- Complex Query 1: List Books Checked Out by a Specific User
SELECT books.book_id, books.title, books.isbn, transactions.checkout_date, transactions.return_date
FROM transactions
JOIN books ON transactions.book_id = books.book_id
WHERE transactions.user_id = 1;

-- Complex Query 2: List Books with available copies
SELECT books.book_id, book_copies.copy_id, books.title, books.isbn
FROM books
LEFT JOIN book_copies ON books.book_id = book_copies.book_id
WHERE book_copies.copy_status = 'Available';

-- Complex Query 3: Find Users with Overdue Books
SELECT DISTINCT users.user_id, users.name
FROM users
JOIN transactions ON users.user_id = transactions.user_id
WHERE transactions.return_date is NULL;

-- Complex Query 4: List Top 5 Most Borrowed Books
SELECT books.title, COUNT(transactions.transaction_id) AS borrow_count
FROM books
LEFT JOIN transactions ON books.book_id = transactions.book_id
GROUP BY books.book_id
ORDER BY borrow_count DESC
LIMIT 5;

-- Complex Query 5: Find the total number of books checked out by each user
SELECT users.user_id, users.name, count(transactions.transaction_id) AS total_checked_out
FROM users
JOIN transactions ON users.user_id = transactions.user_id
WHERE transactions.return_date is not NULL
GROUP BY users.user_id;

-- View 1: View for Available Books
CREATE VIEW available_book_view AS
SELECT books.title, books.isbn, book_copies.copy_status
FROM books
LEFT JOIN book_copies ON books.book_id = book_copies.book_id
WHERE book_copies.copy_status = 'Available';

-- Select data from the new view
SELECT * FROM available_book_view;

-- View 2: View for Users with Overdue Books
CREATE VIEW overdue_user_view AS
SELECT DISTINCT users.user_id, users.name
FROM users
JOIN transactions ON users.user_id = transactions.user_id
WHERE transactions.return_date is NULL;

-- Select data from the new view
SELECT * FROM overdue_user_view;

-- View 3: View for Top Borrowed Books
CREATE VIEW top_borrowed_books_view AS
SELECT books.title, COUNT(transactions.transaction_id) AS borrow_count
FROM books
LEFT JOIN transactions ON books.book_id = transactions.book_id
GROUP BY books.book_id
ORDER BY borrow_count DESC
LIMIT 10;

-- Select data from the new view
SELECT * FROM top_borrowed_books_view;

-- View 4: View for Books Checked Out by a Specific User
CREATE VIEW users_checked_out_book_view AS
SELECT books.book_id, books.title, books.isbn, transactions.checkout_date, transactions.return_date
FROM transactions
JOIN books ON transactions.book_id = books.book_id
WHERE transactions.user_id = 1;

-- Select data from the new view
SELECT * FROM users_checked_out_book_view;


-- Example ROLLBACK 1 operation with savepoints

-- Start a transaction
START TRANSACTION;

-- Create a savepoint
SAVEPOINT SP1;

-- Update operation
UPDATE books
SET quantity = quantity - 1
WHERE book_id = 1;

-- Check the state after the update
SELECT * FROM books WHERE book_id = 1;

-- Rollback to the savepoint
ROLLBACK TO SP1;

-- Check the state after the rollback
SELECT * FROM books WHERE book_id = 1;

-- Commit the transaction
COMMIT;

-- Example ROLLBACK 2 operation with savepoints

-- Start a transaction
START TRANSACTION;

UPDATE books
SET quantity = quantity - 1
WHERE book_id = 1;

INSERT INTO books (title, author, isbn, quantity)
VALUES ('New Book', 'John Doe', '999888777', 5);

-- Check the state after the initial operations
SELECT * FROM books;

-- Create a savepoint
SAVEPOINT SP2;

-- Create an error condition on unique constraint violation on the ISBN column
INSERT INTO books (title, author, isbn, quantity)
VALUES ('Another Book', 'Jane Smith', '999888778', 3);

-- Check the state after the error
SELECT * FROM books;

-- Rollback to the savepoint to undo the last operation
ROLLBACK TO SP2;

-- Check the state after the rollback
SELECT * FROM books;
COMMIT;
