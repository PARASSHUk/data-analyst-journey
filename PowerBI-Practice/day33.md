# Power BI - Day 33 Learning Notes
## Topic: Power BI Revision

---

## What I Did Today

- Revised all Power BI topics
- Revised DAX functions and formulas
- Revised chart types and use cases
- Revised Data Model concepts
- Revised Dashboard Design rules
- Maintaining learning streak during internship

---

## REVISION - POWER QUERY

- Remove Top Bottom Empty Rows
- First Row as Header
- Split Column by Delimiter
- Replace Values for cleaning
- Fill Up Down for Nulls
- Change Data Types
- Transpose and Unpivot
- Merge Columns with separator
- Conditional and Custom Columns
- Append = rows like SQL UNION ALL
- Merge = columns like SQL JOIN
- Close and Apply to save changes
- Green line = data quality indicator

---

## REVISION - DAX FUNCTIONS

### Aggregate
- SUM AVERAGE MIN MAX
- COUNT DISTINCTCOUNT

### Iterator X Functions
- SUMX AVERAGEX MINX MAXX
- Table first then Expression always

### Filter Functions
- CALCULATE = modify filter context
- ALL = remove all filters
- ALLSELECTED = keep slicer selections
- ALLEXCEPT = keep specified columns
- FILTER = rows matching condition
- CROSSFILTER = bidirectional
- DIVIDE = safe division

### Logical Functions
- IF AND OR SWITCH NOT

### Text Functions
- CONCATENATE LEFT RIGHT
- MID UPPER LOWER

### Date Functions
- TODAY NOW DATE
- YEAR MONTH DAY
- DATEDIFF WEEKDAY

### Advanced Functions
- RANKX(ALL(col), measure, , DESC)
- VALUES(col) = unique in context
- VAR variable = expression
  RETURN result

---

## REVISION - KEY FORMULA PATTERNS

### Percentage
Sales % =
DIVIDE(
    SUM(col),
    CALCULATE(SUM(col), ALL(table))
)

### Cumulative
Cumulative =
VAR rank =
    MAXX(VALUES(table[col]), [Rank])
RETURN
    CALCULATE(
        [measure],
        FILTER(
            ALL(table[col]),
            [Rank] <= rank
        )
    )

### Cumulative %
Cumulative % =
DIVIDE(
    [Cumulative],
    CALCULATE([Total], ALL(table[col]))
)

### City Rank
City Rank =
RANKX(ALL(listings[city]), [Total], , DESC)

---

## REVISION - EVALUATION CONTEXT

### Row Context
- Row by row calculation
- Created by Calculated Columns
- Created by SUMX and other iterators
- Scope = one row at a time

### Filter Context
- Filtered dataset calculation
- Created by Slicers and Visuals
- Created by CALCULATE function
- Scope = entire filtered data

### Context Transition
- CALCULATE converts row to filter
- Why columns behave differently
- Most important DAX concept

---

## REVISION - ALL CHARTS

| Chart | Best Use |
|-------|----------|
| Bar | Horizontal categories |
| Column | Vertical time series |
| Stacked Bar | Contribution horizontal |
| Stacked Column | Contribution vertical |
| 100% Stacked | Percentage proportions |
| Line | Trends over time |
| Area | Volume with trend |
| Line Clustered Column | Two metrics |
| Pie | Parts of whole |
| Donut | Parts with center KPI |
| Tree Map | Hierarchy size |
| Scatter | Correlation |
| Map | Geographic bubbles |
| Field Map | Geographic shading |
| Funnel | Process stages |
| Gauge | Value vs target |
| KPI | Actual vs target trend |
| Card | Single KPI number |
| Multi Row Card | Multiple values |
| Table | Exact row data |
| Matrix | Cross-tab |
| Hierarchical Matrix | Drill down |
| Slicer | Interactive filter |

---

## REVISION - DATA MODEL

### Star Schema
- Fact Table = measures and metrics
- Dimension Tables = descriptions
- Simpler faster most used

### Snowflake Schema
- Normalized dimension tables
- More tables less redundancy
- Better for large databases

### Relationships
- One to Many = most common
- Solid line = Active relationship
- Dotted line = Inactive relationship
- Single arrow = one directional
- Both arrows = bidirectional

### Keys
- Primary Key = uniquely identifies row
- Foreign Key = references another table
- Composite Key = two or more columns

---

## REVISION - DASHBOARD DESIGN

### Layout Rules
- Title = largest text always
- Logo = always in corners
- KPI cards = below title
- Charts = main body area
- Slicers = left or top

### KPI Card Rules
- Thousand Separator = ON always
- Display Units = NONE always
- Same size for all cards
- Format Align to space equally
- Padding adjustment for spacing

### Color Rules
- Maximum 2 to 4 colors only
- Format in Data Section globally
- Too many colors = confusing

---

## REVISION - ADVANCED FEATURES

### Bookmarks
- Captures visual visibility state
- Uncheck Data and Current Page
- Check Selected Visuals only
- Link buttons via Action Bookmark
- Test with CTRL + Click in edit mode

### Pareto Method
- 80% results from 20% causes
- Rank highest to lowest
- Find where cumulative crosses 80%
- Focus on vital few categories

### Conditional Formatting
- Only on numeric columns
- Background color by value range
- 0-33% low 33-67% medium 67-100% high

### Drill Down
- Add multiple fields to axis
- Click icon to drill next level
- Drill up to go back

### RANKX
- Always use ALL for global ranking
- Two commas to skip Value argument
- Filter where rank <= N for Top N

### VAR RETURN Pattern
VAR step1 = calculation one
VAR step2 = uses step1
RETURN
    final result

---

## REVISION - POWER BI SERVICE

### Workflow
1. Create in Power BI Desktop
2. Publish to Power BI Service
3. Set up refresh and security
4. Share with team
5. Access from anywhere

### Append vs Merge
- Append = adds rows UNION ALL
- Merge = adds columns JOIN

---

## REVISION - PROJECTS

### Project 1 - Data Professional Survey
- Tool: Power BI Desktop
- 630 respondents Maven Analytics
- 8 visuals on dashboard
- Python most preferred language
- Salary satisfaction 4.27 out of 10
- Status: Completed on GitHub ✅

### Project 2 - Airbnb Dashboard
- Tool: Power BI Desktop
- Maven Analytics Listings Reviews
- 20 DAX measures created
- Bookmarks Pareto VAR RETURN
- Remaining: Map Top Cities Slicers
- Status: Completing very soon ✅

---

## Power BI Learning Progress

| Day Range | Topic | Status |
|-----------|-------|--------|
| Day 1-3 | Data Loading Power Query Charts | Done |
| Day 4 | Data Professional Survey Project | Done |
| Day 5-8 | Components Charts Data Model | Done |
| Day 9-11 | DAX Deep Dive All Functions | Done |
| Day 12-15 | Airbnb Project Building | Done |
| Day 16-20 | Revisions and Interview Prep | Done |
| Day 21 | Interview Day | Done |
| Day 22-24 | Advanced DAX Bookmarks Pareto | Done |
| Day 25-32 | Revisions Internship Period | Done |
| Day 33 | Complete Power BI Revision | Done |

---

## Summary - What I Did Today

- Revised all Power Query operations
- Revised all DAX functions and patterns
- Revised all chart types
- Revised Data Model Star Snowflake
- Revised Dashboard Design principles
- Revised Bookmarks Pareto Drill Down
- Revised both Power BI projects
- Consistent learning during internship!

---

## Tomorrow I Will

- Continue internship at IQ-Line
- Complete Airbnb Dashboard this week
- Keep daily GitHub streak going
- Stay consistent with learning!