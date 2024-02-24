WITH transaction_convert AS (
  SELECT 
    DATE(transaction_time) AS transaction_date,
    SUM(CAST(transaction_amount AS DECIMAL(10,2))) AS transaction_amount
  FROM transactions
  GROUP BY DATE(transaction_time)
)
, rolling_avg AS (
  SELECT 
    transaction_date, 
    AVG(transaction_amount) OVER (
      ORDER BY transaction_date 
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS three_day_rolling_avg
  FROM transaction_convert
)
SELECT *
FROM rolling_avg
WHERE transaction_date = '2021-01-31';
