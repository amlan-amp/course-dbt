{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with order_items_source as (
    select 
        order_id,
        product_id,
        quantity as quantity_value
    from {{ source ('src_greenery','order_items')}}
)

select * from order_items_source