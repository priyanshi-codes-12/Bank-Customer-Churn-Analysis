import pandas as pd
import numpy as np

df = pd.read_csv('Bank Customer Churn Prediction.csv')
# print(df.shape)
# print(df.head())

# print(df.info())
# print(df.isnull().sum())

# print("Duplicate rows:", df.duplicated().sum())
# print("Duplicate customer IDs:", df["customer_id"].duplicated().sum())
# print(df.describe())
# print(df[["balance", "products_number"]].describe())

# for col in ["country", "gender", "credit_card", "active_member", "churn"]:
    # print(col, df[col].unique())

# print(df[["age", "credit_score", "balance", "estimated_salary"]].describe())

# EDA
print(df["churn"].value_counts())