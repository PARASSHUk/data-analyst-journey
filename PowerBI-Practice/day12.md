# Power BI - Day 12 Learning Notes
## Topic: Power BI Service, Color Palette,
##         Airbnb Project Started

---

## What I Did Today

- Learned Power BI Service in depth
- Learned about Color Palette in dashboards
- Started Airbnb Power BI Project
- Loaded dataset from Maven
- Explored data dictionary concept
- Set up relationships between tables
- Changed crossfilter direction for accurate results

---

## POWER BI SERVICE

- Cloud-based platform for business intelligence
- Hosted on Microsoft Azure
- Used for publishing sharing and collaborating
  on Power BI reports and dashboards
- Enables real-time data refresh
- Access reports from anywhere on any device

### Key Features
- Web-based access to all reports and dashboards
- Collaboration and sharing across teams
- Scheduled data refresh
- Role-based security settings
- Mobile access through Power BI Mobile app

---

## POWER BI SERVICE WORKFLOW

### Step 1 - Create Reports in Power BI Desktop
- Build all visuals and DAX measures
- Set up data model and relationships
- Format and finalize the dashboard

### Step 2 - Publish to Power BI Service
- Click Publish button in Power BI Desktop
- Sign in with Microsoft account
- Select workspace to publish to
- Report appears in Power BI Service instantly

### Step 3 - Set Up Data Refresh and Security
- Schedule automatic data refresh
- Set row-level security if needed
- Control who can see which data

### Step 4 - Share and Collaborate
- Share reports with team members
- Set view or edit permissions
- Team can add comments and annotations

### Step 5 - Access Reports Anytime Anywhere
- Open in browser at app.powerbi.com
- Access on mobile using Power BI app
- Embed in websites or SharePoint
- No Power BI Desktop needed to view

---

## POWER BI DESKTOP vs POWER BI SERVICE

| Feature | Power BI Desktop | Power BI Service |
|---------|-----------------|-----------------|
| Purpose | Build reports | Share reports |
| Location | Local computer | Cloud (Azure) |
| Access | Windows app only | Any browser any device |
| Editing | Full edit capability | Limited editing |
| Data Refresh | Manual | Automatic scheduled |
| Sharing | Cannot share directly | Can share with anyone |
| Cost | Free | Requires license |

---

## COLOR PALETTE IN POWER BI

- Companies decide specific colors for dashboards
- Called Brand Colors or Color Palette
- Ensures consistent look across all reports

### Best Practices for Color Palette
- Use a LIMITED number of colors
- Do NOT use too many colors in one dashboard
- Too many colors = confusing and unprofessional
- Stick to 2 to 4 main colors maximum
- Use shades of same color for variations
- Match company brand guidelines

### Why Color Palette Matters
- Makes dashboard look professional
- Creates visual consistency
- Helps users identify patterns faster
- Reduces cognitive load on viewers

---

## PROJECT - AIRBNB DATA ANALYSIS IN POWER BI

### Project Overview
- Dataset Source: Maven Analytics
- Tool: Power BI Desktop
- Tables: Listings and Reviews
- Status: In Progress

---

### Data Dictionary Concept Learned

- Companies create a DATA DICTIONARY for datasets
- A data dictionary explains:
  What each column means
  What type of data it contains
  What values are expected
- Very useful when working with unknown datasets
- Always check data dictionary before analysis
- Helps understand the business context

---

### Step 1 - Load Data

- Downloaded Airbnb dataset from Maven Analytics
- Dataset contains TWO tables:
  1. Listings table = property details
  2. Reviews table = customer reviews

---

### Step 2 - Check Relationships in Model View

- Went to Model View after loading both tables
- Found relationship between the two tables
- Relationship Type = ONE TO MANY
- Primary Key = Listing ID (in Listings table)
- Foreign Key = Listing ID (in Reviews table)
- One listing can have MANY reviews

---

### Step 3 - Fix Crossfilter Direction

- Default crossfilter was SINGLE direction
- Changed crossfilter from Single to BOTH
- This ensures filters flow in both directions
- Needed to get proper and accurate results
- When a listing is selected reviews filter too
- When a review is selected listing filters too

---

### Why Bidirectional Crossfilter Was Needed
- Listings and Reviews are connected tables
- Visuals from both tables needed to interact
- Single direction = only one table could filter
- Both direction = both tables filter each other
- More accurate analysis with Both selected

---

## KEY CONCEPTS REVISED TODAY

### Relationships Recap
- One to One = one record matches exactly one
- One to Many = one record matches many records
- Primary Key = uniquely identifies each row
- Foreign Key = references primary key of another table

### Crossfilter Direction Recap
- Single = filters flow ONE way only
- Both = filters flow in BOTH directions
- Use Both carefully as it can cause ambiguity
- Required when two tables need to filter each other

### Data Source Recap
- Maven Analytics = popular free dataset source
- Good for building portfolio projects
- Real world business datasets available

---



---

## Summary - What I Did Today

- Learned Power BI Service cloud platform
- Understood complete Power BI Service workflow
- Learned importance of Color Palette in dashboards
- Started Airbnb Power BI Project from Maven
- Learned about Data Dictionary concept
- Loaded two tables Listings and Reviews
- Identified One to Many relationship
- Set Primary Key as Listing ID
- Changed crossfilter from Single to Both

---

## Tomorrow I Will Continue

- Continue Airbnb Power BI Project
- Build visuals for Airbnb analysis
- Create KPI cards and charts
- Apply DAX measures for Airbnb insights
- Find key business insights from data
- Complete and upload Airbnb project to GitHub