
/*==============================================================
 Author		: Hossam Mahmoud
 Purpose	: Create the HOSA_Telecom_ETL database
 Date			: 2025-08-11
 Notes		: 
			- Drops the database if it exists
			- Creates a fresh, empty database
==============================================================*/

-- Switch context to the 'master' database
-- (necessary because you cannot drop the database you're currently using)
USE master;
GO

-- Check if a database named 'HOSA_Telecom_ETL' already exists
-- If it exists, delete (drop) it
-- New Method
DROP DATABASE IF EXISTS HOSA_Telecom_ETL;
GO

-- Create a brand new empty database named 'HOSA_Telecom_ETL'
CREATE DATABASE HOSA_Telecom_ETL;
GO










/* OLD METHOD
IF EXISTS (
	SELECT	*
	FROM		sys.databases
	WHERE	name = 'HOSA_Telecom_ETL'
)
    -- If it exists, delete (drop) it
    DROP DATABASE HOSA_Telecom_ETL;
GO
*/
