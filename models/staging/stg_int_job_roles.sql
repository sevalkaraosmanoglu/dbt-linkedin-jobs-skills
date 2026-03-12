{{ config(
    materialized='view' 
) }}

WITH base AS (
    SELECT *,
        CASE
            WHEN LOWER(job_title) LIKE '%scientist%' THEN 'Data Scientist'
            WHEN LOWER(job_title) LIKE '%analyst%' THEN 'Data Analyst'
            WHEN LOWER(job_title) LIKE '%analytics%' THEN 'Analytics'
            ELSE 'Other'
        END AS role_group
    FROM {{ ref('int_job') }}
)

SELECT *
FROM base