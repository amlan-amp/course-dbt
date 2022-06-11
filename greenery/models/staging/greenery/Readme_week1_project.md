Week-1 Submission:

1. How many users do we have?

Ans: 30

SQL:
      select count(distinct user_id) as total_users from dbt_amlan_p.stg_greenery_users;

2. On average, how many orders do we receive per hour?

Ans: 7.53

SQL:

    with summary_table as 
        (
          select max(created_at) as RHS, min(created_at) as LHS,count(distinct order_id) as total_orders, (extract(epoch from (max(created_at)-min(created_at)))/3600) as total_hours
    from dbt_amlan_p.stg_greenery_orders
      )
    select (total_orders/total_hours) as avg_orders_hour from summary_table;

3. On average, how long does an order take from being placed to being delivered?

Ans: 3.89

sql:

      with summary_table_fulfilled as 
         (
            select order_id, delivered_at, created_at,(extract(epoch from (delivered_at - created_at))::numeric(10,2)) as time_secs from dbt_amlan_p.stg_greenery_orders
            where delivered_at is not null
          )
      select (avg(time_secs)/86400)::numeric(10,2) as average_delivery_time_days from summary_table_fulfilled
    
4. How many users have only made one purchase? Two purchases? Three+ purchases?

[
 {
  "customers": "25",
  "number_of_purchases": "1"
 },
 {
  "customers": "28",
  "number_of_purchases": "2"
 },
 {
  "customers": "37",
  "number_of_purchases": "3+"
 }

SQL:

      with users_purchases as 
          (
          select user_id, count (distinct(order_id)) as purchases
          from dbt_amlan_p.stg_greenery_orders
          group by 1
          order by purchases desc
         ),

        purchases_by_user as 
        (
        select purchases as number_of_purchases, count (distinct(user_id)) as customers from users_purchases
        group by 1
        ), 
   
        one_two_orders as 
        (
          select number_of_purchases, customers 
          from purchases_by_user
          where number_of_purchases <3
        ),

          threeplus_orders as 
          (
          select '3+' as number_of_purchases, sum(customers) as customers
          from purchases_by_user
          where number_of_purchases >3
          group by 1
          )

          select number_of_purchases::char, customers from one_two_orders
          union
          select number_of_purchases, customers from threeplus_orders
          order by 1 asc

5. On average, how many unique sessions do we have per hour?

ans: 10.14

SQL:

        with sessions_hour as
        (select count(distinct(session_id)) as unique_sessions, ((extract(epoch from (max(created_at)-min(created_at))))/3600)::numeric(10,2) as total_hours
        from dbt_amlan_p.stg_greenery_events)

        select (unique_sessions/total_hours)::numeric(10,2) as sessions_per_hour from sessions_hour