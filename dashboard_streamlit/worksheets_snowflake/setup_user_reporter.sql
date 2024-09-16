USE ROLE useradmin;
CREATE USER IF NOT EXISTS reporter_arbetskollen
    PASSWORD = 'reporter_password123'
    LOGIN_NAME = 'reporter_arbetskollen'
    DEFAULT_WAREHOUSE = dev_wh
    DEFAULT_NAMESPACE = 'arbetskollen.mart'
    COMMENT = 'reporter user for making analysis and BI'
    DEFAULT_ROLE = 'Streamlit_Role';