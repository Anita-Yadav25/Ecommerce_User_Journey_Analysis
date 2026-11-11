# 🛒 E-commerce User Journey & Funnel Analysis

### From Customer Behaviour to Conversion Insights | SQL • Python • Power BI

## 📌 Project Overview

Why do customers browse an e-commerce website, add products to their carts, and proceed to checkout but leave without completing their purchases?

This project analyzes customer interactions across different stages of the e-commerce shopping journey to understand user behaviour, identify conversion bottlenecks, and uncover opportunities for business growth.

Using event-level behavioural data, the analysis evaluates customer progression through the conversion funnel, examines marketing channel effectiveness, compares device and regional performance, and investigates revenue contribution across product categories.

**The objective is to transform raw customer interaction data into actionable business insights that help improve conversion rates and optimize the customer experience.**

## 🎯 Business Problem

E-commerce businesses invest significantly in customer acquisition, but website traffic does not always translate into purchases.

Understanding where customers drop off and what influences their purchase decisions is essential for improving conversion performance and maximizing revenue opportunities.

### Key Business Questions

1. What percentage of users progress through each stage of the purchase funnel?
2. Which stage experiences the highest customer drop-off?
3. Which marketing channels generate the highest purchase conversion?
4. Does device type influence customer conversion behaviour?
5. Which regions contribute the most purchases and revenue?
6. Which product categories generate the highest revenue?
7. What is the relationship between customer journey progression and revenue generation?
8. Where should the business focus its conversion optimization efforts?

## 📊 Dataset Overview

The project uses an event-level e-commerce dataset containing customer interactions across different stages of the shopping journey.

| Dataset Attribute | Details |
|---|---|
| Total Records | 21,409 |
| Unique Users | 10,000 |
| Unique Sessions | 10,000 |
| Total Columns | 10 |
| Analysis Period | 09 Dec 2025 – 08 Jan 2026 |
| Missing Values | 0 |
| Duplicate Records | 0 |

### Data Dictionary

| Column | Description |
|---|---|
| User ID | Unique customer identifier |
| Session ID | Unique browsing session identifier |
| Event Time | Timestamp of customer activity |
| Event | Customer interaction or activity |
| Device | Device used by the customer |
| Region | Geographical region |
| Channel | Marketing acquisition channel |
| Product Category | Category of the product |
| Revenue | Revenue generated from purchases |
| Bonus Flag | Bonus indicator associated with the event |

## 🔄 Customer Journey & Conversion Funnel

The analysis tracks customer progression through four key stages:

**Browse → Add to Cart → Checkout → Purchase**

### Initial Funnel Performance

| Funnel Stage | Sessions | Conversion Rate |
|---|---:|---:|
| Browse | 10,000 | 100% |
| Add to Cart | 6,949 | 69.49% |
| Checkout | 3,456 | 34.56% |
| Purchase | 1,004 | 10.04% |

### Initial Funnel Observations

- 69.49% of browsing sessions progressed to adding products to the cart.
- 49.73% of cart sessions did not progress to checkout.
- 70.95% of checkout sessions did not result in a purchase.
- The overall purchase conversion rate was 10.04%.

**Key Observation:** Checkout-to-purchase is the biggest conversion bottleneck, making checkout abandonment an important area for further investigation.

## 💰 Revenue Overview

| Metric | Value |
|---|---:|
| Total Revenue | 277,323.06 |
| Total Purchases | 1,004 |
| Average Revenue per Purchase | 276.22 |

*Revenue figures are presented in the dataset's original currency units.*

## 🔍 Analytical Approach

### 1. Data Cleaning & Preparation
- Inspected dataset structure and data types.
- Validated missing values and duplicate records.
- Standardized event timestamps.
- Validated unique user and session identifiers.
- Checked event sequences and chronological consistency.
- Prepared data for exploratory and business analysis.

### 2. Exploratory Data Analysis (EDA)
- Analyzed customer activity and event distribution.
- Examined device-wise customer behaviour.
- Explored regional and marketing channel distribution.
- Evaluated product category performance.
- Investigated revenue distribution and purchase behaviour.

### 3. Funnel Analysis
- Calculated stage-wise conversion rates.
- Measured customer drop-off between funnel stages.
- Evaluated overall funnel conversion.
- Identified the biggest conversion bottleneck.
- Examined session-level customer progression.

### 4. Marketing Channel Analysis
- Compared customer acquisition channels.
- Evaluated channel-wise purchase conversion.
- Analyzed revenue contribution by channel.
- Identified high-performing marketing channels.

### 5. Customer Segmentation
- Device-wise conversion analysis.
- Region-wise purchase performance.
- Product category revenue analysis.
- Marketing channel segmentation.
- Customer journey and purchase behaviour analysis.

## 📈 Key Performance Indicators (KPIs)

| KPI | Business Objective |
|---|---|
| Total Users | Measure customer reach |
| Total Sessions | Measure website activity |
| Total Purchases | Measure completed transactions |
| Overall Conversion Rate | Evaluate purchase effectiveness |
| Stage-wise Conversion Rate | Measure funnel progression |
| Drop-off Rate | Identify customer abandonment |
| Total Revenue | Measure revenue generation |
| Average Revenue per Purchase | Evaluate revenue per purchase |
| Channel-wise Conversion | Compare acquisition effectiveness |
| Category-wise Revenue | Identify revenue-generating categories |

## 🛠️ Tools & Technologies

| Technology | Application |
|---|---|
| SQL | Data querying, aggregation and business analysis |
| Python | Exploratory data analysis |
| Pandas | Data cleaning and manipulation |
| NumPy | Numerical analysis |
| Power BI | Interactive dashboard development |
| DAX | KPI calculations and business metrics |
| Excel | Data validation and preliminary analysis |

## 💡 Business Recommendations

The analysis aims to develop data-backed recommendations around:

- **Checkout Optimization:** Investigate the reasons behind checkout abandonment and identify opportunities to simplify the purchase process.
- **Marketing Optimization:** Prioritize channels based on purchase conversion and revenue contribution.
- **Device Experience:** Identify device-specific conversion gaps and potential usability improvements.
- **Regional Strategy:** Evaluate regional differences to support targeted marketing initiatives.
- **Product Strategy:** Identify high-performing categories and opportunities to improve category-level performance.

## 📂 Repository Structure

```text
user-journey-and-funnel-analysis/
│
├── Dataset/
│   └── Funnel_Analysis_Dataset.csv
│
├── SQL/
│   └── funnel_analysis.sql
│
├── Python/
│   └── funnel_analysis_eda.ipynb
│
├── PowerBI/
│   └── funnel_analysis_dashboard.pbix
│
├── Dashboard/
│   └── dashboard_preview.png
│
└── README.md
```

## 🎓 Key Learning Outcomes

- Analyzing event-level customer behaviour.
- Understanding e-commerce conversion funnels.
- Applying SQL to solve business problems.
- Performing exploratory data analysis using Python.
- Developing business KPIs and interactive Power BI dashboards.
- Translating data findings into actionable recommendations.

## 👩‍💻 About Me

**Anita Yadav | Aspiring Data Analyst**

I bring 6 years and 11 months of professional experience across Quality Assurance, Operations, and Language Analytics.

My professional background has helped me develop strong analytical thinking, attention to detail, data validation, quality monitoring, and problem-solving skills.

I am transitioning into Data Analytics, building practical expertise in SQL, Python, Excel, and Power BI, with a particular interest in E-commerce Analytics, Customer Behaviour, and Growth Analytics.

**Technical Skills:** SQL | Python | Pandas | Excel | Power BI | DAX

**Areas of Interest:** E-commerce Analytics | Growth Analytics | Marketing Analytics | Customer Behaviour Analysis

---

⭐ If you find this project interesting, feel free to explore the repository and connect with me on LinkedIn.

*Turning data into insights. Turning insights into better business decisions.*
