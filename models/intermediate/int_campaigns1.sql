{{ dbt_utils.union_relations(
    relations=[{{ ref('stg_raw__adwords') }}, {{ ref('stg_raw__bing') }}, {{ ref('stg_raw__criteo') }}, {{ ref('stg_raw__facebook') }}]
) }}

select 
    date_date
    , sum(ads_cost) as ads_cost
    , sum(impression) as ads_impressions
    , sum(click) as ads_clicks
from u
group by date_date
order by date_date desc