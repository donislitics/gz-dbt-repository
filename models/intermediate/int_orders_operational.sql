select 
int_sales_margin.orders_id
, int_sales_margin.date_date
, ROUND(SUM((int_sales_margin.margin + stg_raw__ship.shipping_fee) - (stg_raw__ship.shipment_cost + stg_raw__ship.logcost)), 2) as operational_margin
, ROUND(SUM(int_sales_margin.quantity), 2) as quantity
, ROUND(SUM(int_sales_margin.purchase_price), 2) as purchase_price
, ROUND(SUM(int_sales_margin.purchase_cost), 2) as purchase_cost
, ROUND(SUM(int_sales_margin.revenue), 2) as revenue
, ROUND(SUM(int_sales_margin.margin), 2) as margin
, ROUND(SUM(stg_raw__ship.shipping_fee), 2) as shipping_fee
, ROUND(SUM(stg_raw__ship.shipment_cost), 2) as shipment_cost
, ROUND(SUM(stg_raw__ship.logcost), 2) as logcost
from {{ ref('int_sales_margin') }}
inner join {{ ref('stg_raw__ship') }} 
using (orders_id)
group by int_sales_margin.date_date
, int_sales_margin.orders_id
order by int_sales_margin.date_date desc
, int_sales_margin.orders_id desc