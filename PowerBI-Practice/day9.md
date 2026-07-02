# Power BI - Day 9 Learning Notes
## Topic: DAX Deep Dive - Evaluation Contexts,
##         Calculated Columns, Measures,
##         SUM, SUMX, MIN, MINX, MAX, MAXX

---

## What I Learned Today

- What is DAX and why it is important
- Key Features of DAX
- Basic DAX Functions overview
- Evaluation Contexts in depth
- Row Context vs Filter Context
- CALCULATE function in detail
- Calculated Columns vs Measures
- Implicit vs Explicit Measures
- SUM vs SUMX
- MIN MINX MAX MAXX functions

---

## DAX - DATA ANALYSIS EXPRESSIONS

- DAX stands for Data Analysis Expressions
- Formula language used in:
  Power BI
  Excel Power Pivot
  Analysis Services
- Used to create:
  Calculated Columns
  Measures
  Custom Tables

---

## WHY DAX IS IMPORTANT

- Enhances data modeling capabilities
- Allows efficient calculations and aggregations
- Provides flexibility in analyzing data
- Enables advanced business intelligence solutions

---

## KEY FEATURES OF DAX

- Ability to create custom calculations
- Powerful aggregation functions
- Time intelligence functions
- Relationship and filtering capabilities

---

## BASIC DAX FUNCTIONS

### Aggregation Functions
- SUM, AVERAGE, MIN, MAX, COUNT

### Logical Functions
- IF, SWITCH, AND, OR

### Text Functions
- CONCATENATE, LEFT, RIGHT, MID

### Date and Time Functions
- TODAY, NOW, YEAR, MONTH

### Filter Functions
- FILTER, ALL, RELATED

---

## CHALLENGES OF DAX

- Learning curve for complex formulas
- Performance issues with very large datasets

---

## EVALUATION CONTEXTS IN DAX

Understanding Evaluation Context is the KEY
to writing efficient and correct DAX formulas.

There are TWO main types:
1. Row Context
2. Filter Context

---

## 1. ROW CONTEXT

### Definition
Row Context applies when a calculation is
performed ROW BY ROW in a table.

### Created Automatically In
- Calculated Columns (evaluates each row)
- Iterating Functions like SUMX, FILTER

### How It Works
- DAX looks at ONE row at a time
- Performs calculation for that specific row
- Then moves to the next row
- Scope = ONE row at a time

### Example
When creating a Calculated Column:
Profit = Sales[Revenue] - Sales[Cost]
DAX calculates this for EACH row separately

---

## 2. FILTER CONTEXT

### Definition
Filter Context is applied when FILTERS
affect a calculation from outside.

### Created By
- Slicers on the dashboard
- Filters panel in Power BI
- Rows and Columns in a visual or Pivot Table
- CALCULATE function in DAX

### How It Works
- Filters affect the ENTIRE dataset
- Calculation runs on the filtered subset
- Scope = Entire dataset based on filter applied

### Example
CALCULATE modifies filter context to show
only sales from West region:

regionwise_sales =
CALCULATE(
    SUM(Orders[Sales]),
    Orders[Region] = "West"
)

---

## CALCULATE FUNCTION

CALCULATE() is the most important DAX function.
It changes or overrides the current filter context.

### Syntax
CALCULATE(
    Expression,
    Filter
)

- Expression = the calculation to perform
- Filter = the filter to apply or override

### Key Behavior

#### When Used in a MEASURE
- Returns the TOTAL after applying the filter
- Filter context from visuals also applies
- Example: Shows West region total sales

#### When Used in a CALCULATED COLUMN
- DAX evaluates it once for EVERY ROW
- This is called ROW CONTEXT
- Row context converts to filter context
- This conversion is called CONTEXT TRANSITION

### Why Calculated Column Does Not Return Total
- CALCULATE converts row context into filter context
- This is called Context Transition
- Each row gets its own filter context
- So result is row-level not grand total

### KEY POINTS
- Filters from visuals slicers or DAX affect calculations
- CALCULATE can modify or override existing filters
- Multiple filters can combine to create complex contexts

---

## ROW CONTEXT vs FILTER CONTEXT

| Feature | Row Context | Filter Context |
|---------|-------------|----------------|
| Evaluates | Row by row | Entire dataset |
| Created by | Calculated Columns, SUMX, FILTER | Slicers, Visuals, CALCULATE |
| Scope | One row at a time | Filtered dataset |
| Use case | Row level calculations | Aggregate with conditions |

---

## CALCULATED COLUMN

A Calculated Column is a NEW column created
in a table using a DAX formula.
It is calculated ROW BY ROW at data model level.

### PROS
- Can be used in relationships
- Can be used in filters
- Can be used in aggregations
- Visible in table as a real column

### CONS
- Consumes storage space
- Affects performance for large datasets
- Calculated once when data is loaded

### When to Use
- When you need a row-level label or category
- Example: Order Size = IF(Quantity > 6, "Big", "Small")
- Example: Full Name = First Name + Last Name

---

## CALCULATED MEASURES

A Measure is a DYNAMIC aggregation calculated
at RUNTIME based on user interactions.

### Example
Total Sales = SUM(Sales[TotalPrice])

### PROS
- Optimized for performance
- Does NOT increase storage
- Recalculated dynamically as filters change
- Best practice for aggregations

### CONS
- Cannot be used inside Calculated Columns

---

## TYPES OF MEASURES

### Implicit Measure
- Created AUTOMATICALLY by Power BI
- When you drag a numeric column to a visual
- Power BI decides the aggregation (Sum, Count etc)
- Less control over the calculation

### Explicit Measure
- Created MANUALLY by us using DAX
- Go to New Measure and write DAX formula
- These are temporary and flexible
- Best practice always use explicit measures
- Example: Total Revenue = SUM(Sales[Amount])

---

## DAX AGGREGATION FUNCTIONS

---

### SUM vs SUMX

#### SUM
- Aggregates a SINGLE column
- Adds all values in that column at once
- Does NOT iterate row by row
- Use Case: Total Revenue calculation
- Syntax: SUM(Table[Column])
- Example: Total Sales = SUM(Sales[Amount])

#### SUMX
- Iterates over a table ROW BY ROW
- Performs row-level calculation FIRST
- Then aggregates (sums) all results
- Use Case: When multiplication or expression
  is needed BEFORE summation
- Syntax: SUMX(Table, Expression)
- Example:
  Total Profit = SUMX(
    Sales,
    Sales[Quantity] * Sales[Unit_Price]
  )
- First calculates Quantity * Price for each row
- Then sums all those results together

#### SUM vs SUMX Comparison
| Feature | SUM | SUMX |
|---------|-----|------|
| Method | Column aggregation | Row by row iteration |
| Expression | No | Yes |
| Use Case | Simple total | Calculated total |
| Context | Filter only | Row + Filter |

---

### MIN and MINX

#### MIN
- Returns the SMALLEST value in a column
- Simple column aggregation
- Use Case: Finding lowest value
- Example: MIN(Sales[Price])

#### MINX
- Returns MINIMUM value AFTER row-wise calculation
- Iterates row by row first
- Then returns the minimum of all results
- Example: MINX(Sales, Sales[Price] * Sales[Qty])
- Returns minimum of all Price x Qty combinations

---

### MAX and MAXX

#### MAX
- Returns the MAXIMUM value in a column
- Simple column aggregation
- Use Case: Finding highest value
- Example: MAX(Sales[Price])

#### MAXX
- Returns MAXIMUM value AFTER row-wise calculation
- Iterates row by row first
- Then returns the maximum of all results
- Example: MAXX(Sales, Sales[Price] * Sales[Qty])
- Returns maximum of all Price x Qty combinations

---

## X FUNCTIONS SUMMARY

| Function | What It Does |
|----------|-------------|
| SUM | Sum of entire column |
| SUMX | Sum after row-wise expression |
| MIN | Minimum of entire column |
| MINX | Minimum after row-wise expression |
| MAX | Maximum of entire column |
| MAXX | Maximum after row-wise expression |

### Rule for X Functions
- All X functions (SUMX, MINX, MAXX) follow same pattern
- Step 1 = Iterate through table row by row
- Step 2 = Apply expression to each row
- Step 3 = Apply aggregate (sum, min, max)
- These are called ITERATOR FUNCTIONS

---

## KEY DAX CONCEPTS SUMMARY

| Concept | Meaning |
|---------|---------|
| Row Context | Calculates row by row |
| Filter Context | Calculates on filtered data |
| Context Transition | CALCULATE converts row to filter context |
| Calculated Column | Row level new column stored in model |
| Measure | Dynamic runtime aggregation |
| Implicit Measure | Auto-created by Power BI |
| Explicit Measure | Manually created by user |
| Iterator Function | Processes row by row before aggregating |

---


---

## Summary - What I Learned Today

- Learned DAX definition and importance
- Understood Row Context vs Filter Context
- Learned CALCULATE function in depth
- Understood Context Transition concept
- Learned Calculated Column pros and cons
- Learned Measure pros and cons
- Understood Implicit vs Explicit Measures
- Learned SUM vs SUMX difference
- Learned MIN MINX MAX MAXX functions
- Understood iterator function pattern

---

## Tomorrow I Will Learn

- CALCULATE with multiple filters
- ALL and ALLEXCEPT functions
- Time Intelligence DAX functions
- TOTALYTD TOTALQTD TOTALMTD
- Build another Power BI dashboard
- Continue Power BI learning journey!