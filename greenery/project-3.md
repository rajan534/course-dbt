what is our conversion rate?

Answer: 62.5%
SQL:
```
select 
COUNT(DISTINCT ORDER_ID) as orders, COUNT(DISTINCT SESSION_ID)as unique_sess,
 round(COUNT(DISTINCT ORDER_ID)/COUNT(DISTINCT SESSION_ID),3) as conversion_rate
from dev_db.dbt_rajankabarwalmolliecom.stg_postgres__events


```
What is our conversion rate by product?
NAME	CONVERSION_RATE
String of pearls	0.609375
Arrow Head	0.555556
Pilea Peperomioides	0.474576
Rubber Plant	0.518519
Orchid	0.453333
Cactus	0.545455
Aloe Vera	0.492308
Calathea Makoyana	0.509434
Fiddle Leaf Fig	0.5
Boston Fern	0.412698
Angel Wings Begonia	0.393443
Bird of Paradise	0.45
Ponytail Palm	0.4
Monstera	0.510204
Money Tree	0.464286
Birds Nest Fern	0.423077
ZZ Plant	0.539683
Jade Plant	0.478261
Philodendron	0.483871
Snake Plant	0.39726
Ficus	0.426471
Devil's Ivy	0.488889
Dragon Tree	0.467742
Bamboo	0.537313
Peace Lily	0.409091
Majesty Palm	0.492537
Pink Anthurium	0.418919
Pothos	0.344262
Spider Plant	0.474576
Alocasia Polly	0.411765

Answer: 
SQL:
```
select pv.product_id,
p.name,
count (distinct case when checkouts > 0 then session_id end) / count(distinct session_id) as conversion_rate from dev_db.dbt_rajankabarwalmolliecom.fact_page_views as pv left join
dev_db.dbt_rajankabarwalmolliecom.stg_postgres__products as p on p.product_id = pv.product_id
group by 1,2

```
