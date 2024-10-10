CREATE DATABASE LIBRARY_MANAGEMENT;
USE LIBRARY_MANAGEMENT;

-- 1. Table Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no 
CREATE TABLE Branch
(
Branch_no VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10),
Branch_address VARCHAR(30),
Contact_no VARCHAR(15)
);
DESC branch;
INSERT INTO branch VALUES
('B001', 'M101', '123 Palakkad', '+919099988676'),
('B002', 'M102', '456 Eranakulam', '+919099988677'),
('B003', 'M103', '789 Kottayam', '+919099988678'),
('B004', 'M104', '567 Calicut', '+919099988679'),
('B005', 'M105', '890 Trivandrum', '+919099988680');
SELECT * FROM branch;

-- 2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch
CREATE TABLE Employee (
    Emp_ID varchar(10) PRIMARY KEY,
    Emp_name Varchar(30),
    Emp_Position VARCHAR(20),
    Salary Decimal(10,2),
    branch_number varchar(10),
	foreign key(branch_number) references branch(branch_no) on delete cascade);
    desc employee;
    
INSERT INTO employee VALUES
('E101', 'John', 'Manager', 60000.00,'B001'),
('E102', 'Anu', 'Clerk', 45000.00,'B003'),
('E103', 'James', 'Librarian', 55000.00,'B002'),
('E104', 'Eva', 'Assistant', 40000.00,'B001'),
('E105', 'Sarah', 'Assistant', 42000.00,'B004'),
('E106', 'Rakesh', 'Assistant', 43000.00,'B005'),
('E107', 'Manu', 'Manager', 62000.00,'B002'),
('E108', 'Rahul', 'Clerk', 46000.00,'B001'),
('E109', 'Devika', 'Librarian', 57000.00,'B003'),
('E110', 'Nithya', 'Assistant', 41000.00,'B005'),
('E111', 'Divya', 'Manager', 65000.00,'B004');
INSERT INTO employee VALUES
('E112', 'Jacob', 'clerk', 30000.00,'B001'),
('E113', 'Ram', 'Trainee', 10000.00,'B001'),
('E114', 'Raj', 'clerk', 30000.00,'B001');
SELECT * FROM EMPLOYEE;

-- 3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher 

CREATE TABLE Books
(
ISBN VARCHAR(25) PRIMARY KEY,
Book_title VARCHAR(80),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status ENUM('Yes','No'),
Author VARCHAR(30),
Publisher VARCHAR(30)
);
DESC Books;

INSERT INTO books VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'no', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', "Harry Potter and the Sorcerer's Stone", 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', "A People's History of the United States", 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'no', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'yes', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'yes', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'no', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'yes', 'Charles C. Mann', 'Vintage Books');
SELECT * FROM BOOKS;

-- 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date

CREATE TABLE Customer
(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);
DESC customer;
INSERT INTO customer VALUES
('C101', 'Alice', '123 Palakkad', '2023-05-15'),
('C102', 'Bob', '456 Eranakulam', '2022-06-20'),
('C103', 'Chandni', '789 Kottayam', '2024-07-10'),
('C104', 'Dev', '567 Calicut', '2024-08-05'),
('C105', 'Eve', '890 Trivandrum', '2023-09-25'),
('C106', 'Franklin', '456 Eranakulam', '2022-10-15'),
('C107', 'Grace', '789 Kottayam', '2021-11-20'),
('C108', 'Henry', '567 Calicut', '2023-12-10'),
('C109', 'shani', '123 Palakkad','2022-01-05'),
('C110', 'Jack', '890 Trivandrum', '2024-02-25');
SELECT * FROM customer;

/* 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book – 
Set as FOREIGN KEY and it should refer isbn in BOOKS table */

CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(80),
Issue_date DATE,
Isbn_book VARCHAR(25),
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id) on DELETE CASCADE,
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN) on DELETE CASCADE
);
DESC issuestatus;

INSERT INTO IssueStatus VALUES
('IS101', 'C101', 'The Catcher in the Rye', '2023-05-01', '978-0-553-29698-2'),
('IS102', 'C102', 'The Da Vinci Code', '2023-05-02', '978-0-7432-4722-4'),
('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', '2023-05-03', '978-0-7432-7357-1'),
('IS104', 'C104', 'Sapiens: A Brief History of Humankind', '2023-05-04', '978-0-307-58837-1'),
('IS105', 'C105', 'The Diary of a Young Girl', '2023-05-05', '978-0-375-41398-8'),
('IS106', 'C106', 'The Histories', '2023-06-01', '978-0-14-044930-3');
SELECT * FROM ISSUESTATUS;

-- 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS 

CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(80),
Return_date DATE,
isbn_book2 VARCHAR(25),
FOREIGN KEY (isbn_book2) REFERENCES books(ISBN) on DELETE CASCADE
);
DESC returnstatus;

INSERT INTO ReturnStatus VALUES
('RS101', 'C101', 'The Catcher in the Rye', '2023-06-06', '978-0-553-29698-2'),
('RS102', 'C102', 'The Da Vinci Code', '2023-06-07', '978-0-7432-4722-4'),
('RS103', 'C105', 'The Diary of a Young Girl', '2023-06-08', '978-0-375-41398-8'),
('RS104', 'C108', 'The Histories', '2023-06-09', '978-0-14-044930-3'),
('RS105', 'C110', 'A Game of Thrones', '2023-06-10', '978-0-09-957807-9');
SELECT * FROM returnstatus;

# 1. Retrieve the book title, category, and rental price of all available books.
SELECT book_title, category, rental_price FROM books WHERE Status = 'Yes';

#2. List the employee names and their respective salaries in descending order of salary. 
SELECT emp_name, salary FROM employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT 
    issuestatus.Issued_book_name, customer.Customer_name
FROM
    issuestatus
        INNER JOIN
    customer ON issuestatus.Issued_cust = customer.Customer_Id;
    
# 4. Display the total count of books in each category.
SELECT Category, COUNT(Book_title) as count FROM books GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_name as Employee_name, emp_position as position  from employee where salary>50000;

# 6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT customer_name FROM customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM issuestatus);

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_number, COUNT(emp_id) as Count FROM employee GROUP BY branch_number;

# 8.Display the names of customers who have issued books in the month of June 2023
SELECT customer.Customer_name as Customer_Name FROM customer INNER JOIN issuestatus ON 
customer.Customer_Id = issuestatus.Issued_cust WHERE issuestatus.Issue_date >= '2023-06-01' AND 
issuestatus.Issue_date <= '2023-06-30';

# 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM books WHERE Category = 'history';

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT branch_number, COUNT(emp_id) as count  FROM employee GROUP BY branch_number HAVING COUNT(Emp_id) > 5;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses.
Select E.Emp_name , b.Branch_Address from employee E 
inner join  branch b
on e.branch_number = b.branch_no and emp_position = 'Manager';


UPDATE books SET Rental_price = 30 WHERE isbn in ('978-0-307-58837-1','978-0-141-44171-6','978-0-7432-7357-1');

# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
Select C.Customer_Name, b.Rental_Price   from customer c 
 join  issuestatus i
on c.Customer_id = I.issued_cust 
join  books b on I.isbn_book= b.isbn and b.rental_price>25;

