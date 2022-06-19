{{ config(materialized = 'table') }}

with 
products_purchase_details as ( 
    select * from {{ref('int_product_purchase_details')}}
)

,user_details as (
    select * from {{ref('int_user_information')}}
)

,user_order_data as (
    select order_id, user_id
    from {{ref('int_user_level_purchases')}}
)

select 
user_details.*, 
products_purchase_details.promo_id,
products_purchase_details.product_name,
user_order_data.order_id
from products_purchase_details
left join user_order_data on products_purchase_details.order_id = user_order_data.order_id
left join user_details on user_order_data.user_id = user_details.user_id 