{{ config(materialized = 'table') }}


{% set events = dbt_utils.get_column_values(table=ref('stg_greenery_events'), column = 'event_type') %}


select 
session_id, user_id, product_id
{% for event_type in events %}
, {{aggregate_events(event_type)}} as {{event_type}}
{% endfor %}

from {{ref('stg_greenery_events')}}
group by 1,2,3
