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
    cast(md5(job_link) as string) as job_id,
    trim(skill) as skill,
    job_link
from skills,
unnest(skills_array) as skill