SELECT SUM(staff_numbers) AS staff_count

FROM dim_store

WHERE country_code = 'GB';
