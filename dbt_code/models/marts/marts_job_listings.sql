WITH fct_job_ads AS (SELECT * FROM {{ ref('fct_job_ads') }}),

job_details AS (SELECT * FROM {{ ref('dim_job_details') }}),

employer AS (SELECT * FROM {{ ref('dim_employer') }}),

auxilliary_attributes AS (SELECT * FROM {{ ref('dim_auxilliary_attributes') }}),

deadline_date AS (SELECT * FROM {{ref('dim_deadline_date')}}),

publication_date AS (SELECT * FROM {{ref('dim_publication_date') }})

SELECT 
    jd.headline,
    f.vacancies,
    jd.salary_type,
    f.relevance,
    e.employer_name,
    e.workplace_city,
    jd.description,
    jd.description_html_formatted,
    jd.duration,
    jd.scope_of_work_min,
    jd.scope_of_work_max,
    dd.application_deadline,
    dd.day_name_deadline,
    dd.month_name_deadline,
    dd.day_of_month_deadline,
    pd.publication_date,
    pd.month_name_publication,
    pd.day_of_month_publication,
    pd.week_publication,
    pd.month_publication,
    pd.year_publication

FROM fct_job_ads AS f
LEFT JOIN job_details AS jd
    ON f.job_details_key = jd.job_details_id
LEFT JOIN employer AS e
    ON f.employer_key = e.employer_id
LEFT JOIN auxilliary_attributes AS aa
    ON f.auxilliary_key = aa.auxilliary_attributes_id
LEFT JOIN deadline_date AS dd
    ON f.deadline_date_key = dd.deadline_date_id
LEFT JOIN publication_date AS pd
    ON f.publication_date_key = pd.publication_date_id


