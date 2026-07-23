# Power BI - Day 30 Learning Notes
## Topic: Complete Power BI Revision
##         Managing Time Between Internship
##         and Personal Learning

---

## What I Did Today

- Complete revision of all Power BI topics
- Revised DAX functions and patterns
- Revised all chart types
- Revised Data Model concepts
- Revised Airbnb project progress
- Planning to complete Airbnb project on Sunday
- Managing time between internship and learning

---

## NOTE - TIME MANAGEMENT

Currently managing two things together:
- Internship at IQ-Line Monday to Saturday
- Personal learning and GitHub commits daily
- Airbnb Power BI project will be completed
  on Sunday when free from internship
- Consistency is key even if pace is slower

---

## COMPLETE POWER BI REVISION

---

### Power Query Revision

#### Data Loading
- Excel CSV JSON XML files
- SQL Server MySQL databases
- Import Mode vs Live Connection vs Direct Query
- Append = adds rows like SQL UNION ALL
- Merge = adds columns like SQL JOIN

#### Key Transformations
- Remove Top Bottom Empty Rows
- First Row as Header
- Remove Columns and Rename
- Split Column by Delimiter
- Replace Values
- Fill Up and Fill Down for Nulls
- Change Data Types
- Transpose and Unpivot
- Merge Columns with separator
- Conditional Column with IF logic
- Custom Column with formula
- Duplicate Column
- Extract Character Length
- Format Upper Lower Proper
- Statistical Sum Avg Min Max
- Standard Add Subtract Multiply Divide
- Date operations Month Quarter Year
- Close and Apply to save changes

---

### DAX Functions Complete Revision

#### Aggregate Functions
- SUM(col) = total of column
- AVERAGE(col) = average of column
- MIN(col) = minimum value
- MAX(col) = maximum value
- COUNT(col) = count non-blank values
- DISTINCTCOUNT(col) = count unique values

#### Iterator X Functions
- SUMX(table, expression) = sum after row calc
- AVERAGEX(table, expression) = avg after row calc
- MINX(table, expression) = min after row calc
- MAXX(table, expression) = max after row calc
- Rule: Table first then Expression always

#### Filter Functions
- CALCULATE(expr, filter) = modify filter context
- ALL(table or col) = remove all filters
- ALLSELECTED(col) = keep slicer selections
- ALLEXCEPT(table, col) = keep specified col only
- FILTER(table, condition) = filter rows
- CROSSFILTER(col1, col2, Both) = bidirectional
- DIVIDE(a, b) = safe division no zero error

#### Logical Functions
- IF(condition, true, false)
- AND(cond1, cond2)
- OR(cond1, cond2)
- SWITCH(TRUE(), cond, result, else)
- NOT(condition)

#### Text Functions
- CONCATENATE(text1, text2)
- LEFT(text, n) RIGHT(text, n)
- MID(text, start, num)
- UPPER(text) LOWER(text)

#### Date Functions
- TODAY() NOW() DATE(y, m, d)
- YEAR(date) MONTH(date) DAY(date)
- DATEDIFF(start, end, unit)
- WEEKDAY(date, mode)

#### Advanced DAX
- RANKX(ALL(col), measure, , DESC)
  Dynamic ranking always use ALL
  Two commas when skipping Value argument

- VALUES(col)
  Unique values in current filter context
  Respects active filters

- VAR variable = expression
  RETURN result
  Store temporary values in formula
  Makes complex formulas readable

- MAXX(VALUES(col), [measure])
  Maximum of a measure across filtered values

#### Key Formula Patterns

Percentage Contribution:
Sales % =
DIVIDE(
    SUM(col),
    CALCULATE(SUM(col), ALL(table))
)

Cumulative Measure:
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

Cumulative Percentage:
Cumulative % =
DIVIDE(
    [Cumulative Listings],
    CALCULATE([Total Listing], ALL(listings[city]))
)

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
- CALCULATE converts row to filter context
- Happens inside Calculated Columns
- Why column does not return grand total

#### Calculated Column vs Measure

| Feature | Calculated Column | Measure |
|---------|------------------|---------|
| Storage | Stored in model | On demand |
| Context | Row context | Filter context |
| Use Case | Row level labels | KPI aggregations |
| Performance | Uses memory | Optimized |

---

### All Charts Revision

| Chart | Best Use Case |
|-------|---------------|
| Bar | Horizontal category comparison |
| Column | Vertical time comparison |
| Stacked Bar | Contribution horizontal |
| Stacked Column | Contribution vertical |
| 100% Stacked | Percentage proportions |
| Line | Trends over time |
| Area | Volume with trend |
| Line Clustered Column | Two metrics combined |
| Pie | Parts of whole |
| Donut | Parts of whole with center |
| Tree Map | Hierarchy size comparison |
| Scatter | Correlation two measures |
| Map | Geographic bubbles |
| Field Map | Geographic shading |
| Funnel | Process stages |
| Gauge | Value vs target |
| KPI | Actual vs target with trend |
| Card | Single important number |
| Multi Row Card | Multiple values |
| Table | Exact row data |
| Matrix | Cross-tab multi-dimensional |
| Hierarchical Matrix | Multi-level drill down |
| Slicer | Interactive filter control |

---

### Data Model Revision

#### Star Schema
- Central Fact Table = measures and metrics
- Surrounding Dimension Tables = descriptions
- Simpler faster most used in Power BI

#### Snowflake Schema
- Dimension tables further normalized
- More tables less redundancy
- Better for very large databases

#### Relationship Types
- One to One = both unique values
- One to Many = most common in Power BI
- Many to Many = needs bridge table
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

#### KPI Card Formatting
- Thousand Separator = always ON
- Display Units = always NONE
- Same exact size for all KPI cards
- Format Align to space cards equally

#### Color Palette Rules
- Maximum 2 to 4 colors only
- Too many colors = confusing
- Format in Data Section applies globally

---

### Advanced Concepts Revision

#### RANKX
- RANKX(ALL(col), measure, , DESC)
- Always use ALL for global ranking
- Two commas to skip Value argument
- Use with FILTER where rank <= N for Top N

#### Bookmarks
- Captures visual visibility state
- Uncheck Data and Current Page
- Check Selected Visuals only
- Link buttons via Action = Bookmark
- Test with CTRL + Click in edit mode

#### Pareto Method
- 80% of results from 20% of causes
- Find vital few categories
- Use cumulative % to find 80% line
- Focus resources on high-impact items

#### VAR RETURN Pattern
VAR step1 = calculation one
VAR step2 = calculation two using step1
RETURN
    final result using both VARs

---

### Projects Revision

#### Project 1 - Data Professional Survey
- 630 respondents Maven Analytics
- 8 visuals on dashboard
- Python most preferred language
- Salary satisfaction 4.27 out of 10
- Status: Completed and on GitHub ✅

#### Project 2 - Airbnb Dashboard
- Maven Analytics Listings and Reviews
- One to Many relationship on Listing ID
- 16 DAX measures created
- Bookmarks for rating navigation
- Pareto analysis for city contribution
- Status: In Progress completing Sunday ✅

---

## AIRBNB PROJECT - REMAINING TASKS

### Visuals Still To Build
- Map visual for global distribution
- Top Cities table with RANKX filter
- Final slicers for interactivity
- Final polish and color consistency
- Take dashboard screenshot

### After Completion
- Write README for Airbnb project
- Export data files as CSV
- Upload pbix file and screenshot
- Push to GitHub PowerBI-Projects folder

---

## TIME MANAGEMENT PLAN

### Weekdays (Monday to Saturday)
- 8 AM to 4 PM = Internship at IQ-Line
- Evening = Daily GitHub commit
- Write what I learned at internship
- Quick revision of SQL or Power BI

### Sunday
- Full day for personal projects
- Complete Airbnb Power BI dashboard
- Upload to GitHub
- Plan next learning goal
- Rest and recharge for next week

### Daily Non-Negotiable
- GitHub commit every single day
- Even if just 5 minutes of notes
- Streak must never break
- Consistency over intensity


---

## Summary - What I Did Today

- Complete Power BI revision done
- Revised all Power Query operations
- Revised all 25 plus DAX functions
- Revised all 20 plus chart types
- Revised Data Model schemas
- Revised Dashboard Design rules
- Revised Bookmarks and Pareto concepts
- Revised both Power BI projects
- Planned Sunday for Airbnb completion
- Created time management plan
- 30 days of Power BI completed!

---

## Tomorrow I Will

- Continue internship at IQ-Line
- Learn more about Smart Parcha software
- Apply data skills at work
- Keep daily GitHub streak going
- Sunday = Complete Airbnb Dashboard!