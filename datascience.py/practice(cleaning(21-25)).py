import pandas as pd
#1. Load dataset

df = pd.read_csv("Data_cleaning.csv")
print(df)

#21.Clean mixed data (fix non-numeric values)

df["Age"] = pd.to_numeric(df["Age"], errors="coerce")
print(df["Age"])
df["Salary"] = pd.to_numeric(df["Salary"], errors="coerce")
print(df["Salary"])
# Replace NaN with mean
df["Age"] = df["Age"].fillna(df["Age"].mean())
print(df["Age"])
df["Salary"] = df["Salary"].fillna(df["Salary"].mean())
print(df["Salary"])

#22.Remove duplicate rows
df = df.drop_duplicates()
print("df:",df)

#23.Label Encoding (categorical → numeric)

from sklearn.preprocessing import LabelEncoder

encoder = LabelEncoder()
df["Department_Encoded"] = encoder.fit_transform(df["Department"])
print(df["Department_Encoded"])

#24.Normalize data (StandardScaler)

from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()

df[["Age", "Salary"]] = scaler.fit_transform(df[["Age", "Salary"]])
result=df[["Age", "Salary"]] 

print(result)

#25.6. Train-test split (80-20)

from sklearn.model_selection import train_test_split

X = df[["Age", "Salary", "Department_Encoded"]]
y = df["ID"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, shuffle=True, random_state=42
)
print("X_train:\n", X_train)
print("X_test:\n", X_test)
print("y_train:\n", y_train)
print("y_test:\n", y_test)