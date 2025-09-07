# Restaurant Chain Database Management System (PostgreSQL)

## Problem
Managing data across multiple restaurant locations is complex:
- Inconsistent sales and inventory tracking
- Difficulty generating real-time revenue and reservation insights
- Challenges with secure customer data handling

## Method
- Designed a **normalized relational schema (3NF)** covering menu, reservations, inventory, sales, and transactions.
- Implemented schema in **PostgreSQL** with **primary/foreign keys, constraints, and junction tables**.
- Populated database with **sample data** for menu items, reservations, customers, inventory, and transactions.
- Developed SQL queries for analytics:
  - Total sales by category
  - Top 10 most popular menu items
  - Customer reservation history
  - Inventory levels by ingredient
  - Revenue by location
- Applied **security measures**: role-based access, masking customer-sensitive details, triggers for automatic inventory updates.

## Tech Stack
- **Database:** PostgreSQL  
- **Tools:** pgAdmin, Draw.io (ERD), SQL scripting  
- **Security:** Roles, functions, triggers, data masking  

## Results
- Delivered a **scalable and normalized database** supporting multi-location operations.
- Automated **daily revenue reports, sales reports by category, and inventory tracking**.
- Improved data integrity and reduced redundancy with 3NF design.

<img width="1518" height="875" alt="ERD" src="https://github.com/user-attachments/assets/80a20da8-2c61-4948-b871-ec42d992c0ac" />


## Business Impact
- Enabled restaurant chain to:
  - Generate **real-time revenue insights** by location.
  - Track **top-selling items** to adjust menus.
  - Maintain **accurate inventory levels** with automated updates.
  - Protect sensitive customer data via masking and role-based access.

## How to Run
1. Clone the repo and import SQL schema files (`sql/create_tables.sql`, `sql/insert_data.sql`).
2. Load sample dataset into PostgreSQL via `pgAdmin` or `psql`.
3. Run analytics queries (`sql/queries.sql`) for reports.
4. Explore ERD and normalization diagram in `/docs`.
