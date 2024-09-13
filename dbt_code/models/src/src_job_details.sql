WITH stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }}
)

SELECT 
    id AS job_details_id,
    headline,
    description__text AS description,
    description__text_formatted AS description_html_formatted,
    duration__label AS duration,
    salary_type__label AS salary_type,
    working_hours_type__label AS working_hours_type,
    scope_of_work__min AS scope_of_work_min,
    scope_of_work__max AS scope_of_work_max
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen job_details