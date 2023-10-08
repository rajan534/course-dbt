Run the products snapshot model using dbt snapshot and query it in snowflake to see how the data has changed since last week. 

Which products had their inventory change from week 3 to week 4? 

Answer:
Bamboo
String of pearls
Philodendron
Pothos
ZZ Plant
Monstera

SQL:
```
select * from dev_db.dbt_rajankabarwalmolliecom.products_snapshot
where dbt_updated_at > '2023-10-02'


```
Now that we have 3 weeks of snapshot data, can you use the inventory changes to determine which products had the most fluctuations in inventory? Did we have any items go out of stock in the last 3 weeks? 

Answer: 
Most fluctuations: 
Pothos
Philodendron
Bamboo
ZZ Plant
Monstera
String of pearls

Out of stock products:
Pothos
String of pearls
SQL:
```
select * from dev_db.dbt_rajankabarwalmolliecom.products_snapshot where product_id in
(
select product_id from dev_db.dbt_rajankabarwalmolliecom.products_snapshot
group by 1 having count(1) >1)
order by product_id, dbt_valid_from

```


Part 2. Modeling challenge


How are our users moving through the product funnel?

Product funnel:
Page Views	Add to Carts	Checkouts
578	           467	          361

Users view a page, then proceed to add the products to the cart, finally checking out. 
From our side we then ship the product

Which steps in the funnel have largest drop off points?

Answers: 
Drop offs:
page view -> add to cart = 19.2%
add to cart -> check out = 22.7%
overall conversion = 62.5%


SQL:
```
select count (distinct case when page_views > 0 then session_id end) as page_views,
count (distinct case when add_to_carts > 0 then session_id end) as add_to_carts,
count (distinct case when checkouts > 0 then session_id end) as checkouts,
count (distinct case when add_to_carts > 0 then session_id end)/count (distinct case when page_views > 0 then session_id end) as page_view_to_add_cart_rate,
count (distinct case when checkouts > 0 then session_id end)/count (distinct case when add_to_carts > 0 then session_id end) as add_to_cart_to_checkout_rate,
count (distinct case when checkouts > 0 then session_id end)/ count (distinct case when page_views > 0 then session_id end) as overall_conversion
from dev_db. dbt_oleg.fact_page_views

```

Q3a)

My organization already uses DBT, we use DBT model our data prior to visualising it in Looker. It has been really helpful to keep track of logic and towards the future we could move our Looker ML logic into DBT too. I have learned about Macros and testing which should be useful going forward to save time from rewriting code and making sure our data is complete.
