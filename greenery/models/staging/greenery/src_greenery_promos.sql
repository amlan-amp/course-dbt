{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with promos_source as (
    select
        promo_id,
        discount,
        status
    from {{ source ('src_greenery','promos')}}
)

select * from promos_source