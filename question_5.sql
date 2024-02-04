SELECT
    dp.category,
    SUM(dp.sale_price - dp.cost_price) AS total_profit,
    ds.country_region

FROM
    dim_store ds
JOIN
    orders o ON ds.store_code = o.store_code
JOIN
    dim_product dp ON o.product_code = dp.product_code
WHERE
    ds.country_region = 'Wiltshire' AND EXTRACT(YEAR FROM o.order_date::DATE) = 2021
GROUP BY
    dp.category,
    ds.country_region
ORDER BY
    total_profit DESC
LIMIT 1;
