{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with products_source as (
    select 
        product_id,
        name,
        price,
        inventory
    from {{ source ('src_greenery','products')}}
)

select * from products_source