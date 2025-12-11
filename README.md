# 📊 Conversion Funnel & Retention Analysis

## 🎯 Project Overview: Diagnosing Customer Attrition

This project aims to use behavioral data to analyze the end-to-end customer journey, quantify the severity of user churn, and provide actionable, data-driven strategies to improve retention and Customer Lifetime Value (CLV).

The analysis was performed after initial data showed unacceptable levels of customer attrition, indicating a massive revenue leak.

## 🔑 Key Findings & Business Impact

* **Identified Critical Churn:** Developed a custom Cohort Analysis model that quantified severe, early-stage **Customer Churn at over 95%** within the first few retention periods.
* **Diagnosed Funnel Bottleneck:** Executed a full conversion funnel analysis on **10,453 unique users**, pinpointing the largest drop-off (bottleneck) at **29.0%** between the Trial Signup and Initial Purchase stages.
* **Strategic Recommendation:** Proposed a targeted, data-driven re-engagement program focused on users who completed the Trial Signup but did not convert, aiming to stabilize KPIs and increase CLV.

## 🛠️ Technical Stack & Methods

| Tool / Method | Purpose in Project |
| :--- | :--- |
| **SQL** (or BigQuery) | Data extraction, cleaning, date standardization, and calculation of initial metrics (e.g., `first_purchase_date`). Used for the final, corrected calculation of `cohort_age`. |
| **Advanced Excel** (or Google Sheets) | Development of the custom **Cohort Analysis Model** and Pivot Table logic to measure monthly retention rates. |
| **Data Modeling** | Defined key metrics (CLV, Churn, Retention Rate) and created the core user-transaction table structure. |
| **Funnel Analysis** | Utilized conversion rates between defined stages (Awareness $\rightarrow$ Trial $\rightarrow$ Purchase) to identify the largest points of friction. |

## 📁 Repository Structure

* [`Funnel_and_Retention_Analysis`](https://github.com/lentzjeanfrancois5-boop/Conversion-Funnel-Retention-Analysis/blob/main/Business%20Analytics_%20Project.xlsx): The spreadsheet containing the raw data and the pivot table showing the final retention rates.
