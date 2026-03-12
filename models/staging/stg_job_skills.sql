with source as (

    select *
    from {{ source("linkedin", "job_skills") }}

),

cleaned as (

    select
        job_link,
        -- skill listesini virgülle ayırıp array yapıyoruz
        regexp_replace(job_skill, r'\* ', '') as job_skill
    from source
    where job_link is not null
)

select *
from cleaned