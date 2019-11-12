/*
-> Trigger - Special kind of SP utomatically fired or executed when some
event (insert, delete and update) occurs. 
-> Create table like INSERTED, DELETED in memory.
-> Types of trigger
	-DDL Trigger
	-DML Trigger
			-After Trigger 
			-Instead of Trigger -Approvel then insert like example
	-Logon Trigger
	-

*/

USE BikeStores;
SELECT * FROM INFORMATION_SCHEMA.TABLES;
SELECT * FROM production.categories;
CREATE TABLE production.categories_audit
(
Category_Id INT,
Category_Name VARCHAR(50),
Audit_TimeStamp DATETIME,
Audit_Action VARCHAR(100)
);

CREATE TRIGGER trgAfterInsertInCategTBl ON [production].[categories] AFTER INSERT
AS BEGIN
DECLARE @category_id INT;
DECLARE @category_name VARCHAR(50);
SELECT @category_id = i.Category_Id FROM INSERTED i;
SELECT @category_name = i.Category_Name FROM inserted i;
INSERT INTO [production].[categories_audit] VALUES(@category_id,@category_name,GETDATE(),'Inserted Record -- After Insert Trigger.');
PRINT 'AFTER INSERT trigger fired.'  
END

CREATE TRIGGER trgAfterDeleteCategTBl ON [production].[categories] AFTER DELETE
AS BEGIN
DECLARE @category_id INT;
DECLARE @category_name VARCHAR(50);
SELECT @category_id = i.Category_Id FROM deleted i;
SELECT @category_name = i.Category_Name FROM deleted i;
INSERT INTO [production].[categories_audit] VALUES(@category_id,@category_name,GETDATE(),'Deleted Record -- After Delete Trigger.');
PRINT 'AFTER DELETE trigger fired.'  
END

INSERT INTO [production].[categories] VALUES(52);
SELECT * FROM [production].[categories_audit];
SELECT * FROM production.categories;
DELETE FROM [production].[categories] WHERE category_id = 8 OR category_id = 9;