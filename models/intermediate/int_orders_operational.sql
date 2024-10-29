SELECT
marg.*,
ROUND((marg.margin + ship.shipping_fee) - ship.logcost - ship.ship_cost,2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS marg
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
USING (orders_id)
ORDER BY orders_id DESC
