USE ROLE useradmin;

CREATE USER IF NOT EXISTS transformer_arbetskollen
    PASSWORD = 'transformer_password123' 
    DEFAULT_WAREHOUSE = dev_wh    
    LOGIN_NAME='transformer_arbetskollen'
    DEFAULT_NAMESPACE='arbetskollen.warehouse'
    COMMENT = 'dbt user for transforming data'
    DEFAULT_ROLE = 'arbetskollen_dbt_role';

use role securityadmin;
GRANT ROLE arbetskollen_dbt_role TO USER transformer_arbetskollen;
GRANT ROLE arbetskollen_dbt_role TO USER simontroedsson;
GRANT ROLE arbetskollen_dbt_role TO USER herman;
GRANT ROLE arbetskollen_dbt_role TO USER lovisa;
GRANT ROLE arbetskollen_dbt_role TO USER gabriel;

GRANT ROLE arbetskollen_dlt_role TO ROLE arbetskollen_dbt_role;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA arbetskollen.warehouse TO ROLE arbetskollen_dbt_role;

-- grant CRUD and select tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA arbetskollen.warehouse TO ROLE arbetskollen_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA arbetskollen.warehouse TO ROLE arbetskollen_dbt_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA arbetskollen.warehouse TO ROLE arbetskollen_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA arbetskollen.warehouse TO ROLE arbetskollen_dbt_role;
USE ROLE arbetskollen_dbt_role;

use warehouse dev_wh;
SELECT * FROM arbetskollen.staging.data_field_job_ads LIMIT 10;

SHOW GRANTS ON SCHEMA arbetskollen.warehouse;