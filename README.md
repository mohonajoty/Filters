# Filters
#  Library Query Lab (CSE210)

## Project Overview

This project presents a **Library Management Database System** developed using SQL. It demonstrates how to design a relational database, enforce data integrity using constraints, and perform data analysis through various SQL queries. The system models real-world relationships between members and books.

##  Objectives

* Design a relational database structure
* Apply constraints to maintain data accuracy
* Insert and manage data efficiently
* Perform filtering, sorting, and analysis using SQL
* Understand practical database operations

## Database Details

* Database Name: `library_query_lab`
* DBMS Used: MySQL

##  Tables Description

###  MEMBER

This table stores information about library members.
Each member has a unique ID, name, email, age, and phone number.
The system ensures that:

* Email must be unique
* Age cannot be less than 12
* Phone defaults to 'N/A' if not provided

### BOOK

This table contains all book-related information.
Each book has a unique ID, title, ISBN, price, and availability status.
The system ensures that:

* ISBN is unique
* Price cannot be negative
* Availability is either 'AVAILABLE' or 'BORROWED'

###  BORROW

This table records borrowing transactions.
It connects members and books using their IDs.
Each record includes:

* Which member borrowed
* Which book was borrowed
* The date of borrowing
* 
##  Relationships

* A single member can borrow multiple books
* A single book can be borrowed multiple times
* The BORROW table connects MEMBER and BOOK

##  Sample Data

* 8 Members
* 8 Books
* 10 Borrow Records


##  SQL Features Used

* Primary Key and Foreign Key
* Unique and Check constraints
* Default values and ENUM
* WHERE, LIKE, BETWEEN, IN conditions
* ORDER BY and LIMIT
* COUNT, AVG, MIN, MAX functions
* GROUP BY and DISTINCT


##  Query Highlights

###  Data Retrieval

All records from MEMBER, BOOK, and BORROW are displayed.

###  Filtering

Queries are used to:

* Find members based on age
* Search books within price ranges
* Match names and titles using patterns
* Apply conditions using IN, BETWEEN, and NOT

###  Sorting

Books are sorted to find:

* Most expensive books
* Cheapest books

###  Analysis

The system calculates:

* Total number of members, books, and borrow records
* Average, minimum, and maximum book prices
* Number of books by availability
* Number of times each member borrowed books

