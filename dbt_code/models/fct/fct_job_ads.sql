WITH ja AS (SELECT * FROM {{ ref('src_job_ads') }}),

jd AS (SELECT * FROM {{ ref('src_job_details') }}),

e AS (SELECT * FROM {{ ref('src_employer') }}),

aa AS (SELECT * FROM {{ ref('src_auxilliary_attributes') }}),

dd AS (SELECT * FROM {{ ref('src_deadline_date') }}),

pd AS (SELECT * FROM {{ ref('src_publication_date')}})

SELECT 
    {{dbt_utils.generate_surrogate_key(['ja.job_id','ja.vacancies'])}} as job_ads_id,
    {{dbt_utils.generate_surrogate_key(['jd.job_details_id', 'jd.headline'])}} as job_details_key,
    {{dbt_utils.generate_surrogate_key(['e.employer_id', 'e.employer_name'])}} as employer_key,
    {{dbt_utils.generate_surrogate_key(['aa.auxilliary_attributes_id', 'aa.experience_required']) }} AS auxilliary_key,
    {{dbt_utils.generate_surrogate_key(['dd.deadline_date_id', 'dd.application_deadline'])}} as deadline_date_key,
    {{dbt_utils.generate_surrogate_key(['pd.publication_date_id', 'pd.publication_date'])}} as publication_date_key,
    relevance, 
    coalesce(vacancies, 1) as vacancies,

FROM 
    ja 
LEFT JOIN 
    jd ON ja.job_id = jd.job_details_id
LEFT JOIN 
    e ON ja.job_id = e.employer_id
LEFT JOIN 
    aa ON ja.job_id = aa.auxilliary_attributes_id
LEFT JOIN 
    dd ON ja.job_id = dd.deadline_date_id
LEFT JOIN
    pd ON ja.job_id = pd.publication_date_id
