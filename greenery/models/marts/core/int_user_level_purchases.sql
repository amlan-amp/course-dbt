{{ config(materialized = 'table') }}

with
orders as ( 
    select * from {{ref('stg_greenery_orders')}}
)

,order_items as (
    select * from {{ref('stg_greenery_order_items')}}
)

select orders.*, 
order_items.product_id, 
order_items.quantity_value
from orders
left join order_items on orders.order_id = order_items.order_id