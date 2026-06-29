# Power BI - Day 6 Learning Notes
## Topic: Visualization Charts in Power BI
##         Bar Chart, Column, Pie, Donut,
##         Tree Map, Table and Matrix

---

## What I Learned Today

- Bar Chart customization in detail
- Column Chart
- Pie Chart
- Donut Chart
- Tree Map with hierarchy
- Table visualization with formatting
- Conditional Formatting with icons
- Matrix visualization
- Hierarchical Matrix with Drill Down

---

## VISUALIZATION CHARTS IN POWER BI

---

### 1. Bar Chart

- Used when analyzing numerical values
  with categorical values
- Categories on Y-Axis
- Values on X-Axis
- Best for comparing categories horizontally

#### Customization Learned
- Can manually edit colors of each bar
  WITHOUT using Legends
- Can add borders to bars for better look
- Go to Format Visual to change colors

#### Focus Mode Tip
- When in Focus Mode the title section
  is not properly visible
- Come OUT of Focus Mode first
- Then make changes to title
- Then go back to Focus Mode to verify

---

### 2. Column Chart

- Same as Bar Chart but axes are swapped
- X-Axis = Categories
- Y-Axis = Values
- Vertical bars instead of horizontal
- Best for time-based comparisons
- Example: Monthly sales comparison

#### Bar Chart vs Column Chart
| Feature | Bar Chart | Column Chart |
|---------|-----------|--------------|
| Bars direction | Horizontal | Vertical |
| Categories axis | Y-Axis | X-Axis |
| Values axis | X-Axis | Y-Axis |
| Best for | Long category names | Time periods |

---

### 3. Pie Chart

- A circular chart divided into slices
- Each slice = one category
- Slice size = category proportion of whole
- Shows percentage distributions
- Helps compare parts of a whole
- Best for few categories (less than 6)
- Do NOT use when categories are too many
- Example: Sales percentage by region

---

### 4. Donut Chart

- Same as Pie Chart but with hollow center
- Hollow center makes it visually distinct
- Center space can show labels or KPIs
- Used to represent proportions of a whole
- Cleaner look compared to Pie Chart
- Example: Gender salary comparison

#### Pie Chart vs Donut Chart
| Feature | Pie Chart | Donut Chart |
|---------|-----------|-------------|
| Center | Solid | Hollow |
| Extra space | No | Yes for KPI |
| Visual appeal | Basic | More modern |
| Use case | Same | Same |

---

### 5. Tree Map

- A hierarchical chart
- Shows parent and child data distribution
- Displayed as a group of rectangles
- Rectangles are segregated by category
- Larger numeric values appear at TOP
- Smaller numeric values appear at BOTTOM
- Size of rectangle = value magnitude

#### How It Was Used in Practice
- Category section = Sub-Category
- Details = Region
- Values = SUM(Sales)
- Shows which sub-category in which region
  has the highest and lowest sales

#### When to Use Tree Map
- When showing hierarchy of data
- When comparing sizes of categories
- When you have parent-child relationships
- Example: Country → State → City sales

---

### 6. Table

- Normal grid showing data in rows and columns
- Has headers and rows
- Shows exact values not summary
- Users can cross-highlight elements
- Can select individual cells, rows, columns

#### Table Formatting Options

##### Alternate Row Colors
- Can give different colors to alternate rows
- Makes table easier to read
- Go to Format Visual → Style Presets

##### Style Presets
- Power BI has built-in table templates
- Steps:
  Select Table →
  Format Visual →
  Visual →
  Style Presets →
  Choose template

##### Conditional Formatting with Icons
- Icons can be added to numeric columns
- Uses 3 ranges: 0-33%, 33-67%, 67-100%

##### How Icon Percentage is Calculated
Power BI uses this formula for thresholds:

Threshold = Min + (Max - Min) × Percent / 100

Example Calculation:
- Min = 234
- Max = 5968
- Range = 5968 - 234 = 5734
- 67% Threshold:
  234 + (5734 × 0.67)
  234 + 3841.78
  = 4075.78
- Values below 33% threshold = low icon
- Values between 33% and 67% = medium icon
- Values above 67% threshold = high icon

---

### 7. Matrix

- Similar to Table but more powerful
- Table = data in 2 dimensions only
- Matrix = data in MULTIPLE dimensions
- Matrix aggregates data automatically
- Lets users drill down into data

#### Example Used in Practice
- Rows = Sub-Categories
- Columns = Region
- Values = Sales
- Shows sales of each sub-category
  broken down by each region

#### Important Rule
- Conditional Formatting in Matrix
  is ONLY applicable on numeric columns
- Example: Sales, Profit, Quantity
- Cannot apply on text columns

---

### 8. Hierarchical Matrix

- Special type of Matrix with multiple levels
- Uses Category + Region + Sub-Category
  all placed in the same Rows field
- Gives PLUS (+) icon on each row

#### How Drill Down Works in Hierarchical Matrix
- Click PLUS (+) icon on a category row
- It expands to show all regions for that category
- Click PLUS (+) on a region row
- It further expands to show sub-categories
- Drag Sales into Values section to see numbers
- Go from high level to low level detail easily

#### Hierarchical Matrix vs Regular Matrix
| Feature | Regular Matrix | Hierarchical Matrix |
|---------|---------------|---------------------|
| Levels | 2 rows and columns | Multiple nested levels |
| Drill Down | No | Yes with + icon |
| Detail | Fixed | Expandable |
| Use Case | Simple cross tab | Complex hierarchy |

---

## ALL CHARTS SUMMARY TABLE

| Chart | Best For | Avoid When |
|-------|----------|------------|
| Bar Chart | Categorical vs numeric horizontal | Too many categories |
| Column Chart | Time-based comparisons vertical | Long category names |
| Pie Chart | Parts of a whole few categories | More than 6 categories |
| Donut Chart | Same as pie with center KPI | Too many slices |
| Tree Map | Hierarchical size comparison | No hierarchy in data |
| Table | Exact row level values | Trend analysis needed |
| Matrix | Cross-tab multi-dimensional | Simple single dimension |
| Hierarchical Matrix | Multi-level drill down | Flat non-nested data |

---

## CONDITIONAL FORMATTING FORMULA RECAP

Threshold = Min + (Max - Min) × Percent / 100

This formula decides icon assignment:
- 0% to 33% range = LOW icon (red or down arrow)
- 33% to 67% range = MEDIUM icon (yellow)
- 67% to 100% range = HIGH icon (green or up arrow)

Only works on NUMERIC value columns!

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

---

## Summary - What I Learned Today

- Customized Bar Chart colors and borders
- Understood Focus Mode title issue fix
- Learned Column Chart differences from Bar
- Learned Pie and Donut Chart use cases
- Used Tree Map with category and region
- Formatted Table with style presets
- Applied Conditional Formatting with icons
- Understood threshold percentage formula
- Built Matrix for cross-tab analysis
- Built Hierarchical Matrix with Drill Down
---

## Tomorrow I Will Learn

- More DAX functions CALCULATE and FILTER
- Waterfall Chart and Funnel Chart
- Slicer types and advanced filtering
- Build another Power BI project
- Continue Power BI learning journey!