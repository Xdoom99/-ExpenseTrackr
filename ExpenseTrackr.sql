-- Create Expense Tracker Database

CREATE DATABASE ExpenseTracker;
USE ExpenseTracker;

-- Create Tables

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE Expenses (
    ExpenseID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10, 2) NOT NULL,
    Description VARCHAR(255),
    CategoryID INT,
    ExpenseDate DATE NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Insert Sample Data

INSERT INTO Categories (CategoryName) VALUES ('Food');
INSERT INTO Categories (CategoryName) VALUES ('Transportation');
INSERT INTO Categories (CategoryName) VALUES ('Entertainment');

INSERT INTO Expenses (Amount, Description, CategoryID, ExpenseDate) VALUES (20.50, 'Lunch', 1, '2024-01-30');
INSERT INTO Expenses (Amount, Description, CategoryID, ExpenseDate) VALUES (30.00, 'Gas', 2, '2024-01-30');
INSERT INTO Expenses (Amount, Description, CategoryID, ExpenseDate) VALUES (15.00, 'Movie', 3, '2024-01-29');
INSERT INTO Expenses (Amount, Description, CategoryID, ExpenseDate) VALUES (25.00, 'Groceries', 1, '2024-01-28');

-- Query to Retrieve Expenses

SELECT
    Expenses.ExpenseID,
    Expenses.Amount,
    Expenses.Description,
    Categories.CategoryName,
    Expenses.ExpenseDate
FROM Expenses
JOIN Categories ON Expenses.CategoryID = Categories.CategoryID;