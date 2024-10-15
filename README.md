# Sales Analysis Dashboard

## Table of Contents
1. [Project Overview](#project-overview)
2. [Project Structure](#project-structure)
3. [Entity-Relationship Diagram (ERD)](#entity-relationship-diagram-erd)
4. [Tableau Visualization](#tableau-visualization)
5. [SQL Queries Overview](#sql-queries-overview)
   - [Database Setup](#database-setup)
   - [Analysis Queries](#analysis-queries)
6. [SQL File Breakdown](#sql-file-breakdown)
7. [Running the Project](#running-the-project)
   - [Prerequisites](#prerequisites)
   - [Steps](#steps)


## Project Overview

This project provides a **Sales Analysis Dashboard** for analyzing sales performance, subscription metrics, and sales representative performance. It includes SQL queries to track key sales metrics like the number of deals closed, revenue generated, and the performance of sales representatives within different time frames.

## Project Structure

```bash
.
├── ERD.png               # Entity-Relationship Diagram (ERD)
├── Sale_Analysis.sql      # SQL script for database creation, inserting data, and analysis queries
└── README.md              # Project overview and instructions
```

## Entity-Relationship Diagram (ERD)

The ERD below outlines the structure of the database tables used for sales analysis. It helps visualize relationships between Sales Representatives, Products, and Sales.

Sales Representatives: Contains information on sales team members, their hiring and termination dates.
Products: Contains product details, including descriptions.
Sales: Stores data on individual sales, subscription costs, and contract dates.

## Tableau Visualization

You can explore the visual representation of the sales analysis on my Tableau Public profile:  
[Tableau Public Profile](https://public.tableau.com/app/profile/riddhisha.chitwadgi/viz/Performance_17281855478900/SalesDashboard)

## SQL Queries Overview

### Database Setup
The provided SQL script sets up the database schema, populates tables with sample data, and includes queries for sales performance analysis.

Note: The actual dataset used for this analysis cannot be revealed due to a Non-Disclosure Agreement (NDA). However, a sample database has been created to demonstrate the structure and queries.

1. Create the Database:
The script starts by creating a new database, New, with the necessary tables: sales_representatives, products, and sales.

2. Tables:

sales_representatives: Stores details of sales representatives, including their team, hire date, and termination date.
products: Contains product data with unique IDs, names, and descriptions.
sales: Stores sales transaction details, including the sales rep ID, product ID, subscription cost, and contract dates.

3. Sample Data:
Sample data is inserted into the tables for analysis.

## Analysis Queries

The following queries are included to analyze sales performance:

### Q1 - Total Sales by Sales Representative (with and without zeros):
Two versions of the query count the number of sales made by each sales representative within a given period (August 2024):

With Zeros: Includes sales reps who have no sales during the period.
Without Zeros: Only includes sales reps who have sales during the period.

### Q2 - Top Selling Product by Volume and Revenue (Q1 2024):
This query identifies the best-selling product by both volume (number of sales) and total revenue in the first quarter of 2024.

### Q3 - Deals Closed within the First 3 Months and First Year of Hiring:
This query calculates how many deals each sales rep closed within their first 3 months and their first year of employment.

## Running the Project

### Prerequisites
You need the following tools to run the SQL script:

1. PostgreSQL (or a compatible SQL database)
2. SQL Client (e.g., pgAdmin, DBeaver)

### Steps
1. Clone the repository:

```bash
git clone https://github.com/your-username/sales-analysis-dashboard.git
```
```bash
cd sales-analysis-dashboard
```

2. Create the Database:
Run the Sale_Analysis.sql script in your PostgreSQL instance to create the New database, tables, and sample data.

3. Run Analysis Queries:
Use the SQL queries in the script to perform sales analysis:

Query total sales by each sales representative.
Determine the top-selling product by volume and revenue for Q1 2024.
Analyze how quickly sales reps close deals after joining the team.
