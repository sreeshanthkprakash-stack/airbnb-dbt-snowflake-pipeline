{{ config(materialized = 'incremental', unique_key='HOST_ID')}}

SELECT 
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    CASE
        WHEN RESPONSE_RATE > 90 THEN 'high'
        WHEN RESPONSE_RATE BETWEEN 70 AND 89 THEN 'medium'
        WHEN RESPONSE_RATE BETWEEN 50 AND 69 THEN 'fair'
        ELSE 'low'
    END AS RESPONSE_RATE,
    CREATED_AT
FROM {{ ref('bronze_hosts') }}