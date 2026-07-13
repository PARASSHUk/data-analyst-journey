# Power BI - Day 20 Learning Notes
## Topic: Interview Preparation
##         Project Explanations and
##         Common Interview Questions
---

## What I Did Today

- Complete interview preparation
- Practiced explaining all 7 projects
- Prepared answers for common questions
- Revised all key technical concepts
- Practiced how to walk through dashboards
- Prepared GitHub profile talking points
- Ready for Data Analyst interview!

---

## MY COMPLETE PROJECT PORTFOLIO

---

### Project 1 - Sales Performance Dashboard
Tool: Microsoft Excel

Problem Solved:
Business had 3 years of raw sales data
but no way to quickly understand which
products regions and time periods were
performing best or worst.

What I Built:
- Cleaned 2823 rows of sales data
- Created 10 Pivot Tables for analysis
- Built 7 charts bar line pie column
- Built interactive dashboard with
  4 KPI cards and 4 slicers
- Slicers for Year Territory
  Deal Size and Product Line

Key Insights Found:
- Classic Cars = highest revenue product line
- November = peak sales month every year
- 2004 = best performing year
- EMEA = highest contributing territory
- Medium deal size = most common

Skills Demonstrated:
- Excel Advanced Pivot Tables VLOOKUP XLOOKUP
- Dashboard Design and KPI Cards
- Business Insight Generation
- Data Cleaning and Formatting

---

### Project 2 - Pizza Sales Dashboard
Tool: SQL Server plus Microsoft Excel

Problem Solved:
Pizza business had raw sales data but no
visibility into peak hours best selling
products and category performance.

What I Built:
SQL Analysis:
- Total Revenue = dollar 817860
- Average Order Value calculation
- Daily trend by day of week
- Hourly trend by hour of day
- Category and size percentage analysis
- Top 5 and Bottom 5 selling pizzas
- Used DATEPART FORMAT GROUP BY

Excel Dashboard:
- 5 KPI cards
- 7 charts including daily hourly
  category size and seller charts
- Timeline slicer for month filtering
- 1/COUNT trick for accurate order counting

Key Insights Found:
- Friday has highest orders = 3538
- Peak hour = 12pm with 2520 orders
- Large size = 46% of total sales
- Classic Deluxe = best selling pizza
- Brie Carre = worst selling pizza

Skills Demonstrated:
- SQL DATEPART FORMAT GROUP BY RANK
- Excel Dashboard with combined SQL data
- Time Series Analysis
- Business Insight Generation

---

### Project 3 - EDA with SQL
Tool: SQL Server

Problem Solved:
Before building any dashboard a business
needs to fully understand their data.
This project shows professional EDA methodology.

What I Did:
6 Step EDA Process:
Step 1 = Database Exploration
  Used INFORMATION_SCHEMA to explore
  all tables and all columns
Step 2 = Dimension Exploration
  Found unique categories in text columns
  Used SELECT DISTINCT
Step 3 = Date Exploration
  Found first and last dates in dataset
  Calculated data coverage period
Step 4 = Measure Exploration
  Found total sales orders customers
  Built complete business KPI report
  Using UNION ALL combining all metrics
Step 5 = Magnitude Analysis
  Compared measures by dimensions
  Total sales by country by category
Step 6 = Ranking Analysis
  Found top and bottom performers
  Used TOP keyword and ROW_NUMBER

Skills Demonstrated:
- INFORMATION_SCHEMA for exploration
- Aggregate Functions SUM AVG MAX MIN COUNT
- Window Functions ROW_NUMBER
- UNION ALL for combined reports
- Analytical thinking and methodology

---

### Project 4 - Data Cleaning with SQL
Tool: MySQL

Problem Solved:
Real world data is always messy and
unusable in its raw form. This project
demonstrates professional data cleaning
before analysis.

What I Did:
4 Step Cleaning Pipeline:

Step 1 = Remove Duplicates
- Created staging table (never touch original)
- Used ROW_NUMBER with PARTITION BY
  across all key columns
- Could not delete from CTE in MySQL
- Created second staging table with row_num
- Deleted where row_num greater than 1

Step 2 = Standardize Data
- TRIM to remove extra spaces from company names
- LIKE to fix Crypto Currency variations to Crypto
- TRIM TRAILING to remove dot from United States
- STR_TO_DATE to convert TEXT dates to DATE type
- ALTER TABLE MODIFY to change column data type

Step 3 = Handle NULL and Blank Values
- Converted blank strings to NULL first
- Used SELF JOIN on same company and location
  to fill missing industry values
- Used SQL_SAFE_UPDATES setting
- Identified unfixable NULLs like Bally

Step 4 = Remove Unnecessary Columns
- Dropped row_num helper column
- ALTER TABLE DROP COLUMN

Best Practice Used:
Always work on staging copy never original data

Skills Demonstrated:
- Staging Tables best practice
- ROW_NUMBER PARTITION BY for duplicates
- SELF JOIN for data population
- STR_TO_DATE for type conversion
- ALTER TABLE MODIFY and DROP COLUMN
- SQL_SAFE_UPDATES handling

---

### Project 5 - Advanced SQL Analytics
Tool: SQL Server

Problem Solved:
Standard reports show WHAT happened.
This project uses 7 advanced techniques
to show HOW to analyze WHY it happened
and predict future trends.

What I Did:
7 Step Advanced Analysis:

Step 1 = Change Over Time Analysis
- Yearly and monthly sales trends
- Used DATETRUNC and FORMAT functions
- Found seasonal patterns

Step 2 = Cumulative Analysis
- Running total of sales using
  SUM() OVER(ORDER BY date)
- Shows if business is growing or declining
- Default window frame UNBOUNDED PRECEDING
  to CURRENT ROW

Step 3 = Performance Analysis
- Compared each product to its own average
  using AVG() OVER PARTITION BY product
- Compared to previous year using LAG()
- Year over Year analysis

Step 4 = Part-To-Whole Analysis
- Percentage contribution of each category
- Used CAST and SUM() OVER() grand total
- Formula: (category sales / total sales) x 100

Step 5 = Data Segmentation
- Segmented products by cost range
  Below 100 / 100-500 / 500-1000 / Above 1000
- Segmented customers into VIP Regular New
  VIP = 12 plus months AND spending above 5000
  Regular = 12 plus months AND spending below 5000
  New = less than 12 months history

Step 6 = Customer Report VIEW
- Production-ready SQL VIEW
- VIP Regular New segmentation
- Age segmentation
- Recency average order value
- Average monthly spend KPIs

Step 7 = Product Report VIEW
- Production-ready SQL VIEW
- High Performer Mid Range Low Performer
- Revenue segmentation
- Recency average order revenue

Skills Demonstrated:
- Window Functions LAG SUM AVG RANK
- CTEs complex multi-step queries
- DATETRUNC FORMAT for time analysis
- CAST for accurate division
- CREATE VIEW for production reporting
- Advanced customer and product segmentation

---

### Project 6 - Data Professional Survey Dashboard
Tool: Power BI Desktop

Problem Solved:
Analyze what 630 data professionals worldwide
think about salary satisfaction job roles
and preferred programming languages.

What I Did:
Data Cleaning in Power Query:
- Split job title column by left parenthesis
- Split salary range column by digit to non-digit
- Replaced k and minus with blank values
- Created custom average salary column
- Changed data types to Whole Number
- Used duplicate column to keep original safe

Dashboard Built:
- 2 KPI Cards: 630 survey takers and age 29.87
- Stacked Bar Chart: average salary by job title
- Stacked Column Chart: favourite programming language
- Tree Map: country distribution of respondents
- 2 Gauge Charts: work-life and salary satisfaction
- Donut Chart: male vs female salary comparison

Key Insights Found:
- Python = most preferred language by far
- Data Scientist = highest paid role
- Data Analyst = among lower paid roles
- Salary satisfaction = 4.27 out of 10
  Most professionals unhappy with pay
- Work-life satisfaction = 5.74 out of 10
- United States = most respondents
- Males earn slightly more than females

Skills Demonstrated:
- Power Query data cleaning Split Replace Custom
- DAX measures for custom KPIs
- Multiple visual types
- Dashboard design and color theming
- Business insight generation
---

## KEY NUMBERS TO REMEMBER

| Project | Key Number |
|---------|-----------|
| Sales Dashboard | 2823 rows 10 pivot tables |
| Pizza Dashboard | 48620 rows dollar 817860 revenue |
| EDA Project | 6 step methodology 3 tables |
| Data Cleaning | 4 step pipeline real layoffs data |
| Advanced SQL | 7 analytical techniques 2 SQL Views |
| Power BI Survey | 630 respondents 8 visuals |
| GitHub Commits | 50 plus consecutive days |

---

## FINAL CHECKLIST FOR INTERVIEW

Before Interview:
- Resume printed and ready              ✅
- GitHub profile checked                ✅
- All projects explained and practiced  ✅
- Key numbers memorized                 ✅
- Common questions practiced            ✅

During Interview:
- Start with problem statement
- Mention key numbers always
- Give key insights found
- Mention GitHub link confidently
- Show enthusiasm for learning

If Asked Something Unknown:
I have not learned that specific topic yet
but I am learning something new every day
and I am confident I can pick it up quickly.

---

## Power BI Learning Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 to 3 | Data Loading Power Query Charts | Done |
| Day 4 | First Project Data Professional Survey | Done |
| Day 5 to 8 | Components Charts Data Model Schema | Done |
| Day 9 to 11 | DAX Deep Dive All Functions | Done |
| Day 12 to 15 | Airbnb Project Building | Done |
| Day 16 to 18 | Complete Revisions | Done |
| Day 19 | Dashboard Explanation Practice | Done |
| Day 20 | Interview Preparation | Done |

---

## Summary - What I Did Today

- Practiced explaining all 7 projects
- Prepared answers for 8 common questions
- Revised all key technical concepts
- Memorized key project numbers
- Practiced dashboard walkthrough method
- Prepared GitHub talking points
- Completed full interview preparation
- Ready for Data Analyst interview!

---

## ALL THE BEST FOR THE INTERVIEW PARAS!

You have:
- 7 real projects built from scratch
- 50 plus days of daily practice
- GitHub with complete portfolio
- Professional ATS friendly resume
- Deep knowledge of SQL Excel Power BI
