
/*==============================================================
 Author		: Hossam Mahmoud
 Purpose	: Create the fact transaction table
 Date			: 2025-08-11
 Notes		: 
			- Drops the table if it exists
			- Creates a table as required
==============================================================*/

-- Switch context to the target database
USE HOSA_Telecom_ETL;
GO

-- If the table already exists, drop it (modern syntax SQL Server 2016+)
DROP TABLE IF EXISTS fact_transaction;
GO

-- Create the fact_transaction table
CREATE TABLE fact_transaction (
    -- Surrogate key: unique identifier for each record (auto-incrementing)
    id INT NOT NULL IDENTITY (1,1),
    
    -- Natural/business keys coming from the source system (CSV / source DB)
    transaction_id INT NOT NULL,		-- Transaction ID from the source system/file
    imsi VARCHAR(9) NOT NULL,		-- IMSI = International Mobile Subscriber Identity
    subscriber_id INT,							-- Reference to subscriber dimension
    tac VARCHAR(8) NOT NULL,		-- TAC = Type Allocation Code (first 8 digits of IMEI)
    snr VARCHAR(6) NOT NULL,			-- SNR = Serial Number (last 6 digits of IMEI)
    imei VARCHAR(14) NULL,				-- Full IMEI (optional, may not always be present)
    cell INT NOT NULL,							-- Cell tower ID (location where transaction occurred)
    lac INT NOT NULL,							-- Location Area Code
    
    -- Event details
    event_type VARCHAR(2) NULL,			-- Event type code (e.g., call, SMS, data)
    event_ts DATETIME NOT NULL,			-- Timestamp of the event
    
    -- Audit / ETL control column
    audit_id INT NOT NULL DEFAULT (-1),	-- Audit key for ETL tracking (default -1)
    
    -- Primary key constraint on the surrogate key
    CONSTRAINT pk_fact_transaction_id PRIMARY KEY (id)
);
GO










/*
IF EXISTS (
	SELECT *
	FROM		sys.tables
	WHERE	name	= 'fact_transaction'
	AND		type	= 'U'
)
DROP TABLE fact_transaction
GO
*/


/*
ALTER TABLE fact_transaction
	ADD CONSTRAINT pk_fact_transaction_id primary key (id) 
GO
*/

/*
alter table fact_transaction
	ADD CONSTRAINT fk_fact_transaction_dim_audit foreign  key (audit_id) references dim_audit(id)
GO
*/

/*
IF EXISTS (
	SELECT *
	FROM   sys.foreign_keys
	WHERE  NAME = 'fk_fact_transaction_dim_audit'
                  AND parent_object_id = Object_id('fact_transaction')
	)
ALTER TABLE fact_transaction
    DROP CONSTRAINT fk_fact_transaction_dim_audit;
*/