SELECT
date_date,
ROUND(operational_margin - ads_cost,2)  AS ads_margin,
average_basket,
operational_margin,
ads_cost,
ads_impression,
ads_click,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
log_cost
FROM {{ ref('finance_days') }} AS finance
LEFT JOIN {{ ref('int_campaigns_day') }} AS campaign
USING (date_date)