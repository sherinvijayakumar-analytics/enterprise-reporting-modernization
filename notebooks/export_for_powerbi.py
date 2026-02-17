import sqlite3
import pandas as pd
import os

DB_PATH = "../data/healthcare.db"
EXPORT_PATH = "../powerbi"

os.makedirs(EXPORT_PATH, exist_ok=True)

conn = sqlite3.connect(DB_PATH)

tables = [
    "fact_admissions",
    "dim_department",
    "dim_date"
]

for table in tables:
    df = pd.read_sql(f"SELECT * FROM {table}", conn)
    df.to_csv(f"{EXPORT_PATH}/{table}.csv", index=False)

conn.close()

print("Data exported for Power BI successfully.")

