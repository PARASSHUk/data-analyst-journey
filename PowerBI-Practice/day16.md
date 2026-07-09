# Power BI - Day 16 Learning Notes
## Topic: Complete Power BI Revision
##         All Topics from Day 1 to Day 15

---

## What I Did Today

- Complete revision of all Power BI topics
- Revised Data Loading and Power Query
- Revised all DAX Functions
- Revised all Visualization Types
- Revised Data Model and Relationships
- Revised Dashboard Design Principles
- Revised both completed projects

---

## REVISION - DAY 1 TO DAY 5 BASICS

### Data Loading
- Loaded Excel and CSV data into Power BI
- Used Power Query for all transformations
- Applied Steps panel tracks all changes
- Close and Apply to save all changes

### Power Query Operations
- Remove Top Rows and Bottom Rows
- Set First Row as Headers
- Remove Empty Rows
- Remove Rows with Specific Text
- Remove Columns
- Rename Columns
- Transpose Table
- Unpivot Columns
- Split Column by Delimiter
- Replace Values
- Fill Up and Fill Down for Nulls
- Change Data Types
- Extract Character Length
- Format Text Upper Lower Proper
- Statistical operations Sum Avg Min Max
- Standard operations Add Subtract Multiply
- Date operations Month Quarter Year Day
- Merge Columns with separator
- Add Conditional Column
- Add Duplicate Column
- Custom Column with formula

### Relationships
- Connect tables using common columns
- Model View shows all relationships visually
- Solid line = Active relationship
- Dotted line = Inactive relationship
- Single arrow = one directional filter
- Both arrows = bidirectional filter
- Autodetect tool to find relationships
- Manual drag and drop to create

---

## REVISION - DAY 2 AND DAY 9 TO DAY 11 DAX

### What is DAX
- Data Analysis Expressions
- Formula language for Power BI Excel SSAS
- Creates Calculated Columns Measures and Tables

### Evaluation Contexts
- Row Context = calculates row by row
  Created by Calculated Columns and SUMX
- Filter Context = calculates on filtered data
  Created by Slicers Visuals CALCULATE
- Context Transition = CALCULATE converts
  row context to filter context

### Calculated Column vs Measure

| Feature | Calculated Column | Measure |
|---------|------------------|---------|
| Storage | Stored in table | Calculated on demand |
| Context | Row context | Filter context |
| Use Case | Row level labels | KPI aggregations |
| Performance | Uses storage | Optimized |

### Implicit vs Explicit Measures
- Implicit = auto-created by Power BI
- Explicit = manually created by user
- Always use Explicit Measures for best practice

---

## REVISION - ALL DAX FUNCTIONS

### Aggregate Functions
- SUM = total of column
- AVERAGE = average of column
- MIN = minimum of column
- MAX = maximum of column
- COUNT = count non-blank values
- DISTINCTCOUNT = count unique values

### Iterator Functions (X Functions)
- SUMX = sum after row-wise expression
- AVERAGEX = average after row-wise expression
- MINX = minimum after row-wise expression
- MAXX = maximum after row-wise expression
- Rule: Always write Table first then Expression

### Filter Functions
- CALCULATE = modify filter context
  CALCULATE(Expression, Filter)
- ALL = remove ALL filters from table
- ALLSELECTED = keep user slicer selections
- ALLEXCEPT = keep only specified columns
- CROSSFILTER = enable filter between
  indirectly related tables
- FILTER = return filtered table

### Logical Functions
- IF = single condition check
- AND = all conditions must be true
- OR = any one condition must be true
- SWITCH = multiple value matching
- SWITCH(TRUE()) = for range comparisons
- NOT = reverse boolean value

### Text Functions
- CONCATENATE = join two strings
- LEFT = extract from left side
- RIGHT = extract from right side
- MID = extract from middle
- UPPER = convert to uppercase
- LOWER = convert to lowercase

### Date and Time Functions
- TODAY = current date
- NOW = current date and time
- DATE = create date from parts
- YEAR MONTH DAY = extract date parts
- DATEDIFF = days months years between dates
- WEEKDAY = day number from date

### Ranking Function
- RANKX(ALL(table), measure, , DESC)
- Always use ALL() for global ranking
- Two commas when skipping Value argument
- Value argument = rank an external value
- Use with filter where rank <= N for Top N

### Percentage Formula
Sales Percentage =
DIVIDE(
    SUM(Sales[Amount]),
    CALCULATE(SUM(Sales[Amount]), ALL(Sales))
)

---

## REVISION - DAY 6 AND DAY 7 VISUALIZATIONS

### All Chart Types and When to Use

| Chart | Best For |
|-------|----------|
| Bar Chart | Horizontal category comparison |
| Column Chart | Vertical time-based comparison |
| Stacked Bar | Category contribution horizontal |
| Stacked Column | Category contribution vertical |
| 100% Stacked | Percentage proportions |
| Line Chart | Trends over time or dates |
| Area Chart | Volume and trends combined |
| Line and Clustered Column | Two metrics in one visual |
| Pie Chart | Parts of whole few categories |
| Donut Chart | Parts of whole with center KPI |
| Tree Map | Hierarchical size comparison |
| Scatter Chart | Correlation between two measures |
| Map Chart | Geographic bubble distribution |
| Field Map | Geographic shading by region |
| Funnel Chart | Process stages flow |
| Gauge Chart | Single value vs target |
| KPI Chart | Actual vs target with trend |
| Card | Single important KPI number |
| Multi Row Card | Multiple values comparison |
| Table | Exact row level data |
| Matrix | Cross-tab multi-dimensional |
| Hierarchical Matrix | Multi-level drill down |
| Slicer | Interactive filter control |

---

## REVISION - DAY 8 DATA MODEL

### Star Schema
- Central Fact Table = measures and metrics
- Surrounding Dimension Tables = descriptions
- Simple fast and most used in Power BI

### Snowflake Schema
- Dimension tables further normalized
- More tables less redundancy
- More complex but better for large databases

### Primary Key vs Foreign Key
- Primary Key = uniquely identifies each row
- Foreign Key = references another table key
- Composite Primary Key = two or more columns

### Relationship Types
- One to One = both tables have unique values
- One to Many = most common in Power BI
- Many to Many = requires bridge table

---

## REVISION - DAY 12 POWER BI SERVICE

### Power BI Service Workflow
1. Create reports in Power BI Desktop
2. Publish to Power BI Service
3. Set up data refresh and security
4. Share and collaborate with team
5. Access from anywhere on any device

### Connection Modes
- Import Mode = data loaded into Power BI
- Live Connection = connects to live dataset
- Direct Query = queries database in real-time

### Append vs Merge
- Append = adds ROWS (like SQL UNION ALL)
- Merge = adds COLUMNS (like SQL JOIN)

---

## REVISION - DASHBOARD DESIGN PRINCIPLES

### Consistency Rules
- Same font family throughout
- Consistent color palette (2 to 4 colors)
- Title = largest text on dashboard
- No other text equal or larger than title

### Layout Rules
- Title at top center
- Logo always in corners
- KPI cards just below title
- Charts in main body area
- Slicers on left or top

### KPI Card Formatting
- Always set Thousand Separator ON
- Always set Display Units to NONE
- Set exact same size for all KPI cards
- Use Format Align to space cards evenly

---

## REVISION - PROJECTS COMPLETED

### Project 1 - Data Professional Survey Dashboard
- Dataset: 630 survey respondents from Maven
- Cleaned in Power Query (Split Replace Custom Column)
- 8 Visuals: Cards KPI Stacked Bar Stacked Column
  Tree Map Gauge Charts Donut Chart
- Key Insight: Python most preferred
  Salary satisfaction = 4.27 out of 10

### Project 2 - Airbnb Dashboard (In Progress)
- Dataset: Listings and Reviews from Maven
- One to Many relationship on Listing ID
- Bidirectional crossfilter applied
- 5 KPI cards completed
- Line chart with 6 growth phases
- Super Host vs Not Super Host measure
- RANKX for City Ranking measure
- Still building: Map Top Cities Reviews Price

---

## COMPLETE POWER BI LEARNING SUMMARY

### Skills Mastered
- Data Loading from multiple sources          ✅
- Power Query transformations 14+ methods     ✅
- All Chart Types 20+ visualizations          ✅
- DAX Functions 20+ functions                 ✅
- Evaluation Contexts Row and Filter          ✅
- Calculated Columns and Measures             ✅
- Data Model Star and Snowflake Schema        ✅
- Relationships and Crossfilter               ✅
- Dashboard Design Principles                 ✅
- Power BI Service Workflow                   ✅
- Conditional Formatting with Icons           ✅
- Drill Down and Hierarchy                    ✅
- RANKX for Dynamic Ranking                   ✅
- Bins Lists and Groups                       ✅
- Custom Visuals Marketplace                  ✅


---

## Summary - What I Did Today

- Complete revision of all Power BI topics
- Revised Power Query 14+ operations
- Revised all 20+ DAX functions
- Revised all 20+ chart types and use cases
- Revised Data Model Star vs Snowflake Schema
- Revised Relationship types and crossfilter
- Revised Dashboard Design Principles
- Revised both completed Power BI projects
- Strengthened all concepts before next project

---

## Tomorrow I Will

- Complete Airbnb Dashboard
- Build remaining visuals for Airbnb
- Add map and top cities chart
- Add review trend and price analysis
- Add slicers for interactivity
- Upload Airbnb project to GitHub
- Start next Power BI project or Python!