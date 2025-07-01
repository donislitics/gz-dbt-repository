select
date_date
, count(orders_id) as total_nb_transactions
, round(sum(revenue) , 2) as total_revenue
, round(avg(revenue) , 2) as avg_basket
, round(sum(operational_margin), 2) as operational_margin
, round(sum(purchase_cost) , 2) as total_purchase_cost
, round(sum(shipping_fee) , 2) as total_shipping_fees
, round(sum(logcost) , 2) as total_log_costs
, round(sum(quantity) , 2) as total_products_qty_sold
from {{ ref('int_orders_operational') }}
group by date_date
order by date_date desc