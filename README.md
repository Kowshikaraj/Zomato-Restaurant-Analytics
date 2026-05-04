<div align="center">

# Zomato Restaurant Analytics

### End-to-End Data Analytics Project using SQL, Python & Power BI

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557C?style=for-the-badge)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

---

An end-to-end restaurant analytics project that transforms raw restaurant data into actionable business insights using SQL, Python, and Power BI.

---

<img src="screenshots/dashboard.png" width="100%">

</div>

---

# Table of Contents

- [Project Overview](#project-overview)
- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Project Architecture](#project-architecture)
- [Technology Stack](#technology-stack)
- [Dataset Description](#dataset-description)
- [Repository Structure](#repository-structure)
- [Database Development](#database-development)
- [Data Cleaning](#data-cleaning)
- [Data Profiling](#data-profiling)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Feature Engineering](#feature-engineering)
- [Python Analysis](#python-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Business Insights](#business-insights)
- [Skills Demonstrated](#skills-demonstrated)
- [Installation](#installation)
- [Future Enhancements](#future-enhancements)
- [Author](#author)

---

# Project Overview

Restaurant platforms generate large volumes of operational and customer data every day. Transforming this information into meaningful insights helps businesses understand customer preferences, market competition, pricing strategies, and service performance.

This project analyzes the Bangalore Zomato restaurant dataset by building a complete analytics pipeline using SQL, Python, and Power BI. The workflow begins with raw data ingestion, followed by data cleaning, profiling, exploratory analysis, feature engineering, and finally an interactive dashboard for business reporting.

The project demonstrates practical data analysis techniques commonly used in business intelligence and analytics teams while following an organized and reproducible workflow.

---

# Business Problem

Restaurant businesses operate across different locations, cuisines, pricing segments, and service models. Without structured analysis, it is difficult to identify market trends and customer behavior.

This project addresses questions such as:

- Which locations have the highest restaurant concentration?
- Which cuisines dominate the market?
- How are restaurants distributed across different price ranges?
- What does customer rating distribution reveal about restaurant quality?
- Which restaurant types are most common?
- How widely is online ordering adopted across restaurants?

The objective is to convert raw restaurant data into meaningful business insights that support data-driven decision making.

---

# Project Objectives

The primary objectives of this project are:

- Build a structured SQL database from raw restaurant data.
- Perform comprehensive data cleaning and validation.
- Conduct exploratory data analysis using SQL.
- Engineer new analytical features using Python.
- Create informative visualizations to identify trends.
- Develop an interactive Power BI dashboard.
- Generate business insights from restaurant data.
- Demonstrate an end-to-end analytics workflow suitable for portfolio presentation.

---

# Project Architecture

```

                        Kaggle Dataset
                              │
                              ▼
                     MySQL Database
                              │
                              ▼
                     SQL Data Cleaning
                              │
                              ▼
                     Data Profiling
                              │
                              ▼
               Exploratory Data Analysis
                              │
                              ▼
                 Feature Engineering
                              │
                              ▼
                  Python Visualizations
                              │
                              ▼
                 Power BI Dashboard
                              │
                              ▼
                   Business Insights

```
# Technology Stack

| Category | Technology | Purpose |
|-----------|------------|---------|
| Database | MySQL 8.0 | Data storage and SQL analysis |
| Query Language | SQL | Data cleaning, profiling, exploratory analysis and business queries |
| Programming Language | Python 3 | Data processing and feature engineering |
| Data Analysis | Pandas | Data manipulation and transformation |
| Numerical Computing | NumPy | Numerical operations |
| Data Visualization | Matplotlib | Exploratory visualizations |
| Business Intelligence | Power BI | Interactive dashboard development |
| Version Control | Git & GitHub | Project management and collaboration |
| Development Environment | Jupyter Notebook, VS Code | Analysis and development |

---

# Dataset Description

### Dataset Source

The project uses the **Zomato Bangalore Restaurants Dataset** available on Kaggle.

The dataset contains restaurant-level information collected from restaurants operating across Bangalore, India. It includes customer ratings, pricing information, cuisines served, restaurant categories, customer engagement metrics, and service availability.

### Dataset Summary

| Attribute | Details |
|-----------|---------|
| Source | Kaggle |
| Records | 51,609 Restaurants |
| Features | 12 |
| Format | CSV |
| Domain | Food & Restaurant Analytics |

### Dataset Features

| Column | Description |
|----------|-------------|
| name | Restaurant name |
| location | Restaurant location |
| cuisines | Cuisine served |
| rest_type | Restaurant category |
| online_order | Online ordering availability |
| book_table | Table booking availability |
| rate | Average customer rating |
| votes | Total customer votes |
| approx_cost | Approximate cost for two people |
| listed_in_type | Restaurant listing category |
| listed_in_city | City or locality listing |

---

# Repository Structure

```text
Zomato-Restaurant-Analytics/
│
├── Dataset/
│   ├── raw/
│   │   └── zomato.csv
│   │
│   └── processed/
│       ├── zomato_clean.csv
│       └── zomato_featured.csv
│
├── SQL/
│   ├── 01_database_setup.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_data_profiling.sql
│   ├── 04_feature_engineering.sql
│   ├── 05_eda_queries.sql
│   ├── 06_business_queries.sql
│   └── 07_views.sql
│
├── Python/
│   ├── 01_data_loading.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_exploratory_analysis.ipynb
│   ├── 05_business_insights.ipynb
│   └── 06_export_for_powerbi.ipynb
│
├── powerbi/
│   └── Zomato_Restaurant_Analytics.pbix
│
├── screenshots/
│   ├── dashboard.png
│   ├── rating_distribution.png
│   ├── top_locations.png
│   ├── top_cuisines.png
│   ├── restaurant_types.png
│   ├── price_segments.png
│   └── python_visualizations.png
│
├── docs/
│
├── README.md
├── requirements.txt
├── LICENSE
└── .gitignore
```

---

# Database Development

The raw dataset was imported into MySQL to create a structured analytical database that supports data cleaning, profiling, and business analysis.

A separate working table was created from the original dataset to ensure that the raw data remained unchanged throughout the project. This approach allows all transformations to be performed safely while preserving the original source.

The database development process consisted of the following stages:

- Database creation
- Importing raw CSV data
- Schema validation
- Working table creation
- Data verification

### Database Schema

| Column | Data Type |
|----------|-----------|
| name | VARCHAR |
| location | VARCHAR |
| cuisines | TEXT |
| rest_type | VARCHAR |
| online_order | VARCHAR |
| book_table | VARCHAR |
| rate | DECIMAL |
| votes | INT |
| approx_cost | INT |
| listed_in_type | VARCHAR |
| listed_in_city | VARCHAR |

---

# Data Cleaning

Real-world restaurant datasets often contain inconsistent formatting, invalid values, and missing information. Before analysis, the dataset was systematically cleaned using SQL to improve data quality and ensure reliable results.

The following cleaning operations were performed.

### Rating Standardization

Customer ratings originally contained values such as:

```text
4.1/5
NEW
-
```

The cleaning process included:

- Replacing "NEW" with NULL
- Replacing "-" with NULL
- Removing "/5" from ratings
- Converting ratings to DECIMAL format

---

### Approximate Cost Cleaning

Restaurant pricing contained comma-separated values.

Example

```text
1,200
800
450
```

Cleaning steps:

- Removed comma separators
- Converted values to integer
- Replaced blank values with NULL

---

### Missing Value Handling

The dataset was examined for missing values across all important columns.

Columns inspected included:

- Location
- Cuisine
- Restaurant Type
- Rating
- Approximate Cost

Missing values were identified, quantified, and handled appropriately before analysis.

---

### Data Validation

After cleaning, validation queries were executed to verify data quality.

Validation included:

- Null value checks
- Blank value detection
- Data type verification
- Category consistency
- Rating validation
- Cost validation

These validation steps ensured the cleaned dataset was suitable for exploratory analysis and dashboard development.

---

# Data Cleaning Summary

| Cleaning Task | Status |
|---------------|--------|
| Rating Standardization | Completed |
| Cost Standardization | Completed |
| Missing Value Handling | Completed |
| Null Value Validation | Completed |
| Blank Value Validation | Completed |
| Data Type Conversion | Completed |
| Category Validation | Completed |
| Data Consistency Checks | Completed |
# Data Profiling

Before performing exploratory analysis, the dataset was profiled to assess its overall quality, completeness, and structure. This step helped identify inconsistencies and ensured the dataset was suitable for analytical tasks.

The profiling process included:

- Total number of records
- Total number of columns
- Missing value analysis
- Distinct value counts
- Category distribution
- Rating distribution
- Cost distribution
- Restaurant type distribution
- Location distribution

This process provided a clear understanding of the dataset and helped determine the required cleaning and transformation steps.

---

# Exploratory Data Analysis

Exploratory Data Analysis (EDA) was performed using SQL to understand restaurant distribution, customer behaviour, pricing patterns, and service characteristics across Bangalore.

More than 35 analytical SQL queries were developed to answer business-focused questions and identify meaningful trends within the dataset.

The analysis focused on the following areas.

## Restaurant Distribution

Restaurant density was analysed across different locations to identify areas with the highest concentration of restaurants.

The analysis included:

- Restaurant count by location
- Top 10 restaurant locations
- Restaurant distribution by listing category
- Distribution across restaurant types

This analysis highlights competitive food hubs within Bangalore.

---

## Customer Ratings

Customer ratings were analysed to understand overall restaurant quality and identify highly rated categories.

The analysis included:

- Rating distribution
- Average rating by location
- Average rating by cuisine
- Average rating by restaurant type
- Average rating by price category

The objective was to identify factors associated with higher customer satisfaction.

---

## Cuisine Analysis

Cuisine preferences were analysed to understand customer demand and restaurant specialization.

The analysis included:

- Most popular cuisines
- Highest-rated cuisines
- Cuisine distribution
- Average customer votes by cuisine

This provides insights into cuisine popularity and customer engagement.

---

## Pricing Analysis

Restaurant pricing was analysed to understand market segmentation and affordability.

The analysis included:

- Average cost for two
- Price distribution
- Restaurants by price category
- Average rating by price category

This helps evaluate pricing strategies across different restaurant segments.

---

## Customer Engagement

Customer engagement was measured using the number of votes received by restaurants.

The analysis included:

- Restaurants with the highest customer votes
- Average votes by restaurant type
- Average votes by location
- Relationship between ratings and customer votes

These metrics help identify restaurants generating higher customer interaction.

---

## Online Ordering Analysis

Online ordering has become an important service offered by restaurants.

The analysis focused on:

- Restaurants offering online ordering
- Online ordering distribution
- Online ordering across restaurant types
- Online ordering across locations

This analysis helps understand digital service adoption within the restaurant industry.

---

# Feature Engineering

To improve business reporting and dashboard usability, several derived features were created using Python.

These engineered features simplify analysis by grouping numerical values into meaningful business categories.

### Price Category

Restaurants were classified into pricing segments based on approximate cost for two people.

Categories include:

- Budget
- Mid-Range
- Premium

These categories support pricing analysis and dashboard filtering.

---

### Rating Category

Restaurant ratings were grouped into qualitative categories.

Categories include:

- Poor
- Average
- Good
- Excellent

This simplifies customer satisfaction analysis and improves dashboard readability.

---

### Rating Sort Order

A custom sort order was created to ensure rating categories appear in logical business order within Power BI visualizations.

Order:

- Excellent
- Good
- Average
- Poor

---

# Python Analysis

Python was used to extend the SQL analysis by performing feature engineering, statistical exploration, and visualization.

The workflow was divided into multiple notebooks, each focusing on a specific stage of the analysis.

## Data Loading

The cleaned dataset exported from MySQL was imported into Pandas for further processing.

Initial inspection included:

- Dataset dimensions
- Data types
- Missing values
- Descriptive statistics

---

## Data Exploration

The dataset was explored using Pandas to better understand its characteristics.

The analysis included:

- Unique value counts
- Category frequencies
- Statistical summaries
- Correlation between numerical variables

---

## Data Visualization

Several visualizations were created to support exploratory analysis and validate business findings.

Visualizations include:

- Restaurant rating distribution
- Restaurant count by location
- Top cuisines
- Restaurant types
- Price category distribution
- Customer votes distribution

These visualizations provided a better understanding of customer preferences and restaurant trends before dashboard development.

---

## Export for Power BI

After completing feature engineering and exploratory analysis, the final dataset was exported for Power BI.

The exported dataset includes:

- Cleaned data
- Engineered features
- Business categories
- Consistent data types

This dataset serves as the final data source for the interactive dashboard.
# Power BI Dashboard

The final stage of the project focuses on transforming analytical findings into an interactive business intelligence dashboard using Microsoft Power BI.

The dashboard provides a consolidated view of restaurant performance across multiple business dimensions, allowing users to explore restaurant distribution, customer preferences, pricing strategies, and service availability through interactive visualizations and filters.

The dashboard was designed using a Zomato-inspired theme with an emphasis on readability, consistency, and business storytelling.

---

## Dashboard Overview

The dashboard consists of four Key Performance Indicators (KPIs), six analytical visualizations, and multiple interactive slicers that allow users to filter results dynamically.

### Key Performance Indicators

| KPI | Description |
|------|-------------|
| Total Restaurants | Total number of restaurants included in the dataset |
| Average Rating | Average customer rating across all restaurants |
| Average Cost for Two | Average dining cost for two people |
| Total Customer Votes | Total customer engagement measured through votes |

---

## Dashboard Visualizations

### 1. Top Restaurant Locations

**Chart Type:** Clustered Bar Chart

This visualization highlights the locations with the highest concentration of restaurants in Bangalore.

Business Value

- Identifies highly competitive restaurant markets.
- Helps understand restaurant density across locations.
- Supports market expansion and location planning.

---

### 2. Restaurant Rating Distribution

**Chart Type:** Clustered Column Chart

Restaurants are grouped into qualitative rating categories to understand overall customer satisfaction.

Business Value

- Provides an overview of restaurant quality.
- Identifies the proportion of highly rated restaurants.
- Highlights overall customer satisfaction trends.

---

### 3. Top Cuisines

**Chart Type:** Clustered Bar Chart

Displays the most popular cuisines based on the number of restaurants serving each cuisine.

Business Value

- Identifies customer food preferences.
- Helps businesses understand cuisine competition.
- Supports menu and expansion planning.

---

### 4. Price Category Distribution

**Chart Type:** Donut Chart

Shows how restaurants are distributed across different pricing segments.

Business Value

- Identifies dominant pricing categories.
- Supports pricing strategy analysis.
- Helps understand affordability across the market.

---

### 5. Restaurant Type Distribution

**Chart Type:** Clustered Bar Chart

Compares different restaurant categories based on the number of establishments.

Business Value

- Highlights the most common restaurant formats.
- Provides insight into market composition.
- Helps evaluate business opportunities across restaurant types.

---

### 6. Online Ordering Analysis

**Chart Type:** Bar Chart

Compares restaurants based on online ordering availability.

Business Value

- Measures adoption of online ordering services.
- Highlights digital service availability.
- Supports operational strategy and customer convenience analysis.

---

## Interactive Filters

The dashboard includes dynamic slicers that allow users to explore the data from different perspectives.

Available filters include:

- Location
- Cuisine
- Restaurant Type
- Price Category
- Rating Category
- Online Ordering

Each slicer updates all visualizations simultaneously, enabling interactive business exploration.

---

## Dashboard Features

The dashboard includes the following functionality:

- Interactive filtering
- Dynamic KPI updates
- Cross-visual filtering
- Custom business categories
- Consistent dashboard theme
- Responsive visual layout

---

# Business Questions Answered

The project addresses several practical business questions relevant to the restaurant industry.

### Market Analysis

- Which locations have the highest concentration of restaurants?
- Which restaurant categories dominate the market?
- Which cuisines are most commonly offered?

### Customer Behaviour

- How are customer ratings distributed?
- Which restaurants receive the highest customer engagement?
- How do customer ratings vary across restaurant categories?

### Pricing Strategy

- Which pricing segment contains the largest number of restaurants?
- How does pricing vary across restaurant types?

### Service Availability

- How widely is online ordering adopted?
- Which restaurant segments provide online ordering services?

---

# Key Business Insights

### Restaurant Distribution

Restaurant activity is concentrated in commercial areas with high customer demand, indicating strong competition within these locations.

---

### Cuisine Trends

North Indian, Chinese, and South Indian cuisines represent the largest share of restaurants, reflecting customer demand and market preference.

---

### Customer Ratings

The majority of restaurants maintain ratings between **3.5 and 4.0**, suggesting generally positive customer experiences across the platform.

---

### Pricing

Most restaurants fall within the **Budget** and **Mid-Range** pricing segments, indicating a competitive market focused on affordability.

---

### Restaurant Types

Casual Dining and Quick Bites account for the highest proportion of restaurants, making them the dominant business models within the dataset.

---

### Online Ordering

A large proportion of restaurants support online ordering, demonstrating the growing importance of digital food delivery services.

---

## Dashboard Preview

<p align="center">
<img src="screenshots/dashboard.png" width="100%">
</p>
# Skills Demonstrated

This project demonstrates practical skills across the complete data analytics lifecycle, from raw data preparation to interactive business reporting.

## SQL

The SQL phase focused on building a structured analytical database and performing data preparation before analysis.

Skills demonstrated include:

- Database design and table creation
- Data cleaning and validation
- Data profiling
- Exploratory Data Analysis (EDA)
- Business query development
- Aggregate functions
- GROUP BY and HAVING
- CASE expressions
- Common Table Expressions (CTEs)
- Views
- String manipulation
- Data type conversion

---

## Python

Python was used for feature engineering, exploratory analysis, and visualization.

Skills demonstrated include:

- Data loading with Pandas
- Data cleaning
- Missing value analysis
- Feature engineering
- Exploratory Data Analysis
- Statistical summaries
- Data visualization
- Exporting processed datasets

Libraries used:

- Pandas
- NumPy
- Matplotlib

---

## Power BI

Power BI was used to build an interactive dashboard for business reporting.

Skills demonstrated include:

- Dashboard design
- Data modeling
- DAX measures
- KPI Cards
- Interactive slicers
- Cross-filtering
- Business storytelling
- Data visualization best practices

---

## Business Analysis

This project demonstrates the ability to translate raw restaurant data into meaningful business insights by answering practical analytical questions related to:

- Market distribution
- Customer satisfaction
- Cuisine popularity
- Pricing strategy
- Restaurant segmentation
- Online service adoption

---

# Project Outcomes

This project successfully demonstrates an end-to-end analytics workflow covering every major stage of the data analysis process.

Key outcomes include:

- Imported and organized raw restaurant data into MySQL.
- Cleaned and validated inconsistent data using SQL.
- Performed exploratory analysis through business-focused SQL queries.
- Engineered analytical features using Python.
- Built reusable visualizations for exploratory analysis.
- Developed an interactive Power BI dashboard.
- Generated actionable business insights from restaurant data.

---

# Future Enhancements

The current project focuses on descriptive analytics. Future improvements may include:

- Customer review sentiment analysis using Natural Language Processing.
- Restaurant recommendation system.
- Predictive models for restaurant ratings.
- Geographic analysis using interactive maps.
- Time-series analysis using restaurant opening dates.
- Automated reporting using Power BI Service.

---

# Installation

## Clone the Repository

```bash
git clone https://github.com/Kowshikaraj/Zomato-Restaurant-Analytics.git
```

Navigate to the project directory.

```bash
cd Zomato-Restaurant-Analytics
```

---

## Install Python Dependencies

```bash
pip install -r requirements.txt
```

---

## Import the Dataset

Place the Kaggle dataset inside:

```text
Dataset/raw/
```

---

## Execute SQL Scripts

Run the SQL scripts in the following order:

```text
01_database_setup.sql
02_data_cleaning.sql
03_data_profiling.sql
04_feature_engineering.sql
05_eda_queries.sql
06_business_queries.sql
07_views.sql
```

---

## Run Python Notebooks

Execute the notebooks sequentially.

```text
01_data_loading.ipynb

02_data_cleaning.ipynb

03_feature_engineering.ipynb

04_exploratory_analysis.ipynb

05_business_insights.ipynb

06_export_for_powerbi.ipynb
```

---

## Open the Dashboard

Open the Power BI dashboard located in:

```text
powerbi/
```

Refresh the dataset if required.

---

# Conclusion

This project presents a complete analytics workflow beginning with raw restaurant data and ending with an interactive business intelligence dashboard.

By combining SQL for data preparation, Python for analysis and feature engineering, and Power BI for visualization, the project demonstrates how raw operational data can be transformed into actionable business insights.

The techniques used throughout this project reflect common practices followed in modern data analytics and business intelligence workflows.

---

# Author

**Kowshika Raj**

B.Tech Computer Science and Engineering  
Indian Institute of Technology Jodhpur

GitHub

https://github.com/Kowshikaraj

LinkedIn

https://www.linkedin.com/in/sri-kowshika-raj-banoth/

Email

kowshikaraj537@gmail.com

---
## Acknowledgements

- Kaggle for providing the Zomato Bangalore Restaurants dataset.
- Microsoft Power BI for dashboard development.
- Python open-source community for data analysis libraries.
- MySQL Community Edition for database management.