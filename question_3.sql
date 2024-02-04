SELECT ds.store_type,
       SUM(dp.sale_price - dp.cost_price) AS total_revenue
FROM orders o
JOIN dim_product dp ON o.product_code = dp.product_code
JOIN dim_store ds ON o.store_code = ds.store_code
WHERE EXTRACT(YEAR FROM o.order_date::DATE) = 2022
   AND ds.country = 'Germany'
GROUP BY ds.store_type
ORDER BY total_revenue DESC
LIMIT 1;
