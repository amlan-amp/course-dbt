{{ config(materialized = 'table') }}

with 
sessions_to_sale as ( 
    select * from {{ref('int_sessions_product_sales')}}
)

select * from sessions_to_sale