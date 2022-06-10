{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with products_source as (
    select * from {{ source ('src_greenery','products')}}
)

select * from products_source