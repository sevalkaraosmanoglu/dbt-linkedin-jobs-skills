with source as (

    select *
    from {{ source("linkedin", "job_summary") }}

),

cleaned as (

    select
        string_field_0 as job_link,
        -- line break ve fazladan boşlukları temizle
        trim(regexp_replace(string_field_1, r'\s+', ' ')) as job_summary_clean
    from source
    where string_field_0 is not null

)

select *
from cleaned