
/*==============================================================
 Author		: Hossam Mahmoud
 Purpose	: Create error for source output table
 Date			: 2025-08-11
 Notes		: 
			- Drops the table if it exists
			- Creates a table as required
==============================================================*/

-- Switch context to the target database
USE HM_STAG_ETL_DB;
GO

CREATE TABLE err_source_output (
	id int identity(1,1),
    [Flat File Source Error Output Column] varchar(max),
    [ErrorCode] int,
    [ErrorColumn] int
)
go

alter table err_source_output add audit_id int;