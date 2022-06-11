{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with addresses_source as (
    select
        address_id,
        address,
        zipcode,
        state,
        country  
    from {{ source ('src_greenery','addresses')}}
)

select * from addresses_source