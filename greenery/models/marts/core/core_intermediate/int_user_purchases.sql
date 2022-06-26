{{ config(materialized = 'table') }}

with 
all_users as ( 
select * from {{ ref('stg_greenery_users')}}
)

,paying_users as ( 
    select * from {{ref('stg_greenery_orders')}}
)

select all_users.user_id, paying_users.order_id
from all_users
left join paying_users on all_users.user_id = paying_users.user_id
group by 1,2