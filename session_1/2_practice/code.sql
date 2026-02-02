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
LEFT JOIN Loans ON Books.id = loans.book_id
LEFT JOIN Members ON loans.member_id = members.id
