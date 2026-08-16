# 🏦 Bank Management SQL Analysis

## 📌 Project Overview

This project focuses on analyzing banking data using **MySQL** to extract meaningful business insights from customers, accounts, cards, loans, and merchants.

The project covers SQL analysis from basic aggregations to advanced SQL techniques such as **subqueries, CTE-style analysis, window functions, ranking, and customer-level business analysis**.

The goal is to demonstrate practical SQL skills that can be applied to real-world banking and financial data.

---

## 🎯 Project Objectives

The main objectives of this project are to:

* Analyze customer demographics and credit scores
* Understand account balances and account types
* Analyze card distribution and expiration patterns
* Analyze loan amounts and interest rates
* Analyze merchant distribution by city
* Identify high-value customers
* Perform customer-level financial analysis
* Use advanced SQL techniques for business insights
* Build a portfolio-ready SQL project

---

## 🗂️ Database Tables

The project uses the following main tables:

| Table       | Description                                                   |
| ----------- | ------------------------------------------------------------- |
| `customers` | Customer information, demographics, and credit scores         |
| `accounts`  | Customer bank accounts and account balances                   |
| `cards`     | Card information and expiration dates                         |
| `loans`     | Customer loans, loan amounts, interest rates, and start dates |
| `merchants` | Merchant information and locations                            |

### Main Relationships

```text
customers
    │
    ├── accounts
    │
    ├── cards
    │
    └── loans

merchants
    │
    └── merchant-related analysis
```

The `customer_id` field is used to connect customers with their accounts, cards, and loans.

---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* **Python** for data import
* **GitHub** for project documentation and version control

---

## 📊 Analysis Performed

### 👤 Customer Analysis

The customer analysis includes:

* Total number of customers
* Customer distribution by city
* Average credit score
* Highest and lowest credit scores
* Customers with credit scores above 700
* Credit-score classification
* Customer creation trends by year
* Average credit score by city
* Top customers by credit score
* High-credit-score customers by city

**SQL concepts used:**

`COUNT()` · `AVG()` · `MAX()` · `MIN()` · `WHERE` · `GROUP BY` · `HAVING` · `CASE` · `YEAR()` · `CONCAT()` · `ORDER BY` · `LIMIT`

---

### 💰 Account Analysis

The account analysis includes:

* Total number of accounts
* Accounts by account type
* Total account balance by account type
* Average account balance
* Customers with high total account balances
* Top customers by total account balance
* Account-type comparisons

**SQL concepts used:**

`COUNT()` · `SUM()` · `AVG()` · `GROUP BY` · `HAVING` · `JOIN` · `ORDER BY`

---

### 💳 Card Analysis

The card analysis includes:

* Total number of cards
* Cards by card type
* Most common card type
* Number of cards associated with each account
* Top accounts by number of cards
* Cards expiring by year
* Cards expiring by card type and year

**SQL concepts used:**

`COUNT()` · `YEAR()` · `GROUP BY` · `ORDER BY` · `LIMIT`

---

### 💵 Loan Analysis

The loan analysis includes:

* Total number of loans
* Total loan amount
* Average loan amount
* Highest loan amount
* Average interest rate
* Loans by interest rate
* Top customers by total loan amount
* Loans started by year
* Average loan amount by interest rate
* Customers with multiple loans
* Customers with total loan amounts above a threshold
* Highest-value loan customer
* Customer-level loan analysis using joins

**SQL concepts used:**

`SUM()` · `AVG()` · `MAX()` · `YEAR()` · `GROUP BY` · `HAVING` · `JOIN` · `ORDER BY` · `LIMIT`

---

### 🏪 Merchant Analysis

The merchant analysis includes:

* Total number of merchants
* Merchants by city
* City with the highest number of merchants
* Top cities by merchant count
* Merchants whose names start with a specific letter
* Merchants containing specific text
* Cities with high merchant counts
* Alphabetical merchant analysis
* City with the fewest merchants
* Average merchant-name length

**SQL concepts used:**

`COUNT()` · `LIKE` · `LENGTH()` · `GROUP BY` · `HAVING` · `ORDER BY` · `LIMIT`

---

# 🚀 Advanced SQL Analysis

The project also includes advanced SQL techniques used for more complex business analysis.

### Multi-table Analysis

* Combining customer, account, and loan information
* Customer-level financial analysis
* Aggregating accounts and loans before joining to avoid duplicate-row multiplication

### Subqueries

* Customer-level account aggregation
* Customer-level loan aggregation
* Comparing aggregated values across tables
* Finding maximum values within groups

### Window Functions

The project demonstrates:

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`
* `SUM() OVER()`
* `SUM() OVER(PARTITION BY ...)`
* `AVG() OVER()`
* `LAG()`
* `LEAD()`

### Window Function Examples

#### Customer Ranking

Customers can be ranked according to their total account balance:

```sql
RANK() OVER (
    ORDER BY SUM(balance_usd) DESC
)
```

#### Ranking Within Groups

Customers can be ranked within each city:

```sql
RANK() OVER (
    PARTITION BY city
    ORDER BY SUM(balance_usd) DESC
)
```

#### Customer-Level Loan Totals

Individual loan records can be retained while calculating the customer's total loans:

```sql
SUM(loan_amount) OVER (
    PARTITION BY customer_id
)
```

#### Percentage of Total

Individual loans can be compared against the total loan portfolio:

```sql
loan_amount / SUM(loan_amount) OVER () * 100
```

---

# 💡 Key Business Questions

This project answers questions such as:

* Which cities have the most customers?
* Which customers have the highest credit scores?
* Which account types hold the most money?
* Which customers have the highest account balances?
* Which card types are most common?
* When are the most cards expiring?
* Which customers have the highest total loan exposure?
* Which interest rates are associated with the largest loans?
* Which cities have the highest merchant concentration?
* Which customers have both high account balances and high loan exposure?
* How do individual loans contribute to the overall loan portfolio?

---

# 📁 Project Structure

```text
bank-management-sql-project/
│
├── README.md
│
├── sql/
│   ├── 01_customer_analysis.sql
│   ├── 02_account_analysis.sql
│   ├── 03_card_analysis.sql
│   ├── 04_loan_analysis.sql
│   ├── 05_merchant_analysis.sql
│   └── 06_advanced_analysis.sql
```

---

# 🔍 SQL Skills Demonstrated

This project demonstrates practical experience with:

### Basic SQL

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `DISTINCT`

### Aggregation

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

### Grouping

* `GROUP BY`
* `HAVING`

### String & Date Functions

* `CONCAT()`
* `LIKE`
* `LENGTH()`
* `YEAR()`

### Conditional Logic

* `CASE`

### Joins

* `INNER JOIN`
* Multi-table joins
* Aggregation before joining to prevent duplicate calculations

### Advanced SQL

* Subqueries
* Window functions
* `RANK()`
* `DENSE_RANK()`
* `ROW_NUMBER()`
* `LAG()`
* `LEAD()`
* `SUM() OVER()`
* `AVG() OVER()`
* `PARTITION BY`

---

# 📈 Business Value

The analysis demonstrates how SQL can be used to support banking-related business decisions, including:

* Customer segmentation
* Credit-risk analysis
* Customer value identification
* Loan portfolio analysis
* Account balance analysis
* Card portfolio monitoring
* Merchant distribution analysis

The project focuses not only on writing SQL queries but also on understanding how the results can support **data-driven decision making**.

---

# ▶️ How to Use This Project

### 1. Set up MySQL

Create a MySQL database and import the required banking data.

### 2. Create the database tables

Create the required tables according to the database schema.

### 3. Import the data

The Python import script can be used to load the banking data into MySQL.

### 4. Run the SQL analysis

Open the SQL files inside the `sql/` directory and execute the queries in MySQL.

The analysis files are organized by business area:

```text
01_customer_analysis.sql
02_account_analysis.sql
03_card_analysis.sql
04_loan_analysis.sql
05_merchant_analysis.sql
06_advanced_analysis.sql
```

---

# 📌 Project Highlights

* Designed and analyzed a relational banking database
* Performed customer, account, card, loan, and merchant analysis
* Used aggregation and grouping for business reporting
* Used joins to combine information across multiple tables
* Used subqueries for complex customer-level analysis
* Used window functions for ranking and comparative analysis
* Calculated customer-level financial metrics
* Organized SQL analysis into reusable `.sql` files
* Documented the project for portfolio and GitHub presentation

---

# 👨‍💻 Author

Chendilikumar Kavya

SQL | MySQL | Python | Data Analysis



⭐ If you find this project useful, feel free to explore the SQL files and analysis.
