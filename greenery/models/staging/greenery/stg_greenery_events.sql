{{
    config(
        MATERIALIZED = 'view'    
    )

}}

with events_source as (
    select 
        event_id,
        session_id,
        user_id,
        page_url,
        created_at,
        event_type,
        order_id,
        product_id 
    from {{ source ('src_greenery','events')}}
)

select * from events_source