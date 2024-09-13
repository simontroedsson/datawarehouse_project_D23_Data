WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

{# TODO: fill nulls #}

SELECT
    {{ dbt_utils.generate_surrogate_key(['employer_id','employer_name']) }} AS employer_id, 
    employer_name,
    employer_workplace,
    {{ capitalize_first_letter("coalesce(workplace_city, 'stad ej specificerat')") }} AS workplace_city,
    {{ capitalize_first_letter("coalesce(application_details_email, 'email ej specificerat')")}} AS application_details_email,
    employer_organization_number,
    {{ capitalize_first_letter("coalesce(workplace_street_address, 'adress ej specificerat')") }} AS workplace_street_address,
    {{ capitalize_first_letter("coalesce(workplace_region, 'region ej specificerat')") }} AS workplace_region,
    {{ capitalize_first_letter("coalesce(workplace_postcode, 'postkod ej specificerat')") }} AS workplace_postcode,
    workplace_country

FROM src_employer