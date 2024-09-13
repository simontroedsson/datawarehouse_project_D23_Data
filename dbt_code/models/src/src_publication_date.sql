with stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }})

SELECT 
    id AS publication_date_id,
    publication_date,
    DAYNAME(application_deadline) as day_name_publication,
    MONTHNAME(application_deadline) AS month_name_publication,
    DAY(application_deadline) AS day_of_month_publication,
    WEEK(application_deadline) AS week_publication,
    MONTH(application_deadline) AS month_publication,
    YEAR(application_deadline) AS year_publication,
    HOUR(application_deadline) AS hour_publication,
    MINUTE(application_deadline) AS minute_publication
   
   
    
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen employer