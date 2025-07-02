select 
    finance.date_date
    , round(sum(finance.operational_margin - campaigns.ads_cost), 2) as ads_margin
    , round(sum(finance.avg_basket), 2) as average_basket
    , round(sum(finance.operational_margin), 2) as operational_margin
    , round(sum(campaigns.ads_cost), 2) as ads_cost
    , round(sum(campaigns.ads_impressions), 2) as ads_impressions
    , round(sum(campaigns.ads_clicks), 2) as ads_clicks
    , round(sum(finance.total_products_qty_sold), 2) as quantity
    , round(sum(finance.total_revenue), 2) as revenue 
    , round(sum(finance.total_purchase_cost), 2) as purchase_cost
    , round(sum(finance.total_margin), 2) as margin
    , round(sum(finance.total_shipping_fees), 2) as shipping_fee
    , round(sum(finance.total_log_costs), 2) as log_cost
    , round(sum(finance.total_ship_cost), 2) as ship_cost
from {{ ref('finance_days') }} as finance
join {{ ref('int_campaigns') }} as campaigns
using (date_date)
group by date_date
order by date_date