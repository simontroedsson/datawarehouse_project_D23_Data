USE ROLE SYSADMIN;

USE DATABASE arbetskollen;

CREATE SCHEMA IF NOT EXISTS warehouse;

SHOW SCHEMAS IN DATABASE arbetskollen;

USE ROLE securityadmin;

GRANT ROLE arbetskollen_dlt_role TO ROLE arbetskollen_dbt_role;

SHOW GRANTS TO ROLE arbetskollen_dbt_role;

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
SHOW GRANTS ON SCHEMA arbetskollen.warehouse;

--test
USE SCHEMA arbetskollen.warehouse;
CREATE TABLE test (id INTEGER);
SHOW TABLES;
DROP TABLE TEST;