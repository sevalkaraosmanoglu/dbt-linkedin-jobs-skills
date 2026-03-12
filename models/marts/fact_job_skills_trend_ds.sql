with ds_jobs as (
    select f.job_id_int,
           f.skill,
           d.first_seen
    from {{ ref('fact_job_skills') }} f
    join {{ ref('dim_job_posting') }} d
      on f.job_id_int = d.job_id_int
    where lower(d.job_title) like '%data scientist%'
)

select
    date_trunc(date(first_seen), month) as month_start,  -- ayın ilk günü
    extract(year from first_seen) as year,
    extract(month from first_seen) as month_num,
    skill,
    count(distinct job_id_int) as job_count
from ds_jobs
group by 1,2,3, skill
order by 1,2,3