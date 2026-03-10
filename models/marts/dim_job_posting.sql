with int_jobs as (

    select *
    from {{ ref('int_job') }}

)

select
    cast(md5(job_link) as string) as job_id,
    job_link,
    job_title,
    company,
    job_location,
    job_level,
    job_type,
    search_city,
    search_country,
    search_position,
    first_seen,
    last_processed_time
from int_jobs