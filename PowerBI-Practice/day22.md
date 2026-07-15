# Power BI - Day 22 Learning Notes
## Topic: Airbnb Project - Calculated
##         Cumulative Percentage Measure

---

## What I Did Today

- Continued Airbnb Dashboard Project
- Created Cumulative Percentage measure
- Combined RANKX CALCULATE FILTER ALL
  and VAR RETURN together
- Used cumulative measure for city analysis
- Understood how percentage builds up
  across ranked cities

---

## CUMULATIVE PERCENTAGE MEASURE

### Why Cumulative Percentage is Needed
- Shows what percentage of total listings
  are covered by top N cities
- Example: Top 5 cities cover 40% of
  all Airbnb listings worldwide
- Helps business identify which cities
  to focus on for maximum impact
- Classic 80/20 rule analysis

---

## FORMULA CREATED TODAY

Cumulative % =
VAR currentRank =
    MAXX(
        VALUES(listings[city]),
        [City Rank]
    )
VAR cumulativeListings =
    CALCULATE(
        [Total Listing],
        FILTER(
            ALL(listings[city]),
            [City Rank] <= currentRank
        )
    )
VAR totalListings =
    CALCULATE(
        [Total Listing],
        ALL(listings[city])
    )
RETURN
    DIVIDE(
        cumulativeListings,
        totalListings
    )

---

## BREAKING DOWN THE FORMULA

---

### VAR 1 - currentRank

VAR currentRank =
    MAXX(VALUES(listings[city]), [City Rank])

- VALUES gets unique cities in current
  filter context
- MAXX evaluates City Rank measure
  for each city row by row
- Returns the maximum rank found
  in the current context
- Stores it as currentRank variable

Example:
If current row is Paris with rank 1
currentRank = 1

If current row is London with rank 2
currentRank = 2

---

### VAR 2 - cumulativeListings

VAR cumulativeListings =
    CALCULATE(
        [Total Listing],
        FILTER(
            ALL(listings[city]),
            [City Rank] <= currentRank
        )
    )

- ALL removes existing city filters
- FILTER applies new condition
- Only keeps cities where rank is
  less than or equal to currentRank
- CALCULATE sums total listings
  for all those filtered cities
- Gives running total up to current city

Example at Paris (rank 1):
cumulativeListings = listings of Paris only

Example at London (rank 2):
cumulativeListings = Paris + London listings

---

### VAR 3 - totalListings

VAR totalListings =
    CALCULATE(
        [Total Listing],
        ALL(listings[city])
    )

- ALL removes ALL city filters completely
- Gives grand total of ALL listings
  across every city in dataset
- This is the denominator for percentage
- Same value in every row

---

### RETURN - Calculate Percentage

RETURN
    DIVIDE(
        cumulativeListings,
        totalListings
    )

- DIVIDE = safe division function
- Divides cumulative by total
- Gives percentage as decimal
- Example: 0.25 means 25%
- Format the measure as Percentage
  in Power BI to show % symbol

---

## HOW CUMULATIVE PERCENTAGE BUILDS UP

Example Table Result:

| City | Listings | City Rank | Cumulative Listings | Cumulative % |
|------|----------|-----------|---------------------|--------------|
| Paris | 1200 | 1 | 1200 | 12% |
| London | 900 | 2 | 2100 | 21% |
| Berlin | 700 | 3 | 2800 | 28% |
| Rome | 600 | 4 | 3400 | 34% |
| Madrid | 500 | 5 | 3900 | 39% |
| Others | ... | ... | ... | 100% |

### Business Insight from This
- Top 1 city = 12% of all listings
- Top 5 cities = 39% of all listings
- Tells business where most inventory is
- Helps prioritize marketing by city

---

## KEY DAX CONCEPTS USED TODAY

### DIVIDE vs Division Operator

| Method | Syntax | Handles Zero |
|--------|--------|-------------|
| Division | a / b | Error if b = 0 |
| DIVIDE | DIVIDE(a, b) | Returns blank if b = 0 |

Always use DIVIDE for safe calculation
Never use slash for division in DAX
DIVIDE prevents divide by zero errors

### Multiple VAR in One Formula
- Can use as many VARs as needed
- Each VAR stores one step of calculation
- Makes complex formula readable
- Each VAR can reference previous VARs
- RETURN uses all VARs together

### VAR Naming Best Practice
- Use clear descriptive names
- currentRank not cr or x
- cumulativeListings not cl
- totalListings not tl
- Makes debugging easier later

---

## DIFFERENCE BETWEEN MEASURES CREATED

| Measure | What It Shows |
|---------|---------------|
| Total Listing | Count of all listings |
| City Rank | Rank of each city by listing count |
| Cumulative Listings | Running total up to current rank |
| Cumulative % | Running percentage up to current rank |

---

## HOW TO USE IN DASHBOARD

### Add to Table Visual
- Columns: City, Listings, City Rank,
  Cumulative Listings, Cumulative %
- Sort by City Rank ascending
- Format Cumulative % as Percentage
- Shows complete ranking analysis

### Add to Line Chart
- X-Axis = City Rank
- Y-Axis = Cumulative %
- Shows S-curve of coverage
- Flattens when adding more cities
  adds less percentage contribution
- Identifies the elbow point

### Filter for Top N Cities
- Add City Rank to Filters
- Set filter to is less than or equal to 10
- Shows only top 10 cities
- Cumulative % shows coverage of top 10

---

## AIRBNB DASHBOARD PROGRESS

### Measures Created So Far
- Total Listing = COUNT(listing_id)         ✅
- Total Cities = DISTINCTCOUNT(city)         ✅
- Total Hosts = COUNT(host_id)               ✅
- Total Property Types = DISTINCTCOUNT       ✅
- Total Reviews = DISTINCTCOUNT(review_id)  ✅
- Hotel Room = CALCULATE COUNT room type    ✅
- Entire Home = CALCULATE COUNT room type   ✅
- Private Room = CALCULATE COUNT room type  ✅
- Shared Room = CALCULATE COUNT room type   ✅
- Super Host = CALCULATE COUNT t            ✅
- Not Super Host = CALCULATE COUNT f        ✅
- City Rank = RANKX ALL DESC                ✅
- Cumulative Listings = VAR RETURN          ✅
- Cumulative % = VAR RETURN DIVIDE          ✅

### Visuals Completed
- Dashboard Title                           ✅
- Airbnb Logo in corner                    ✅
- 5 KPI Cards                              ✅
- Line Chart with 6 growth phases          ✅
- Business Insights panel                  ✅
- Line and Stacked Column Chart            ✅
  Super Host vs Not Super Host

### Still To Build
- Map visual for global distribution
- Top Cities table with RANKX filter
- Review trend over time
- Price distribution analysis
- Final slicers and interactivity

---

## Power BI Learning Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 to 3 | Data Loading Power Query Charts | Done |
| Day 4 | Data Professional Survey Project | Done |
| Day 5 to 8 | Components Charts Data Model | Done |
| Day 9 to 11 | DAX Deep Dive All Functions | Done |
| Day 12 to 15 | Airbnb Project Building | Done |
| Day 16 to 19 | Revisions and Interview Prep | Done |
| Day 20 | Interview Preparation | Done |
| Day 21 | Interview Day | Done |
| Day 22 | Cumulative Percentage Measure | Done |

---

## Summary - What I Did Today

- Created Cumulative Percentage measure
- Used 3 VAR variables in one formula
- Combined RANKX MAXX VALUES CALCULATE
  FILTER ALL and DIVIDE together
- Understood how percentage accumulates
- Learned DIVIDE vs division operator
- Applied measure to Airbnb dashboard
- Back to building after interview day!

---

## Tomorrow I Will

- Build map visual for Airbnb locations
- Build Top 10 Cities table with RANKX
- Add cumulative % to ranking table
- Add review trend chart
- Add slicers for interactivity
- Work towards completing Airbnb project