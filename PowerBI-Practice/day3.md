# Power BI - Day 3 Learning Notes
## Topic: Revision of Day 1 and Day 2 and
##         Types of Visualizations in Power BI

---

## What I Did Today

- Complete revision of Power BI Day 1 and Day 2
- Learned new visualization types in Power BI
- Learned important relationship line rule
- Strengthened understanding of when to use
  which chart type

---

## REVISION OF DAY 1 AND DAY 2

### Day 1 Revision
- Loaded Excel data into Power BI Desktop
- Used Power Query for data transformation
  Removed top rows
  Set first row as header
  Removed empty rows
  Removed specific text rows
  Removed unwanted columns
  Unpivoted columns for proper structure
  Fixed data types
- Built Stacked and Clustered charts
- Added Legend for colors
- Added data labels with exact values
- Created relationships between tables
- Understood single vs bidirectional arrows

### Day 2 Revision
- Created DAX Measures using New Measure
- COUNT for counting orders
- SUM for totaling units sold
- SUM vs SUMX difference
  SUM = aggregates entire column at once
  SUMX = iterates row by row then sums
- Profit calculation using SUMX
- WEEKDAY function for day number from date
- Conditional IF for order size labeling
- Drill Down by adding layers to X-Axis
- Conditional Formatting with color rules
- Bins for grouping numeric and date data
- Lists for manual category grouping
- CTRL + click to group two values together

---

## TYPES OF VISUALIZATIONS IN POWER BI

### 1. Stacked Bar Chart

- Horizontal version of stacked columns
- Categories are placed on Y-Axis
- Values are placed on X-Axis
- Best use cases:
  When there are too many categories
  When category names are very long
  When horizontal layout reads better
- Example: Sales by product category
  where product names are long text

### 2. Stacked Column Chart

- Vertical bars with categories stacked
- Categories on X-Axis values on Y-Axis
- Shows total value AND contribution
  of each category in one visual
- Best use cases:
  Comparing totals across time periods
  Showing category contribution to total
- Example: Monthly revenue by department

### 3. 100% Stacked Column Chart

- Shows percentage contribution not actual values
- Each column always goes to 100%
- Each category is stacked one on top of another
- Best use cases:
  When you care about proportions not totals
  Showing market share of products
  Showing survey response distribution
- Example: Percentage of sales by product type

### 4. Line Chart

- Best visualization for date and time data
- Shows trends clearly over time periods
- Connects data points with a continuous line
- Best use cases:
  When X-Axis has dates or time values
  Showing growth or decline over time
  Identifying seasonal patterns
  Comparing trends of multiple categories
- Example: Monthly sales trend over a year
- Example: Daily orders over a week

---

## IMPORTANT RULE - RELATIONSHIP LINES

### Active Relationship
- Shown as a SOLID straight line between tables
- Data filters flow through this relationship
- Used automatically in all calculations
- Only one active relationship between two tables

### Inactive Relationship
- Shown as a DOTTED line between tables
- Does NOT automatically filter data
- Must be activated manually using
  USERELATIONSHIP function in DAX
- Useful when you need alternate relationships

### Visual Guide
- SOLID LINE   = Active Relationship   ✅
- DOTTED LINE  = Inactive Relationship ⚠️

---

## COMPLETE CHART SELECTION GUIDE

| Chart Type | When to Use | When NOT to Use |
|------------|-------------|-----------------|
| Stacked Bar | Long category names many categories | When precise comparison needed |
| Stacked Column | Show total and contribution together | Too many categories |
| 100% Stacked | Show percentages and proportions | When actual values matter |
| Line Chart | Date and time trends | Non-sequential categories |
| Clustered Bar | Compare values side by side | Showing contribution to total |
| Clustered Column | Compare multiple categories | Too many groups |
| Pie Chart | Show parts of a whole few categories | More than 5-6 categories |
| Donut Chart | Same as pie with center space | Too many slices |
| Card | Show single KPI number | Multiple values |

---

## KEY CONCEPTS REVISED TODAY

### Power Query Summary
- All data transformations happen here
- Applied Steps panel tracks all changes
- Changes apply every time data refreshes
- Non-destructive original data stays safe

### DAX Summary
- DAX = Data Analysis Expressions
- Used to create Measures and Columns
- Measures = calculated on demand aggregated
- Columns = stored row by row in table
- SUM = simple column total
- SUMX = row by row expression then total
- COUNT = count non-empty values
- WEEKDAY = extract day number from date
- IF = conditional logic same as Excel

### Relationships Summary
- Connect tables using common columns
- Model View shows all relationships visually
- Single arrow = one directional filter
- Both arrows = bidirectional filter
- Solid line = active relationship
- Dotted line = inactive relationship

---

## POWER BI LEARNING PROGRESS

### Day 1 Topics
- Data loading from Excel             ✅
- Power Query transformations          ✅
- Stacked and Clustered charts         ✅
- Table relationships                  ✅

### Day 2 Topics
- DAX Measures - COUNT SUM SUMX        ✅
- WEEKDAY and IF functions             ✅
- Drill Down feature                   ✅
- Conditional Formatting               ✅
- Bins and Lists grouping              ✅

### Day 3 Topics
- Complete revision Day 1 and Day 2    ✅
- Stacked Bar Chart                    ✅
- 100% Stacked Column Chart            ✅
- Line Chart for date data             ✅
- Active vs Inactive relationship lines ✅

---

## Summary - What I Did Today

- Complete revision of all Power BI topics
- Learned Stacked Bar Chart use cases
- Learned 100% Stacked Column Chart
- Learned Line Chart for date analysis
- Learned Active vs Inactive relationship
  solid line vs dotted line rule

---

## Tomorrow I Will Learn

- More visualization types
- Cards and KPI visuals
- Slicers and filters in depth
- DAX CALCULATE function
- Build a more complete Power BI report
- Continue Power BI learning journey!