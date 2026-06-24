# Power BI - Day 1 Learning Notes
## Topic: Introduction, Data Loading, Power Query,
##         Charts and Table Relationships
## Total Power BI Days Completed: 1

---

## What is Power BI

Power BI is a business intelligence and data
visualization tool developed by Microsoft.
It helps organizations collect, analyze, and
visualize data from multiple sources to make
better business decisions.

---

- Data Loading and Basic Charts

### Step 1 - Load Data
- Loaded Excel data into Power BI Desktop
- Opened Power Query Editor
- Renamed column from "date" to "date_purchased"
- Saved changes and loaded to report view

### Step 2 - Create Pivot Table
- Created a pivot table between Store and Price columns
- Used it as base for chart creation

### Step 3 - Add Stacked Chart
- Applied Stacked Chart on the pivot table
- Stacked charts show total value AND contribution
  of each category in one single visualization

### Step 4 - Add Colors Using Legend
- Added Store column to Legend field
- Each store gets a different color automatically
- Makes chart easier to read and compare

### Step 5 - Change Chart Title
- Go to Format Visual → General → Title
- Click on chart and change title text

### Step 6 - Add Data Labels
- Go to Format Visual → Visual → Data Label
- Turn on to show values on chart bars

### Step 7 - Show Exact Values
- Go to Format Visual → Visual → Label
- Scroll down to Values
- Change Display Units to None
- Now shows exact numbers not rounded values

---

## What is a Stacked Chart

A stacked chart shows multiple data series
stacked on top of each other in a single
bar or column.

### Types of Stacked Charts

#### 1. Stacked Column Chart
- Vertical bars with categories stacked
- Use when comparing totals across periods
- Use when showing category contribution to total
- Example: Monthly sales by product
- Example: Revenue by department

#### 2. Stacked Bar Chart
- Horizontal version of stacked columns
- Use when category names are long
- Use when comparing many groups
- Example: Employee count by department and gender

#### 3. 100% Stacked Chart
- Shows percentages instead of actual values
- Use when you care about proportions not totals
- Example: Market share of brands
- Example: Survey responses

### When NOT to Use Stacked Charts
- When you have too many categories (more than 5-6)
- When you need precise comparison between segments
- When stacks become very small and hard to read

---

## What is a Clustered Chart

A Clustered Chart also called a Grouped Chart
displays multiple categories side by side
instead of stacking them.

### When to Use Clustered Charts
- Comparing values between categories
- Comparing actual vs target values
- Comparing multiple products
- Comparing yearly performance
- Comparing departments or regions

### When NOT to Use Clustered Charts
- When you want to show category contribution to total
- When you want to show percentages
- When you have too many categories (20-30 bars)
- When you want to show trends over time

---

## VIDEO 2 - Power Query Data Transformation

### Loading Excel with Pivot Table
- Can import both Excel raw data and
  Excel Pivot Tables into Power BI
- Power Query handles all transformations

### Transformations Done in Power Query

#### Remove Top Rows
- Click on table row number
- Home → Remove Rows → Top Rows
- Enter number of rows to remove
- Used to remove irrelevant header rows

#### First Row as Header
- Go to Transform
- Choose Use First Row as Headers
- Converts first data row to column names

#### Fix Data Types
- Power BI automatically detects data types
- You can see applied changes in Applied Steps panel
- Click on data type icon next to column name
  to manually fix incorrect data types

#### Remove Empty Rows
- Click filter arrow on column
- Go to Remove Empty
- Removes all blank rows from that column

#### Remove Rows with Specific Text
- Click filter arrow on column
- Go to Text Filters → Does Not Contain
- Type the text you want to exclude
- All rows containing that text are removed

#### Remove Columns
- Click on the column to select it
- Go to Home → Remove Columns
- Column is permanently removed from query

#### Unpivot Columns
- Select first column
- Hold Shift and select last column to include
- Go to Transform → Unpivot Columns
- Converts wide table to long table format
- Very useful for time series data in Excel

#### Fix Date Column
- Click data type icon on date column
- Change to Date type
- Rename column to give proper name

---

- Create and Build Relationships

### What are Relationships in Power BI
- Relationships connect two tables together
- Similar to JOINS in SQL
- Allows data from multiple tables to work together
- Essential for accurate cross-table calculations

### How to Create a Relationship

#### Method 1 - Model View
- Go to Model View (left panel icon)
- Find the two tables to connect
- Double click on the line connecting them
- Check which column is common to both tables
- Click on column in Table 1
- Click on same column in Table 2
- Relationship is created

#### Method 2 - Drag and Drop
- Go to Model View
- Find common column in Table 1
- Drag it to the same column in Table 2
- Drop it and relationship is created automatically

### Understanding Relationship Arrows

#### Single Arrow Direction
- Data filters flow in one direction only
- From one table to another
- Most common and recommended setting

#### Both Arrow Directions (Bidirectional)
- Data filters flow in both directions
- Both tables treat each other as single table
- Use carefully as can cause unexpected results
- Gives exact data from both tables when needed

### Using Measures with Relationships
- Click on the table in Model View
- Go to New Measure
- Use COUNT function on product ID column
- Measure appears in the table field list
- Drag measure to visual to see count by state
- With bidirectional relationship you get
  accurate state-wise data from both tables

---

## Key Power BI Terms Learned Today

| Term | Meaning |
|------|---------|
| Power Query | Data transformation tool in Power BI |
| Applied Steps | History of all changes made in Power Query |
| Model View | Where you manage table relationships |
| Report View | Where you build dashboards and charts |
| Data View | Where you see all loaded data tables |
| Measure | Calculated value using DAX formula |
| Legend | Field that adds color grouping to charts |
| Unpivot | Convert wide table to long table format |

---

## Power BI vs Excel Comparison

| Feature | Excel | Power BI |
|---------|-------|---------|
| Data Size | Limited rows | Millions of rows |
| Interactivity | Basic slicers | Advanced filters |
| Relationships | VLOOKUP manual | Automatic model |
| Sharing | File sharing | Cloud publishing |
| Refresh | Manual | Automatic |
| DAX | Basic formulas | Advanced DAX |

---

## Summary - What I Learned Today

- Loaded Excel data into Power BI Desktop
- Transformed data using Power Query
- Removed rows columns and empty data
- Unpivoted columns for proper data structure
- Built Stacked and Clustered charts
- Added colors using Legend field
- Added data labels with exact values
- Created relationships between tables
- Understood single vs bidirectional relationships
- Created a measure using COUNT function


---

## Tomorrow I Will Learn

- DAX formulas in depth
- Calculated columns vs measures
- SUM COUNT CALCULATE FILTER functions
- Build more complex visuals
- Continue Power BI learning journey!