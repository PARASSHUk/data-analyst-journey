# Power BI - 
## Topic: DAX Functions, Drill Down,
##         Conditional Formatting, Bins and Lists


---

## What I Learned Today

- DAX Functions in depth
- Difference between SUM and SUMX
- Calculated Columns vs Measures
- Conditional IF in DAX
- WEEKDAY function in DAX
- Drill Down in Power BI
- Conditional Formatting
- Bins and Lists for grouping data

---

## DAX - Data Analysis Expressions

DAX is the formula language used in Power BI
to create calculated columns and measures.
It is similar to Excel formulas but much
more powerful for data analysis.

### How to Create a DAX Formula
- Right click on table name in Fields panel
- Click New Measure or New Column
- Type your DAX formula
- Press Enter to confirm
- You can rename the measure to any name

---

## DAX Measures Practiced Today

### Count of Orders
- Count of Sales = COUNT('Apocolypse Sales'[Order ID])
- Used to check total number of orders placed
- COUNT counts non-empty values in a column

### Sum of Products Sold
- Sum of Product Sold = SUM('Apocolypse Sales'[Units Sold])
- Used to check which product is sold the most
- SUM adds all values in a column

---

## SUM vs SUMX - Key Difference

### SUM (Aggregated Function)
- Syntax: SUM(column)
- Calculates total of entire column at once
- Does NOT run any expression row by row
- Simple and fast for basic totals
- Example:
  Total Units = SUM('Apocolypse Sales'[Units Sold])

### SUMX (Iterator Function)
- Syntax: SUMX(table, expression)
- Iterates row by row through the table
- Runs an expression for each row
- Then sums all results together
- Used when calculation needs row level logic
- Example:
  Profit = SUMX(
    'Apocolypse Sales',
    ('Apocolypse Store'[Price] -
     'Apocolypse Store'[Production Cost]) *
     'Apocolypse Sales'[Units Sold]
  )
- This shows profit by product name correctly
  because it calculates per row first
  then sums everything

### When to Use Which
| Situation | Use |
|-----------|-----|
| Simple column total | SUM |
| Calculation involving multiple columns | SUMX |
| Row level expression needed | SUMX |
| Basic aggregation | SUM |

---

## Profit Calculation Using DAX

PROFIT =
  (SUM('Apocolypse Store'[Price]) -
   SUM('Apocolypse Store'[Production Cost])) *
   SUM('Apocolypse Sales'[Units Sold])

---

## DAX Date Functions

### WEEKDAY Function
- Returns day of week as a number
- Has different modes:
  Mode 1 = Sunday is Day 1
  Mode 2 = Monday is Day 1 (most common)
  Mode 3 = Monday is Day 0
- Example:
  Days of Week =
  WEEKDAY('Apocolypse Sales'[Date Purchased], 2)
- Used to create charts showing units sold
  by day of the week

---

## DAX Conditional IF

Works exactly the same as Excel IF formula
but inside Power BI DAX

### Syntax
IF(condition, value if true, value if false)

### Example Used Today
Order Size =
IF('Apocolypse Sales'[Units Sold] > 25,
   "BIG ORDER",
   "SMALL ORDER")

- Creates a new column
- If units sold more than 25 = BIG ORDER
- Otherwise = SMALL ORDER
- Used to segment orders by size

---

## Drill Down in Power BI

### What is Drill Down
Drill Down means adding another layer
beneath the top layer of a visualization.
When someone clicks or drills down into data
they can see more insights and details.
You can also Drill Up to go back to top level.

### How to Use Drill Down
- Add first column to X-Axis (example: Store)
- Add second column to X-Axis (example: Product)
- A Drill Down arrow icon appears on the chart
- Click the arrow to drill into selected data
- Clicking a bar shows data for that store only
  broken down by product

### Example
- X-Axis = Store, Y-Axis = Sum of Price
- Add Product to X-Axis
- Drill Down icon appears
- Click on a store bar
- Now see product level data for that store only

### Drill Up
- Click Drill Up button to go back to store level
- Navigate between hierarchy levels easily

---

## Conditional Formatting in Power BI

Works similar to Excel Conditional Formatting
but applied to Power BI visuals and tables

### What It Does
- Give different colors to low and high values
- Apply custom rules with color scales
- Makes it easy to spot patterns visually

### How to Apply
- Right click on the column in the visual
- Click Conditional Formatting option
- Choose background color or font color
- Set minimum color for lowest values
- Set maximum color for highest values
- Can also apply rule-based formatting
  with custom conditions

---

## Bins and Lists in Power BI

### What are Bins
Bins group numeric and date values into ranges
automatically based on a size you specify.

### Bins
- Used to group numbers into ranges
- You just give a bin size
- Power BI calculates groups automatically
- Creates a new column with range groups
- Can also use bins on DATE columns
- Example: Group months using bin size 1
  gives exact month-wise data
- Bin size 2 combines every 2 months together
  Jan-Feb, Mar-Apr, May-Jun etc
- Increasing bin size = broader time periods
  fewer categories easier trend analysis

### Lists
- Shows categories exactly as they are
- Creates a new column with grouped data
- Used to manually group specific values

### How to Group Two Values Together
- Click on first value in the visual
- Hold CTRL key
- Click on second value
- Right click → Group
- Both values are now combined into one group

### Bins vs Lists Comparison
| Feature | Bins | Lists |
|---------|------|-------|
| Data Type | Numeric or Date | Categorical |
| Grouping | Automatic by size | Manual grouping |
| Output | Range groups | Named groups |
| Use Case | Age ranges sales ranges | Custom segments |

---

## Key DAX Functions Learned Today

| Function | Type | Use |
|----------|------|-----|
| COUNT(column) | Aggregate | Count non-empty values |
| SUM(column) | Aggregate | Sum all values |
| SUMX(table, expression) | Iterator | Row by row calculation |
| WEEKDAY(date, mode) | Date | Get day number from date |
| IF(condition, true, false) | Logical | Conditional column |

---

## Calculated Column vs Measure

| Feature | Calculated Column | Measure |
|---------|------------------|---------|
| Created by | New Column | New Measure |
| Storage | Stored in table | Calculated on demand |
| Row level | Yes per row | No aggregated |
| Use case | Row by row labels | KPI calculations |
| Example | Order Size IF | Total Revenue SUM |

---

## Summary - What I Learned Today

- Created DAX measures for Count and Sum
- Understood difference between SUM and SUMX
- Built profit calculation using SUMX
- Used WEEKDAY function for day analysis
- Created conditional IF calculated column
- Learned how Drill Down works in Power BI
- Applied Conditional Formatting on visuals
- Used Bins to group numeric and date data
- Used Lists to manually group categories
- Grouped two values together using CTRL

---

## Tomorrow I Will Learn

- More advanced DAX functions
- CALCULATE and FILTER functions
- Time intelligence functions
- Build a complete Power BI report
- Continue Power BI learning journey!