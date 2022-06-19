{{ config(materialized = 'table') }}

with 
orders as ( 
    select order_id, promo_id from {{ref('stg_greenery_orders')}}
)

,order_items as ( 
    select * from {{ref('stg_greenery_order_items')}}
)

,promos as (
    select * from {{ref('stg_greenery_promos')}}
)

,products as ( 
    select * from {{ref('stg_greenery_products')}}
)

select 
orders.order_id, 
orders.promo_id,
order_items.product_id,
order_items.quantity_value,
promos.discount as promotion_discount,
promos.status as promotion_status,
products.name as product_name,
products.price as product_price,
products.inventory as product_inventory
from orders
left join order_items on orders.order_id = order_items.order_id
left join promos on orders.promo_id = promos.promo_id
left join products on order_items.product_id = products.product_id
