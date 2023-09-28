{# 
    This macro drop PR schemas that is provided
    Sample usage with different date:
        dbt run-operation pr_schema_cleanup --args "{'schema_to_clean': 'analytics'}"
#}
{% macro pr_schema_cleanup(schema_to_clean) %}

    {% set drop_schema_query %}
        drop schema if exists {{ schema_to_clean }} cascade
    {% endset %}

    {% if execute %}

        {{ log('Schema drop statements:' ,True) }}
        {{ log(drop_schema_query ,True) }}
        {% do run_query(drop_schema_query) %}

    {% endif %}

{% endmacro %}