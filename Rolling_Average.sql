SELECT
transaction_date,
ROUND(AVG(day_total_transaction_amount) OVER (
ORDER BY transaction_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
), 2) AS rolling_three_day_avg
FROM (
SELECT
TO_CHAR(transaction_time, 'YYYY-MM-DD') AS transaction_date,
SUM(transaction_amount) AS day_total_transaction_amount
FROM transactions
GROUP BY TO_CHAR(transaction_time, 'YYYY-MM-DD')
) subquery
WHERE transaction_date = '2021-01-31';


-- The rolling 3 day average of total transaction amount for 31st January is : 682.15
