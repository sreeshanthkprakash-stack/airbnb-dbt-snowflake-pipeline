{% macro tags(col) %}
    CASE
        WHEN {{ col }} < 100 THEN 'low'
        WHEN {{ col }} BETWEEN 100 AND 200 THEN 'medium'
        ELSE 'high'
    END
{% endmacro %}