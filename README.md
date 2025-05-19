## Project Overview
This project demonstrates a data warehouse setup using PostgreSQL. It includes ETL processing, data modeling, and analysis of movie sales data in a star schema structure and also implements some practices to extract insights such as total sales per film, top revenue-generating cities, and more.

## Repository Structure
```
/
├── database/               # Contains the sample database
|-- sql/
|   |-- queries.sql         # Contains all SQL queries for analysis
|   |-- ddl.sql             # Contains all DDL statements for table creation
|   |-- dml.sql             # Contains all DML statements for data insertion
|
|-- assets/
|   |-- er-diagram.pdf      # ER diagram of the sample PostgreSQL database
|
|-- README.md               # Project overview and instructions
```

## ER Diagram
The ER diagram for the sample database is located in the `assets` folder.

## SQL Files
- `ddl.sql`: Contains all DDL statements for creating tables (dimDate, dimCustomer, dimMovie, dimStore, factSales).
- `dml.sql`: Contains all DML statements for inserting data into the dimension tables and fact table.
- `queries.sql`: Contains all SQL queries for extracting sales insights, revenue by movie, and top revenue-generating cities.

## Data Warehouse Implementation
A dimensional data warehouse model is implemented with the following tables:
1. **dimDate** - Date dimension table
2. **dimCustomer** - Customer dimension table
3. **dimMovie** - Movie dimension table
4. **dimStore** - Store dimension table
5. **factSales** - Fact table for sales data

## Instructions
1. Execute the DDL statements in `sql/ddl.sql` to create the tables.
2. Insert data using the statements in `sql/dml.sql`.
3. Run the analysis queries in `sql/queries.sql` to get insights.

## Future Enhancements
- Data visualization using Python.
- Implement data integrity checks.
- Develop an interactive dashboard for sales analysis.

