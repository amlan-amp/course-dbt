{{ config(materialized = 'table') }}

with 
website_events as ( 
    select * from {{ref('stg_greenery_events')}}
)

, product_details as (
    select * from {{ref('stg_greenery_products')}}
)

select website_events.*, 
product_details.name as product_name, product_details.price as product_price
from website_events
left join product_details on website_events.product_id = product_details.product_id