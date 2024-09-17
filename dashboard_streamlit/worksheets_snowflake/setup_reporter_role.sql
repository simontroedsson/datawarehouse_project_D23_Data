USE ROLE useradmin;
CREATE ROLE IF NOT EXISTS Streamlit_Role;

USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE Streamlit_Role;

GRANT USAGE ON DATABASE arbetskollen TO ROLE Streamlit_Role;
GRANT USAGE ON SCHEMA arbetskollen.mart TO ROLE Streamlit_Role;
GRANT SELECT ON ALL TABLES IN SCHEMA arbetskollen.mart TO ROLE Streamlit_Role;
GRANT SELECT ON ALL VIEWS IN SCHEMA arbetskollen.mart TO ROLE Streamlit_Role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA arbetskollen.mart TO ROLE Streamlit_Role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA arbetskollen.mart TO ROLE Streamlit_Role;


GRANT ROLE Streamlit_Role TO USER simontroedsson;
GRANT ROLE Streamlit_Role  TO USER gabriel;
GRANT ROLE Streamlit_Role TO USER herman;
GRANT ROLE Streamlit_Role TO USER lovisa;

GRANT ROLE Streamlit_Role TO USER reporter_arbetskollen;

USE ROLE Streamlit_Role;

SHOW GRANTS TO ROLE Streamlit_Role;

-- test querying a mart
USE WAREHOUSE dev_wh;
SELECT * FROM arbetskollen.mart.marts_job_listings