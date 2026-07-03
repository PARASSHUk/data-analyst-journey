# Power BI - Day 10 Learning Notes
## Topic: DAX AVERAGE, AVERAGEX, COUNT,
##         DISTINCTCOUNT, ALL, ALLSELECTED,
##         ALLEXCEPT, CALCULATE Deep Dive

---

## What I Learned Today

- AVERAGE and AVERAGEX functions
- COUNT and DISTINCTCOUNT functions
- ALL function and its use cases
- ALLSELECTED function
- ALLEXCEPT function
- Key difference between ALL ALLSELECTED ALLEXCEPT
- CALCULATE function deep dive
- Bidirectional relationship concept

---

## DAX AVERAGE AND AVERAGEX

---

### 1. AVERAGE Function

- Returns the arithmetic mean of a column
- Simple column aggregation
- Syntax: AVERAGE(Table[Column])
- Example: AVERAGE(Sales[Revenue])
- Returns the average revenue across all rows

### 2. AVERAGEX Function

- Computes average of an EXPRESSION
  evaluated over a table row by row
- Iterator function like SUMX
- Syntax: AVERAGEX(Table, Expression)
- Example:
  AVERAGEX(Sales, Sales[Price] * Sales[Quantity])
- First calculates Price x Quantity for each row
- Then takes the average of all those results

### Important Note - Column vs Measure

#### When using Calculated Column for average
- If you create a new column called Avg
- Then drop it into a Card visual
- Card shows SUM of that column by default
- You must manually change aggregation
  from Sum to Average in the visual settings

#### When using Explicit Measure for average
- Create New Measure with AVERAGE formula
- When dropped into Card it directly shows Average
- No manual change needed
- This is why Explicit Measures are best practice

### Iterator Function Rule
- Always write TABLE NAME first
- Then write the EXPRESSION second
- Syntax: FUNCTIONX(Table, Expression)
- This applies to SUMX AVERAGEX MINX MAXX etc

---

## DAX COUNT AND DISTINCTCOUNT

---

### 1. COUNT Function

- Counts the number of NON-BLANK values
  in a column
- Syntax: COUNT(Table[Column])
- Example: COUNT(Sales[Order])
- Returns total number of orders including
  duplicate order IDs

### 2. DISTINCTCOUNT Function

- Counts the number of UNIQUE values
  in a column
- Ignores duplicate values
- Syntax: DISTINCTCOUNT(Table[Column])
- Example: DISTINCTCOUNT(Sales[CustomerID])
- Returns unique number of customers
  who purchased something
- Very useful for unique customer count
  unique order count etc

### COUNT vs DISTINCTCOUNT

| Feature | COUNT | DISTINCTCOUNT |
|---------|-------|---------------|
| Counts | All non-blank values | Unique values only |
| Duplicates | Included | Excluded |
| Use Case | Total rows | Unique entities |
| Example | Total orders | Unique customers |

---

## DAX ALL, ALLSELECTED, ALLEXCEPT

---

### 1. ALL Function

- Returns ALL rows in a table or ALL values
  in a column
- IGNORES any filter that has been applied
- Removes filter context completely
- Syntax: ALL(Table) or ALL(Table[Column])

#### Why ALL is Needed
When creating a Table visual with:
- State, Sub-Category, SUM of Quantity
- The SUM already applies row-wise filters
  for each sub-category automatically
- To get GRAND TOTAL ignoring those filters
  we need ALL function

#### ALL Formula
Total Quantity All =
CALCULATE(
    SUM(Orders[Quantity]),
    ALL(Orders)
)
- This gives total of ALL quantity
  by REMOVING all filters completely

#### Most Common Use of ALL - Percentage

Sales Percentage =
DIVIDE(
    SUM(Sales[Sales Amount]),
    CALCULATE(
        SUM(Sales[Sales Amount]),
        ALL(Sales)
    )
)

Example Result:
- Delhi has Rs 30,000 sales
- Total sales are Rs 1,00,000
- 30,000 / 1,00,000 = 30%
- This is percentage contribution of Delhi
- One of the most common uses of ALL()

#### SUM vs CALCULATE with ALL Comparison

| Formula | Result |
|---------|--------|
| SUM(Quantity) | Sum with current filters applied |
| CALCULATE(SUM(Quantity), ALL(Orders)) | Sum of entire table ignoring all filters |

---

### 2. ALLSELECTED Function

- Returns all rows ignoring filters INSIDE the query
- BUT KEEPS filters that come from OUTSIDE
  (like user selections from slicers)
- Respects what the user has selected
- But ignores grouping on the specified column

#### ALLSELECTED Formula
Total Subcategory Qty =
CALCULATE(
    SUM(Orders[Quantity]),
    ALLSELECTED(Orders[State])
)

#### How It Works
- User selects a state from slicer
- ALLSELECTED keeps that slicer selection
- But removes the row-level filter of sub-category
- So each sub-category shows its TOTAL quantity
  not its filtered quantity
- Example: Accessories total = 2000
  This 2000 shows for every city where
  Accessories appears in the table

#### Use Case
- You want sub-category wise total
- But still want to respect state slicer selection
- Keep city filter from slicer
- Remove sub-category grouping filter

---

### 3. ALLEXCEPT Function

- Removes ALL filters from the table
- EXCEPT the columns you specifically keep
- The opposite approach of ALLSELECTED

#### ALLEXCEPT Formula
State Total Qty =
CALCULATE(
    SUM(Orders[Quantity]),
    ALLEXCEPT(Orders, Orders[State])
)

#### How It Works
- Removes ALL filters from Orders table
- But KEEPS the filter on State column
- Result: Shows total quantity for each STATE
  regardless of sub-category or other filters

#### Use Case
- You want state-wise totals only
- Remove all other filters except state
- Perfect for showing state-level aggregates

---

### KEY DIFFERENCES - ALL vs ALLSELECTED vs ALLEXCEPT

| Function | What It Removes | What It Keeps |
|----------|-----------------|---------------|
| ALL | Removes ALL filters | Nothing |
| ALLSELECTED | Removes internal query filters | User slicer selections |
| ALLEXCEPT | Removes ALL filters | Only specified columns |

### Simple Memory Rule
- ALL = ignore everything
- ALLSELECTED = respect user selections only
- ALLEXCEPT = keep only what I specify

### Important Note
Always use DIMENSION COLUMNS in these functions
Example: ALLEXCEPT(Orders, Orders[City])
Use City (dimension) not Sales Amount (measure)

---

## DAX CALCULATE FUNCTION - DEEP DIVE

CALCULATE is the most powerful DAX function.
It has TWO parts:

### Part 1 - Expression (Aggregation)
- The calculation you want to perform
- Can be any aggregation function
- Examples: SUM(Sales), AVG(Price), COUNT(Orders)

### Part 2 - Filter (Criteria)
- Defines the dataset the aggregation applies to
- Modifies or overrides the current filter context
- Examples: Region = West, Year = 2024

### Syntax
CALCULATE(
    Expression,
    Filter1,
    Filter2,
    ...
)

### Examples

Simple filter:
West Sales =
CALCULATE(
    SUM(Orders[Sales]),
    Orders[Region] = "West"
)

Multiple filters:
West 2024 Sales =
CALCULATE(
    SUM(Orders[Sales]),
    Orders[Region] = "West",
    Orders[Year] = 2024
)

Using ALL to remove filter:
Total Sales No Filter =
CALCULATE(
    SUM(Orders[Sales]),
    ALL(Orders)
)

---

## BIDIRECTIONAL RELATIONSHIP

- Created when two tables have NO direct connection
- But are connected through a COMMON third table
- Both direction arrows are enabled
- Allows filtering to flow both ways
- Use carefully as can cause unexpected results
- Example:
  Products table → Sales table → Customers table
  Products and Customers have no direct link
  but connect through Sales table
  Bidirectional on Sales allows both to filter

---

## ALL DAX FUNCTIONS LEARNED SO FAR

| Function | Type | Purpose |
|----------|------|---------|
| SUM | Aggregate | Total of column |
| SUMX | Iterator | Total after row expression |
| AVERAGE | Aggregate | Average of column |
| AVERAGEX | Iterator | Average after row expression |
| MIN | Aggregate | Minimum of column |
| MINX | Iterator | Minimum after row expression |
| MAX | Aggregate | Maximum of column |
| MAXX | Iterator | Maximum after row expression |
| COUNT | Aggregate | Count non-blank values |
| DISTINCTCOUNT | Aggregate | Count unique values |
| CALCULATE | Filter Modifier | Change filter context |
| ALL | Filter Remover | Remove all filters |
| ALLSELECTED | Filter Remover | Keep user selections |
| ALLEXCEPT | Filter Remover | Keep specified columns |
| IF | Logical | Conditional calculation |
| WEEKDAY | Date | Day number from date |
| DIVIDE | Math | Safe division |

---



---

## Summary - What I Learned Today

- Learned AVERAGE and AVERAGEX difference
- Understood why explicit measures are better
- Learned COUNT vs DISTINCTCOUNT
- Learned ALL to remove all filters
- Used ALL for percentage contribution formula
- Learned ALLSELECTED to keep slicer filters
- Learned ALLEXCEPT to keep specific column filters
- Understood key differences between all three
- Deep dived into CALCULATE two-part structure
- Learned Bidirectional relationship concept

---

## Tomorrow I Will Learn

- Time Intelligence DAX functions
- TOTALYTD TOTALQTD TOTALMTD
- DATEADD and SAMEPERIODLASTYEAR
- Year over Year comparison in Power BI
- Build another complete dashboard
- Continue Power BI learning journey!