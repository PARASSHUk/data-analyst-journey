# Power BI - Day 15 Learning Notes
## Topic: Airbnb Dashboard - Line Chart Insights,
##         Market Share Chart, RANKX Function

---

## What I Did Today

- Created heading for line chart with styling
- Divided line chart into 6 growth phases
- Added business insights below line chart
- Built Line and Stacked Column Chart
  for market share by city
- Created Super Host and Not Super Host measures
- Created City Rank measure using RANKX

---

## STEP 1 - LINE CHART HEADING

### Adding a Text Heading
- Inserted a Text Box with name: New Listings
- Added round corners to the text box
- Adjusted padding from top and bottom
  by going into Properties section

### Design Tip
- Every chart section should have a heading
- Round corners give modern professional look
- Padding ensures text is not touching edges

---

## STEP 2 - DIVIDE LINE CHART INTO GROWTH PHASES

### 6 Phases Identified on Line Chart
The listing growth trend was divided into
6 meaningful business phases:

| Phase | Description |
|-------|-------------|
| 1. Introduction | Early days when Airbnb started |
| 2. Growth | Rapid increase in new listings |
| 3. Peak | Highest number of new listings |
| 4. Decline | Slowdown in listing growth |
| 5. Re-invention | New growth phase started |
| 6. COVID-19 | Growth stopped due to pandemic |

### Why Divide into Phases
- Makes the chart tell a STORY
- Viewers understand business context
- Each phase explains WHY the trend changed
- Transforms raw data into business narrative

---

## STEP 3 - KEY INSIGHTS ADDED BELOW CHART

Insights written below the line chart:

- In 2015 Airbnb reached the highest number
  of new listings ever recorded

- Listing growth slowed during 2016 and 2017
  One possible contributing factor was the
  introduction of stricter local regulations
  in several cities worldwide

- From 2018 there was a new growth phase
  which was then stopped in 2019 to 2020
  by the COVID-19 pandemic

### Why Adding Insights Matters
- Raw charts alone do not tell the full story
- Insights explain the WHY behind numbers
- Makes dashboard valuable for decision makers
- Separates good dashboards from great ones

---

## LINE AND STACKED COLUMN CHART
## Market Share by City

### Chart Purpose
- Shows market share of super hosts vs
  regular hosts in each city
- Compares city-wise listing distribution

### Initial Approach (Did Not Work Well)
- X-Axis = City
- Y-Axis = Host Is SuperHost column
- Legend = Host Is SuperHost
- Problem: Divided into T and F labels
- Not clear and not professional looking

### Better Approach - Custom DAX Measures

#### Measure 1 - Super Host Count
Super Host =
CALCULATE(
    COUNT(listings[listing_id]),
    listings[host_is_superhost] = "t"
)
- Counts listings where host IS a superhost
- "t" = True in the dataset

#### Measure 2 - Not Super Host Count
Not Super Host =
CALCULATE(
    COUNT(listings[listing_id]),
    listings[host_is_superhost] = "f"
)
- Counts listings where host is NOT a superhost
- "f" = False in the dataset

### Final Chart Setup
- Removed Host Is SuperHost from Y-Axis
- Added Super Host measure to Y-Axis
- Added Not Super Host measure to Y-Axis
- Both measures appear in different colors
- Shows count of super hosts vs not super hosts
  clearly for each city

### Result
- Clean professional comparison chart
- No confusing T and F labels
- Clear color differentiation between groups
- Better storytelling for stakeholders

---

## RANKX FUNCTION

### What is RANKX
- DAX function to rank values dynamically
- Ranks items in a table based on a measure
- Updates as filters and slicers change

### RANKX Syntax
RANKX(
    Table,
    Expression,
    Value,
    Order,
    Ties
)

| Argument | Description |
|----------|-------------|
| Table | The table to rank over |
| Expression | The measure to rank by |
| Value | Optional specific value to rank |
| Order | ASC or DESC |
| Ties | How to handle tied ranks |

---

### City Rank Measure Created

City Rank =
RANKX(
    ALL(listings[city]),
    [Listing Count],
    ,
    DESC
)

### Why Two Commas
- Third argument (Value) is OPTIONAL
- No specific value needed here
- Left BLANK but comma still required
- RANKX needs 4 arguments minimum
- So two commas used to skip Value argument
- Format: RANKX(table, expression, , DESC)

---

### How the Value Argument Works

When you provide a value as third argument:
- Power BI compares that value against all cities
- Assigns a rank based on where it falls

Example:
RANKX(
    ALL(listings[city]),
    [Listing Count],
    550,
    DESC
)

Power BI compares:
- City A = 700 → Rank 1
- City B = 600 → Rank 2
- Value 550 → Rank 3
- City C = 500 → Rank 4
- City D = 300 → Rank 5

Even if 550 does not exist in the table
Power BI finds where it WOULD rank.
That is the power of the Value argument.

---

### Why ALL() is Used in RANKX
- Without ALL() the rank resets for each filter
- ALL() ignores filters and ranks across ALL cities
- Gives consistent global ranking
- Without ALL() rank 1 would appear for every city

---

### Use Case for City Rank
- Filter dashboard to show only Top N cities
- Add City Rank to a table visual
- Filter where City Rank <= 10
- Shows Top 10 cities by listing count
- Dynamic and updates with all slicers

---

## KEY DAX CONCEPTS FROM TODAY

### CALCULATE with Boolean Text Filter
CALCULATE(COUNT(col), table[col] = "t")
- Filter uses text "t" and "f" for true false
- Must match exactly as stored in dataset
- Check actual values before writing filter

### RANKX Key Points
- Always use ALL() as first argument -- ALL IS USED TO REMOVE THE FILTERS.
  to get global ranking across all values
- Two commas when skipping Value argument
- DESC for highest value = rank 1
- ASC for lowest value = rank 1
- Use in table visuals then filter by rank

---

## AIRBNB DASHBOARD PROGRESS

### Completed So Far
- Dashboard title                          ✅
- Airbnb logo in corner                   ✅
- 5 KPI cards                             ✅
- Line Chart for new listings growth      ✅
- 6 growth phases labeled                 ✅
- Business insights below chart           ✅
- Line and Stacked Column Chart
  for super host vs not super host        ✅
- City Rank measure using RANKX           ✅

### Still To Build
- Map visual for geographical distribution
- Bar chart for top cities by listings
- Review trend chart
- Price analysis
- Slicers for interactivity

---

## Summary - What I Did Today

- Added styled heading for line chart
- Divided line chart into 6 business phases
- Added key business insights below chart
- Created Super Host and Not Super Host measures
- Built Line and Stacked Column Chart
  for city-wise market share comparison
- Created City Rank measure using RANKX
- Learned RANKX syntax and all 5 arguments
- Understood why two commas are needed
- Understood how Value argument ranks externally
- Understood why ALL() is essential in RANKX


---

## Tomorrow I Will Continue

- Build map visual for Airbnb locations
- Build Top 10 Cities bar chart
  using City Rank measure
- Add review trend over time
- Add price distribution visual
- Add slicers for city country room type
- Complete and upload Airbnb dashboard!