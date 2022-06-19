{{ config(materialized = 'table') }}

with 
user_purchases as ( 
    select * from {{ ref('int_user_level_purchases')}}
)

,user_category as ( 
    select * from {{ ref('int_user_category')}}

)

select user_purchases.*, 
user_category.number_of_purchases as purchases_madeby_user
from user_purchases
left join user_category on user_purchases.user_id = user_category.user_id