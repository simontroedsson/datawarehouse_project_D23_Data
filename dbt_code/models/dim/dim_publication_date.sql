WITH src_publication_date AS (SELECT * FROM {{ ref('src_publication_date') }})


SELECT
    {{ dbt_utils.generate_surrogate_key(['publication_date_id','publication_date']) }} AS publication_date_id, 
    publication_date,
    day_name_publication,
    month_name_publication,
    day_of_month_publication,
    week_publication,
    month_publication,
    year_publication,
    hour_publication,
    minute_publication

FROM src_publication_date