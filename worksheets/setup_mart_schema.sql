USE DATABASE arbetskollen;

CREATE SCHEMA IF NOT EXISTS mart;

SHOW SCHEMAS IN DATABASE arbetskollen;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA arbetskollen.mart TO ROLE arbetskollen_dbt_role;

-- grant CRUD and select tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA mart TO ROLE arbetskollen_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA arbetskollen.mart TO ROLE arbetskollen_dbt_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA arbetskollen.mart TO ROLE arbetskollen_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA arbetskollen.mart TO ROLE arbetskollen_dbt_role;
SHOW GRANTS TO ROLE arbetskollen_dbt_role;

--test
USE ROLE ARBETSKOLLEN_DBT_ROLE;
SHOW GRANTS ON SCHEMA arbetskollen.mart;
USE SCHEMA arbetskollen.mart;
CREATE TABLE TEST(id integer);
SHOW TABLES;
DROP TABLE TEST;