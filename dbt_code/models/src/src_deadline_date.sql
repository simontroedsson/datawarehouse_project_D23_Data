with stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }})

SELECT 
    id AS deadline_date_id,
    application_deadline,
    DAYNAME(application_deadline) as day_name_deadline,
    MONTHNAME(application_deadline) AS month_name_deadline,
    DAY(application_deadline) AS day_of_month_deadline,
    WEEK(application_deadline) AS week_deadline,
    MONTH(application_deadline) AS month_deadline,
    YEAR(application_deadline) AS year_deadline,
    HOUR(application_deadline) AS hour_deadline,
    MINUTE(application_deadline) AS minute_deadline
   
   
    
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen employer