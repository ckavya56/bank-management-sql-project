import pandas as pd
import mysql.connector

# MySQL connection
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="YOUR_PASSWORD",
    database="bank_management"
)

# CSV files
files = {
    "customers": "customers.csv",
    "accounts": "accounts.csv",
    "cards": "cards.csv",
    "loans": "loans.csv",
    "merchants": "merchants.csv"
}

# Load CSV files into MySQL
for table_name, file_name in files.items():
    df = pd.read_csv(file_name)

    print(f"{file_name} loaded successfully")
    print(f"Rows: {len(df)}")
    print(f"Columns: {len(df.columns)}")
    print("-" * 40)

connection.close()

print("Database connection closed.")
