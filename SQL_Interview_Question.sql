SELECT @@version;
SELECT * FROM sys.objects WHERE type = 'U';
SELECT * FROM INFORMATION_SCHEMA.TABLES;
---------Create new DB-----------
CREATE DATABASE BikeStores;
---------Create new DB-----------
CREATE DATABASE PracticeDB;
USE PracticeDB;
------Create table Stock---------
DROP TABLE Stock;
CREATE TABLE Stock(
ID SMALLINT,
Rate MONEY CONSTRAINT notnull_rate NOT NULL,
Stock_Name NVARCHAR(50) CONSTRAINT unique_stock_name UNIQUE,
Stock_Agent NVARCHAR(50),
Create_Date DATETIME CONSTRAINT default_create_date DEFAULT(GETDATE()),
Expiry_Date DATETIME
);
-----Alter table ---------------
ALTER TABLE Stock 
ADD CONSTRAINT check_rate CHECK(Rate > 500);
ALTER TABLE Stock 
ADD CONSTRAINT default_expiry_date DEFAULT(GETDATE()) FOR[Expiry_Date];
ALTER TABLE Stock 
ADD CONSTRAINT unique_stock_agent UNIQUE(Stock_Agent);
ALTER TABLE Stock 
ALTER COLUMN ID SMALLINT NOT NULL; 
ALTER TABLE Stock 
ADD CONSTRAINT pk_ID PRIMARY KEY (ID);

SELECT * FROM sys.all_objects WHERE type = 'p'object_id = -571204656;
SELECT * FROM sys.server_principals;
SELECT * FROM sys.sql_logins;
SELECT * FROM sys.sysindexes;
sp_lock;
SELECT @@SPID;
SELECT * FROM sys.sql_modules;
SELECT SUBSTRING('pranay',1,3); --pra
SELECT CHARINDEX('a','pranay') --3
SELECT SYSDATETIME(); --till ns
SELECT GETDATE(); --till ms
SELECT FLOOR(-10.5);
SELECT SIGN(-10);
SELECT COALESCE(NULL , 'Hey', NULL,'there!!');--First not null value
SELECT NULLIF(10,10) Result;

CREATE SCHEMA schema_name
    [AUTHORIZATION owner_name]
