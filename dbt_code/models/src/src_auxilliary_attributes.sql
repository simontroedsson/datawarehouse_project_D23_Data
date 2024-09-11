with stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }})

SELECT *
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen auxilliary_attributes