
/*==============================================================
 Author		: Hossam Mahmoud
 Purpose	: Creates an error table
 Date			: 2025-08-11
 Notes		: 
			- Redirects rejected records into this table
==============================================================*/

-- Switch context to the target database
use HM_STAG_ETL_DB
go

CREATE TABLE err_destination_output (
    [id] int,
    [imsi] varchar(9),
    [imei] varchar(14),
    [cell] int,
    [lac] int,
    [event_type] varchar(2),
    [event_ts] datetime,
    [tac] varchar(8),
    [snr] varchar(6),
    [ErrorCode] int,
    [ErrorColumn] int
)
GO

alter table err_destination_output add audit_id int;