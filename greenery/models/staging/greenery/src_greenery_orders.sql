{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with orders_source as (
    select * from {{ source ('src_greenery','orders')}}
)

select * from orders_source