with source as (

    select *
    from {{ source("linkedin", "job_posting") }}

),

cleaned as (

    select
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
        last_processed_time,
        got_summary,
        got_ner,
        is_being_worked
    from source
    where job_link is not null

)

select *
from cleaned