import sqlite3
import pandas as pd

# Paths
DB_PATH = "../data/healthcare.db"
CSV_PATH = "../data/hospital_admissions_cleaned.csv"

# Connect to SQLite (creates DB if it doesn't exist)
conn = sqlite3.connect(DB_PATH)

# Load cleaned CSV
df = pd.read_csv(CSV_PATH)

# Write to SQLite table
df.to_sql(
    name="stg_hospital_admissions",
    con=conn,
    if_exists="replace",
    index=False
)

conn.close()

print("Data loaded into SQLite database successfully.")
