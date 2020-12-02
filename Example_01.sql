--Su dung co so du lieu dung USE <ten>
USE AdventureWorks2019
SELECT * FROM HumanResources.Employee
GO
--Khai bao bien cuc bo deptID kieu int
DECLARE @deptID INT

--Dung SET hoac SELECT de gan gia tri cho bien
SELECT @deptID = 1
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID = @deptID
GO

SELECT @@LANGUAGE --Tra lai thong tin bien toan cuc @@LANGUAGE (bien toan cuc la bien co san trong database va bat dau bang @@)
SELECT @@VERSION --Tra lai thong tin bien toan cuc @@VERSION

--Cac ham trong ngon ngu Transact-SQL
SELECT SUM(StandardCost) FROM Production.ProductCostHistory --Lay ra Standardcost trong bang ProductCostHistory

SELECT AVG(StandardCost) FROM Production.ProductCostHistory --Lay ra gia tri trung binh cua truong StandardCost trong ban ProductCostHistory

SELECT MAX(StandardCost) FROM Production.ProductCostHistory

SELECT COUNT(*) FROM Production.ProductPhoto

SELECT GETDATE()

SELECT DATEPART(hh,GETDATE())

SELECT CONVERT(varchar(50),GETDATE(),103)

SELECT DB_ID('AdventureWorks2019')

--Tao co so du lieu
CREATE DATABASE EXAMPLE
USE EXAMPLE

--Tao bang trong co so du lieu
CREATE TABLE Contacts
(MailID VARCHAR(20),
Name NTEXT,
TelephoneNumber INT)

--Them 1 cot vao bang da co
ALTER TABLE Contacts ADD Address NVARCHAR(50)

--Them du lieu vao bang Contacts
INSERT INTO Contacts values ('abc@yahoo.com','Nguyen Van A',9893245,'Ha Noi')
INSERT INTO Contacts values ('ngthib@gmail.com','Nguyen Thi B',8759385,'Ha Noi')
INSERT INTO Contacts values ('tranc@yahoo.com','Tran Van C',7236258,'Ha Noi')
INSERT INTO Contacts values ('trinhvand@gmail.com','Trinh Van D',5463245,'Ha Noi')

SELECT * FROM Contacts

--Xoa ban ghi
DELETE FROM Contacts WHERE MailID='tranc@yahoo.com'

UPDATE Contacts SET Name=N'Trinh Hoang Long' WHERE MailID='trinhvand@gmail.com'

--Tao Login account de test GRANT
CREATE LOGIN example WITH PASSWORD='123456'

--Tao user tu Login vua tao
CREATE USER example FROM LOGIN example

--Huy bo tat ca cac quyen cua user example tren bang contact
REVOKE ALL ON Contacts FROM example

--Gan lai quyen cho user example
GRANT SELECT ON Contacts TO example