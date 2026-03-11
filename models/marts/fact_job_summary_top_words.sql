{{ config(
    materialized='table'
) }}

WITH stg AS (
   
    SELECT
        ROW_NUMBER() OVER(ORDER BY job_link) AS job_id_int,
        job_title,
        job_summary_clean
    FROM {{ ref('int_job') }}
    WHERE job_summary_clean IS NOT NULL
),

base AS (
   
    SELECT
        job_id_int,
        job_summary_clean,
        CASE
            WHEN LOWER(job_title) LIKE '%scientist%' THEN 'Data Scientist'
            WHEN LOWER(job_title) LIKE '%analyst%' THEN 'Data Analyst'
            ELSE 'Other'
        END AS role_group
    FROM stg
    WHERE LOWER(job_title) LIKE '%scientist%'
       OR LOWER(job_title) LIKE '%analyst%'
),

tokens AS (

    SELECT
        role_group,
        LOWER(word) AS word
    FROM base,
    UNNEST(SPLIT(job_summary_clean, ' ')) AS word
    WHERE LENGTH(word) > 3
      AND LOWER(word) NOT IN (
          'with','that','this','will','from','your','have','work',
          'team','role','you','are','for','and','the','our','their',
          'they','them','what','when','where'
      )
),

word_counts AS (

    SELECT
        role_group,
        word,
        COUNT(*) AS word_count
    FROM tokens
    GROUP BY role_group, word
),

ranked AS (

    SELECT
        role_group,
        word,
        word_count,
        ROW_NUMBER() OVER(PARTITION BY role_group ORDER BY word_count DESC) AS rn
    FROM word_counts
)

SELECT
    role_group,
    word,
    word_count
FROM ranked
WHERE rn <= 10
ORDER BY role_group, word_count DESC