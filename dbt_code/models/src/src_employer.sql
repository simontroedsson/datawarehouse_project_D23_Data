with stg_job_ads AS (SELECT * FROM {{ source('arbetskollen', 'stg_job_ads') }})

SELECT 
    id AS employer_id,
    employer__name AS employer_name, 
    employer__workplace AS employer_workplace,
    workplace_address__city AS workplace_city,
    application_details__email AS application_details_email,
    employer__organization_number AS employer_organization_number,
    workplace_address__street_address AS workplace_street_address,
    workplace_address__region AS workplace_region,
    workplace_address__postcode AS workplace_postcode,
    workplace_address__country AS workplace_country
FROM stg_job_ads
-- TODO Skapa select query för alla kolumner som ska finnas med i tabellen employer