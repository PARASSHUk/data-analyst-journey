# Power BI - Day 8 Learning Notes
## Topic: Cards, Multiple Row Card, Custom Visuals,
##         Data Model, Star Schema, Relationships

---

## What I Learned Today

- Cards visual in depth with filters
- Multiple Row Card visual
- Custom Visuals and Marketplace
- Data Model concept and importance
- Data Model Schema - Star Schema
- Fact Table and Dimension Table
- Primary Key and Foreign Key
- Composite Primary Key
- Types of Relationships
- Creating and Managing Relationships

---

## VISUALIZATION CHARTS - CONTINUED

---

### 17. Cards

- Displays a SINGLE important value
- Works with dynamic scenarios
- Example: Total world population
- When combined with a Slicer it shows
  the value filtered by slicer selection
- Example: Population changes by country
  when country slicer is clicked

#### Using Filters to Show Top Subcategory
- Click on the Card visual
- Go to Filters section
- Drag Sub-Category to Filters field
- Add Field then choose option: TOP N
- Enter number (1 to get top 1 result)
- Add Value By field: drop Total Sales into it
- Click Apply Filter
- Card now shows highest sales value
  for the top subcategory automatically

#### Other Uses of Card with Filters
- Which date generated highest sales
- Which date generated highest profit
- Works same way using filter with TOP N

---

### 18. Multiple Row Card

- Shows MULTIPLE values in one visual
- Unlike Cards which show only one value
- Can see multiple subcategories with
  their sales, profit, quantity together

#### Using Filters on Multiple Row Card
- Same filter approach as Cards
- But can show TOP 3 categories instead of 1
- Shows highest sales, profit etc together
- Much more informative than single card

#### Connecting Multiple Row Card with Chart
- Example: Pie Chart showing region-wise sales
- When user clicks on a REGION in Pie Chart
- Multiple Row Card updates automatically
- Shows data for ONLY that selected region
- Creates interactive cross-filtering effect

---

## CUSTOM VISUALS

- Power BI extensions beyond standard visuals
- Allow creation of unique visualizations
- Tailored to specific business needs

### How to Access Custom Visuals
- Go to Power BI Marketplace (AppSource)
- Find visuals created by community and vendors
- Install directly into Power BI Desktop
- Use like any other built-in visual

### Benefits
- Flexibility for unique chart types
- Customization beyond default options
- Community-built specialized visuals
- Industry-specific visualization options

---

## DATA MODEL IN POWER BI

A Data Model in Power BI is a logical
representation of data structure and relationships.
It is a collection of tables and the
relationships between those tables.

---

## IMPORTANCE OF DATA MODEL

### 1. Defining Tables and Columns
- Identifies relevant data elements
- Structures them into tables with proper columns
- Foundation of all Power BI analysis

### 2. Establishing Relationships
- Creates connections between tables
- Based on shared key values
- Enables analysis across different datasets
- Links dimension data to fact data

### 3. Data Types
- Assigns appropriate data types to columns
- Ensures accurate calculations
- Ensures correct visualizations
- Prevents errors in DAX measures

### 4. Measures and Calculations
- Defines custom metrics based on data model
- Answers specific business questions
- Uses DAX formulas for complex calculations

---

## KEY BENEFITS OF DATA MODEL

### Improved Accuracy
- Clear relationships between data points
- Minimizes data redundancy
- Reduces errors in reports and insights
- More reliable analysis results

### Enhanced Performance
- Properly structured model optimizes queries
- Reduces unnecessary calculations
- Faster data retrieval
- Allows for quicker analysis

### Clarity and Understanding
- Visual representation of data structure
- Users easily see how elements connect
- Better interpretation of results
- Easier to communicate findings

---

## DATA MODEL SCHEMA

---

### 1. Star Schema

- Most popular schema in Power BI
- Central FACT TABLE in the middle
- Multiple DIMENSION TABLES branching off
- Shape looks like a STAR
- Fact table = center of the star
- Dimension tables = points of the star

#### FACT TABLE
- Contains the MEASURES or METRICS
- These are the values of interest
- Examples: Sales Amount, Quantity, Profit
- Usually has many rows
- Contains foreign keys linking to dimension tables

#### DIMENSION TABLE
- Contains DESCRIPTIVE ATTRIBUTES
- Descriptive attributes = columns that
  describe an entity but are NOT used
  for calculations
- Examples: Product Name, Customer Name,
  Region, Category, Date
- Usually has fewer rows than fact table
- Contains the primary key column

---

## PRIMARY KEY AND FOREIGN KEY

### Primary Key
- A column or set of columns that
  UNIQUELY identifies each row in a table
- No duplicate values allowed
- Cannot be NULL
- Example: Customer ID in Customers table

### Foreign Key
- A column or set of columns that
  REFERENCES the primary key of another table
- Creates a link between two tables
- Example: Customer ID in Orders table
  references Customer ID in Customers table

### Composite Primary Key
- A PRIMARY KEY made up of TWO or MORE columns
- Used when ONE column alone CANNOT uniquely
  identify a row
- But the COMBINATION of columns can
- Example: (Order ID + Product ID) together
  uniquely identify each order line item

---

## TYPES OF RELATIONSHIPS

### 1. One to One (1:1)
- One record in Table A is related to
  exactly ONE record in Table B
- Works both ways - vice versa also
- Neither table can have duplicate values
  in the relationship column
- Example: One Employee has One Passport

### 2. One to Many (1:*)
- MOST COMMONLY USED relationship in Power BI
- A single record from one table can be
  linked to ZERO or MORE rows in another table
- Example: One Customer can have Many Orders
- One Product can appear in Many Order Lines
- The ONE side = Dimension Table (Primary Key)
- The MANY side = Fact Table (Foreign Key)

---

## CREATING AND MANAGING RELATIONSHIPS

### Method 1 - Autodetect Tool
- If tables are loaded but no relationship visible
- Go to Modeling Tab
- Click Manage Relationships
- Click Autodetect button
- Power BI automatically finds common columns
- Creates relationships based on matching names

### Method 2 - Manual Creation
- Check common columns between two tables
- Example: Shipment table has Shipment Date
  Calendar table has Cal_Date
- These are the common columns to link on
- Drag one column onto the matching column
  in the other table in Model View
- Relationship is created manually

### Managing Existing Relationships
- Can delete relationships that are wrong
- Can make relationships ACTIVE or INACTIVE
- Active relationship = SOLID dark line
- Inactive relationship = DOTTED line
- Use USERELATIONSHIP() DAX function
  to activate an inactive relationship
  inside a specific measure

---

## COMPLETE CHART REFERENCE - ALL DAYS

| Day | Charts Learned |
|-----|----------------|
| Day 6 | Bar, Column, Pie, Donut, TreeMap, Table, Matrix |
| Day 7 | Line, Area, KPI, Slicer, Funnel, Scatter, Map, Gauge |
| Day 8 | Cards, Multiple Row Card, Custom Visuals |

---

## KEY CONCEPTS SUMMARY TABLE

| Concept | Meaning |
|---------|---------|
| Star Schema | Central fact + surrounding dimension tables |
| Fact Table | Contains measures and metrics |
| Dimension Table | Contains descriptive attributes |
| Primary Key | Uniquely identifies each row |
| Foreign Key | References primary key of another table |
| Composite Key | Two or more columns as one primary key |
| One to One | One record matches exactly one record |
| One to Many | One record matches many records |
| Autodetect | Power BI finds relationships automatically |
| Active Relationship | Solid line in Model View |
| Inactive Relationship | Dotted line in Model View |

---

## Power BI Learning Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 | Data Loading Power Query Charts Relationships | Done |
| Day 2 | DAX SUM SUMX WEEKDAY IF Drill Down Bins | Done |
| Day 3 | Visualization Types Active Inactive Lines | Done |
| Day 4 | First Project Data Professional Survey | Done |
| Day 5 | Why Power BI Components Power Query Methods | Done |
| Day 6 | Bar Column Pie Donut TreeMap Table Matrix | Done |
| Day 7 | Line Area KPI Slicer Funnel Scatter Map Gauge | Done |
| Day 8 | Cards Multiple Row Card Data Model Star Schema | Done |

---

## Summary - What I Learned Today

- Used Cards with TOP N filter technique
- Learned Multiple Row Card for multi-value display
- Learned how cross-filtering works between visuals
- Learned about Custom Visuals marketplace
- Understood Data Model concept fully
- Learned Star Schema structure
- Understood Fact vs Dimension tables
- Learned Primary Key Foreign Key difference
- Learned Composite Primary Key concept
- Learned One to One and One to Many relationships
- Learned Autodetect and Manual relationship creation
- Understood Active vs Inactive relationship lines

---

## Tomorrow I Will Learn

- DAX CALCULATE and FILTER functions
- Time Intelligence DAX functions
- RELATED and RELATEDTABLE functions
- Build a complete Power BI project
- Continue Power BI learning journey!