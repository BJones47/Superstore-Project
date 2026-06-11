import pandas as pd
import numpy as np

# read in the dataset
df = pd.read_csv('Sample - Superstore.csv', encoding='latin-1')


print("SHAPE (rows, columns):", df.shape)

print("\nCOLUMN TYPES:")
print(df.dtypes)

# check for missing values
missing = df.isnull().sum()

print("\nMISSING VALUES BY COLUMN:")
print(missing[missing > 0] if missing.sum() > 0 else "No missing values found")

# check for missing rows
print("\nMISSING ROWS:")
print(df[df.isnull().any(axis=1)])

# check for duplicates
print("\nDUPLICATES:")
print(df.duplicated().sum())

# no missing values or duplicates were detected in the dataset

# convert column names into lowercase and replace spaces with underscores 
# (for easier sql queries)
df.columns = df.columns.str.lower().str.replace(' ', '_')

# create a new column for profit margin, shipping duration, year, and month
df['profit_margin'] = df['profit'] / df['sales'].replace(0, np.nan)
df['shipping_duration'] = (pd.to_datetime(df['ship_date']) - pd.to_datetime(df['order_date'])).dt.days
df['year'] = pd.to_datetime(df['order_date']).dt.year
df['month'] = pd.to_datetime(df['order_date']).dt.month

# identify outliers in the profit margin column using the IQR method 
Q1 = df['profit_margin'].quantile(0.25)
Q3 = df['profit_margin'].quantile(0.75)
IQR = Q3 - Q1
lower_bound = Q1 - 1.5 * IQR
upper_bound = Q3 + 1.5 * IQR
outliers = df[(df['profit_margin'] < lower_bound) | (df['profit_margin'] > upper_bound)]
print("\nOUTLIERS SUMMARY:")
print("Count:", len(outliers))
print("Percent of dataset:", round(len(outliers) / len(df) * 100, 2), "%")
print("\nSample:")
print(outliers.head())


# identify extreme discounts, and negative profits
extreme_discounts = df[df['discount'] > 0.5]
negative_profits = df[df['profit'] < 0]
print("\nEXTREME DISCOUNTS (>0.5):")
print("Count:", len(extreme_discounts))
print(extreme_discounts.head())

print("\nNEGATIVE PROFITS:")
print("Count:", len(negative_profits))
print(negative_profits.head())

df.to_csv('cleaned_superstore.csv', index=False)