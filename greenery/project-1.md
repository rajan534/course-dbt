How many users do we have?

Answer: We have 130 unique users

SQL:
```
select count(distinct(USER_ID)) from dev_db.dbt_rajankabarwalmolliecom.stg_postgres_users

```

On average, how many orders do we receive per hour?
Answer: we recieved 7.5 orders per hour for the 2 days we were have operating data for

SQL:
```
    select count(ORDER_ID) as number_of_orders, round(timediff(minute,min(created_at), max(created_at))/60,0) as hours_operating, count(ORDER_ID)/round(timediff(minute,min(created_at), max(created_at))/60,0)  as orders_per_hour  from dev_db.dbt_rajankabarwalmolliecom.stg_postgres__orders

```


On average, how long does an order take from being placed to being delivered?

Answer: On average it takes 5604 minutes (3.9 days) for all orders that have been processed and delivered

SQL:
```
    select sum(timediff(minutes,created_at,delivered_at))/count(order_id) as average_delivery  
    from dev_db.dbt_rajankabarwalmolliecom.stg_postgres__orders
    where delivered_at is not null and created_at is not null

```



How many users have only made one purchase? Two purchases? Three+ purchases?

Answer: 25, 28, 71 respectively


SQL:
```

with orders_per_user as 
(select user_id, count(distinct order_id) as number_of_orders  from dev_db.dbt_rajankabarwalmolliecom.stg_postgres__orders
group by 1)
select 
count(case when number_of_orders = 1 then 1 else null end) as order1,
count(case when number_of_orders = 2 then 1 else null end) as orders2,
count(case when number_of_orders >2 then 1 else null end) as orders3plus
from orders_per_user
```


On average, how many unique sessions do we have per hour?

Answer: 10.14 unique sessions per hour in the 57 hours we have data for

SQL:
```
select count(distinct session_id), round(timediff(minute,min(created_at), max(created_at))/60,0) as total_hours, count(distinct session_id)/
round(timediff(minute,min(created_at), max(created_at))/60,0) as unique_sess_hour from dev_db.dbt_rajankabarwalmolliecom.stg_postgres__events

```
