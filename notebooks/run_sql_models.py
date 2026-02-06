import sqlite3

DB_PATH = "../data/healthcare.db"

sql_files = [
    "../sql/dim_dept.sql",
    "../sql/dim_date.sql",
    "../sql/fact_admission.sql"
]

conn = sqlite3.connect(DB_PATH)
cursor = conn.cursor()

for file in sql_files:
    with open(file, "r") as f:
        sql = f.read()
        cursor.executescript(sql)

conn.commit()
conn.close()

print("Star schema tables created successfully.")
