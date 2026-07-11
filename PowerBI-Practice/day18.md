# Power BI - Day 18 Learning Notes
## Topic: Complete Power BI Revision
## All Topics from Day 1 to Day 17

---

## What I Did Today

- Complete revision of all Power BI topics
- Revised Power Query operations
- Revised all DAX functions
- Revised all visualization types
- Revised data model and schemas
- Revised dashboard design rules
- Revised advanced DAX concepts
- Strengthened all concepts before
  completing Airbnb project

---

## QUICK REVISION - POWER QUERY

### Data Loading
- Excel CSV JSON XML files
- SQL Server MySQL databases
- Online services and APIs
- Import Mode vs Live Connection

### Key Transformations
- Remove Top Bottom Rows
- First Row as Header
- Remove Empty Rows
- Remove Rows by Text Filter
- Remove Columns
- Rename Columns
- Transpose Table rows to columns
- Unpivot Columns wide to long
- Split Column by Delimiter
- Replace Values
- Fill Up and Fill Down for Nulls
- Change Data Types
- Extract Character Length
- Format Text Upper Lower Proper
- Statistical Sum Avg Min Max
- Standard Add Subtract Multiply Divide
- Date operations Month Quarter Year
- Merge Columns with separator
- Conditional Column with IF logic
- Duplicate Column
- Custom Column with formula
- Append = adds rows like SQL UNION ALL
- Merge = adds columns like SQL JOIN
- Close and Apply to save all changes

---

## QUICK REVISION - ALL DAX FUNCTIONS

### Aggregate Functions
- SUM(col) = total of entire column
- AVERAGE(col) = average of column
- MIN(col) = minimum value
- MAX(col) = maximum value
- COUNT(col) = count non-blank values
- DISTINCTCOUNT(col) = count unique values

### Iterator Functions
- SUMX(table, expression) = sum after row calc
- AVERAGEX(table, expression) = avg after row calc
- MINX(table, expression) = min after row calc
- MAXX(table, expression) = max after row calc
- Rule: Table first then Expression

### Filter and Context Functions
- CALCULATE(expr, filter) = modify filter context
- ALL(table or col) = remove all filters
- ALLSELECTED(col) = keep slicer selections
- ALLEXCEPT(table, col) = keep specified col only
- FILTER(table, condition) = filter rows
- CROSSFILTER(col1, col2, Both) = bidirectional

### Logical Functions
- IF(condition, true, false)
- AND(cond1, cond2)
- OR(cond1, cond2)
- SWITCH(TRUE(), cond1, result1, cond2, result2)
- NOT(condition)

### Text Functions
- CONCATENATE(text1, text2)
- LEFT(text, num_chars)
- RIGHT(text, num_chars)
- MID(text, start, num_chars)
- UPPER(text)
- LOWER(text)

### Date and Time Functions
- TODAY() = current date
- NOW() = current date and time
- DATE(year, month, day)
- YEAR(date) MONTH(date) DAY(date)
- DATEDIFF(start, end, unit)
- WEEKDAY(date, mode)

### Advanced DAX Functions
- RANKX(ALL(col), measure, , DESC)
  = rank cities or products by measure
  = always use ALL for global ranking
  = two commas when skipping Value argument

- VALUES(col)
  = unique values in current filter context
  = respects active filters

- VAR variable = expression
  RETURN result
  = store temporary values
  = makes complex formulas readable
  = calculated only once for performance

### Percentage Formula
Sales % =
DIVIDE(
    SUM(Sales[Amount]),
    CALCULATE(SUM(Sales[Amount]), ALL(Sales))
)

### Cumulative Measure Pattern
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

---

## QUICK REVISION - EVALUATION CONTEXTS

### Row Context
- Applies when calculation is row by row
- Created by Calculated Columns and SUMX
- Scope = one row at a time

### Filter Context
- Applies when filters affect calculation
- Created by Slicers Visuals CALCULATE
- Scope = entire filtered dataset

### Context Transition
- CALCULATE converts row context to filter context
- Happens inside Calculated Columns
- Why column does not return grand total

### Calculated Column vs Measure

| Feature | Calculated Column | Measure |
|---------|------------------|---------|
| Storage | Stored in model | On demand |
| Context | Row context | Filter context |
| Use Case | Labels categories | KPI aggregations |
| Performance | Uses memory | Optimized |

---

## QUICK REVISION - ALL CHARTS

| Chart | Best For |
|-------|----------|
| Bar | Horizontal category comparison |
| Column | Vertical time comparison |
| Stacked Bar | Contribution horizontal |
| Stacked Column | Contribution vertical |
| 100% Stacked | Percentage proportions |
| Line | Trends over time |
| Area | Volume with trend |
| Line and Clustered Column | Two metrics combined |
| Pie | Parts of whole |
| Donut | Parts of whole with center |
| Tree Map | Hierarchy size comparison |
| Scatter | Correlation two measures |
| Map | Geographic bubbles |
| Field Map | Geographic shading |
| Funnel | Process stages |
| Gauge | Value vs target |
| KPI | Actual vs target with trend |
| Card | Single KPI number |
| Multi Row Card | Multiple values |
| Table | Exact row data |
| Matrix | Cross-tab dimensions |
| Hierarchical Matrix | Multi-level drill down |
| Slicer | Interactive filter |

---

## QUICK REVISION - DATA MODEL

### Star Schema
- Central Fact Table = measures metrics
- Surrounding Dimension Tables = descriptions
- Simpler faster most used in Power BI

### Snowflake Schema
- Dimension tables further normalized
- More tables less redundancy
- More complex for very large databases

### Relationship Types
- One to One = both unique values
- One to Many = most common in Power BI
- Many to Many = requires bridge table

### Relationship Lines
- Solid line = Active relationship
- Dotted line = Inactive relationship
- Single arrow = one directional filter
- Both arrows = bidirectional filter

### Creating Relationships
- Autodetect = Power BI finds automatically
- Manual = drag and drop in Model View
- CROSSFILTER DAX = for indirect connections

---

## QUICK REVISION - DASHBOARD DESIGN

### Layout Rules
- Title at top center = LARGEST text
- Logo always in corners
- KPI cards just below title
- Charts in main body
- Slicers on left or top

### KPI Card Formatting
- Thousand Separator = always ON
- Display Units = always NONE
- Same exact size for all cards
- Use Format Align to space evenly
- Adjust padding for breathing room

### Color Palette Rules
- Maximum 2 to 4 colors per dashboard
- Stick to company brand colors
- Too many colors = confusing
- Use shades of same color for variations

### Text Size Hierarchy
- Title = largest (no other text equal or bigger)
- Section Headers = medium
- Chart Labels = smaller
- Data Labels = smallest

### Page Size Options
- 4:3 ratio = traditional
- 16:9 ratio = widescreen default
- Custom = any size needed

---

## QUICK REVISION - POWER BI SERVICE

### Workflow
1. Create in Power BI Desktop
2. Publish to Power BI Service
3. Set up data refresh and security
4. Share and collaborate with team
5. Access from anywhere on any device

### Desktop vs Service

| Feature | Desktop | Service |
|---------|---------|---------|
| Purpose | Build reports | Share reports |
| Location | Local computer | Cloud Azure |
| Access | Windows app | Any browser |
| Data Refresh | Manual | Automatic |
| Sharing | No | Yes |

---

## QUICK REVISION - PROJECTS COMPLETED

### Project 1 - Data Professional Survey
- Source: Maven Analytics (630 respondents)
- Cleaned data: Split columns Replace values
  Custom average salary column
- Visuals: KPI Cards Stacked Bar Stacked Column
  Tree Map Gauge Charts Donut Chart
- Key Insights:
  Python = most preferred language
  Data Scientist = highest paid role
  Salary satisfaction = 4.27 out of 10
  Work-life satisfaction = 5.74 out of 10

### Project 2 - Airbnb Dashboard (In Progress)
- Source: Maven Analytics (Listings + Reviews)
- Relationship: One to Many on Listing ID
- Bidirectional crossfilter applied
- 5 KPI cards: Listings Cities Hosts
  Property Types Reviews
- Line chart with 6 growth phases labeled
- Super Host vs Not Super Host measure
- RANKX City Ranking measure
- VAR VALUES MAXX Cumulative Listings measure
- Still building: Map Top Cities Reviews

---

## ALL DAX FUNCTIONS MASTERED

| Function | Type | Purpose |
|----------|------|---------|
| SUM | Aggregate | Column total |
| AVERAGE | Aggregate | Column average |
| MIN MAX | Aggregate | Min Max values |
| COUNT | Aggregate | Non-blank count |
| DISTINCTCOUNT | Aggregate | Unique count |
| SUMX AVERAGEX | Iterator | Row expression |
| MINX MAXX | Iterator | Row min max |
| CALCULATE | Filter | Modify context |
| ALL | Filter | Remove filters |
| ALLSELECTED | Filter | Keep slicer |
| ALLEXCEPT | Filter | Keep specified |
| FILTER | Filter | Row condition |
| CROSSFILTER | Filter | Bidirectional |
| IF AND OR | Logical | Conditions |
| SWITCH | Logical | Multiple values |
| NOT | Logical | Reverse boolean |
| CONCATENATE | Text | Join strings |
| LEFT RIGHT MID | Text | Extract text |
| UPPER LOWER | Text | Change case |
| TODAY NOW DATE | Date | Date values |
| YEAR MONTH DAY | Date | Extract parts |
| DATEDIFF WEEKDAY | Date | Date math |
| RANKX | Ranking | Dynamic rank |
| VALUES | Context | Unique in context |
| VAR RETURN | Variable | Store expression |
| DIVIDE | Math | Safe division |


---

## Summary - What I Did Today

- Complete revision of all 18 days of Power BI
- Revised all Power Query transformations
- Revised all 25+ DAX functions
- Revised all 20+ chart types
- Revised Star vs Snowflake Schema
- Revised Relationship types and directions
- Revised Dashboard Design Principles
- Revised Power BI Service workflow
- Revised both completed projects
- Revised advanced VAR VALUES RANKX concepts
---

## Tomorrow I Will

- Complete Airbnb Dashboard remaining visuals
- Build map for global distribution
- Build Top 10 Cities using RANKX filter
- Add review trend chart
- Complete and upload Airbnb project
- Start Python learning phase or new project!