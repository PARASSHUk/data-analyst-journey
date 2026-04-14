# Day 9 - Excel Learning Notes

## What I Practiced Today

- Practiced Excel formulas revision
- Performed Conditional Formatting on Sales column
- Created new formula for conditional formatting
- Learned how to convert month number to month name
- Learned IFERROR formula to handle errors
- Created all 10 Pivot Tables and Charts for Project 1

## New Formulas Learned Today

- =TEXT(DATE(2024,01,02),"mmmmmm")
  converts month number to month name
  example: 1 becomes January, 2 becomes February

- =IFERROR(formula, "value if error")
  hides error messages in cells
  example: =IFERROR(VLOOKUP(...),"Not Found")
  instead of showing #N/A it shows "Not Found"

- Conditional Formatting with Custom Formula
  applied on SALES column
  highlights cells based on formula condition
  makes data patterns visible instantly

## Project 1 - Sales Performance Dashboard

### Status: Pivot Tables and Charts Completed 

### Questions Solved Today

- Q1  Which Product Line generates the most Sales?
      Pivot Table + Bar Chart created

- Q2  What is the Monthly Sales Trend?
      Pivot Table + Line Chart created 

- Q3  Which Year had the Highest Sales?
      Pivot Table + Column Chart created 

- Q4  Which Territory generates the most Revenue?
      Pivot Table + Bar Chart created 

- Q5  Which Deal Size contributes most to Sales?
      Pivot Table + Pie Chart created 

- Q6  What is the Order Status breakdown?
      Pivot Table + Pie Chart created 

- Q7  Which Quarter performs best every year?
      Pivot Table + Grouped Column Chart created 

- Q8  Who are the Top 10 Customers by Sales?
      Pivot Table + Horizontal Bar Chart created 

- Q9  Which Product Line has highest Average Price?
      Pivot Table + Bar Chart created 

- Q10 Which Territory contributes most to Sales?
      Pivot Table + Pie Chart created 

### Skills Used in Project Today

- Pivot Tables
- Pivot Charts
- Bar Chart
- Line Chart
- Pie Chart
- Column Chart
- Horizontal Bar Chart
- Grouped Column Chart
- Conditional Formatting
- TEXT and IFERROR formulas

## What Was Difficult Today

- Converting month numbers to month names
- Remembered: =TEXT(DATE(2024,MONTH_ID,1),"mmmm")
  gives full month name from month number
- IFERROR wraps around any formula to hide errors

## What I Am Proud Of Today

- Completed all 10 Pivot Tables in one day
- Created 10 different charts for each question
- Learned 2 new useful formulas
- Project 1 analysis phase is fully complete

## Tomorrow I Will Practice

- Build the final Dashboard sheet
- Add KPI cards at top of dashboard
- Copy all charts to Dashboard sheet
- Add Slicers for Year, Territory, Deal Size
- Make dashboard interactive and professional