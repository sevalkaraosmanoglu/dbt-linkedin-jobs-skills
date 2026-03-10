with int_jobs as (
    select *
    from {{ ref('int_job') }}
),

skills as (
    select
        job_link,
        split(skills_raw, ',') as skills_array
    from int_jobs
)

select
    to_hex(md5(job_link)) as job_id,
    trim(skill) as skill,
    job_link
from skills,
unnest(skills_array) as skill