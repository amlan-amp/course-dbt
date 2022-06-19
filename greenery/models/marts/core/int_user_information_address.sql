{{ config(materialized = 'table') }}

with 
user_information as ( 
select * from {{ ref('stg_greenery_users')}}
)

,user_location as ( 
    select * from {{ref('stg_greenery_addresses')}}
)

select user_information, user_location
from user_information
left join user_location on user_information.address_id = user_location.address_id