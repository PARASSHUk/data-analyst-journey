# Power BI - Day 31 Learning Notes
## Topic: Complete Power BI Revision
##         All Topics Consolidated
---

## What I Did Today

- Complete revision of all 30 days
  of Power BI learning
- Revised Power Query operations
- Revised all DAX functions
- Revised all visualization types
- Revised Data Model concepts
- Revised Dashboard Design principles
- Revised both completed projects
- Maintaining learning during internship

---

## POWER QUERY - COMPLETE REVISION

### Data Sources
- Files: Excel CSV JSON XML
- Databases: SQL Server MySQL Oracle
- Online: SharePoint Google Analytics
- Others: APIs Web OData

### Connection Modes
- Import Mode = data loads into Power BI
- Live Connection = real-time database
- Direct Query = queries database live

### All Transformations Mastered
- Remove Top Bottom Empty Rows
- First Row as Header
- Remove and Rename Columns
- Split Column by Delimiter
- Replace Values for cleaning
- Fill Up and Fill Down for Nulls
- Change Data Types
- Transpose rows to columns
- Unpivot columns wide to long
- Merge Columns with separator
- Conditional Column with IF logic
- Custom Column with formula
- Duplicate Column
- Extract Character Length
- Format Upper Lower Proper
- Statistical Sum Avg Min Max
- Standard Add Subtract Multiply Divide
- Date operations Month Quarter Year
- Append = adds rows like SQL UNION ALL
- Merge = adds columns like SQL JOIN
- Close and Apply to save all changes

### Green Line Below Column Name
- Shows data quality of column
- Full green = 100% valid values
- Not full = null values exist
- Shows count of null values

---

## DAX - COMPLETE REVISION

### What is DAX
- Data Analysis Expressions
- Formula language for Power BI
- Creates Calculated Columns
- Creates Measures
- Creates Custom Tables

### Evaluation Contexts

#### Row Context
- Applies row by row
- Created by Calculated Columns
- Created by Iterator functions SUMX
- Scope = one row at a time

#### Filter Context
- Applies to filtered dataset
- Created by Slicers and Visuals
- Created by CALCULATE function
- Scope = entire filtered data

#### Context Transition
- CALCULATE converts row to filter context
- Happens inside Calculated Columns
- Why column does not return grand total

### Calculated Column vs Measure

| Feature | Calculated Column | Measure |
|---------|------------------|---------|
| Storage | Stored in model | On demand |
| Context | Row context | Filter context |
| Use Case | Row labels | KPI calculations |
| Performance | Uses memory | Optimized |
| Best Practice | Use sparingly | Always prefer |

### Implicit vs Explicit Measures
- Implicit = auto created by Power BI
- Explicit = manually created by user
- Always use Explicit for best practice

---

### ALL DAX FUNCTIONS

#### Aggregate Functions
- SUM = total of column
- AVERAGE = average of column
- MIN = minimum value
- MAX = maximum value
- COUNT = count non-blank
- DISTINCTCOUNT = count unique values

#### Iterator X Functions
- SUMX(table, expression)
- AVERAGEX(table, expression)
- MINX(table, expression)
- MAXX(table, expression)
- Rule: Table first then Expression

#### Filter Functions
- CALCULATE(expr, filter)
- ALL(table or col)
- ALLSELECTED(col)
- ALLEXCEPT(table, col)
- FILTER(table, condition)
- CROSSFILTER(col1, col2, Both)
- DIVIDE(numerator, denominator)

#### Logical Functions
- IF(condition, true, false)
- AND(cond1, cond2)
- OR(cond1, cond2)
- SWITCH(TRUE(), cond, result, else)
- NOT(condition)

#### Text Functions
- CONCATENATE(text1, text2)
- LEFT(text, n)
- RIGHT(text, n)
- MID(text, start, num)
- UPPER(text)
- LOWER(text)

#### Date Functions
- TODAY()
- NOW()
- DATE(year, month, day)
- YEAR(date) MONTH(date) DAY(date)
- DATEDIFF(start, end, unit)
- WEEKDAY(date, mode)

#### Advanced Functions
- RANKX(ALL(col), measure, , DESC)
- VALUES(col)
- VAR variable = expression
  RETURN result

---

### KEY FORMULA PATTERNS

#### Percentage Contribution
Sales % =
DIVIDE(
    SUM(Sales[Amount]),
    CALCULATE(SUM(Sales[Amount]), ALL(Sales))
)

#### Cumulative Measure
Cumulative =
VAR currentRank =
    MAXX(VALUES(table[col]), [Rank Measure])
RETURN
    CALCULATE(
        [total measure],
        FILTER(
            ALL(table[col]),
            [Rank Measure] <= currentRank
        )
    )

#### Cumulative Percentage
Cumulative % =
DIVIDE(
    [Cumulative Listings],
    CALCULATE([Total Listing], ALL(listings[city]))
)

#### Top N Filter Using RANKX
City Rank =
RANKX(ALL(listings[city]), [Listing Count], , DESC)
Then filter where City Rank <= 10
for Top 10 cities

---

## ALL CHARTS - COMPLETE REVISION

| Chart | When to Use |
|-------|-------------|
| Bar | Long category names horizontal |
| Column | Time-based vertical bars |
| Stacked Bar | Category contribution horizontal |
| Stacked Column | Category contribution vertical |
| 100% Stacked | Percentage proportions |
| Line | Trends over time dates |
| Area | Volume with line trend |
| Line Clustered Column | Two metrics together |
| Pie | Parts of whole few categories |
| Donut | Parts of whole with center KPI |
| Tree Map | Hierarchy size comparison |
| Scatter | Correlation two numeric measures |
| Map | Geographic bubble distribution |
| Field Map | Geographic region shading |
| Funnel | Process stages flow |
| Gauge | Single value vs target |
| KPI | Actual vs target with trend axis |
| Card | Single important KPI number |
| Multi Row Card | Multiple values together |
| Table | Exact detailed row data |
| Matrix | Cross-tab multi-dimensional |
| Hierarchical Matrix | Multi-level drill down |
| Slicer | Interactive filter control |

---

## DATA MODEL - COMPLETE REVISION

### Star Schema
- Central Fact Table = measures metrics
- Surrounding Dimension Tables = descriptions
- Simpler faster most used in Power BI

### Snowflake Schema
- Dimension tables further normalized
- More tables less redundancy
- Slightly slower more complex
- Better for very large databases

### Star vs Snowflake

| Feature | Star | Snowflake |
|---------|------|-----------|
| Tables | Fewer | More |
| Queries | Faster | Slower |
| Redundancy | More | Less |
| Complexity | Simple | Complex |
| Best For | Most BI projects | Large enterprise |

### Keys and Relationships
- Primary Key = uniquely identifies each row
- Foreign Key = references another table
- Composite Key = two or more columns as key
- One to One = both tables have unique values
- One to Many = most common in Power BI
- Many to Many = needs bridge table

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

## DASHBOARD DESIGN - COMPLETE REVISION

### Layout Rules
- Title = ALWAYS the largest text
- No other text equal or bigger than title
- Logo = ALWAYS in corners
- KPI cards = just below title
- Charts = main body area
- Slicers = left or top

### KPI Card Rules
- Thousand Separator = always ON
- Display Units = always NONE
- Same exact size for all KPI cards
- Format Align to space cards equally
- Adjust padding for clean spacing

### Color Palette Rules
- Maximum 2 to 4 colors per dashboard
- Too many colors = confusing
- Stick to brand or consistent theme
- Format in Data Section for global apply

### Text Size Hierarchy
- Dashboard Title = largest
- Section Headers = medium
- Chart Labels = smaller
- Data Labels = smallest

### Page Size Options
- 4:3 = traditional
- 16:9 = widescreen default
- Custom = any size needed

---

## ADVANCED FEATURES - COMPLETE REVISION

### Drill Down
- Add multiple fields to X-Axis
- Drill Down icon appears on chart
- Click to see next level of detail
- Drill Up to go back to previous level
- Also available in Matrix by column

### Conditional Formatting
- Only on NUMERIC columns
- Background color by value range
- Formula: Min + (Max - Min) x % / 100
- 0-33% = low color
- 33-67% = medium color
- 67-100% = high color

### Bookmarks
- Captures visual visibility state
- Uncheck Data and Current Page
- Check Selected Visuals only
- Link buttons via Action = Bookmark
- Test with CTRL + Click in edit mode
- Great for switching between views

### Pareto Method
- 80% results from 20% causes
- Rank categories highest to lowest
- Calculate cumulative percentage
- Find where cumulative crosses 80%
- Focus on vital few categories

### Bins and Lists
- Bins = group numbers into ranges automatically
- Lists = manually group categories together
- CTRL + Click to group two values

### Custom Visuals
- Available from Power BI Marketplace
- AppSource has many community visuals
- Extends beyond standard chart types

---

## POWER BI SERVICE - REVISION

### Workflow
1. Create in Power BI Desktop
2. Publish to Power BI Service
3. Set up data refresh and security
4. Share and collaborate with team
5. Access from anywhere on any device

### Desktop vs Service

| Feature | Desktop | Service |
|---------|---------|---------|
| Purpose | Build | Share |
| Location | Local | Cloud Azure |
| Access | Windows only | Any browser |
| Data Refresh | Manual | Automatic |
| Sharing | No | Yes |

---

## PROJECTS STATUS

### Project 1 - Data Professional Survey
- Tool: Power BI Desktop
- Key Insight: Python most preferred
  Salary satisfaction 4.27 out of 10

### Project 2 - Airbnb Dashboard
- Tool: Power BI Desktop
- Status: 90% complete
- Completing on Sunday this week
- Remaining: Map Top Cities Slicers
- Key Insight: 2015 peak year
  COVID stopped growth 2019-2020


---

## Summary - What I Did Today

- Revised all 31 days of Power BI learning
- Revised all Power Query transformations
- Revised all 25 plus DAX functions
- Revised all key formula patterns
- Revised all 20 plus chart types
- Revised Star vs Snowflake Schema
- Revised Dashboard Design principles
- Revised Bookmarks Pareto Drill Down
- Revised Power BI Service workflow
- Reviewed both projects status

---

## Tomorrow I Will

- Continue internship at IQ-Line
- Learn more about implementation process
- Keep daily GitHub streak going
- Sunday = Complete Airbnb Dashboard!
- Keep managing time effectively!