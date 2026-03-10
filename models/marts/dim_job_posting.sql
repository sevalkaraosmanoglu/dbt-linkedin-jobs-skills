with int_jobs as (
    select *
    from {{ ref('int_job') }}
)
select
    row_number() over(order by job_link) as job_id_int,  -- sıralamayı sabitle
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