# Power BI - Day 13 Learning Notes
## Topic: Snowflake Schema, Dashboard Design,
##         Airbnb Project - Dashboard Building

---

## What I Learned Today

- Snowflake Schema concept
- Difference between Star and Snowflake Schema
- Relationships in Power BI recap
- Dashboard page size settings
- Dashboard design best practices
- Building Airbnb Global Performance Dashboard
  Step 1 - Title creation and formatting
  Step 2 - Adding logo
  Step 3 - Creating KPI cards

---

## SNOWFLAKE SCHEMA

A Snowflake Schema is a data model where
a DIMENSION TABLE is further divided into
MULTIPLE related tables.
It looks like a snowflake shape in Model View.

---

## STAR SCHEMA vs SNOWFLAKE SCHEMA

| Feature | Star Schema | Snowflake Schema |
|---------|-------------|-----------------|
| Fact Table | One central fact table | One central fact table |
| Dimension Tables | Not normalized (flat) | Normalized (split further) |
| Number of Tables | Fewer tables | More tables |
| Query Speed | Faster queries | Slightly slower queries |
| Complexity | Simpler model | More complex model |
| Data Redundancy | Some duplicate data | Less duplicate data |
| Maintenance | Harder to maintain | Easier to maintain |
| Best For | Smaller databases | Very large databases |

---

### Why Use Snowflake Schema

#### Advantages
- Less duplicate data in tables
- Easier to maintain and update
- Better for very large databases
- More normalized data structure

#### Disadvantages
- Requires more JOINS to get data
- Slightly slower query performance
- More complex model to understand
- Takes more time to set up

---

## RELATIONSHIPS IN POWER BI RECAP

Types of relationships available:
1. One to One (1:1)
2. One to Many (1:*)
3. Many to One (*:1)
4. Many to Many (*:*)

Active vs Inactive:
- Solid line = Active relationship
- Dotted line = Inactive relationship

Crossfilter Direction:
- Single = filters flow one way
- Both = filters flow both ways

---

## DASHBOARD PAGE SIZE SETTINGS

### How to Change Dashboard Size
- Go to Format Your Report Page
- Options available:
  4:3 ratio (traditional)
  16:9 ratio (widescreen default)
  Custom (any size you define)
- Choose based on where dashboard will be viewed
- 16:9 is most common for modern screens

---

## AIRBNB GLOBAL PERFORMANCE DASHBOARD

### Project Name
Global Airbnb Performance Dashboard

### Dataset Source
Maven Analytics

### Tables Used
- Listings = property and host details
- Reviews = customer review data

---

## STEP 1 - CREATE DASHBOARD TITLE

### Title Text
Global Airbnb Performance Dashboard

### Design Rules for Title

#### Font Consistency Rule
- Text format should be SAME throughout dashboard
- Font family consistent across all visuals
- Only SIZE should differ for hierarchy

#### Size Hierarchy Rule
- Title text must be the LARGEST text on dashboard
- Example: If title is size 20
  NO other text on dashboard should be
  greater than or equal to size 20
  All other text must be SMALLER than title

#### Alignment Rule
- Set title alignment to CENTER
- Steps to align:
  Select the title text box
  Go to Format menu at top
  Click Align
  Click Align Center

---

## STEP 2 - ADD AIRBNB LOGO

### Design Rule for Logos
- Logos are ALWAYS placed in CORNERS
  of the dashboard
- Usually top-left or top-right corner
- Never in the middle of the dashboard

### Steps to Add Logo
1. Go to Insert tab at top
2. Click Image
3. Go to Format Image panel
4. Go to Style section
5. Click Browse Image
6. Upload the Airbnb logo image file
7. Resize and position to corner

---

## STEP 3 - CREATE KPI CARDS

### What to Show in KPI
- Listing ID placed in Values field
- Shows count of total listings

### Formatting KPI for Readability

#### Step 1 - Add Thousand Separator
- Makes large numbers easy to read
- Example: 1000000 becomes 1,000,000
- Steps:
  Select the Card visual
  Go to Format Visual
  Go to General
  Go to Format Options
  Turn ON Thousand Separator

#### Step 2 - Remove Display Units
- By default Power BI shows K M B (thousands millions)
- This can be confusing for exact values
- Steps to show exact number:
  Come out of General section
  Go to Visual section
  Find Callout
  Go to Values
  Find Display Unit
  Change Display Unit to NONE
- Now shows exact number with thousand separator
- Example: 48,895 instead of 48.9K

### Why This Formatting Matters
- Makes KPI instantly readable
- Anyone can understand the value immediately
- Thousand separator prevents misreading
- No display units means exact precision
- Professional dashboard appearance

---

## DASHBOARD DESIGN PRINCIPLES LEARNED

### Consistency Rules
- Same font family throughout dashboard
- Consistent color palette (2 to 4 colors)
- Consistent spacing between visuals
- Consistent text sizes (title > section > body)

### Layout Rules
- Title at top center
- Logo in corner (top left or top right)
- KPI cards just below title
- Charts in main body area
- Filters and slicers on left or top

### Text Size Hierarchy
- Dashboard Title = largest (example: 20+)
- Section Headers = medium (example: 14-16)
- Chart Labels = smaller (example: 10-12)
- Data Labels = smallest (example: 8-10)

---

## KEY LEARNINGS FROM TODAY

### Snowflake vs Star
- Star = simpler and faster
- Snowflake = less redundancy but more joins
- Most Power BI projects use Star Schema
- Snowflake used for very large enterprise data

### Dashboard Formatting Tips
- Always use Format Your Report Page
  to set correct canvas size first
- Add title BEFORE adding any visuals
- Logo always goes in corners not center
- KPI cards always go near the top

### Thousand Separator Tip
- Always apply thousand separator on large numbers
- Always set Display Unit to NONE for exact values
- Users should understand numbers at a glance

---


## Summary - What I Did Today

- Learned Snowflake Schema and differences
  from Star Schema
- Understood when to use which schema
- Learned dashboard page size settings
- Applied title design rules and font hierarchy
- Added Airbnb logo to correct corner position
- Created KPI card with listing count
- Applied thousand separator formatting
- Changed display units to NONE for exact values

---

## Tomorrow I Will Continue

- Continue Airbnb Dashboard building
- Add more KPI cards
- Build charts for listing analysis
- Build review trend charts
- Add slicers for interactivity
- Complete Airbnb project and upload to GitHub