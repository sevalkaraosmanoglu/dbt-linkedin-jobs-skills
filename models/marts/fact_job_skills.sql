with int_jobs as (
    select *
    from {{ ref('int_job') }}
),

dim_jobs as (
    select
        row_number() over(order by job_link) as job_id_int,  -- dim ile aynı sırada
        job_link
    from {{ ref('int_job') }}
),

skills as (
    select
        j.job_id_int,
        i.job_link,
        split(i.skills_raw, ',') as skills_array
    from int_jobs i
    left join dim_jobs j
        on i.job_link = j.job_link
)

select
    job_id_int,
    trim(skill) as skill,
    job_link
from skills,
unnest(skills_array) as skill