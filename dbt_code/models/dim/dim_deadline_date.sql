WITH src_deadline_date AS (SELECT * FROM {{ ref('src_deadline_date') }})

{# TODO: fill nulls #}

SELECT
    {{ dbt_utils.generate_surrogate_key(['deadline_date_id','application_deadline']) }} AS deadline_date_id, 
    application_deadline,
    day_name_deadline,
    month_name_deadline,
    day_of_month_deadline,
    week_deadline,
    month_deadline,
    year_deadline,
    hour_deadline,
    minute_deadline

FROM src_deadline_date