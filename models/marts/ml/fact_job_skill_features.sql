{{ config(
    materialized = 'table'
) }}

SELECT
    j.job_id_int,
    j.job_level,
    j.search_position,
    j.job_type,
    LENGTH(i.job_summary_clean) AS summary_length,
    COUNT(DISTINCT s.skill) AS skill_count
FROM {{ ref('dim_job_posting') }} j
LEFT JOIN {{ ref('int_job') }} i
    ON j.job_link = i.job_link
LEFT JOIN {{ ref('fact_job_skills') }} s
    ON j.job_id_int = s.job_id_int
GROUP BY
    j.job_id_int,
    j.job_level,
    j.search_position,
    j.job_type,
    i.job_summary_clean