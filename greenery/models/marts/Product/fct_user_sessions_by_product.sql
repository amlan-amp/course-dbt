{{ config(materialized = 'table') }}

with sessions_data as ( 
    select * from {{ref('int_sessions_product_agg')}}
)


select 
*
from sessions_data
