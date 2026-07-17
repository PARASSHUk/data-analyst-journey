# Power BI - Day 24 Learning Notes
## Topic: Pareto Method, Bookmarks,
##         Rating Measures and Matrix Chart

---

## What I Did Today

- Learned Pareto Method and 80/20 principle
- Created 5 rating measures for Airbnb
- Built Matrix Chart for detailed ratings
- Applied Cell Formatting on Matrix
- Created 2 Bookmarks for navigation
- Linked buttons to bookmarks
- Built interactive bookmark switching

---

## PARETO METHOD

### What is the Pareto Method
The Pareto Method is based on the 80/20 principle
where approximately 80% of results come from
just 20% of causes.

### Why Do We Use Pareto Method
Businesses have limited time money and resources.
They cannot improve everything at once.
Instead they ask:
Which few things are creating the biggest impact?
The Pareto method helps answer that question.

### In Power BI Context
- Which few cities contribute most of total listings?
- Which few products generate 80% of revenue?
- Which few customers bring 80% of sales?
- Which few issues cause 80% of complaints?

### How Pareto Works in Our Dashboard
- Rank all cities by listing count (highest first)
- Calculate cumulative percentage
- Find where cumulative % crosses 80%
- Cities before that point = the vital 20%
- These are the cities to focus on

### Business Application
The Pareto method helps identify the small number
of categories that contribute to the majority
of the outcome. In business it is used to
prioritize high-impact products customers cities
or issues so that resources are focused where
they deliver the greatest benefit.

### Pareto Chart Elements
- X-Axis = Cities sorted by listing count
- Bar Chart = individual city listing count
- Line Chart = cumulative percentage
- When line crosses 80% mark = Pareto line
- Everything left of that line = vital few

---

## RATING MEASURES CREATED

Created 5 individual rating measures
for detailed Airbnb analysis:

### Measure 1 - Accuracy Rating
Accuracy =
AVERAGE(listings[review_scores_accuracy])
- Measures how accurate the listing description is
- Guests rate if listing matched expectations

### Measure 2 - Cleanliness Rating
Cleanliness =
AVERAGE(listings[review_scores_cleanliness])
- Measures how clean the property was
- One of the most important factors for guests

### Measure 3 - Communication Rating
Communication =
AVERAGE(listings[review_scores_communication])
- Measures how responsive the host is
- Quick responses lead to better experience

### Measure 4 - Location Rating
Location =
AVERAGE(listings[review_scores_location])
- Measures how good the location is
- Proximity to attractions transport etc

### Measure 5 - Overall Rating (Already Had)
Avg Rating =
AVERAGE(listings[review_scores_rating])
- Overall satisfaction score from guests

---

## MATRIX CHART FOR DETAILED RATINGS

### Purpose
Show all 5 rating types broken down
by city or property type side by side

### Matrix Configuration
- Rows = City or Room Type
- Values = All 5 rating measures
  Accuracy Cleanliness Communication
  Location Overall Rating
- Shows multi-dimensional rating comparison

### Customization Done
- Removed Row Subtotals
- Removed Grand Total row
- Cleaner look without unnecessary totals
- Steps to remove:
  Format Visual → Visual → Row Subtotals → Off
  Format Visual → Visual → Grand Total → Off

### Cell Formatting Applied
- Used Conditional Formatting on cells
- Go to Cell Elements in Format Visual
- Apply Background Color by value
- Higher ratings = green color
- Lower ratings = red or orange color
- Makes best and worst ratings
  instantly visible at a glance

---

## BOOKMARKS IN POWER BI

### What are Bookmarks
Bookmarks capture the current state of a
report page including which visuals are
visible which filters are applied and
which selections are made.
Used to create navigation between different
views of the same dashboard.

### Our Use Case
Created 2 bookmark views:
1. Overall Rating = shows simple overall rating chart
2. Detailed Rating = shows full matrix with all 5 ratings

User clicks a button to switch between views
without going to a different page.

---

## STEP BY STEP BOOKMARK CREATION

### Step 1 - Create Rating Visuals
- Built Overall Rating chart (simple column chart)
- Built Detailed Rating matrix (all 5 measures)
- Both visuals placed on same dashboard page
- They will swap when bookmark is clicked

### Step 2 - Add Buttons for Navigation
- Go to Insert tab
- Click Buttons
- Added Star button → named it Overall Rating
- Added Magnifying Glass button → named it Detailed Rating

### Step 3 - Add Title for Bookmark Section
- Added text box with title:
  Select The Detail Level
- Placed above the two buttons
- Helps user understand what buttons do

### Step 4 - Group Button with Label
- Select button label text (hold CTRL + SHIFT)
- Click the button icon as well
- Right click → Group
- Both label and button move together
- Did same for both buttons

### Step 5 - Create the Bookmarks
1. Go to View tab at top
2. Click Selection panel
3. Click Bookmarks panel
4. Click on the Overall Rating visual
   (make Detailed Rating hidden)
5. Click Add Bookmark
6. Name it: Overall

7. Click on the Detailed Rating matrix
   (make Overall Rating hidden)
8. Click Add Bookmark
9. Name it: Detailed

### Step 6 - Clean Up Bookmark Settings
For BOTH bookmarks do this:
1. Right click on the bookmark (3 dots)
2. Uncheck Data option
3. Uncheck Current Page option
4. Check Selected Visuals option only
- This ensures bookmark only remembers
  which visual is visible
- Not the filter state or page position

### Step 7 - Link Buttons to Bookmarks

For Magnifying Glass button (Detailed):
1. Click on the button
2. Go to Format Visual
3. Find Action section
4. Toggle Action ON
5. Type = Bookmark
6. Bookmark = Detailed

For Star button (Overall):
1. Click on the button
2. Go to Format Visual
3. Find Action section
4. Toggle Action ON
5. Type = Bookmark
6. Bookmark = Overall

### Step 8 - Test the Bookmarks
- To test in edit mode:
  Hold CTRL key + Click the button
- Star button shows Overall Rating chart
- Magnifying Glass shows Detailed Matrix
- Smooth switching between views!

---

## HOW BOOKMARKS WORK TECHNICALLY

### Selected Visuals Setting
- When Selected Visuals is checked
- Bookmark only captures visibility state
- Of currently selected visuals only
- Not all visuals on the page

### Why Remove Data and Current Page
- Data = if unchecked bookmark does not
  remember filter state (good for navigation)
- Current Page = if unchecked bookmark
  does not lock to specific page
- We only want visibility to be captured

### CTRL + Click for Testing
- In edit mode buttons need CTRL + Click
- In published view clicking works directly
- Users do not need to hold CTRL

---

## KEY LEARNINGS FROM TODAY

### Pareto Principle
- 80% of results come from 20% of causes
- Find the vital few not the trivial many
- Use cumulative % to identify the 80% line
- Focus resources on high-impact categories

### Bookmarks Best Practices
- Always uncheck Data in bookmark settings
- Always uncheck Current Page
- Always check Selected Visuals only
- Group button with its label text
- Give clear descriptive bookmark names
- Test with CTRL + Click in edit mode

### Matrix vs Table
- Table = simple rows and columns
- Matrix = rows columns with aggregation
  and drill down capability
- Matrix is better for multi-measure comparison
- Remove grand totals for cleaner look

### Cell Formatting
- Applied to Matrix visual cells
- Colors change based on value
- Higher = green lower = red
- Makes patterns visible instantly

---

## AIRBNB DASHBOARD PROGRESS

### Visuals Completed
- Dashboard Title                           ✅
- Airbnb Logo                              ✅
- 5 KPI Cards                              ✅
- Line Chart with 6 growth phases          ✅
- Business Insights panel                  ✅
- Super Host vs Not Super Host Chart       ✅
- Average Price by Room Type               ✅
- Ratings per City with Conditional Format ✅
- Cumulative % Table                       ✅
- Overall Rating Chart                     ✅
- Detailed Rating Matrix                   ✅
- Bookmark Navigation Buttons              ✅
- Select Detail Level section              ✅

### Still To Build
- Map visual for global distribution
- Top Cities table with RANKX
- Final slicers for interactivity
- Final polish and upload to GitHub

---


---

## Summary - What I Did Today

- Learned Pareto 80/20 principle in detail
- Created 5 individual rating measures
- Built Detailed Rating Matrix visual
- Removed grand totals from Matrix
- Applied Cell Formatting with color scale
- Created 2 Bookmarks Overall and Detailed
- Added Star and Magnifying Glass buttons
- Grouped buttons with their labels
- Linked buttons to bookmarks using Actions
- Tested bookmark switching with CTRL Click

---

## Tomorrow I Will

- Build Map visual for global listing distribution
- Build Top 10 Cities table using RANKX
- Add final slicers for interactivity
- Complete Airbnb Dashboard fully
- Take dashboard screenshot
- Write README for Airbnb project
- Upload Airbnb project to GitHub!