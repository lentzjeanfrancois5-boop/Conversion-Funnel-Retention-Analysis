-- Simplified SQL Query: Cohort Retention Analysis
SELECT
    DATE_TRUNC('month', f.first_purchase_date) AS cohort_month,
    (DATE_PART('year', a.purchase_date) * 12 + DATE_PART('month', a.purchase_date))
      - (DATE_PART('year', f.first_purchase_date) * 12 + DATE_PART('month', f.first_purchase_date)) 
      AS cohort_age,
    COUNT(DISTINCT a.user_id) AS retained_users
FROM
    purchase_activity a
INNER JOIN
    (
        -- Find first purchase date per user
        SELECT
            user_id,
            MIN(purchase_date) AS first_purchase_date
        FROM
            purchase_activity
        GROUP BY
            user_id
    ) f
ON a.user_id = f.user_id
GROUP BY
    cohort_month,
    cohort_age
ORDER BY
    cohort_month,
    cohort_age;
