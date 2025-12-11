-- SQL Query: Cohort Retention Analysis Matrix
-- This query uses Common Table Expressions (CTEs) to find the first purchase date
-- for each user and then calculates the count of retained users by month.

WITH first_purchase AS (
    -- CTE 1: Find the absolute first purchase date for every unique user (MIN function).
    SELECT
        user_id,
        MIN(purchase_date) AS first_purchase_date
    FROM
        purchase_activity
    GROUP BY
        user_id
),

cohort_data AS (
    -- CTE 2: Combine the first purchase date with all purchase activity.
    SELECT
        a.user_id,
        a.purchase_date,
        
        -- Standardize the cohort month (the 'YYYY-MM' equivalent)
        DATE_TRUNC('month', f.first_purchase_date) AS cohort_month,
        
        -- Calculate the Cohort Age in months (the difference between the
        -- current purchase month and the first purchase month).
        -- NOTE: Syntax for date difference may vary (e.g., DATEDIFF, MONTHS_BETWEEN).
        (DATE_PART('year', a.purchase_date) * 12 + DATE_PART('month', a.purchase_date))
        - (DATE_PART('year', f.first_purchase_date) * 12 + DATE_PART('month', f.first_purchase_date)) AS cohort_age_months
    FROM
        purchase_activity a
    INNER JOIN
        first_purchase f ON a.user_id = f.user_id
),

retained_users_by_age AS (
    -- CTE 3: Select the unique user_id for each (Cohort Month, Cohort Age) pair.
    -- This handles the COUNT(DISTINCT user_id) logic.
    SELECT DISTINCT
        cohort_month,
        cohort_age_months,
        user_id
    FROM
        cohort_data
)

-- Final step: Aggregate the unique users to get the count for the retention matrix.
SELECT
    cohort_month,
    cohort_age_months AS cohort_age,
    COUNT(user_id) AS retained_users_count
FROM
    retained_users_by_age
GROUP BY
    1, 2
ORDER BY
    cohort_month,
    cohort_age_months;
