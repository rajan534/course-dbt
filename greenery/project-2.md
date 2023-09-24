what is our repeat rate?

Answer: We have 99 repeat customers out 124 customers (80%)

SQL:
```
with orders_by_users as (select user_id, count(*) as orders from dev_db.dbt_rajankabarwalmolliecom.stg_postgres__orders
group by all 
order by 2 desc)

select user_id, orders from orders_by_users where orders >1


```
What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

Answer: Time difference between order delivery and order time
        Customer location
        Total order cost/quantity


Explain the product mart models you added. Why did you organize the models in the way you did?

Answer: For the int layer I tried to create models that would be helpful to reuse in later mart models for manipulation, such as page views or orders by day

What assumptions are you making about each model? (i.e. why are you adding each test?)

Answer: I added a relationship test for user ID to make sure both are connected and not null tests for created_at to make sure every order was properly recorded.

Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?

Answer: Not yet


Which products had their inventory change from week 1 to week 2?

Answer: Pothos
        Philodendron
        Monstera
        String of pearls   

