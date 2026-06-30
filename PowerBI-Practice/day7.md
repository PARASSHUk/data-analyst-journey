# Power BI - Day 7 Learning Notes
## Topic: Line Chart, Area Chart, KPI Chart,
##         Slicers, Funnel, Scatter, Map and
##         Field Map, Gauge Chart

---

## What I Learned Today

- Drill Down in Matrix by Column
- Line Chart
- Area Chart with Secondary Y-Axis
- KPI Chart with Target
- Slicers and their settings
- Funnel Chart
- Scatterplot Chart
- Map Chart and Pie Chart in Map
- Field Map
- Gauge Chart

---

## DRILL DOWN IN MATRIX BY COLUMN

- In Matrix there is also Drill Down option
  available for COLUMNS not just rows
- If a date field is placed in Columns
  a Drill Down option appears
- Can drill down by Row or by Column separately
- Gives more flexibility than basic drill down

---

## VISUALIZATION CHARTS - CONTINUED

---

### 8. Line Chart

- A series of data points connected by a line
- Shows data points based on numerical info
- Has X-Axis and Y-Axis
- Can have ONE or MANY lines
- Works with continuous data sets
- Best used for:
  Showing current trends
  Showing change over time
  Comparing two or more data sets

---

### 9. Area Chart

- Also called Layered Area Chart
- Based on the Line Chart structure
- Area between axis and line is filled with color
- The fill color indicates VOLUME of data
- More visually impactful than plain line chart

#### Secondary Y-Axis Feature
- Line charts can have TWO Y-Axes
- Primary Y-Axis = one metric (example: Sales)
- Secondary Y-Axis = another metric (example: Profit)
- One line shows Sales volume
- Another line shows Profit trend
- Useful for comparing two different scale metrics
  on the same chart

---

### 10. KPI Chart

- KPI = Key Performance Indicator
- Evaluates performance in different business areas
- Uses quantifiable measure values
- Acts as visual cues that indicate growth
- Always has a Base Value compared to a Target Value
- Compares ACTUAL performance vs TARGET set

#### Required Fields for KPI Chart
- Value = the actual measure (example: SUM of Sales)
- Trend Axis = almost always a DATE field
- Target = the goal value to compare against

#### How Target Was Created
- Orders table had no target column originally
- Created a NEW MEASURE for target
- Formula used: SUM(Sales) * 1.5
- This 1.5 times sales became our target benchmark

#### Important Note
- KPI Trend Axis shows LATEST YEAR sales only
- Does NOT show overall total automatically
- If overall total is needed use a CARD visual instead

---

### 11. Slicers

- Interactive filters used to analyze
  specific parts of data more effectively
- Make dashboards interactive for end users

#### How Slicers Work
- Give a field on which slicer filter applies
- Slicers can filter charts tables and other visuals
- All visuals connected update when slicer changes

#### Multiple Selection in Slicer
- Hold CTRL key and click multiple values
- Allows selecting multiple categories at once

#### Slicer Settings
- Go to Format Visual → Visual → Slicer Settings
- Selection section lets you:
  Turn ON or OFF multi-select option
  Control how many values can be selected

#### Slicer Styles
- Can change slicer appearance style
- Options include:
  Dropdown style
  Tile style (button style)
  List style
- Choose based on dashboard design needs

---

### 12. Funnel Chart

- Shape looks like broad head and narrow neck
- Shows data flow through multiple stages
- Common use cases:
  Sales funnel (leads to customers)
  Recruitment process (applicants to hired)
  Order fulfillment process (cart to delivery)

#### Required Fields
- Category = the stages of the process
- Value = the measure to show at each stage
- Shows MAXIMUM value stage at top (wide)
- Shows MINIMUM value stage at bottom (narrow)

---

### 13. Scatterplot Chart

- Displays data along Horizontal X and Vertical Y axis
- Reveals relationship between two numerical values
- Each intersection point = one data point
- Used to find correlation between two measures

#### Required Fields
- Values = category column (or use Legend instead)
- X-Axis = SUM of Sales
- Y-Axis = SUM of Profit
- Legend = Category
- Size = additional dimension (optional)

#### How Size Field Works
- Choose either Profit or Sales for Size
- If Profit chosen for size:
  Categories with HIGH profit = BIGGER circles
  Categories with LOW profit = SMALLER circles
- Same logic applies if Sales chosen for size
- Adds a third dimension of data to the chart

---

### 14. Map Chart

- Visualizes location-based data
- Useful for understanding geographical trends
- Helps analyze spatial relationships
- Common uses:
  Display sales data by location
  Track customer distribution
  Monitor infrastructure across regions

#### Required Fields for Map Chart
- Location = State (or country/city)
- Legend = Region or any grouping field
- Latitude = optional (not used in this practice)
- Longitude = optional (not used in this practice)
- Bubble Size = SUM of Sales

#### How to Plot a Pie Chart Inside Map
- Drop Category into Legend field
- Location = State
- Bubble Size = SUM of Sales
- Result: Each location shows a small pie chart
  representing category breakdown at that location

---

### 15. Field Map (Filled Map)

- Shows regions colored based on data intensity
- Different from bubble map — uses shading

#### Required Fields
- Legend = Region
- Location = State
- Tooltips = SUM of Sales

#### How It Works
- Divides map region-wise with different colors
- Hover over any state to see tooltip
- Tooltip shows exact sales value for that state

---

### 16. Gauge Chart

- Shows a SINGLE value within a range
- Compares that value to a target
- Visual style looks like a speedometer

#### How Min and Max Work
- If Min and Max are NOT manually set
- Power BI AUTOMATICALLY calculates them

#### Practice Example
- Value = SUM of Sales
- Target = Target Sales measure
- Max was auto-calculated as 2x current sales
  Current Sales = 2.30 → Max = 2.30 × 2 = 4.59
- Target was set to 3.45

---

## ALL CHARTS LEARNED SO FAR - COMPLETE LIST

| Day | Charts Learned |
|-----|----------------|
| Day 6 | Bar, Column, Pie, Donut, Tree Map, Table, Matrix |
| Day 7 | Line, Area, KPI, Funnel, Scatter, Map, Field Map, Gauge |

---

## REQUIRED FIELDS QUICK REFERENCE TABLE

| Chart | Required Fields |
|-------|-----------------|
| KPI | Value, Trend Axis (date), Target |
| Funnel | Category, Value |
| Scatterplot | X-Axis, Y-Axis, Legend, Size |
| Map | Location, Legend, Bubble Size |
| Field Map | Legend, Location, Tooltips |
| Gauge | Value, Target, Min, Max (auto) |

---

## Power BI Learning Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 | Data Loading Power Query Charts Relationships | Done |
| Day 2 | DAX SUM SUMX WEEKDAY IF Drill Down Bins | Done |
| Day 3 | Visualization Types Active Inactive Lines | Done |
| Day 4 | First Project Data Professional Survey | Done |
| Day 5 | Why Power BI Components Power Query Methods | Done |
| Day 6 | Bar Column Pie Donut TreeMap Table Matrix | Done |
| Day 7 | Line Area KPI Slicer Funnel Scatter Map Gauge | Done |

---

## Summary - What I Learned Today

- Learned Matrix drill down by column
- Learned Line Chart for trend analysis
- Learned Area Chart with secondary Y-Axis
- Built KPI Chart with custom target measure
- Learned all Slicer settings and styles
- Learned Funnel Chart for process flow
- Built Scatterplot Chart with Size dimension
- Built Map Chart with Pie Chart inside it
- Learned Field Map for region-wise coloring
- Built Gauge Chart with auto-calculated max

---

## Tomorrow I Will Learn

- DAX CALCULATE and FILTER functions
- Time Intelligence DAX functions
- Build complete dashboard using
  all charts learned this week
- Continue Power BI learning journey!