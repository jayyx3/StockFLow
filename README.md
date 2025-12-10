# StockFlow - Inventory Management System

StockFlow is a comprehensive Inventory Management System designed to streamline the tracking of products, orders, and stock levels across multiple warehouses. This project demonstrates an end-to-end data engineering workflow, from database schema design and creation to data migration (ETL) and analysis.

## 🚀 Project Overview

The system is built using **Python** and **MySQL**. It automates the process of setting up a relational database, importing raw data from CSV files, and preparing it for analysis.

### Key Features
- **Database Architecture**: Automatically creates a normalized relational database schema including tables for:
  - `Category`: Product categories
  - `Product`: Product details and pricing
  - `Warehouse`: Storage location information
  - `Inventory`: Stock levels per product per warehouse
  - `Customer`: Customer contact information
  - `Order_details`: Transactional order data
- **ETL Pipeline**: Utilizes **Pandas** and **SQLAlchemy** to efficiently load bulk data from CSV files into the MySQL database.
- **Data Integrity**: Enforces foreign key constraints to ensure relationships between entities (e.g., Products linked to Categories, Orders linked to Customers).
- **SQL Analysis**: Includes ready-to-use SQL scripts for querying and analyzing inventory metrics.

## 🛠️ Tech Stack

- **Language**: Python 3.x
- **Database**: MySQL
- **Libraries**:
  - `pandas`: For data manipulation and cleaning.
  - `sqlalchemy`: For database ORM and connection management.
  - `pymysql`: MySQL driver for Python.
- **Tools**: Jupyter Notebook, Visual Studio Code

## 📂 Project Structure

```
StockFlow/
├── PROJECT_Inventory_Management.ipynb  # Main notebook for DB setup and data loading
├── analysis.sql                        # SQL queries for data analysis
├── delimiters.sql                      # SQL scripts (procedures/triggers)
├── categories.csv                      # Raw data: Categories
├── products.csv                        # Raw data: Products
├── warehouses.csv                      # Raw data: Warehouses
├── inventory.csv                       # Raw data: Inventory levels
├── customers.csv                       # Raw data: Customers
├── order_details.csv                   # Raw data: Orders
└── README.md                           # Project documentation
```

## ⚙️ Setup & Installation

1. **Prerequisites**:
   - Ensure you have **MySQL Server** installed and running locally.
   - Install Python and the required libraries:
     ```bash
     pip install pandas sqlalchemy pymysql
     ```

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/StockFlow.git
   cd StockFlow
   ```

3. **Configure Database Connection**:
   - Open `PROJECT_Inventory_Management.ipynb`.
   - Locate the connection string cell and update the `user` and `password` fields with your MySQL credentials:
     ```python
     connection = pymysql.connect(host='LOCALHOST', user='your_username', password='your_password')
     # AND
     engine = create_engine("mysql+pymysql://your_username:your_password@localhost/Inventory")
     ```

4. **Run the Project**:
   - Execute the cells in `PROJECT_Inventory_Management.ipynb` sequentially.
   - This will:
     1. Create the `Inventory` database.
     2. Drop existing tables (if any) and create new ones.
     3. Read data from the CSV files.
     4. Insert the data into the MySQL tables.

5. **Analyze Data**:
   - Use the queries in `analysis.sql` to explore the data, or connect your favorite BI tool (like Tableau or PowerBI) to the MySQL database.

## 📊 Database Schema

The project uses a relational schema where:
- **Products** belong to **Categories**.
- **Inventory** tracks **Products** in specific **Warehouses**.
- **Orders** are placed by **Customers** for specific **Products**.

## 📝 License

This project is open-source and available for learning and modification.
