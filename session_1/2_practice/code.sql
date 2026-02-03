-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit

1. **List all loans**  
Show book title, member name, and loan date.
-- write your sql code here
SELECT Books.title, Members.name, Loans.loan_date
FROM Loans 
JOIN Books ON Books.id = loans.book_id
JOIN Members ON loans.member_id = members.id

2. **Books and loans**  
List all books and any loans associated with them.
SELECT Books.title, Loans.id
FROM Books
LEFT JOIN Loans ON Books.id = loans.book_id

3. **Branches and books**  
List all library branches and the books they hold.
SELECT LibraryBranch.name, Books.title
FROM LibraryBranch
JOIN Books ON Books.branch_id = LibraryBranch.id

4. **Branch book counts**  
Show each library branch and the number of books it holds.
SELECT LibraryBranch.name, SUM(Books.title) AS TotalNumberOfBooks
FROM LibraryBranch
LEFT JOIN Books ON Books.branch_id = LibraryBranch.id
GROUP BY name
GROUP BY TotalNumberOfBooks ASC

5. **Branches with more than 7 books**  
Show branches that hold more than 7 books.
SELECT LibraryBranch.name, SUM(Books.title) AS TotalNumberOfBooks
HAVING TotalNumberOfBooks > 7
FROM LibraryBranch
LEFT JOIN Books ON Books.id = LibraryBranch.id
GROUP BY name

6. **Members and loans**  
List all members and the number of loans they have made.
SELECT Members.name, SUM(Loans) AS TotalNumberOfLoans
FROM Members
LEFT JOIN Loans ON Members.id = Loans.id
GROUP BY name

7. **Members who never borrowed**  
Identify members who have never borrowed a book
SELECT Members.name, SUM(Loans) AS TotalNumberOfLoans
WHERE TotalNumberOfLoans = 0
FROM Members
LEFT JOIN Loans ON Members.id = Loans.id
GROUP BY name

8. **Branch loan totals**  
For each library branch, show the total number of loans for books in that branch.
SELECT LibraryBranch.name, SUM(Loans) AS TotalNumberOfLoans
FROM LibraryBranch
LEFT JOIN Books ON Books.id = LibraryBranch.id
LEFT JOIN Loans ON Books.id = Loans.book_id
GROUP BY name

9. **Members with active loans**  
List members who currently have at least one active loan.
SELECT Members.name, SUM(Loans) AS TotalNumberOfLoans
WHERE TotalNumberOfLoans > 0
FROM Members
LEFT JOIN Loans ON Members.id = Loans.id
GROUP BY name

10. **Books and loans report**  
Show all books and all loans, 
including books that were never loaned. 
Include a column classifying each row as 
“Loaned book” or “Unloaned book.”. 
You will need to look up how to do this 
(hint: a case statement would work). -->

SELECT Books.name, Loans.id
WHERE TotalNumberOfLoans > 0
FROM Members
LEFT JOIN Loans ON Members.id = Loans.id
GROUP BY name

