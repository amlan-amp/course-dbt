

1. what is our user repeat rate?

Result: 99

                with  users_purchases_summary as
                (select user_id, count(distinct(order_id)) as number_of_purchases
                from dbt_amlan_p.stg_greenery_orders
                group by 1
                order by 2 desc)

                select count(user_id)
                from users_purchases_summary
                where number_of_purchases >= 2

2. What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?



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