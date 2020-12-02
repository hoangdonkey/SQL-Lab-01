USE master
GO

IF (DB_ID('EXAMPLE4') IS NOT NULL)
	DROP DATABASE EXAMPLE4


CREATE DATABASE EXAMPLE4
ON PRIMARY
(	NAME=N'Customer_DB',
	FILENAME=N'D:\Aptech 1st semester\Database\SQL\SQL-Lab-01\WHERE\Example4.mdf')
LOG ON
(	NAME=N'Customer_DB_log',
	FILENAME='D:\Aptech 1st semester\Database\SQL\SQL-Lab-01\WHERE\Example4_log.ldf')
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

USE EXAMPLE4
GO
ALTER DATABASE Example4 MODIFY NAME = Example4Test
GO

USE Example4Test
GO
EXECUTE  sp_changedbowner @loginame='sa'
EXEC sp_changedbowner 'sa'
GO

USE Example4Test
GO
ALTER DATABASE Example4Test SET AUTO_SHRINK ON
GO

USE master
GO

IF(DB_ID('Example4') IS NOT NULL)
	DROP DATABASE Example4
GO

CREATE DATABASE Example4
ON PRIMARY
(	NAME='Example4_Primary',
	FILENAME='D:\Aptech 1st semester\Database\SQL\SQL-Lab-01\WHERE\Example4.mdf',
	SIZE=4MB,
	MAXSIZE=10MB,
	FILEGROWTH=1MB),
FILEGROUP Example4_FG1
(	NAME='Example4_FG1_Dat1',
	FILENAME='D:\Aptech 1st semester\Database\SQL\SQL-Lab-01\WHERE\Example4_FG1_1.ndf',
	SIZE=1MB,
	MAXSIZE=10MB,
	FILEGROWTH=1MB),
(	NAME='Example4_FG1_Dat2',
	FILENAME='D:\Aptech 1st semester\Database\SQL\SQL-Lab-01\WHERE\Example4_FG1_2.ndf',
	SIZE=1MB,
	MAXSIZE=10MB,
	FILEGROWTH=1MB)
