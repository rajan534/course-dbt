with daily_orders as (
select * from {{ ref('int_orders_by_day') }}
)

select daily_orders.day, p.name, sum(oi.quantity) as total_orders from daily_orders 
left join {{ ref('stg_postgres__order_items') }} oi on
daily_orders.order_id = oi.order_id
left join {{ ref('stg_postgres__products') }} p on 
oi.product_id = p.product_id
group by 1,2
order by 1 desc, 2 desc