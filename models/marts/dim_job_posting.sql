-- dim_job_posting.sql
select
    row_number() over(order by job_link) as job_id_int,
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
from {{ ref('int_job') }}