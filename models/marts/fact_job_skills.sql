with jobs as (
    select
        job_id_int,
        job_link
    from {{ ref('dim_job_posting') }}
),

skills as (
    select
        job_link,
        split(job_skill, ',') as skills_array
    from {{ ref('int_job') }}
)

select
    j.job_id_int,
    trim(skill) as skill
from skills s
join jobs j
    on s.job_link = j.job_link,
unnest(skills_array) as skill