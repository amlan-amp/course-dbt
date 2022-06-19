{{ config(materialized = 'table') }}

with 
user_data as ( 
    select * from {{ ref('int_user_information')}}
)

,user_category as ( 
    select * from {{ ref('int_user_category')}}

)

select user_data.*, 
user_category.customer_type
from user_data
left join user_category on user_data.user_id = user_category.user_id