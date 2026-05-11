**# Excel Formulas Revision**



**## What I Revised Today**

**- Revised all major Excel formulas**

**- Practiced formula use cases**

**- Revised lookup formulas**

**- Revised text formulas**

**- Revised date formulas**

**- Revised logical formulas**



**## 1. LOOKUP FORMULAS**



**### VLOOKUP**

**- =VLOOKUP(value, range, column, FALSE)**

**- Searches left to right only**

**- Needs column number manually**

**- FALSE = exact match**



**### XLOOKUP**

**- =XLOOKUP(value, lookup range, return range)**

**- Searches any direction**

**- No column number needed**

**- More flexible than VLOOKUP**



**### INDEX + MATCH**

**- =INDEX(return range, MATCH(value, lookup range, 0))**

**- Most powerful lookup combination**

**- Works in any direction**

**- Does not break when columns added**



**### Difference**

**- VLOOKUP  = old left to right only**

**- XLOOKUP  = new any direction**

**- INDEX MATCH = most flexible professional**



**## 2. LOGICAL FORMULAS**



**### IF**

**- =IF(condition, value if true, value if false)**

**- Example: =IF(A1>50, "Pass", "Fail")**



**### Nested IF**

**- =IF(A1>90, "A", IF(A1>80, "B", IF(A1>70, "C", "D")))**

**- Multiple conditions checked one by one**



**### COUNTIF**

**- =COUNTIF(range, criteria)**

**- Counts cells matching one condition**

**- Example: =COUNTIF(A1:A10, ">50")**



**### SUMIF**

**- =SUMIF(range, criteria, sum range)**

**- Adds cells matching one condition**



**### IFERROR**

**- =IFERROR(formula, value if error)**

**- Hides error messages**

**- Example: =IFERROR(VLOOKUP(...),"Not Found")**



**## 3. TEXT FORMULAS**



**### LEN**

**- =LEN(text)**

**- Counts number of characters**



**### LEFT and RIGHT**

**- =LEFT(text, number)  = extracts from left**

**- =RIGHT(text, number) = extracts from right**



**### MID**

**- =MID(text, start, number)**

**- Extracts from middle of text**



**### TRIM**

**- =TRIM(text)**

**- Removes extra spaces from text**



**### UPPER LOWER PROPER**

**- =UPPER(text)  = ALL CAPS**

**- =LOWER(text)  = all lowercase**

**- =PROPER(text) = First Letter Capital**



**### CONCATENATE**

**- =CONCATENATE(A1, " ", B1)**

**- Joins two or more cells together**

**- Short way = A1\&" "\&B1**



**### TEXT**

**- =TEXT(value, format)**

**- Example: =TEXT(DATE(2024,1,1),"mmmm")**

**- Converts date to month name**



**### SUBSTITUTE**

**- =SUBSTITUTE(text, old text, new text)**

**- Replaces specific text inside a cell**



**## 4. DATE FORMULAS**



**### TODAY and NOW**

**- =TODAY() = current date**

**- =NOW()   = current date and time**



**### DAY MONTH YEAR**

**- =DAY(date)   = extract day number**

**- =MONTH(date) = extract month number**

**- =YEAR(date)  = extract year number**



**### DAYS**

**- =DAYS(end date, start date)**

**- Calculates total days between dates**



**### NETWORKDAYS**

**- =NETWORKDAYS(start, end)**

**- Calculates working days only**

**- Excludes weekends automatically**



**### DATEDIF**

**- =DATEDIF(start, end, "Y")**

**- Calculates years months days between**



**## 5. MATH FORMULAS**



**### Basic**

**- =SUM(range)     = adds all numbers**

**- =AVERAGE(range) = finds average**

**- =COUNT(range)   = counts numbers**

**- =COUNTA(range)  = counts non empty cells**

**- =MAX(range)     = highest value**

**- =MIN(range)     = lowest value**



**### ROUND**

**- =ROUND(number, decimals)**

**- =ROUNDUP(number, decimals)**

**- =ROUNDDOWN(number, decimals)**



**### MOD**

**- =MOD(number, divisor)**

**- Returns remainder after division**



**## 6. IMPORTANT SHORTCUTS**



**| Shortcut | Action |**

**|----------|--------|**

**| Ctrl + S | Save file |**

**| Ctrl + Z | Undo |**

**| Ctrl + C | Copy |**

**| Ctrl + V | Paste |**

**| Ctrl + F | Find |**

**| Ctrl + H | Find and Replace |**

**| Alt + = | AutoSum |**

**| F4 | Lock cell reference $ |**

**| Ctrl + T | Create Table |**



**## Summary - What I Revised**

**- 6 categories of Excel formulas**

**- 25 plus formulas revised**

**- Shortcuts revised**

**- Ready to use in projects**

