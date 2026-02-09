# banking-data-analysis-sql-powerbi_perplexity
This project demonstrates an end-to-end data analytics workflow using a banking dataset. It includes database creation, data insertion with real-world inconsistencies, data cleaning using SQL, table integration, and the development of an interactive Power BI dashboard for business insights.

  Note: SQL queries and database setup were developed with the assistance of Perplexity AI as a learning and reference tool.

# Project Objective
The goal of this project was to simulate a real-world banking data environment, clean inconsistent data, combine multiple tables, and build a dashboard to extract meaningful insights.

## Dataset Overview

The database contains three main tables:

### Customers
- Customer ID
- Name
- Gender
- Date of Birth
- Joining Date

### Accounts
- Account ID
- Customer ID
- Account Type
- Balance
- Opening Date

### Transactions
- Transaction ID
- Account ID
- Transaction Date
- Transaction Type (Credit/Debit)
- Amount

---

## Real-World Data Issues Simulated

The dataset includes several common data quality problems to replicate real-world scenarios:

- Mixed date formats
- Missing values
- Inconsistent text cases
- Invalid account references
- Negative and extreme transaction amounts

These issues were intentionally introduced to simulate real-world data challenges and practice data cleaning techniques.

---

## SQL Work Performed

### 1. Database Creation
- Created the banking database.
- Designed Customers, Accounts, and Transactions tables.

### 2. Data Insertion
- Inserted customer and account data.
- Generated 10,000+ synthetic transactions.

### 3. Data Cleaning
- Standardized date formats across all tables.
- Used conversion and transformation logic to clean data.

### 4. Data Integration
- Joined Customers, Accounts, and Transactions tables.
- Created a unified dataset:

---

## Power BI Dashboard

The cleaned dataset was used to build an interactive dashboard for banking insights.

### Dashboard Preview


### Key Features
- KPI cards for balances and transactions
- Credit vs Debit analysis
- Account type distribution
- Customer insights
- Time-based transaction trends
- Interactive filters and slicers

---

## Tools & Technologies
- SQL Server and Power Query Editor – Database creation, cleaning, and transformation
- Power BI – Data modeling and visualization
- DAX- To create new measures 
- Perplexity AI – Query assistance and reference

---

## Project Workflow
1. Database design
2. Data insertion with inconsistencies
3. Data cleaning and formatting
4. Table joins and dataset creation
5. Power BI dashboard development

---

## Repository Structure
/SQL Scripts
├── POWER_BI2_Database_Create.sql
├── POWER_BI2_Insert_Data.sql
├── Update_Tables_dateFormat.sql
└── Combined_table.sql

/Power BI Dashboard
└── POWERBI_Perplexity_dashboard.pbix


---

## Key Learning Outcomes
- Handling messy, real-world data in SQL
- Data cleaning using conversion functions
- Table joins and dataset integration
- End-to-end analytics workflow
- Dashboard creation in Power BI
