# Library Database System

This repository contains a SQL script for setting up a database for a library system. The database is designed to manage books, authors, users (patrons), transactions (checkouts and returns), and other essential library operations. The script includes the structure for tables, relationships, and sample data to illustrate the usage of the database.

## Features

- **Database Setup**: A `library_db` database is created with various tables to store information about books, authors, publishers, users, and transactions.
- **Tables**:
    - **books**: Stores information about the books available in the library.
    - **authors**: Stores information about authors.
    - **publishers**: Stores information about publishers.
    - **users**: Stores information about library users/patrons.
    - **transactions**: Tracks the checkout and return dates of books.
    - **book_authors**: Links books to their respective authors.
    - **book_copies**: Tracks the availability of individual copies of books.
- **Relationships**: Foreign keys are used to link tables, ensuring referential integrity.
- **Data**: Sample data for authors, publishers, books, users, transactions, and book copies is included.
- **Complex Queries**: Includes several SQL queries to retrieve data based on specific criteria (e.g., books checked out by a user, top borrowed books, overdue users).
- **Views**: Predefined views to simplify queries like available books and overdue users.
- **Transactions and Rollback**: Examples of using transactions, including savepoints, to manage changes in the database.

## Installation

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/NavyaNayak18/Library-Database.git
    ```

2. Open your MySQL client (or any SQL tool that supports MySQL) and execute the SQL script inside `Library_db.sql` to create the database and tables with the sample data.

3. Ensure that the database is created correctly by running:

    ```sql
    USE library_db;
    SHOW TABLES;
    ```

## Tables Overview

- **books**: Contains information about books such as `book_id`, `title`, `author`, `isbn`, `quantity`, `publisher_id`, and `publication_year.
- **authors**: Stores author information, with fields like `author_id` and `author_name`.
- **publishers**: Contains details about publishers, with `publisher_id` and `publisher_name`.
- **users**: Includes details about library patrons, such as `user_id`, `name`, `email`, `phone_number`, and `address`.
- **transactions**: Stores book checkout and return details for users, with fields like `transaction_id`, `user_id`, `book_id`, `checkout_date`, and `return_date`.
- **book_authors**: Links books to authors in a many-to-many relationship using `book_id` and `author_id`.
- **book_copies**: Tracks the status (`Available`, `Checked Out`, `On Hold`) of individual copies of books.
