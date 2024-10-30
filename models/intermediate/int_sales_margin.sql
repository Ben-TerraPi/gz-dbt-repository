WITH sub AS ( 
SELECT
sales.*,
purchase_price,
ROUND(sales.quantity * product.purchase_price,2) AS purchase_cost,
ROUND(sales.revenue - (sales.quantity * product.purchase_price),2) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales 
LEFT JOIN {{ ref('stg_raw__product') }} AS product
USING (products_id)
)
SELECT *,
{{ margin_percent("revenue", "purchase_cost",2) }} AS margin_percent
FROM sub