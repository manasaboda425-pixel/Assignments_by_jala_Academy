import pandas as pd
#importing dataset
df = pd.read_csv("Eda_dataset.csv")
print(df)

#26.Summary Statistics (mean, median, mode, std)
print("Mean:\n", df.mean())
print("Median:\n", df.median())
print("Mode:\n", df.mode())
print("Standard Deviation:\n", df.std())

#27.Histogram + Boxplot + Outliers

#importing pacakges
import matplotlib.pyplot as plt

# Histogram
df["Salary"].hist()
plt.title("Salary Distribution")
plt.show()

# Boxplot
df.boxplot(column="Salary")
plt.title("Salary Distribution")
plt.show()

#28.Correlation Matrix + Heatmap

import seaborn as sns
import matplotlib.pyplot as plt

corr = df.corr()

print(corr)

sns.heatmap(corr, annot=True)
plt.title("Salary Distribution")
plt.show()


#29.Scatter Plot Matrix

from pandas.plotting import scatter_matrix
import matplotlib.pyplot as plt

scatter_matrix(df, figsize=(8,8))

plt.show()

#30.Feature Engineering + Bar Chart
#create new feature
df["Salary_per_Experience"] = df["Salary"] / df["Experience"]

df.mean().plot(kind="bar")
plt.title("Feature Importance (Basic)")
plt.show()