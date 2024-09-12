WITH src_auxilliary_attributes AS (SELECT * FROM {{ ref('src_auxilliary_attributes') }})

{# TODO: fill nulls #}

SELECT
    {{ dbt_utils.generate_surrogate_key(['auxilliary_attributes_id','experience_required']) }} AS auxilliary_attributes_id, 
    experience_required,
    driving_license_required,
    access_to_own_car
FROM src_auxilliary_attributes