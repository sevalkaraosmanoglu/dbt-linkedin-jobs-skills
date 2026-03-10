with source as (

    select *
    from {{ source("linkedin", "job_skills") }}

),

cleaned as (

    select
        string_field_0 as job_link,
        -- skill listesini virgülle ayırıp array yapıyoruz
        regexp_replace(string_field_1, r'\* ', '') as skills_raw
    from source
    where string_field_0 is not null
)

select *
from cleaned