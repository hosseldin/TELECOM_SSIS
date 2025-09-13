
/*==============================================================
 Author		: Hossam Mahmoud
 Purpose	: Create the HM_STAG_ETL_DB database
 Date			: 2025-08-11
 Notes		: 
			- Drops the database if it exists
			- Creates a fresh, empty database
==============================================================*/

-- Switch context to the 'master' database
-- (necessary because you cannot drop the database you're currently using)
USE master;
GO

-- Check if a database named 'HM_STAG_ETL_DB' already exists
-- If it exists, delete (drop) it
-- New Method
DROP DATABASE IF EXISTS HM_STAG_ETL_DB;
GO

-- Create a brand new empty database named 'HM_STAG_ETL_DB'
CREATE DATABASE HM_STAG_ETL_DB;
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
