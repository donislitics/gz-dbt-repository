{{ config(materialized='table') }}

select 
int_sales_margin.orders_id
, int_sales_margin.date_date
, ROUND(SUM((int_sales_margin.margin + stg_raw__ship.shipping_fee) - (stg_raw__ship.shipment_cost + stg_raw__ship.logcost)), 2) as operational_margin
, int_sales_margin.quantity
, int_sales_margin.purchase_price
, int_sales_margin.purchase_cost
, int_sales_margin.revenue
, int_sales_margin.margin
, stg_raw__ship.shipping_fee
, stg_raw__ship.shipment_cost
, stg_raw__ship.logcost
from {{ ref('int_sales_margin') }}
inner join {{ ref('stg_raw__ship') }} 
using (orders_id)
group by int_sales_margin.date_date
, int_sales_margin.orders_id
order by int_sales_margin.date_date desc
, int_sales_margin.orders_id desc