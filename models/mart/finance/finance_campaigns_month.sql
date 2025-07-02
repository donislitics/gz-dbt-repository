with a as (
select 
    extract(month from date_date) as months_date
    , ads_margin
    , average_basket
    , operational_margin
    , ads_cost
    , ads_impressions
    , ads_clicks
    , quantity
    , revenue 
    , purchase_cost
    , margin
    , shipping_fee
    , log_cost
    , ship_cost
from {{ ref('finance_campaigns_day') }}
)
select
    months_date
    , round(sum(ads_margin), 2) as ads_margin
    , round(sum(average_basket), 2) as average_basket
    , round(sum(operational_margin), 2) as operational_margin
    , round(sum(ads_cost), 2) as ads_cost
    , round(sum(ads_impressions), 2) as ads_impressions
    , round(sum(ads_clicks), 2) as ads_clicks
    , round(sum(quantity), 2) as quantity
    , round(sum(revenue), 2) as revenue 
    , round(sum(purchase_cost), 2) as purchase_cost
    , round(sum(margin), 2) as margin
    , round(sum(shipping_fee), 2) as shipping_fee
    , round(sum(log_cost), 2) as log_cost
    , round(sum(ship_cost), 2) as ship_cost
from a
group by months_date
order by months_date desc