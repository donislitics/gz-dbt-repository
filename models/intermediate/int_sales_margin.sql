{{ config(materialized='table') }}

select 
stg_raw__sales.date_date
, stg_raw__sales.orders_id
, stg_raw__sales.products_id
, stg_raw__sales.quantity
, stg_raw__product.purchase_price
, (purchase_price * quantity) as purchase_cost
, stg_raw__sales.revenue
, (revenue - (purchase_price * quantity)) as margin
from {{ ref('stg_raw__sales') }} 
inner join {{ ref('stg_raw__product') }} 
using (products_id)
