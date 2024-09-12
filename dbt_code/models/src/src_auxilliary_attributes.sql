with stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }})

SELECT 
    id AS auxilliary_attributes_id,
    experience_required,
    driving_license_required,
    access_to_own_car
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen auxilliary_attributes