{{ config(materialized = 'table') }}

with 
all_users as ( 
select * from {{ ref('stg_greenery_users')}}
)

,paying_users as ( 
    select * from {{ref('stg_greenery_orders')}}
)

select all_users.user_id, count(DISTINCT(paying_users.order_id)) as number_of_purchases,
CASE
    when count(DISTINCT(paying_users.order_id)) > 1 then '2_plus_purchases'
    when count(DISTINCT(paying_users.order_id)) = 1 then '1_purchase'
    else 'No_purchases'
END as customer_type
from all_users
left join paying_users on all_users.user_id = paying_users.user_id
group by 1