select 
stg_raw__sales.date_date
, stg_raw__sales.orders_id
, ROUND(SUM(stg_raw__sales.quantity)) as quantity
, ROUND(SUM(stg_raw__product.purchase_price)) as purchase_price
, ROUND(SUM(purchase_price * quantity), 2) as purchase_cost
, ROUND(SUM(stg_raw__sales.revenue)) as revenue
, ROUND(SUM((revenue) - (purchase_price * quantity)), 2) as margin
from {{ ref('stg_raw__sales') }} 
inner join {{ ref('stg_raw__product') }} 
using (products_id)
group by date_date
, orders_id
order by date_date desc,
orders_id