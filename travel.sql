
MySQL Travel Database Project
1. Database Initialization and Table Creation
SQL

-- Creating the travel database
CREATE DATABASE IF NOT EXISTS travel;
USE travel;

-- Creating the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(200) NOT NULL,
    age INT,
    booking_date DATE,
    destination VARCHAR(50)
);
2. Inserting Records into Users
SQL

INSERT INTO users (name, email, phone, address, age, booking_date, destination)
VALUES
('Asha', 'asha@gmail.com', '9876543210', 'Hyderabad, Telangana', 25, '2026-02-06', 'Dubai'),
('Ravi', 'ravi@gmail.com', '9123456780', 'Delhi, India', 45, '2026-02-10', 'Singapore'),
('Meena', 'meena@gmail.com', '9988776655', 'Mumbai, Maharashtra', 34, '2026-02-15', 'Thailand'),
('Kiran', 'kiran@gmail.com', '9000011111', 'Goa, India', 30, '2026-02-20', 'Malaysia');

-- Executed Table:
+---------+-------+-----------------+------------+----------------------+------+--------------+-------------+
| user_id | name  | email           | phone      | address              | age  | booking_date | destination |
+---------+-------+-----------------+------------+----------------------+------+--------------+-------------+
|       1 | Asha  | asha@gmail.com  | 9876543210 | Hyderabad, Telangana |   25 | 2026-02-06   | Dubai       |
|       2 | Ravi  | ravi@gmail.com  | 9123456780 | Delhi, India         |   45 | 2026-02-10   | Singapore   |
|       3 | Meena | meena@gmail.com | 9988776655 | Mumbai, Maharashtra  |   34 | 2026-02-15   | Thailand    |
|       4 | Kiran | kiran@gmail.com | 9000011111 | Goa, India           |   30 | 2026-02-20   | Malaysia    |
+---------+-------+-----------------+------------+----------------------+------+--------------+-------------+
3. Updating Records (Data Modification)
SQL

-- Updating Address for a specific user
UPDATE users SET address = 'Kolkata' WHERE user_id = 2;

-- Executed Table (Partial):
+---------+------+---------+
| user_id | name | address |
+---------+------+---------+
|       2 | Ravi | Kolkata |
+---------+------+---------+
4. Creating and Populating the Bookings Table (Foreign Key Relationship)
SQL

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    destination VARCHAR(50),
    booking_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO bookings VALUES
(1, 1, 'Dubai', '2026-02-06'),
(2, 2, 'Singapore', '2026-02-10'),
(3, 3, 'Thailand', '2026-02-15'),
(4, 4, 'Malaysia', '2026-02-20');
5. Performing Table Joins (Inner Join)
SQL

SELECT users.user_id, users.name, bookings.destination, bookings.booking_date
FROM users
INNER JOIN bookings ON users.user_id = bookings.user_id;

-- Executed Table:
+---------+-------+-------------+--------------+
| user_id | name  | destination | booking_date |
+---------+-------+-------------+--------------+
|       1 | Asha  | Dubai       | 2026-02-06   |
|       2 | Ravi  | Singapore   | 2026-02-10   |
|       3 | Meena | Thailand    | 2026-02-15   |
|       4 | Kiran | Malaysia    | 2026-02-20   |
+---------+-------+-------------+--------------+
6. Aggregate Functions (Analysis)
SQL

SELECT 
    COUNT(*) AS total_users, 
    SUM(age) AS total_age, 
    AVG(age) AS avg_age, 
    MAX(age) AS max_age, 
    MIN(age) AS min_age 
FROM users;

-- Executed Table:
+-------------+-----------+---------+---------+---------+
| total_users | total_age | avg_age | max_age | min_age |
+-------------+-----------+---------+---------+---------+
|           4 |       134 | 33.5000 |      45 |      25 |
+-------------+-----------+---------+---------+---------+
7. Sorting and Filtering Data (Order By & Limit)
SQL

-- Sorting users by age in descending order and limiting to top 2
SELECT * FROM users
ORDER BY age DESC
LIMIT 2;

-- Executed Table:
+---------+-------+-----------------+------------+---------------------+------+--------------+-------------+
| user_id | name  | email           | phone      | address             | age  | booking_date | destination |
+---------+-------+-----------------+------------+---------------------+------+--------------+-------------+
|       2 | Ravi  | ravi@gmail.com  | 9123456780 | Kolkata             |   45 | 2026-02-10   | Singapore   |
|       3 | Meena | meena@gmail.com | 9988776655 | Mumbai, Maharashtra |   34 | 2026-02-15   | Thailand    |
+---------+-------+-----------------+------------+---------------------+------+--------------+-------------+
8. Grouping and Having Clauses
SQL

-- Grouping by destination to count travelers
SELECT destination, COUNT(*) AS total_users
FROM users
GROUP BY destination
ORDER BY total_users DESC;

-- Executed Table:
+-------------+-------------+
| destination | total_users |
+-------------+-------------+
| Dubai       |           1 |
| Singapore   |           1 |
| Thailand    |           1 |
| Malaysia    |           1 |
+-------------+-------------+