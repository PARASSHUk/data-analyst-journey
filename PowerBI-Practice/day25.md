# Power BI - Day 25 Learning Notes
## Topic: Complete Power BI revesion

---

## What I Did Today

- Complete revision of all Power BI topics
- Revised all DAX functions
- Revised all visualization types
- Revised Airbnb project progress
- Took rest to recharge for tomorrow
- Maintaining daily GitHub streak

---

## QUICK REVISION - ALL TOPICS

---

### Power Query Revision
- Data loading from Excel CSV SQL Server
- Remove rows columns rename columns
- Split Column by delimiter
- Replace Values for cleaning
- Fill Up Down for nulls
- Change Data Types
- Transpose and Unpivot
- Merge Columns with separator
- Conditional and Custom Columns
- Append = rows like UNION ALL
- Merge = columns like JOIN
- Close and Apply to save changes

---

### DAX Functions Revision

#### Aggregate
- SUM AVERAGE MIN MAX COUNT DISTINCTCOUNT

#### Iterator X Functions
- SUMX AVERAGEX MINX MAXX
- Table first then Expression always

#### Filter Functions
- CALCULATE = modify filter context
- ALL = remove all filters
- ALLSELECTED = keep slicer selections
- ALLEXCEPT = keep specified columns
- FILTER = rows matching condition
- CROSSFILTER = bidirectional filtering
- DIVIDE = safe division no zero error

#### Logical Functions
- IF AND OR SWITCH(TRUE()) NOT

#### Text Functions
- CONCATENATE LEFT RIGHT MID UPPER LOWER

#### Date Functions
- TODAY NOW DATE YEAR MONTH DAY
- DATEDIFF WEEKDAY

#### Advanced Functions
- RANKX = dynamic ranking
  RANKX(ALL(col), measure, , DESC)
- VALUES = unique in current context
- VAR RETURN = store expressions
- MAXX with VALUES = max of measure

#### Key Formula Patterns
Percentage:
DIVIDE(SUM(col), CALCULATE(SUM(col), ALL(table)))

Cumulative:
VAR rank = MAXX(VALUES(col), [Rank Measure])
RETURN CALCULATE([measure],
FILTER(ALL(col), [Rank Measure] <= rank))

Cumulative %:
DIVIDE([Cumulative], CALCULATE([Total], ALL(col)))

---

### Evaluation Context Revision
- Row Context = row by row calculation
- Filter Context = filtered dataset calculation
- Context Transition = CALCULATE converts
  row context to filter context

---

### All Charts Revision

| Chart | Best Use |
|-------|----------|
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
| Tree Map | Hierarchy size |
| Scatter | Correlation two measures |
| Map | Geographic bubbles |
| Field Map | Geographic shading |
| Funnel | Process stages |
| Gauge | Value vs target |
| KPI | Actual vs target trend |
| Card | Single KPI number |
| Multi Row Card | Multiple values |
| Table | Exact row data |
| Matrix | Cross-tab multi-dimensional |
| Hierarchical Matrix | Multi-level drill down |
| Slicer | Interactive filter |

---

### Data Model Revision
- Star Schema = fact + dimension tables
- Snowflake Schema = normalized dimensions
- One to One relationship
- One to Many = most common
- Solid line = active relationship
- Dotted line = inactive relationship
- Both arrows = bidirectional filter

---

### Dashboard Design Revision
- Title = always largest text
- Logo = always in corners
- KPI Cards = just below title
- Thousand Separator = always ON
- Display Units = always NONE
- Color Palette = max 2 to 4 colors
- Format in Data Section for global apply

---

### Bookmarks Revision
- Captures visual visibility state
- Uncheck Data and Current Page
- Check Selected Visuals only
- Link buttons via Action = Bookmark
- Test with CTRL + Click in edit mode
- Great for switching between views

---

### Pareto Method Revision
- 80% of results from 20% of causes
- Find vital few not trivial many
- Rank categories highest to lowest
- Calculate cumulative percentage
- Find where cumulative crosses 80%
- Focus resources on those categories

---

### Conditional Formatting Revision
- Only works on numeric columns
- Background color by value range
- Cell formatting in Matrix visual
- Formula: Min + (Max - Min) x % / 100
- 0-33% = low color
- 33-67% = medium color
- 67-100% = high color

---

## AIRBNB PROJECT STATUS

### Measures Created
- Total Listing COUNT                       ✅
- Total Cities DISTINCTCOUNT               ✅
- Total Hosts COUNT                        ✅
- Total Property Types DISTINCTCOUNT       ✅
- Total Reviews DISTINCTCOUNT              ✅
- Hotel Entire Private Shared Room         ✅
- Super Host Not Super Host                ✅
- City Rank RANKX                          ✅
- Cumulative Listings VAR RETURN           ✅
- Cumulative % DIVIDE                      ✅
- Average Price AVERAGE                    ✅
- Avg Rating AVERAGE overall               ✅
- Accuracy Rating AVERAGE                  ✅
- Cleanliness Rating AVERAGE               ✅
- Communication Rating AVERAGE             ✅
- Location Rating AVERAGE                  ✅

### Visuals Completed
- Dashboard Title                          ✅
- Airbnb Logo                             ✅
- 5 KPI Cards                             ✅
- Line Chart 6 growth phases              ✅
- Business Insights panel                 ✅
- Super Host vs Not Super Host            ✅
- Average Price by Room Type              ✅
- Ratings per City Conditional Format     ✅
- Cumulative % Table                      ✅
- Overall Rating Chart                    ✅
- Detailed Rating Matrix                  ✅
- Bookmark Navigation Buttons             ✅

### Still To Build
- Map visual global distribution
- Top Cities table with RANKX
- Final slicers for interactivity
- Final polish and screenshot
- README and upload to GitHub


---

## Summary - What I Did Today

- Complete revision of all Power BI topics
- Revised Power Query transformations
- Revised all DAX functions and patterns
- Revised all chart types and use cases
- Revised Data Model and Schemas
- Revised Dashboard Design Principles
- Revised Bookmark and Pareto concepts
- Reviewed Airbnb project progress
- Took rest to recharge for tomorrow

---

## Tomorrow I Will

- Complete Airbnb Dashboard fully
- Build Map and Top Cities chart
- Add final slicers
- Upload Airbnb to GitHub
- Keep the momentum going!