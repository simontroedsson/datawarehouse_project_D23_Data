--DLT role
CREATE ROLE IF NOT EXISTS arbetskollen_dlt_role;
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE arbetskollen_dlt_role;
GRANT USAGE ON DATABASE arbetskollen TO ROLE arbetskollen_dlt_role;
GRANT USAGE ON SCHEMA staging TO ROLE arbetskollen_dlt_role;
GRANT CREATE TABLE ON SCHEMA staging TO ROLE arbetskollen_dlt_role;
GRANT SELECT, INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA staging TO ROLE arbetskollen_dlt_role;
GRANT SELECT, INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA staging TO ROLE arbetskollen_dlt_role;

-- check grants
SHOW GRANTS ON SCHEMA staging;
SHOW FUTURE GRANTS IN SCHEMA staging;

SHOW GRANTS TO ROLE arbetskollen_dlt_role;

SHOW GRANTS TO USER herman;

GRANT ROLE arbetskollen_dbt_role TO USER ;
-----------------------------------------------------------------------------