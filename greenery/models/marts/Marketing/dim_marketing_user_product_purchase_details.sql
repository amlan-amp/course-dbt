{{ config(materialized = 'table') }}

with 
products_purchase_details as ( 
    select * from {{ref('int_product_purchase_details')}}
)

,user_details as (
    select * from {{ref('int_user_information')}}
)

,user_purchases as (
    select * from {{ref('int_user_purchases')}}
)


select 
user_details.user_id, user_details.first_name,
user_purchases.order_id, 
products_purchase_details.product_id, products_purchase_details.product_name
from user_details
left join user_purchases on user_details.user_id = user_purchases.user_id
left join products_purchase_details on user_purchases.order_id = products_purchase_details.order_id
group by 1,2,3,4,5