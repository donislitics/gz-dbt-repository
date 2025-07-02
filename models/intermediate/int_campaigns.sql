with u as (
select * 
from {{ ref('stg_raw__adwords') }}
UNION ALL 
select * 
from {{ ref('stg_raw__bing') }}
UNION ALL 
select * 
from {{ ref('stg_raw__criteo') }}
UNION ALL 
select * 
from {{ ref('stg_raw__facebook') }}
)

select 
    date_date
    , sum(ads_cost) as ads_cost
    , sum(impression) as ads_impressions
    , sum(click) as ads_clicks
from u
group by date_date
order by date_date desc