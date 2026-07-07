# Power BI - Day 14 Learning Notes
## Topic: Airbnb Dashboard - KPI Formatting,
##         Alignment, and Line Chart with
##         Custom DAX Measures

---

## What I Did Today

- Adjusted KPI card padding
- Set exact KPI card size manually
- Aligned multiple KPI cards perfectly
- Created 5 KPI cards for Airbnb dashboard
- Built Line Chart with custom DAX measures
- Created 4 separate measures for room types

---

## KPI CARD FORMATTING

---

### 1. Padding Adjustment

- Controls the inner spacing of KPI card
- Steps:
  Select KPI Card
  Go to Visual Format
  Go to Visual tab
  Find Multi Card Layout
  Find Padding option
  Adjust padding value as needed
- Padding adds breathing room inside the card
- Makes numbers look less cramped

---

### 2. Setting Exact Height and Width

- For precise sizing of KPI cards
- Manual size control for consistency
- Steps:
  Select KPI Card
  Go to General tab
  Go to Properties
  Find Size section
  Enter exact Height value
  Enter exact Width value
- Always set same size for all KPI cards
- Consistent size = professional look

---

### 3. Align Multiple KPI Cards

- After creating and sizing all KPI cards
- Need to align them in a perfect line

#### Steps to Align
1. Select ALL KPI cards together
   (Click first card, hold SHIFT, click rest)
2. Go to Format menu at top
3. Click Align
4. Choose Vertical Align to align tops
5. Choose Horizontal Align to space evenly
6. All cards now equally spaced horizontally
   and perfectly aligned vertically

#### Result
- Cards are separated in equal horizontal spacing
- All cards sit on the same vertical level
- Looks clean and professional

---

## 5 KPI CARDS CREATED TODAY

---

### KPI 1 - Total Listings
- Field: Listing ID
- Aggregation: COUNT
- Formula logic: Count of Listing ID
- Shows total number of Airbnb properties

### KPI 2 - Total Cities
- Field: City
- Aggregation: COUNT DISTINCT
- Formula logic: Distinct count of City
- Shows how many unique cities have listings

### KPI 3 - Total Hosts
- Field: Host ID
- Aggregation: COUNT
- Formula logic: Count of Host ID
- Shows total number of hosts on platform

### KPI 4 - Total Property Types
- Field: Property Type
- Aggregation: COUNT DISTINCT
- Formula logic: Distinct count of Property Type
- Shows variety of property types available

### KPI 5 - Total Reviews
- Field: Review ID
- Aggregation: COUNT DISTINCT
- Formula logic: Distinct count of Review ID
- Shows total unique reviews received

---

## LINE CHART - LISTINGS BY HOST SINCE AND ROOM TYPE

### Chart Configuration
- X-Axis = Host Since (date when host joined)
- Y-Axis = Count of Listing ID
- Sub-divided by Room Type (4 categories)

### Problem Encountered
- No pre-built Room Type breakdown column existed
- Could not directly split by room type on Y-Axis
- Needed separate measure for each room type

### Solution - Create Custom DAX Measures

Created 4 separate measures using CALCULATE
with filter for each room type:

#### Measure 1 - Hotel Room Listings
Hotel Room =
CALCULATE(
    COUNT(listings[listing_id]),
    listings[room_type] = "Hotel room"
)

#### Measure 2 - Entire Home Listings
Entire Home =
CALCULATE(
    COUNT(listings[listing_id]),
    listings[room_type] = "Entire home/apt"
)

#### Measure 3 - Private Room Listings
Private Room =
CALCULATE(
    COUNT(listings[listing_id]),
    listings[room_type] = "Private room"
)

#### Measure 4 - Shared Room Listings
Shared Room =
CALCULATE(
    COUNT(listings[listing_id]),
    listings[room_type] = "Shared room"
)

### Final Chart Setup
- All 4 measures added to Y-Axis
- Each measure shows as a separate line
- X-Axis shows Host Since date (trend over time)
- Chart shows growth of each room type over time
- Can compare which room type grew fastest

### Why This Approach
- CALCULATE with filter = most flexible method
- Each measure filters only its room type
- Multiple measures on Y-Axis = multiple lines
- Gives more control than using Legend field

---

## KEY LEARNINGS FROM TODAY

### Formatting Best Practices
- Always set exact same size for all KPI cards
- Use Format → Align to space cards evenly
- Padding makes cards look professional
- Consistent formatting = professional dashboard

### DAX Insight
- When a column does not exist for breakdown
- Create separate CALCULATE measures
- One measure per category
- Add all measures to Y-Axis for comparison
- More flexible than relying on existing columns

### CALCULATE with String Filter
CALCULATE(
    COUNT(table[column]),
    table[filter_column] = "exact value"
)
- Filter value must be in QUOTES
- Match exactly as it appears in data
- Case sensitive in some situations

---

## AIRBNB DASHBOARD PROGRESS

### Completed So Far
- Dashboard title                          ✅
- Airbnb logo in corner                   ✅
- 5 KPI cards (Listings City Host
  Property Type Reviews)                  ✅
- Line Chart (Listings by Host Since
  split by Room Type)                     ✅

### Still To Build
- Map visual for geographical distribution
- Bar chart for top cities by listings
- Review trend chart over time
- Price analysis visual
- Slicers for filtering

---



---

## Summary - What I Did Today

- Adjusted KPI card padding for better spacing
- Set exact height and width for all KPI cards
- Aligned 5 KPI cards using Format Align tool
- Created 5 KPI cards for Airbnb dashboard
  Listings Cities Hosts Property Types Reviews
- Built Line Chart for listing growth over time
- Created 4 custom DAX measures for room types
  Hotel Room Entire Home Private Room Shared Room
- Used CALCULATE with string filter for each type
- Added all 4 measures to Y-Axis as separate lines

---

## Tomorrow I Will Continue

- Build map visual for location analysis
- Build bar chart for top cities by listings
- Add review trend analysis
- Add price distribution visual
- Add slicers for interactivity
- Complete Airbnb dashboard fully
- Upload to GitHub as second Power BI project