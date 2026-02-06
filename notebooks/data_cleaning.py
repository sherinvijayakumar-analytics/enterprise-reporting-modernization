import pandas as pd

# Load raw healthcare data
df = pd.read_csv("../data/hospital_admissions_raw.csv")



# Convert dates
df["admission_date"] = pd.to_datetime(df["admission_date"])
df["discharge_date"] = pd.to_datetime(df["discharge_date"])

# Derive length of stay
df["length_of_stay"] = (df["discharge_date"] - df["admission_date"]).dt.days

# Handle missing values (safety step)
df["length_of_stay"] = df["length_of_stay"].fillna(0)

# Standardize text columns
df.columns = df.columns.str.lower()

# Save cleaned data
df.to_csv("../data/hospital_admissions_cleaned.csv", index=False)

print("Healthcare data cleaned and saved successfully.")
