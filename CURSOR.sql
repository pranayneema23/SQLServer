--Cursor - db object which is used to retrieve data from a result set one row at a time
--A SQL cursor is used when the data needs to be updated row by row.
/* LifeCycle of cursor
	1.Declaring Cursor
	2.Openeing Cursor
	3.Fetching Cursor
	4.Closing Cursor
	5.Dellocating Cursor
*/
--Limitation - occupies memory from your system that may be available for other processes.

DECLARE @brand_id INT;
DECLARE @brand_name VARCHAR(10);

PRINT '-------- BRAND DETAILS --------';    

DECLARE get_brand_detail CURSOR FOR
SELECT brand_id,brand_name FROM production.brands;

OPEN get_brand_detail

FETCH NEXT FROM get_brand_detail
INTO @brand_id,@brand_name

PRINT 'Brand ID       Brand Name'

WHILE @@FETCH_STATUS =0 
BEGIN
	PRINT '   ' + CAST(@brand_id AS VARCHAR(5)) + '		    ' + @brand_name;

	FETCH NEXT FROM get_brand_detail
		INTO @brand_id,@brand_name
END

CLOSE get_brand_detail;
DEALLOCATE get_brand_detail;