SELECT EXTRACT(MONTH FROM o.order_date::DATE) AS month,
       EXTRACT(YEAR FROM o.order_date::DATE) AS year,
       SUM(p.sale_price - p.cost_price) AS total_revenue
FROM orders o
JOIN dim_product p ON o.product_code = p.product_code
WHERE EXTRACT(YEAR FROM o.order_date::DATE) = 2022
GROUP BY EXTRACT(MONTH FROM o.order_date::DATE), EXTRACT(YEAR FROM o.order_date::DATE)
ORDER BY total_revenue DESC
LIMIT 1;
