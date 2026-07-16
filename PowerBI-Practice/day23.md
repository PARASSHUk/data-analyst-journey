# Power BI - Day 23 Learning Notes
## Topic: Airbnb Project - Cumulative Percentage
##         Formatting, Average Price, Ratings Chart
##         and Conditional Formatting
---

## What I Did Today

- Simplified Cumulative Percentage formula
- Formatted cumulative values as percentage
- Built Stacked Bar Chart for average price
  by room type
- Built Stacked Column Chart for ratings
  per city
- Applied Conditional Formatting on columns
- Created Average Price and Average Rating
  measures
---

## 1. CUMULATIVE PERCENTAGE - SIMPLIFIED FORMULA

### Formula Created Today

Cumulative % =
DIVIDE(
    [Cumulative Listings],
    CALCULATE(
        [Total Listing],
        ALL(listings[city])
    )
)

### How This Works
- Numerator = Cumulative Listings measure
  (running total up to current ranked city)
- Denominator = Total listings across ALL cities
  ALL(listings[city]) removes city filter
  to get grand total
- DIVIDE = safe division no zero error
- Result = percentage of total covered
  by cities up to current rank

### Difference from Previous Formula
- Previous formula used 3 VAR variables
- This simplified version is shorter
- Uses Cumulative Listings measure directly
  as numerator instead of recalculating
- Both give same result
- Simpler formula is easier to maintain

---

## 2. SORTING CUMULATIVE PERCENTAGE

### Problem
- Chart was not showing in correct order
- Cities were not sorted from highest
  to lowest listing count

### Solution
- Added Cumulative % to chart
- Sorted chart in ASCENDING to DESCENDING
- Now cities appear from rank 1 downward
- Chart reads correctly from left to right

### Why Sorting Matters
- Cumulative analysis only makes sense
  when data is sorted by rank
- First city should have most listings
- Last city should have least listings
- Chart tells the story of concentration

---

## 3. FORMAT CUMULATIVE % AS PERCENTAGE

### Problem
- Values were showing as decimals
- Example: 0.25 instead of 25%
- Hard to read and understand quickly

### Solution - Format in Data Section

Steps:
1. Go to Data Section in Power BI
2. Click on the Cumulative % measure
3. Options appear at top of the screen
4. Find the Percent symbol (%) button
5. Click on it
6. Values now show as percentage format
7. Can also choose how many decimal places
   to display for precision control

### Result
- 0.25 becomes 25%
- 0.40 becomes 40%
- 1.00 becomes 100%
- Much easier to read in table and charts

### Pro Tip
- Always format percentage measures
  in Data Section not in visual format
- Formatting in Data Section applies
  everywhere the measure is used
- No need to format in each visual
  separately every time

---

## 4. AVERAGE PRICE BY ROOM TYPE

### Chart Type Used
Stacked Bar Chart (horizontal)

### Purpose
- Show average price for each room type
- Compare pricing across different
  types of Airbnb listings

### Measure Created
Average Price =
AVERAGE(listings[price])

### Chart Configuration
- Y-Axis = Room Type
- X-Axis = Average Price measure
- Shows which room type commands
  highest average price
- Example: Entire Home vs Private Room
  vs Hotel Room vs Shared Room

### Business Insight Expected
- Hotel Rooms likely highest priced
- Shared Rooms likely lowest priced
- Entire Home somewhere in between
- Helps guests compare value for money

---

## 5. RATINGS PER CITY CHART

### Chart Type Used
Stacked Column Chart (vertical)

### Purpose
- Show average rating for each city
- Identify which cities have the
  best reviewed Airbnb listings

### Measure Created
Avg Rating =
AVERAGE(listings[review_scores_rating])

### Chart Configuration
- X-Axis = City
- Y-Axis = Avg Rating measure
- Chart Title = Ratings
- Shows city-wise quality of listings
- Higher rating = better guest experience

### Business Insight Expected
- Some cities have consistently higher ratings
- Quality differences between cities visible
- Helps guests choose best cities
- Helps hosts understand competition

---

## 6. CONDITIONAL FORMATTING ON COLUMNS

### What Was Done
- Applied conditional formatting to
  the Ratings column chart
- Different colors given based on value ranges

### How to Apply Conditional Formatting
1. Right click on the column in the visual
2. Select Conditional Formatting option
3. Choose Background Color
4. Set color scale:
   Minimum value = one color (example red)
   Middle value = another color (example yellow)
   Maximum value = another color (example green)
5. Click OK and colors apply automatically

### How Colors Are Assigned
Power BI uses this formula for thresholds:
Threshold = Min + (Max - Min) x Percent / 100

- 0% to 33% range = lowest color (red)
- 33% to 67% range = medium color (yellow)
- 67% to 100% range = highest color (green)

### Why Conditional Formatting Helps
- Instantly highlights best and worst cities
- No need to read every number
- Eyes go directly to red or green columns
- Makes insights obvious at a glance
- Professional dashboard appearance

---

## ALL MEASURES CREATED IN AIRBNB PROJECT

| Measure | Formula | Purpose |
|---------|---------|---------|
| Total Listing | COUNT(listing_id) | Total properties |
| Total Cities | DISTINCTCOUNT(city) | Unique cities |
| Total Hosts | COUNT(host_id) | Total hosts |
| Total Property Types | DISTINCTCOUNT | Property variety |
| Total Reviews | DISTINCTCOUNT(review_id) | Total reviews |
| Hotel Room | CALCULATE COUNT room = Hotel | Hotel listings |
| Entire Home | CALCULATE COUNT room = Entire | Home listings |
| Private Room | CALCULATE COUNT room = Private | Private listings |
| Shared Room | CALCULATE COUNT room = Shared | Shared listings |
| Super Host | CALCULATE COUNT t | Superhost count |
| Not Super Host | CALCULATE COUNT f | Regular host count |
| City Rank | RANKX ALL DESC | City ranking |
| Cumulative Listings | VAR RETURN CALCULATE | Running total |
| Cumulative % | DIVIDE cumulative by total | Running percentage |
| Average Price | AVERAGE(price) | Avg listing price |
| Avg Rating | AVERAGE(review_scores_rating) | Avg city rating |

---

## AIRBNB DASHBOARD PROGRESS

### Visuals Completed
- Dashboard Title                           ✅
- Airbnb Logo in corner                    ✅
- 5 KPI Cards                              ✅
- Line Chart with 6 growth phases          ✅
- Business Insights panel                  ✅
- Line and Stacked Column Chart            ✅
  Super Host vs Not Super Host
- Stacked Bar Chart Average Price          ✅
  by Room Type
- Stacked Column Chart Ratings per City    ✅
  with Conditional Formatting
- Cumulative % Table with formatting       ✅

### Still To Build
- Map visual for global distribution
- Top Cities table with RANKX filter
- Review trend over time
- Final slicers for interactivity
- Final polish and upload to GitHub

---

## KEY LEARNINGS FROM TODAY

### Simplifying Complex Formulas
- If a measure already exists reuse it
- DIVIDE([existing measure], CALCULATE(...))
  is cleaner than recalculating everything
- Build measures on top of other measures
- This is called Measure Chaining

### Formatting Best Practice
- Format measures in Data Section
- Percentage format applied once globally
- Works everywhere measure is used
- Saves time formatting each visual

### Conditional Formatting Rule
- Only works on NUMERIC columns
- Cannot apply on text columns
- Uses Min Max range for color scale
- Formula: Min + (Max - Min) x % / 100

---

## Summary - What I Did Today

- Simplified cumulative percentage formula
- Formatted cumulative values as percentage
- Learned to format measures in Data Section
- Sorted chart from ascending to descending
- Created Average Price measure
- Built Stacked Bar Chart for room pricing
- Created Avg Rating measure
- Built Stacked Column Chart for city ratings
- Applied Conditional Formatting on ratings
- Learned measure chaining concept

---

## Tomorrow I Will

- Build Map visual for global distribution
- Build Top 10 Cities table using RANKX
- Add cumulative % to cities table
- Add review trend over time
- Add slicers for interactivity
- Complete Airbnb Dashboard fully
- Upload Airbnb project to GitHub