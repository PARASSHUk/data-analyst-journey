# Power BI - Day 17 Learning Notes
## Topic: Advanced DAX - VAR, VALUES,
##         Cumulative Measure with RANKX

---

## What I Did Today

- Created advanced cumulative listing measure
- Learned VAR keyword in DAX
- Learned VALUES function
- Combined VAR VALUES MAXX CALCULATE
  FILTER ALL and RANKX in one measure
- Understood how cumulative ranking works

---

## CUMULATIVE LISTINGS MEASURE

### Formula Created Today

Cumulative Listings =
VAR currentRank =
    MAXX(
        VALUES(Listings[city]),
        [CITY RANK]
    )
RETURN
    CALCULATE(
        [Total Listing],
        FILTER(
            ALL(Listings[city]),
            [CITY RANK] <= currentRank
        )
    )

---

## BREAKING DOWN THE FORMULA

---

### PART 1 - VAR Keyword

#### What is VAR
- VAR stands for VARIABLE
- Stores a temporary value or expression
- Makes complex DAX formulas readable
- Calculated ONCE and reused multiple times
- Improves performance in complex formulas

#### Syntax
VAR variable_name = expression
RETURN
    result_using_variable

#### Benefits of VAR
- Avoids repeating the same expression
- Makes formula easier to read and debug
- Calculated only once even if used multiple times
- Best practice for complex DAX formulas

#### Example from Today
VAR currentRank =
    MAXX(VALUES(Listings[city]), [CITY RANK])
- Creates a variable called currentRank
- Stores the maximum city rank in current context
- Used later in RETURN section

---

### PART 2 - VALUES Function

#### What is VALUES
- Returns the UNIQUE values of a column
- Works within the CURRENT filter context
- Similar to DISTINCT but respects context

#### Syntax
VALUES(Table[Column])

#### How It Works
- If city filter shows only Paris and London
- VALUES(Listings[city]) returns Paris and London
- Does not return all cities in table
- Respects whatever filter is active

#### Used in Formula
MAXX(VALUES(Listings[city]), [CITY RANK])
- VALUES gets unique cities in current context
- MAXX finds the MAXIMUM city rank
  among those filtered cities
- Stores that rank as currentRank variable

---

### PART 3 - MAXX with VALUES

MAXX(VALUES(Listings[city]), [CITY RANK])

#### How This Works Step by Step
1. VALUES(Listings[city]) gets cities
   currently visible in the filter context
2. MAXX iterates over those cities row by row
3. For each city it evaluates [CITY RANK]
4. Returns the MAXIMUM rank found
5. This becomes the currentRank variable

#### Why MAXX not MAX
- MAX works on a column directly
- MAXX works on an EXPRESSION over a table
- Since [CITY RANK] is a measure not a column
  we need MAXX not MAX
- MAXX iterates and evaluates the measure
  for each row in VALUES result

---

### PART 4 - RETURN with CALCULATE and FILTER

RETURN
    CALCULATE(
        [Total Listing],
        FILTER(
            ALL(Listings[city]),
            [CITY RANK] <= currentRank
        )
    )

#### How This Works Step by Step
1. RETURN = use the variable result here
2. CALCULATE = modify filter context
3. ALL(Listings[city]) = removes existing
   city filters to look at ALL cities
4. FILTER = apply a new condition
5. [CITY RANK] <= currentRank = only include
   cities whose rank is less than or equal
   to the current context rank
6. [Total Listing] = sum up listings
   for all those filtered cities

---

## HOW THE COMPLETE FORMULA WORKS

### Scenario Example

Suppose you have a table showing:
| City | Listing Count | City Rank |
|------|---------------|-----------|
| Paris | 700 | 1 |
| London | 600 | 2 |
| Berlin | 500 | 3 |
| Rome | 400 | 4 |
| Madrid | 300 | 5 |

### When Formula Runs for Berlin (Rank 3)

Step 1 - VAR currentRank
- VALUES gets Berlin in current context
- MAXX evaluates CITY RANK for Berlin = 3
- currentRank = 3

Step 2 - RETURN CALCULATE
- ALL removes current city filter
- FILTER keeps only cities where CITY RANK <= 3
- That means Paris (1) London (2) Berlin (3)
- CALCULATE sums Total Listing for those 3 cities
- Result = 700 + 600 + 500 = 1800

### Cumulative Result Table

| City | Listings | City Rank | Cumulative Listings |
|------|----------|-----------|---------------------|
| Paris | 700 | 1 | 700 |
| London | 600 | 2 | 1300 |
| Berlin | 500 | 3 | 1800 |
| Rome | 400 | 4 | 2200 |
| Madrid | 300 | 5 | 2500 |

---

## KEY FUNCTIONS USED TOGETHER TODAY

| Function | Role in Formula |
|----------|----------------|
| VAR | Store temporary rank value |
| VALUES | Get unique cities in current context |
| MAXX | Find maximum rank in filtered cities |
| RETURN | Use the stored variable result |
| CALCULATE | Modify filter context |
| ALL | Remove existing city filters |
| FILTER | Apply new rank condition |
| CITY RANK | The RANKX measure created earlier |
| Total Listing | The COUNT measure for listings |

---

## VALUES vs ALL vs FILTER

| Function | Returns | Respects Filter |
|----------|---------|-----------------|
| VALUES | Unique values in current context | Yes |
| ALL | All values ignoring all filters | No |
| FILTER | Rows matching condition | Depends |

---

## VAR RETURN PATTERN - BEST PRACTICE

### Simple Pattern
VAR myValue = SUM(Sales[Amount])
RETURN
    myValue * 1.1

### Complex Pattern (Used Today)
VAR step1 = MAXX(VALUES(col), [measure])
VAR step2 = FILTER(ALL(col), [measure] <= step1)
RETURN
    CALCULATE([measure], step2)

### Why This Pattern is Powerful
- Break complex formula into logical steps
- Each VAR is one clear calculation
- RETURN combines all steps together
- Easy to debug each step separately
- Professional DAX writing style

---

## AIRBNB DASHBOARD UPDATE

### New Measure Added Today
- Cumulative Listings measure created
- Shows running total of listings
  as you go from rank 1 city downward
- Can be used in a line chart or table
- Shows which cities account for what
  percentage of total Airbnb listings

### Use Case for This Measure
- Add City and Cumulative Listings to table
- Shows that top 5 cities may account
  for 60% of all Airbnb listings globally
- Powerful insight for business decisions

---

## KEY LEARNINGS FROM TODAY

### VAR Best Practices
- Always use VAR for complex expressions
- Name variables clearly and descriptively
- Each VAR should do ONE specific thing
- RETURN combines all VARs into final result

### VALUES vs DISTINCT
- VALUES = unique values respecting filter context
- DISTINCT = unique values ignoring some contexts
- VALUES is preferred inside DAX measures

### MAXX vs MAX Reminder
- MAX(column) = maximum of a column
- MAXX(table, expression) = maximum of
  a measure evaluated row by row
- Use MAXX when working with measures

---

## Summary - What I Did Today

- Created advanced Cumulative Listings measure
- Learned VAR keyword for variables in DAX
- Learned VALUES function and its filter context
- Understood MAXX vs MAX difference
- Broke down complex formula step by step
- Understood how cumulative ranking works
- Learned VAR RETURN pattern best practice
- Applied measure to Airbnb dashboard

---

## Tomorrow I Will Continue

- Continue completing Airbnb Dashboard
- Build map visual for global distribution
- Build Top 10 Cities chart using RANKX
- Add review trend analysis
- Add price distribution visual
- Add slicers and complete the dashboard
- Upload Airbnb project to GitHub