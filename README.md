# 🍽️ Restaurant Value & Quality Analysis – India

## 📌 Project Overview

This project analyzes restaurant data across major Indian cities to identify **best value-for-money cuisines and cities** by combining **cost, ratings, and restaurant density**. The goal is to help stakeholders understand where customers receive the highest perceived value while maintaining quality.

The dashboard is designed with an **executive-level mindset**, focusing on clarity, reduced cognitive load, and actionable insights.

---

## 🎯 Business Objectives

* Identify **cities offering the best value for money** in dining
* Discover **top cuisines** that deliver high ratings at lower costs
* Understand the relationship between **price, rating, and restaurant volume**
* Enable **data-driven decision-making** for expansion, pricing, and marketing

---

## 📊 Key KPIs

* **Total Restaurants Analyzed:** 8,651
* **Total Cuisines Covered:** 90
* **Average Rating (Overall):** 2.52
* **Median Cost for Two (₹):** 450

---

## 📈 Dashboard Highlights

### 1️⃣ Price vs Rating Analysis

* Bubble chart comparing **Median Cost for Two vs Average Rating**
* Bubble size represents **number of restaurants**
* Reveals that **higher price does not always mean better ratings**

### 2️⃣ Best Value-for-Money Cuisines

* Street Food and Mithai rank highest on **Value for Money Index**
* Affordable cuisines consistently outperform premium categories in perceived value

### 3️⃣ Top Cities by Value for Money

* Filtered to cities with **≥ 20 restaurants** to ensure reliability
* Bhubaneswar, Bhopal, and Varanasi emerge as top performers

### 4️⃣ Interactive Slicers

* City
* Cuisine
* Cost for Two (₹)

These slicers allow stakeholders to dynamically explore insights by geography, budget, and food preference.

---

## 📸 Dashboard Preview

### Overall Dashboard

![Dashboard](Dashboard%20Screenshots/Dashboard.png)

### Value for Money Analysis

![Value for Money](Dashboard%20Screenshots/Value%20for%20money.png)

---

🔹 SQL Analysis (PostgreSQL)

This project uses PostgreSQL to clean, transform, and analyze restaurant data before visualization in Power BI.

🧹 Data Cleaning Queries
-- Remove rows with missing critical values
DELETE FROM restaurants

WHERE aggregate_rating IS NULL

   OR average_cost_for_two IS NULL
   
   OR city IS NULL;

-- Remove invalid cost values

DELETE FROM restaurants

WHERE average_cost_for_two <= 0;

-- Standardize city names
UPDATE restaurants
SET city = INITCAP(TRIM(city));

📊 KPI Calculations
-- Total restaurants in India
SELECT COUNT(*) AS total_restaurants
FROM restaurants;

-- Total cuisines analyzed
SELECT COUNT(DISTINCT cuisine_name) AS total_cuisines
FROM restaurant_cuisines;

-- Average restaurant rating
SELECT ROUND(AVG(aggregate_rating), 2) AS average_rating
FROM restaurants;

-- Median cost for two
SELECT
  PERCENTILE_CONT(0.5)
  WITHIN GROUP (ORDER BY average_cost_for_two) AS median_cost_for_two
FROM restaurants;

🍽️ Value-for-Money Analysis (Cuisine Level)
SELECT
  rc.cuisine_name,
  COUNT(*) AS total_restaurants,
  ROUND(AVG(r.aggregate_rating) / AVG(r.average_cost_for_two), 2) AS value_for_money_score
FROM restaurants r
JOIN restaurant_cuisines rc
  ON r.restaurant_id = rc.restaurant_id
WHERE r.average_cost_for_two > 0
GROUP BY rc.cuisine_name
HAVING COUNT(*) >= 50
ORDER BY value_for_money_score DESC
LIMIT 10;

🌆 City-Level Value-for-Money Analysis
SELECT
  city,
  COUNT(*) AS total_restaurants,
  ROUND(AVG(aggregate_rating) / AVG(average_cost_for_two), 2) AS value_for_money_index
FROM restaurants
WHERE average_cost_for_two > 0
  AND aggregate_rating IS NOT NULL
GROUP BY city
HAVING COUNT(*) >= 20
ORDER BY value_for_money_index DESC
LIMIT 10;


🔄 Data Pipeline Overview

Raw restaurant data imported into PostgreSQL
SQL used for:
              Data cleaning
              KPI calculations
              Value-for-money metrics
Cleaned data connected to Power BI
Interactive dashboards built with slicers & KPIs

🛠️ Tools & Technologies

PostgreSQL – Data cleaning & analysis
SQL – Aggregations, KPIs, indexing logic
Power BI – Interactive dashboards & visual storytelling
GitHub – Version control & portfolio hosting

---

## 💡 Key Insights

* Value-for-money is driven more by **consistency and affordability** than premium pricing
* Cities with mid-sized restaurant ecosystems often outperform metros
* Traditional and local cuisines deliver higher customer satisfaction per rupee

---

## 📂 Repository Contents

* `Restaurant_Value_analysis.pbix` – Power BI dashboard file
* `Dashboard Screenshots/` – Visual previews of the dashboard
* `README.md` – Project documentation

---

## 🚀 Future Enhancements

* Add **sentiment analysis** from customer reviews
* Introduce **time-based trends** (growth in value perception)
* Deploy dashboard via **Power BI Service** for live access

---

## 👤 Author

**Chinmay Chalke**
Aspiring Data Analyst | SQL • Power BI • Data Visualization

---

⭐ If you found this project insightful, feel free to star the repository!
 

