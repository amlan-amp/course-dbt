

1. what is our user repeat rate?

Result: 79.8

                with repeat_orders as (
                        select distinct(user_id)
                    ,sum(distinct case when purchases_madeby_user >= 2 then 1 else 0 end) as repeat_user
                        from dbt_amlan_p.fct_core_user_orders
                        group by 1
                    )
                    select (sum(repeat_user)/count(distinct user_id)) as repeat_rate  from repeat_orders;

2. What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

















What questions the ERD should answer:

User level analysis :
How many users
how many buying users 
how many repeat users
where are buying users coming from?
total purchases made by the user


Revenue
most selling product
geos revenue split 
average sale/users
average sale/repeat users


Delivery 

average time for delivery 
average time for delivery by Geo 
average time for delivery by geo by shipping_service
Average cost of delivery x 2


User_behaviour

user_id and checkout ratio 
time spent by average User 
time spent by purchasing User
time spent by repeat users
cart abandonment %

Products

Products with lot of views but no sale 
Products with no sales and lowest views
Products added to cart by users
Products bought by the users
cart abandonment %