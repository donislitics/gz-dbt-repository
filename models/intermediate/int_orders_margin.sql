{{ config(materialized='table') }}

select
orders_id
, date_date
, ROUND(SUM(revenue), 2) as revenue
, ROUND(SUM(quantity), 2) as quantity
, ROUND(SUM(purchase_cost), 2) as purchase_cost
, ROUND(SUM(margin), 2) as margin
from {{ ref('int_sales_margin') }}
group by date_date
, orders_id
order by date_date desc
, orders_id desc