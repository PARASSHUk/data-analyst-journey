# Power BI - Day 11 Learning Notes
## Topic: CROSSFILTER, Date Time Functions,
##         Text Functions, Logical Functions,
##         Data Connectivity and Report Creation

---

## What I Learned Today

- CROSSFILTER function for indirect relationships
- DAX Date and Time Functions
- DAX Text and String Functions
- DAX Logical Functions (IF AND OR SWITCH NOT)
- Types of Data Sources in Power BI
- Connection Modes in Power BI
- Append vs Merge (SQL UNION vs JOIN)
- Report Creation Steps

---

## CROSSFILTER FUNCTION

### When to Use
- When two tables have NO direct connection
- But are connected through a COMMON third table
- Used as an alternative to Bidirectional relationship

### How It Works
- Create a NEW MEASURE using CROSSFILTER
- Add the measure to a table visual
- Gets data from both unrelated tables
  using the common third table as bridge

### CROSSFILTER Formula
Cross Data =
CALCULATE(
    DISTINCTCOUNT(customers[customerID]),
    CROSSFILTER(
        'orders (2)'[customerID],
        customers[customerID],
        Both
    )
)

### What BOTH Means
- Both = enables filtering in both directions
- Gets data from another table that has no
  direct link with the first table
- Works through the common connecting table
- Alternative to setting Both in Model View

---

## DAX - DATE AND TIME FUNCTIONS

Power BI provides a variety of date and time
functions to handle manipulate and analyze
time-based data.
Essential for time intelligence trend analysis
and reporting.

### Types of Date Time Functions

| Type | Examples |
|------|---------|
| Date Functions | TODAY, DATE, YEAR, MONTH, DAY |
| Time Functions | HOUR, MINUTE, SECOND, NOW |
| Date Arithmetic | DATEDIFF, EDATE, EOMONTH |

---

### TODAY()
- Returns the current date
- No arguments needed
- Example: TODAY()
- Use in cards to show current date

### DATE(year, month, day)
- Creates a date from year month and day values
- Syntax: DATE(year, month, day)
- Example: DATE(2025, 6, 1) = June 1 2025

### YEAR(), MONTH(), DAY()
- Extract specific components from a date
- Syntax: YEAR(date), MONTH(date), DAY(date)
- Example: YEAR(TODAY()) = returns current year
- Example: MONTH(Orders[Order Date]) = month number

### DATEDIFF()
- Calculates difference between two dates
- Syntax: DATEDIFF(first_date, end_date, unit)
- Unit options: YEAR, MONTH, DAY
- Example:
  DATEDIFF(Orders[Order Date], TODAY(), DAY)
  Returns number of days since order was placed

### WEEKDAY()
- Returns day of week as a number
- Syntax: WEEKDAY(date, mode)
- Example: WEEKDAY(Orders[Order_Date], 2)
- Mode 2 = Monday is Day 1

---

## DAX - TEXT AND STRING FUNCTIONS

---

### 1. CONCATENATE()

- Joins two text strings together
- Does NOT add space between them automatically
- For space use nested CONCATENATE

#### Problem with CONCATENATE
- Cannot add space in a single call
- Must nest CONCATENATE to add space

#### Solution with Nested CONCATENATE
Full Location =
CONCATENATE(
    Orders[Segment],
    CONCATENATE(" ", Orders[State])
)

#### Better Alternative - MERGE in Power Query
- Use Merge Columns in Power Query instead
- Easier to add separator like space comma etc
- No complex nesting required

---

### 2. LEFT()

- Returns characters from the LEFT side of text
- Syntax: LEFT(text, num_chars)
- Example: LEFT(Orders[City], 3)
- Returns first 3 characters of city name

---

### 3. RIGHT()

- Works same as LEFT but from RIGHT side
- Returns characters from the RIGHT side
- Syntax: RIGHT(text, num_chars)
- Example: RIGHT(Orders[Postal Code], 4)

---

### 4. MID()

- Extracts characters from the MIDDLE of text
- Syntax: MID(text, start_num, num_chars)
- start_num = starting position in the string
- num_chars = how many characters to extract
- Example: MID(Orders[Concatenate], 3, 6)
- Starts at position 3 and extracts 6 characters

---

### 5. UPPER()

- Converts text string to ALL UPPERCASE letters
- Syntax: UPPER(text)
- Example: UPPER(Orders[City])
- Returns DELHI instead of Delhi

---

### 6. LOWER()

- Converts text string to all lowercase letters
- Syntax: LOWER(text)
- Example: LOWER(Orders[City])
- Returns delhi instead of Delhi

---

## DAX - LOGICAL FUNCTIONS

Logical functions return either TRUE or FALSE
Most crucial components of DAX for conditions

---

### 1. IF Function

- Checks a condition
- Returns one value if TRUE
- Returns different value if FALSE
- Syntax: IF(logical_test, value_if_true, value_if_false)
- Example:
  Sales Category =
  IF(
    (Orders[Sales] * Orders[Quantity]) > 1000,
    "High",
    "Low"
  )
- Can also use expressions in logical test

---

### 2. AND Function

- Returns TRUE only when ALL conditions are TRUE
- Syntax: AND(logical1, logical2, ...)
- Example:
  AND Condition =
  AND(
    Orders[Profit] > 50,
    Orders[Region] = "South"
  )
- Both conditions must be true for result to be TRUE

---

### 3. OR Function

- Returns TRUE when ANY ONE condition is TRUE
- Syntax: OR(logical1, logical2)
- Example:
  OR Condition =
  OR(
    Orders[Sales] > 100,
    Orders[Region] = "West"
  )
- Only ONE condition needs to be true

---

### 4. SWITCH Function

- Evaluates an expression against a LIST of values
- Returns result for FIRST matching value
- If no match returns DEFAULT value
- Syntax:
  SWITCH(
    Expression,
    Value1, Result1,
    Value2, Result2,
    ...
    Else_Result
  )

- Example for range comparison use SWITCH(TRUE()):
  Quantity Category =
  SWITCH(
    TRUE(),
    Orders[Quantity] >= 12, "Excellent",
    Orders[Quantity] >= 8,  "Good",
    Orders[Quantity] >= 5,  "Moderate",
    "Bad"
  )

#### Why SWITCH(TRUE()) not SWITCH(Column)?
- SWITCH cannot compare RANGES directly
- SWITCH(Orders[Quantity], >=12, "Excellent")
  does NOT work
- SWITCH(TRUE(), condition, result) WORKS
  because it checks each condition as boolean

---

### 5. NOT Function

- Reverses the Boolean value of an argument
- Syntax: NOT(logic)
- Example:
  NOT Function = NOT(Orders[Sales] > 500)
- Returns TRUE for all rows where Sales <= 500
- Returns FALSE for rows where Sales > 500
- Gives records that do NOT match the condition

---

### PRACTICAL EXAMPLE - Discount Column

Combining AND with IF for business logic:

Discount =
IF(
    AND(Orders[Sales] > 500, Orders[Region] = "West"),
    0.1,
    0.05
)

- Assigns 10% discount when
  Sales > 500 AND Region is West
- Assigns 5% discount for all other cases

---

## CONNECTIVITY IN POWER BI

Power BI connects to various data sources
for analysis and reporting.

### Types of Data Sources

| Type | Examples |
|------|---------|
| Files | Excel, CSV, JSON, XML |
| Databases | SQL Server, MySQL, Oracle, PostgreSQL |
| Big Data | Azure Data Lake, Hadoop, Spark |
| Online Services | SharePoint, Google Analytics, Azure |
| Other Sources | APIs, Web, OData Feed, SAP |

---

### Connection Modes

#### 1. Import Mode
- Loads data INTO Power BI memory
- Best for performance and fast visuals
- Large datasets may slow down loading
- Data refreshes on schedule not real-time

#### 2. Live Connection
- Connects DIRECTLY to a live dataset
- Example: SSAS (SQL Server Analysis Services)
- Best for enterprise-scale data models
- No data stored in Power BI itself
- Always shows real-time data

#### 3. Data Transformation with Power Query
- Cleaning and Shaping Data
  Removing duplicates
  Handling nulls
- Merging and Appending Tables
- Creating Calculated Columns and Measures
- Applying Business Rules

---

### APPEND vs MERGE - Most Important!

| SQL Command | Power BI Equivalent | Direction |
|-------------|---------------------|-----------|
| UNION ALL | Append | Adds ROWS (vertical) |
| JOIN | Merge | Adds COLUMNS (horizontal) |

#### When to Use APPEND
- When multiple files have SAME columns
- Example: Company stores data as:
  Sales_2022.xlsx
  Sales_2023.xlsx
  Sales_2024.xlsx
- Each file has same column structure
- Append combines all into ONE big Sales table
- Adds rows vertically

#### When to Use MERGE
- When combining two tables horizontally
- Like SQL JOIN on a common column
- Adds new columns from second table

---

## REPORT CREATION STEPS IN POWER BI

### Step 1 - Get Your Data
- Connect to data source
- Import or live connect to tables

### Step 2 - Model Your Data
- Create relationships between tables
- Set up Star Schema
- Define data types

### Step 3 - Create Visuals
- Drag fields to create charts
- Choose appropriate visual types

### Step 4 - Format and Customize
- Change colors themes and fonts
- Add titles and labels
- Apply conditional formatting
- Use Format Pane for all changes

### Step 5 - Publish and Share
- Publish to Power BI Service
- Share with team members
- Set up auto refresh schedule

### Bonus Tip - Auto Chart Creation
- Double tap on an empty Power BI page
- Type what you want to see
- Power BI automatically creates a chart
- Specify chart type in the prompt
- AI-powered chart generation!

---

## ALL DAX LOGICAL FUNCTIONS COMPARISON

| Function | Returns TRUE When | Use Case |
|----------|-------------------|----------|
| IF | Condition is true | Single condition check |
| AND | ALL conditions true | Multiple must-meet conditions |
| OR | ANY condition true | At least one condition met |
| SWITCH | First match found | Multiple value categories |
| NOT | Condition is FALSE | Opposite of condition |

---

## Power BI Learning Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 | Data Loading Power Query Charts | Done |
| Day 2 | DAX Basics SUM SUMX IF WEEKDAY | Done |
| Day 3 | Visualization Types Relationships | Done |
| Day 4 | First Project Data Professional Survey | Done |
| Day 5 | Power BI Components Power Query Methods | Done |
| Day 6 | Bar Column Pie Donut TreeMap Table Matrix | Done |
| Day 7 | Line Area KPI Slicer Funnel Scatter Map | Done |
| Day 8 | Cards Data Model Star Schema | Done |
| Day 9 | Row Filter Context CALCULATE Measures | Done |
| Day 10 | AVERAGE COUNT ALL ALLSELECTED ALLEXCEPT | Done |
| Day 11 | CROSSFILTER Date Text Logical Connectivity | Done |

---

## Summary - What I Learned Today

- Learned CROSSFILTER for indirect relationships
- Learned all Date Time DAX functions
- Learned all Text String DAX functions
- Practiced CONCATENATE with nested space trick
- Learned IF AND OR SWITCH NOT logical functions
- Understood SWITCH(TRUE()) for range comparison
- Built discount column combining AND with IF
- Learned all Power BI data source types
- Understood Import vs Live Connection modes
- Learned APPEND vs MERGE difference
  UNION ALL = Append rows
  JOIN = Merge columns
- Learned 5 step report creation process

---

## Tomorrow I Will Learn

- Time Intelligence DAX functions
- TOTALYTD TOTALQTD TOTALMTD
- DATEADD and SAMEPERIODLASTYEAR
- Year over Year comparison in Power BI
- Build another complete Power BI project
- Continue Power BI learning journey!