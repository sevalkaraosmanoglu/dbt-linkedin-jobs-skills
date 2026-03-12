{{ config(materialized='table') }}

with job_skills as (
    select
        job_id_int,
        max(if(strpos(skill, 'SQL') > 0, 1, 0)) as has_sql,
        max(if(strpos(skill, 'Python') > 0, 1, 0)) as has_python,
        max(if(strpos(skill, 'Java') > 0, 1, 0)) as has_java
    from {{ ref('fact_job_skills') }}
    group by job_id_int
)

select *
from job_skills