What is our overall conversion rate?



                with conversion_data as 
                                (
                                select distinct(session_id),
                                sum(distinct case when event_type = 'checkout' then 1 else 0 end) as sale_session
                                from dbt_amlan_p.int_sessions_product_sales
                                group by 1
                                )
                                
                select (sum(sale_session)/count(distinct session_id)) as conv_rate
                from conversion_data;

What is our conversion rate by product?

                with product_sessions (
                select product_id, count(distinct(session_id)) as sessions
                from dbt_amlan_p.fct_user_sessions_by_product
                group by 1)

                , product_order(
                select product_id, sum(quantity_value) as purchases
                from dbt_amlan_p.int_product_purchases
                group by 1)

                select product_sessions.product_id, product_sessions.sessions, product_order.purchases
                from product_sessions
                left join product_order on product_sessions.product_id = product_order.product_id


