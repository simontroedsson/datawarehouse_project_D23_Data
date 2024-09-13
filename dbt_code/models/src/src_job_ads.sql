WITH stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }}
)

SELECT 
    id AS job_id,
    number_of_vacancies AS vacancies,
    relevance,
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen job_ads



-- 29039448	
-- 29017127
-- 28960016	
-- 28693562