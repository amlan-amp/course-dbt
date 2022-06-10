{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with events_source as (
    select * from {{ source ('src_greenery','events')}}
)

select * from events_source