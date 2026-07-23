# Day 29 - Learning Notes
## Topic: Internship Day 2 - Smart Parcha Software
##         Implementation and Complete SQL Revision

---

## What I Did Today

- Internship Day 2 at IQ-Line Pvt. Ltd.
- Learned how to implement Smart Parcha
  software in a hospital environment
- Understood the complete implementation process
- Revised all SQL topics from beginning to end
- Growing domain knowledge in healthcare IT

---

## INTERNSHIP - DAY 2

### What is Smart Parcha
Smart Parcha is a hospital software product
by IQ-Line Pvt. Ltd. that digitizes the
traditional paper-based prescription and
patient flow process in hospitals.

Parcha = Prescription slip in Hindi
Smart Parcha = Digital prescription system

### Problem Smart Parcha Solves
In traditional hospitals:
- Doctors write prescriptions on paper
- Patients carry paper slips everywhere
- Paper gets lost or damaged easily
- Data cannot be tracked or analyzed
- Long waiting times at every counter
- No visibility of patient flow

Smart Parcha solves all of this by:
- Making prescription completely digital
- Patient gets digital parcha on system
- All departments connected in real time
- Data stored and trackable in database
- Reduces waiting time significantly
- Management gets real-time reports

---

## HOW TO IMPLEMENT SMART PARCHA

### Phase 1 - Pre-Implementation

#### Step 1 - Requirement Gathering
- Meet hospital management team
- Understand current workflow of hospital
- Know how many OPD counters exist
- Know how many doctors are there
- Know departments and their workflow
- Understand current problems they face
- Document all requirements clearly

#### Step 2 - System and Hardware Check
- Check computers at hospital
- Verify network connectivity and Wi-Fi
- Check printers and their drivers
- Verify internet speed and stability
- Check server configuration
- Ensure minimum hardware requirements
  are met at all counters

#### Step 3 - Installation Planning
- Plan which counters to set up first
- Decide go-live date with hospital
- Plan training schedule for staff
- Prepare installation checklist
- Prepare troubleshooting guide

---

### Phase 2 - Installation

#### Step 4 - Server Setup
- Install Smart Parcha server software
  on the hospital main server
- Configure database settings
- Set up network connections
- Test server is accessible from all PCs
- Verify database is running correctly

#### Step 5 - Client Installation
- Install Smart Parcha on each counter PC
- Configure connection to main server
- Set up user accounts and passwords
- Assign roles to each user
  Doctor, Receptionist, Pharmacy, Lab etc
- Test login from each counter

#### Step 6 - Master Data Entry
- Enter all doctors and their details
- Enter all departments
- Enter medicine list in pharmacy module
- Enter test list in lab module
- Enter ward and bed details
- This is called MASTER SETUP
- Without master data software cannot run

---

### Phase 3 - Testing

#### Step 7 - End to End Testing
- Test complete patient flow
  Registration → Doctor → Pharmacy → Lab
- Test each module separately
- Check if data is saving correctly
- Check if reports are generating
- Fix any bugs or configuration issues
- Do parallel run with old paper system

#### Step 8 - Data Validation
- Verify all master data is correct
- Check if patient data is saving properly
- Run SQL queries to verify data in database
- Cross check reports with actual data
- This is where my SQL skills are useful!

---

### Phase 4 - Training

#### Step 9 - Staff Training
- Train reception staff on registration
- Train doctors on digital prescription
- Train pharmacy staff on medicine dispensing
- Train lab staff on test ordering
- Train management on reports and dashboard
- Give printed user manual to each department

#### Step 10 - Go-Live Support
- Be present on go-live day
- Support staff for first few days
- Resolve issues immediately as they arise
- Monitor system performance
- Collect feedback from users
- Fix remaining issues quickly

---

### Phase 5 - Post Implementation

#### Step 11 - Monitoring and Support
- Visit hospital regularly after go-live
- Check if any new issues have come up
- Provide remote support if needed
- Monitor system performance
- Ensure all staff are using system properly

#### Step 12 - Documentation
- Write complete implementation report
- Document all issues faced and resolved
- Record training completion
- Submit final project report to manager

---

## HOW DATA SKILLS HELP IN IMPLEMENTATION

### SQL for Data Validation
After master data entry run queries like:
- SELECT COUNT(*) FROM doctors
  to verify all doctors are entered
- SELECT * FROM medicines
  WHERE medicine_name IS NULL
  to find incomplete records
- SELECT * FROM patients
  WHERE registration_date = TODAY()
  to check todays registrations

### Excel for Tracking
- Create implementation checklist in Excel
- Track which counters are done
- Track training completion per department
- Create daily status report for manager

### Reporting After Go-Live
- Use SQL to generate patient count reports
- Use Excel to show implementation progress
- Show management data insights

---

## COMPLETE SQL REVISION

---

### SQL COMMANDS

#### DDL - Data Definition Language
- CREATE = make new database or table
- DROP = delete table completely
- ALTER = modify table structure
  ADD COLUMN = add new column
  DROP COLUMN = remove column
  CHANGE COLUMN = rename column
  MODIFY COLUMN = change data type

#### DML - Data Manipulation Language
- INSERT = add new rows to table
- UPDATE = modify existing rows
- DELETE = remove rows from table

#### DQL - Data Query Language
- SELECT = retrieve data from table

---

### ALL CLAUSES IN ORDER

- SELECT = choose columns
- FROM = which table
- WHERE = filter rows before grouping
- GROUP BY = group same values
- HAVING = filter groups after grouping
- ORDER BY = sort ASC or DESC
- LIMIT = show only n rows
- OFFSET = skip first n rows

---

### ALL OPERATORS

- Comparison = > < >= <= != =
- Logical = AND OR NOT
- Special = IN BETWEEN LIKE
  IS NULL IS NOT NULL

---

### ALL CONSTRAINTS

- PRIMARY KEY = unique and not null
- FOREIGN KEY = links two tables
- UNIQUE = no duplicate values
- NOT NULL = cannot be empty
- DEFAULT = sets default value
- CHECK = must meet condition

---

### ALL AGGREGATE FUNCTIONS

- COUNT(*) = count all rows
- COUNT(DISTINCT col) = count unique values
- SUM(col) = sum all values
- AVG(col) = average value
- MAX(col) = highest value
- MIN(col) = lowest value

---

### ALL STRING FUNCTIONS

- UPPER(col) = to uppercase
- LOWER(col) = to lowercase
- LENGTH(col) = character count
- LEFT(col, n) = first n chars
- RIGHT(col, n) = last n chars
- SUBSTRING(col, s, n) = extract part
- TRIM(col) = remove spaces
- REVERSE(col) = reverse text

---

### ALL LOGICAL FUNCTIONS

- IF(condition, true, false)
- IFNULL(col, value)
- NULLIF(val1, val2)
- COALESCE(col1, col2)
- CASE WHEN THEN ELSE END

---

### ALL DATE TIME FUNCTIONS

- CURRENT_DATE() = today date
- CURRENT_TIME() = current time
- NOW() = date and time
- DAY(date) = extract day
- MONTH(date) = extract month
- YEAR(date) = extract year
- HOUR(time) = extract hour
- MINUTE(time) = extract minute
- DATE_ADD(date, INTERVAL n) = add
- DATE_SUB(date, INTERVAL n) = subtract
- DATEDIFF(end, start) = days between

---

### ALL NUMERIC FUNCTIONS

- ABS(n) = no negative sign
- CEIL(n) = always round up
- FLOOR(n) = always round down
- MOD(n, d) = remainder
- ROUND(n, d) = round decimals
- POWER(n, e) = n to power e

---

### ALL WINDOW FUNCTIONS

- ROW_NUMBER() = unique row number
- RANK() = rank with gaps
- DENSE_RANK() = rank no gaps
- NTILE(n) = n equal groups
- LAG() = previous row value
- LEAD() = next row value
- PARTITION BY = reset per group

---

### ALL JOINS

- INNER JOIN = matching rows only
- LEFT JOIN = all left matching right
- RIGHT JOIN = all right matching left
- FULL JOIN = all rows both tables

---

### SUBQUERIES

- Single Row = one value use = > 
- Multi Row = many values use IN
- Correlated = references outer query

---

### CTE

- WITH name AS (query)
- SELECT from name
- Temporary during query only
- Makes complex queries readable

---

### NORMALIZATION

- 1NF = atomic values no repeating groups
- 2NF = no partial key dependencies
- 3NF = no transitive dependencies

---

### EDA CONCEPTS

- DIMENSION = text columns for grouping
- MEASURE = numeric columns for calculating
- INFORMATION_SCHEMA.TABLES = all tables
- INFORMATION_SCHEMA.COLUMNS = all columns

---

## SQL JOURNEY SUMMARY

| Day Range | Topics Covered |
|-----------|----------------|
| Day 1-4 | DDL DML DQL Constraints Operators |
| Day 5-8 | Functions String Logical Date Numeric |
| Day 9-12 | Window Functions JOINS Subqueries |
| Day 13-16 | CTE Normalization EDA Concepts |
| Day 17-20 | Pizza Project All 13 Questions |
| Day 21-24 | Advanced Analytics 7 Techniques |
| Day 25-28 | Data Cleaning 4 Step Pipeline |
| Day 29 | Complete Revision All Topics |

---

## KEY HEALTHCARE IT TERMS LEARNED THIS WEEK

| Term | Meaning |
|------|---------|
| HIS | Hospital Information System |
| LIS | Laboratory Information System |
| RIS | Radiology Information System |
| Smart Parcha | Digital prescription system by IQ-Line |
| OPD | Out Patient Department |
| IPD | In Patient Department |
| Master Data | Base data needed to run the software |
| Go-Live | Day when software starts being used live |
| Implementation | Process of setting up software at client |
| Data Validation | Verifying data is correct and complete |

---

## Summary - What I Did Today

- Internship Day 2 completed successfully
- Learned complete Smart Parcha implementation
  process from pre-implementation to post go-live
- Understood 5 phases and 12 steps of
  software implementation in hospitals
- Learned how my SQL and Excel skills
  directly help in implementation work
- Completed full SQL revision all topics
- Domain knowledge growing every day!

---

## Tomorrow I Will

- Continue learning at internship
- Practice Smart Parcha software hands-on
- Learn more about hospital workflows
- Continue daily GitHub commits
- Apply SQL skills in real work tasks