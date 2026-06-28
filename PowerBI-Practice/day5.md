# Power BI - Day 5 Learning Notes
## Topic: Why Power BI, Components, Power Query
##         Methods, Add Column and Statistics

---

## What I Learned Today

- Why Power BI is better than Excel
- Key Features of Power BI
- Components of Power BI
- Importance of Power BI
- What is TMDL
- Useful Power Query Methods
- Transform operations in Power Query
- Add Column operations
- Standard Deviation and CV concept
- Visualization Charts in Power BI

---

## WHY USE POWER BI WHEN WE HAVE EXCEL

Excel has some limitations:
- Cannot handle very large amounts of data
- Limited number of charts and graphs
- Less interactive compared to Power BI
- No built-in AI insights

Power BI solves all these limitations:
- Handles millions of rows of data easily
- Has a huge library of charts and visuals
- Fully interactive dashboards
- AI powered insights built in

---

## KEY FEATURES OF POWER BI

- Interactive Dashboards
- Multiple Data Source Connectivity
- AI Powered Insights
- Custom Visualizations

---

## COMPONENTS OF POWER BI

| Component | Purpose |
|-----------|---------|
| Power BI Desktop | Report creation tool |
| Power BI Service | Cloud based sharing platform |
| Power BI Mobile | On-the-go access to reports |
| Power Query | Data transformation tool |
| Power Pivot | Data modeling engine |

---

## IMPORTANCE OF POWER BI

- Enables data-driven decision making
- Helps in real-time reporting and monitoring
- User-friendly with drag-and-drop features
- Cost-effective for businesses
- Secure data handling and governance

---

## TMDL - Tabular Model Definition Language

TMDL stands for Tabular Model Definition Language.
It is a text-based language used to define a
Power BI semantic model which is the data model.
Used by advanced Power BI developers to manage
models using code instead of the visual interface.

---

## USEFUL POWER QUERY METHODS

### 1. Keep Rows
- Go to option = Keep Rows
- Options appear: Top Rows or Bottom Rows
- Select Top and give number (example: 10)
- Only those 10 rows will appear in table

### 2. Null Values
- Null values = empty blank values in table
- Not the same as zero
- They represent missing data

### 3. Green Line Below Column Name
- Green line shows data quality of column
- If column has 100% valid values = full green
- If column has null values = line is not full
- Shows exactly how many nulls exist in column
- Very useful for quick data quality check

---

## TRANSFORM OPERATIONS

### 4. Fill Null Values
- Go to Transform → Fill Values
- Choose Up or Down
- UP = fills null with the value BELOW it
- DOWN = fills null with the value ABOVE it
- If you want a custom value then use
  Replace Values and give your own value

### 5. Transpose
- Shifts rows to columns and columns to rows
- Entire table gets rotated 90 degrees
- Useful for restructuring data layout

### 6. Count Rows
- Gives total number of rows in the table
- Quick way to check dataset size

### 7. Rename Column
- Option available directly in Transform tab
- Double click column name to rename it
- Gives proper meaningful names to columns

### 8. Extract
- Found under Transform → Extract
- Gets the length of characters in text column
- Useful for finding character count of text

### 9. Format Text Column
- Go to Transform → Format
- Options: UPPERCASE, lowercase, Capitalize Each Word
- Applied on existing text column directly

### 10. Transform vs Add Column
- Transform = changes the EXISTING column
- Add Column = creates a NEW column with result
- If you want to keep original use Add Column
- If you want to replace original use Transform

### 11. Statistical Operations
- Available for numeric columns
- Options: SUM, AVG, MIN, MAX etc.
- Applied to entire numeric column at once

### 12. Standard Operations
- Go to Transform → Standard
- Options: Add, Subtract, Multiply, Divide, Percentage
- You enter a number in the box
- It applies that operation to EVERY row in column
- Example: Multiply all prices by 1.18 for tax

### 13. Round
- Makes each numeric value decimal-free
- Rounds to nearest whole number
- Cleaner data for reporting

### 14. Date Column Operations
- Go to Transform → Date
- Options: By Month, By Quarter, By Day, By Year
- Extracts specific date part from date column
- Very useful for time-based analysis

---

## ADD COLUMN OPERATIONS

Note: All operations here create a NEW column
The original column stays unchanged

### 1. Conditional Column
- Creates a new column based on conditions
- You define rules using IF ELSE logic
- Example:
  If Quantity > 6 then Good else Bad
- Similar to Excel IF formula
- No DAX needed — done in Power Query

### 2. Duplicate Column
- Creates exact copy of selected column
- Same data type and values
- Useful when you need to transform
  a column but keep the original safe

### 3. Formatting in Add Column
- Choose UPPERCASE or lowercase or other format
- Creates a NEW formatted column
- Original column stays unchanged
- Different from Transform which changes original

### 4. Merge Columns
- Select two or more columns together
- Click Merge Columns option
- Choose separator: Space, Comma, Hyphen etc
- New merged column is created
- Example: First Name + Space + Last Name = Full Name

---

## CLOSE AND APPLY

After all Power Query transformations are done:
- Go to Home → Close and Apply
- This saves all changes and loads data to report
- All applied steps are saved and run on refresh

---

## STANDARD DEVIATION AND CV CONCEPT

### Standard Deviation (SD)
- Measures how spread out values are from average
- LOW SD = values close to average = consistent
- HIGH SD = values far from average = inconsistent

### Examples
- Mean = 28, SD = 234
  Very high variability = INCONSISTENT business
- Mean = 10,000, SD = 234
  Low variability = CONSISTENT business
  Because 234 is very small compared to 10,000

### Why We Calculate Coefficient of Variation (CV)

Having the same SD does NOT mean same variability.
We need CV to compare fairly.

Formula:
CV = (Standard Deviation / Mean) * 100

- LOW CV = consistent and stable business
- HIGH CV = inconsistent and unpredictable

### Why This Matters for Business
- Even if two businesses have good averages
- One may be stable (low SD and CV)
- Other may be unstable (high SD and CV)
- High instability increases wastage
- Affects future planning like:
  Deciding staff numbers
  Food storage and inventory
  Budget planning

---

## VISUALIZATION CHARTS IN POWER BI

### 1. Bar Chart
- Used when analyzing numerical values
  with categorical values
- Categories on Y-Axis
- Values on X-Axis
- Best for comparing categories side by side

---

## Power BI Learning Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 | Data Loading Power Query Charts Relationships | Done |
| Day 2 | DAX Functions SUM SUMX WEEKDAY IF Drill Down | Done |
| Day 3 | Visualization Types Active Inactive Relationships | Done |
| Day 4 | First Project Data Professional Survey Dashboard | Done |
| Day 5 | Why Power BI Components Power Query Methods Stats | Done |

---

## Summary - What I Learned Today

- Understood why Power BI is better than Excel
- Learned all 5 components of Power BI
- Practiced 14 Power Query Transform methods
- Learned all 4 Add Column operations
- Understood Standard Deviation and CV concept
- Learned when and how to use Bar Chart

---

## Tomorrow I Will Learn

- More visualization types in Power BI
- Scatter Chart Waterfall Chart Funnel Chart
- More DAX functions CALCULATE FILTER
- Build another Power BI practice project
- Continue Power BI learning journey!