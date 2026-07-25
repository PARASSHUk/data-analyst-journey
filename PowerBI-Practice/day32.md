# Power BI - Day 32 Learning Notes
## Topic: Power BI Revision and
##         Airbnb Project Completing Tomorrow

---

## What I Did Today

- Revised all Power BI topics
- Revised DAX functions and patterns
- Revised all chart types
- Revised Airbnb project plan
- Ready to complete Airbnb project tomorrow!

---

## QUICK REVISION - DAX FUNCTIONS

### Aggregate
- SUM AVERAGE MIN MAX COUNT DISTINCTCOUNT

### Iterator X Functions
- SUMX AVERAGEX MINX MAXX
- Always Table first then Expression

### Filter Functions
- CALCULATE = modify filter context
- ALL = remove all filters
- ALLSELECTED = keep slicer selections
- ALLEXCEPT = keep specified columns
- FILTER = rows matching condition
- CROSSFILTER = bidirectional filtering
- DIVIDE = safe division no zero error

### Logical Functions
- IF AND OR SWITCH(TRUE()) NOT

### Text Functions
- CONCATENATE LEFT RIGHT MID UPPER LOWER

### Date Functions
- TODAY NOW DATE
- YEAR MONTH DAY DATEDIFF WEEKDAY

### Advanced Functions
- RANKX(ALL(col), measure, , DESC)
- VALUES(col) = unique in filter context
- VAR variable = expression
  RETURN result

---

## QUICK REVISION - KEY PATTERNS

### Percentage
Sales % =
DIVIDE(
    SUM(col),
    CALCULATE(SUM(col), ALL(table))
)

### Cumulative
Cumulative =
VAR rank =
    MAXX(VALUES(table[col]), [Rank Measure])
RETURN
    CALCULATE(
        [measure],
        FILTER(ALL(table[col]),
        [Rank Measure] <= rank)
    )

### Cumulative %
Cumulative % =
DIVIDE(
    [Cumulative],
    CALCULATE([Total], ALL(table[col]))
)

### Pareto Rank
City Rank =
RANKX(ALL(listings[city]), [Listing Count], , DESC)

---

## QUICK REVISION - ALL CHARTS

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

## QUICK REVISION - DATA MODEL

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
- Solid line = Active
- Dotted line = Inactive
- Single arrow = one direction
- Both arrows = bidirectional

---

## QUICK REVISION - DASHBOARD DESIGN

### Rules
- Title = largest text always
- Logo = always in corners
- KPI cards = below title
- Thousand Separator = always ON
- Display Units = always NONE
- Color palette = max 2 to 4 colors

---

## QUICK REVISION - ADVANCED FEATURES

### Bookmarks
- Captures visual visibility state
- Uncheck Data and Current Page
- Check Selected Visuals only
- Link buttons via Action Bookmark
- Test with CTRL + Click

### Pareto Method
- 80% results from 20% causes
- Cumulative % crosses 80% = vital few
- Focus resources on those categories

### Conditional Formatting
- Only on numeric columns
- Background color by value range
- Instant visual pattern recognition

### Drill Down
- Add multiple fields to axis
- Click icon to drill into next level
- Drill up to go back

---

## AIRBNB PROJECT - FINAL PLAN FOR TOMORROW

### What is Done
- Dashboard Title                       ✅
- Airbnb Logo                          ✅
- 5 KPI Cards                          ✅
- Line Chart 6 growth phases           ✅
- Business Insights panel              ✅
- Super Host vs Not Super Host Chart   ✅
- Average Price by Room Type           ✅
- Ratings per City Chart               ✅
- Cumulative % Table                   ✅
- Overall Rating Chart                 ✅
- Detailed Rating Matrix               ✅
- Bookmark Navigation Buttons          ✅
- 16 DAX Measures                      ✅

### What To Complete Tomorrow

#### Visual 1 - Map Chart
- Location = City or Country
- Bubble Size = Total Listing
- Shows global distribution of listings
- Which countries have most Airbnb listings

#### Visual 2 - Top 10 Cities Table
- Add City to Rows
- Add Total Listing City Rank
  Cumulative Listings Cumulative %
- Add filter: City Rank <= 10
- Shows top 10 cities with all metrics
- Perfect Pareto analysis table

#### Visual 3 - Slicers
- Slicer 1 = Room Type
- Slicer 2 = Country or City
- All visuals update when slicer clicked

#### Final Polish
- Check all colors are consistent
- Verify all chart titles are clear
- Check all KPI formatting is correct
- Make sure bookmarks work properly
- Take final dashboard screenshot

### After Dashboard Complete

#### Step 1 - Save File
- Save as data-professional-airbnb.pbix

#### Step 2 - Take Screenshot
- Windows + Shift + S
- Select entire dashboard
- Save as dashboard-preview.png

#### Step 3 - Create Project Folder
mkdir PowerBI-Projects/Airbnb-Dashboard

#### Step 4 - Write README
- Project overview
- Dataset source Maven Analytics
- All measures created
- Key insights found
- How to run the project

#### Step 5 - Export Data
- Export listings data as CSV
- Export reviews data as CSV
- Save in data folder

#### Step 6 - Push to GitHub
git add .
git commit -m "Completed Airbnb Global Performance Dashboard"
git push

---

## MEASURES TO BE USED TOMORROW

### All 16 Measures Ready

| Measure | Formula Summary |
|---------|----------------|
| Total Listing | COUNT listing_id |
| Total Cities | DISTINCTCOUNT city |
| Total Hosts | COUNT host_id |
| Total Property Types | DISTINCTCOUNT |
| Total Reviews | DISTINCTCOUNT review_id |
| Hotel Room | CALCULATE COUNT room = Hotel |
| Entire Home | CALCULATE COUNT room = Entire |
| Private Room | CALCULATE COUNT room = Private |
| Shared Room | CALCULATE COUNT room = Shared |
| Super Host | CALCULATE COUNT t |
| Not Super Host | CALCULATE COUNT f |
| City Rank | RANKX ALL DESC |
| Cumulative Listings | VAR RETURN CALCULATE |
| Cumulative % | DIVIDE cumulative by total |
| Average Price | AVERAGE price |
| Avg Rating | AVERAGE rating |
| Accuracy | AVERAGE accuracy |
| Cleanliness | AVERAGE cleanliness |
| Communication | AVERAGE communication |
| Location Rating | AVERAGE location |

---


---

## Summary - What I Did Today

- Revised all Power BI topics and functions
- Revised all chart types and use cases
- Revised Data Model and Design principles
- Revised Advanced features Bookmarks Pareto
- Created detailed plan for tomorrow
- Listed all remaining Airbnb tasks
- Outlined complete upload process
- Tomorrow Airbnb project COMPLETES!

---

## Tomorrow I Will

- Complete Map Visual
- Build Top 10 Cities Pareto Table
- Add final slicers
- Polish entire dashboard
- Take screenshot
- Write README
- Upload Airbnb project to GitHub
- Second Power BI project DONE! 🎉