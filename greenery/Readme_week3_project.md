What is our overall conversion rate?

62%

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

