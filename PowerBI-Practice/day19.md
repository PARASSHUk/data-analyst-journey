# Power BI - Day 19 Learning Notes
## Topic: Complete Revision of Power BI
##         and Dashboard Explanation Practice

---

## What I Did Today

- Complete revision of all Power BI topics
- Practiced how to explain a dashboard
- Revised all DAX functions
- Revised all chart types
- Revised data model concepts
- Revised both completed projects
- Strengthened knowledge before
  completing Airbnb project

---

## HOW TO EXPLAIN A DASHBOARD

### The Right Way to Walk Through a Dashboard

#### Step 1 - Start with the Title
- Tell what the dashboard is about
- Who it is for and what problem it solves
- Example:
  This is a Pizza Sales Dashboard
  built to help the business understand
  sales performance trends and
  identify best and worst selling products

#### Step 2 - Explain the KPI Cards
- Walk through each KPI card
- Explain what each number means
- Example:
  Total Revenue is 8 lakh 17 thousand rupees
  which is the total money earned in one year
  Average Order Value is 38 rupees
  meaning each order is worth 38 rupees on average

#### Step 3 - Explain Each Chart
- Describe what the chart shows
- Give the key insight from the chart
- Example:
  This bar chart shows daily order trends
  Friday has the highest orders at 3538
  which tells us weekends drive most business

#### Step 4 - Connect Charts Together
- Show how different visuals relate
- Use slicers to demonstrate interactivity
- Example:
  When I click on Friday in this chart
  all other visuals update to show
  only Friday data automatically

#### Step 5 - End with Key Insights
- Summarize the most important findings
- Give business recommendations
- Example:
  Based on this dashboard I recommend
  running promotions on Friday evenings
  because that is when most orders happen

---

## COMPLETE REVISION - POWER BI JOURNEY

---

### Power Query Revision

#### Data Loading
- Excel CSV JSON XML files loaded
- SQL Server MySQL databases connected
- Import Mode = data loads into Power BI
- Live Connection = real-time database access

#### Key Transformations Mastered
- Remove Top Bottom Empty Rows
- First Row as Header
- Remove Columns and Rename Columns
- Transpose and Unpivot Columns
- Split Column by Delimiter
- Replace Values for data cleaning
- Fill Up and Fill Down for Nulls
- Change Data Types
- Format Text Upper Lower Proper
- Statistical operations on columns
- Standard Add Subtract Multiply Divide
- Date operations Month Quarter Year
- Merge Columns with custom separator
- Conditional Column with IF logic
- Custom Column with formula
- Append = adds rows (SQL UNION ALL)
- Merge = adds columns (SQL JOIN)

---

### DAX Functions Revision

#### Aggregate Functions
- SUM = total of column
- AVERAGE = average of column
- MIN = minimum value in column
- MAX = maximum value in column
- COUNT = count all non-blank values
- DISTINCTCOUNT = count unique values only

#### Iterator X Functions
- SUMX = iterate row by row then sum
- AVERAGEX = iterate row by row then average
- MINX = iterate row by row find minimum
- MAXX = iterate row by row find maximum
- Rule = always write Table first then Expression

#### Filter Functions
- CALCULATE = most powerful DAX function
  Changes or overrides filter context
  CALCULATE(Expression, Filter)
- ALL = removes all filters completely
- ALLSELECTED = keeps user slicer selections
- ALLEXCEPT = keeps only specified columns
- FILTER = returns rows matching condition
- CROSSFILTER = enables bidirectional filtering

#### Logical Functions
- IF(condition, true, false)
- AND(cond1, cond2)
- OR(cond1, cond2)
- SWITCH(TRUE(), cond1, result1, else)
- NOT(condition)

#### Text Functions
- CONCATENATE(text1, text2)
- LEFT RIGHT MID for text extraction
- UPPER LOWER for case conversion

#### Date Functions
- TODAY NOW DATE
- YEAR MONTH DAY
- DATEDIFF WEEKDAY

#### Advanced DAX
- RANKX(ALL(col), measure, , DESC)
  Dynamic ranking with global context
- VALUES(col)
  Unique values in current filter context
- VAR variable = expression
  RETURN result_using_variable
  Store and reuse complex expressions

#### Most Used Formula Patterns

Percentage Contribution:
Sales % =
DIVIDE(
    SUM(Sales[Amount]),
    CALCULATE(SUM(Sales[Amount]), ALL(Sales))
)

Cumulative Measure:
Cumulative =
VAR currentRank =
    MAXX(VALUES(table[col]), [rank measure])
RETURN
    CALCULATE(
        [total measure],
        FILTER(
            ALL(table[col]),
            [rank measure] <= currentRank
        )
    )

Top N Filter Rank:
City Rank =
RANKX(ALL(listings[city]), [Listing Count], , DESC)

---

### Evaluation Context Revision

#### Row Context
- Calculates row by row
- Created by Calculated Columns and SUMX
- Scope = one row at a time

#### Filter Context
- Calculates on filtered dataset
- Created by Slicers Visuals CALCULATE
- Scope = entire filtered data

#### Context Transition
- CALCULATE converts row context to filter context
- This is why calculated columns behave differently

---

### All Charts Revision

| Chart | Best Use Case |
|-------|---------------|
| Bar Chart | Long category names horizontal |
| Column Chart | Time-based vertical comparison |
| Stacked Bar | Category contribution horizontal |
| Stacked Column | Category contribution vertical |
| 100% Stacked | Percentage proportions |
| Line Chart | Trends over time dates |
| Area Chart | Volume and trend combined |
| Line Clustered Column | Two metrics in one chart |
| Pie Chart | Parts of whole few categories |
| Donut Chart | Parts of whole with center KPI |
| Tree Map | Hierarchical size comparison |
| Scatter Chart | Correlation between two measures |
| Map Chart | Geographic bubble distribution |
| Field Map | Geographic region shading |
| Funnel Chart | Process stages flow |
| Gauge Chart | Single value vs target |
| KPI Chart | Actual vs target with trend axis |
| Card | Single important number |
| Multi Row Card | Multiple values comparison |
| Table | Exact detailed row data |
| Matrix | Cross-tab multi-dimensional |
| Hierarchical Matrix | Multi-level drill down |
| Slicer | Interactive filter control |

---

### Data Model Revision

#### Star Schema
- Central Fact Table has measures and metrics
- Dimension Tables have descriptions
- Simpler faster most used in Power BI

#### Snowflake Schema
- Dimension tables further normalized
- More tables less redundancy
- Better for very large databases

#### Relationship Types
- One to One = both tables have unique values
- One to Many = most common in Power BI
- Many to Many = needs bridge table

#### Relationship Lines
- Solid line = Active relationship
- Dotted line = Inactive relationship
- Single arrow = one directional filter
- Both arrows = bidirectional filter

---

### Dashboard Design Revision

#### Layout Rules
- Title = ALWAYS the largest text
- Logo = ALWAYS in corners
- KPI cards = just below title
- Charts = main body area
- Slicers = left side or top

#### KPI Card Formatting Rules
- Thousand Separator = always ON
- Display Units = always set to NONE
- Same exact size for all KPI cards
- Format Align to space cards equally
- Padding adjustment for clean look

#### Color Palette Rules
- Maximum 2 to 4 colors only
- Too many colors = confusing
- Stick to company brand colors
- Use shades for variations

---

### Projects Revision

#### Project 1 - Data Professional Survey
- Tool: Power BI Desktop
- Source: Maven Analytics 630 respondents
- Key Cleaning: Split columns Replace values
  Custom average salary column formula
- Visuals Built: KPI Cards Stacked Bar
  Stacked Column Tree Map Gauge Donut
- Key Insights:
  Python = most preferred language
  Data Scientist = highest paid role
  Salary satisfaction = 4.27 out of 10
  Work-life balance = 5.74 out of 10
  United States = most respondents
  Males earn slightly more than females

#### Project 2 - Airbnb Dashboard
- Tool: Power BI Desktop
- Source: Maven Analytics Listings and Reviews
- Relationship: One to Many on Listing ID
- Bidirectional crossfilter applied
- 5 KPI Cards: Listings Cities Hosts
  Property Types Reviews
- Line Chart: New listings growth over time
  divided into 6 phases with insights
- Super Host vs Not Super Host measure
- RANKX City Ranking measure
- VAR VALUES MAXX Cumulative Listings
- Status: In Progress almost complete


---

## Summary - What I Did Today

- Learned how to explain a dashboard properly
- Practiced 5 step dashboard walkthrough
- Revised all Power Query transformations
- Revised all 25+ DAX functions
- Revised all 20+ chart types
- Revised Star vs Snowflake Schema
- Revised relationship types and directions
- Revised Dashboard Design Principles
- Revised both projects completely

---

## Tomorrow I Will

- Complete Airbnb Dashboard remaining visuals
- Build map for global listing distribution
- Build Top 10 Cities chart using RANKX
- Add review trend analysis visual
- Finalize and upload Airbnb project to GitHub
- Start Python learning phase!