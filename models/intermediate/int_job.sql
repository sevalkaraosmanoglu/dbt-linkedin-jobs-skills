with posting as (
    select *
    from {{ ref('stg_job_posting') }}
),

skills as (
    select *
    from {{ ref('stg_job_skills') }}
),

summary as (
    select *
    from {{ ref('stg_job_summary') }}
)

select
    p.job_link,
    p.job_title,
    p.company,
    p.job_location,
    p.job_level,
    p.job_type,
    p.search_city,
    p.search_country,
    p.search_position,
    p.first_seen,
    p.last_processed_time,
    p.got_summary,
    p.got_ner,
    p.is_being_worked,
    s.skills_raw,       -- temizlenmiş skills string
    sm.job_summary_clean
from posting p
left join skills s on p.job_link = s.job_link
left join summary sm on p.job_link = sm.job_link