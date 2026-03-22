
import pandas as pd
import numpy as np

# Load CSV file
df = pd.read_csv("Dataset.csv")
print(df)

# Drop rows with missing values
df_clean = df.dropna()# removes rows with NaN
print(df_clean)

# Fill missing numerical values with mean
df['num_col'] = df['num_col'].fillna(df['num_col'].mean())
print(df['num_col'])

# Fill missing categorical values with mode
df['cat_col'] = df['cat_col'].fillna(df['cat_col'].mode()[0])
print(df['cat_col'])


#2.Data Transformaton
# Create new column (sum of two columns)
df['total'] = df['col1'] + df['col2']   # vectorized operation
print(df['total'])

# Apply square root
df['sqrt_col'] = np.sqrt(df['num_col'])
print(df['sqrt_col'])

# Normalize using MinMaxScaler
from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler()
df['normalized'] = scaler.fit_transform(df[['num_col']])
print(df['normalized'])


#3.Merging & Joining

df1 = pd.DataFrame({'id':[1,2], 'val':[10,20]})
df2 = pd.DataFrame({'id':[2,3], 'val2':[30,40]})
print(df1)
print(df2)

# Merge
merged = pd.merge(df1, df2, on='id', how='outer').fillna(0)
print(merged)

# Left join
left_join = pd.merge(df1, df2, left_on='id', right_on='id', how='left').fillna(0)
print(left_join)

# Concatenate columns
concat = pd.concat([df1, df2], axis=1)
print("concat:",concat)

#4.Grouping & Aggregation

# Group by category
group = df.groupby('category')['num_col'].agg(['mean', 'std'])
print("group:",group)

# Sum with groupby
sum_group = df.groupby('category')['num_col'].sum()
result = np.sqrt(sum_group)  # apply NumPy function
print("result:",result)

# Pivot table
pivot = pd.pivot_table(df, values='num_col',
                       index='cat1', columns='cat2',
                       aggfunc=np.mean)
print(pivot)

#5.Array Operations

# Convert column to NumPy array
arr = df['num_col'].to_numpy()
print(arr * 2)   # element-wise operation

# Reshape and assign back
reshaped = arr.reshape(-1, 1)
df['reshaped'] = reshaped
print(df['reshaped'])

# Filter rows
filtered = df[df['num_col'] > 50]
print(filtered)


#6.BroadCasting in Dataframe

# Add array to column
df['new'] = df['num_col'] + np.array([10])
print(df['new'])

# New column from multiple columns
df['sum'] = df['col1'] + df['col2']
print(df['sum'])

# Subtract row mean
#df_sub = df.sub(df.mean(axis=1), axis=0)
#df_sub = df.sub(df.mean(axis=1, numeric_only=True), axis=0)

numeric_df = df.select_dtypes(include=[np.number])

df_sub = numeric_df.sub(numeric_df.mean(axis=1), axis=0)
print(df_sub)

#7.Linear Algebra With Dataframe

# Solve equations
A = np.array([[2,3],[4,6]])
B = np.array([5,10])
solution = np.linalg.lstsq(A,B,rcond=None)[0]

df_sol = pd.DataFrame(solution, columns=['Solution'])
print(df_sol)

# Dot product of columns
dot = np.dot(df['col1'], df['col2'])
print(dot)

# Matrix multiplication
mat1 = df[['col1','col2']].values
mat2 = df[['col1','col2']].values.T

result = np.dot(mat1, mat2)
print(result)

#8.Handling Missing Data

# Interpolation
print(df)
#result=df.interpolate(method='linear', inplace=True)
#print(result)
import numpy as np

# Select numeric columns
numeric_df = df.select_dtypes(include=[np.number])
print("numeric:",numeric_df)

# Apply interpolation
df[numeric_df.columns] = numeric_df.interpolate(method='linear')

print("Interpolate:",df[numeric_df.columns])
# Fill using mask
mask = df['num_col'].isna()
df.loc[mask, 'num_col'] = 0
print(df.loc[mask, 'num_col'] )

# Replace outliers with median
median = df['num_col'].median()
df.loc[df['num_col'] > 100, 'num_col'] = median
print(df.loc[df['num_col'] > 100, 'num_col'])



#9.Group + NumPy
trend = df.groupby(['cat1','cat2'])['num_col'].mean()
print(trend)

# Correlation matrix
#corr = df.corr()
#print("corr:",corr)
import numpy as np

numeric_df = df.select_dtypes(include=[np.number])

corr = numeric_df.corr()
print("corr:",corr)

# Rolling mean
df['rolling'] = df['num_col'].rolling(window=3).mean()
print(df['rolling'])
# Plot
import matplotlib.pyplot as plt
df['rolling'].plot()
plt.show()


import pandas as pd
import numpy as np

# Load CSV file
df = pd.read_csv("Dataset.csv")
#print(df)
#df['rolling'] = df['num_col'].rolling(window=3).mean()
#print(df['rolling'])
# Plot
#import matplotlib.pyplot as plt
#df['rolling'].plot()
#plt.show() 

#10.DATAFRAME & ARRAY MANIPULATION

# DataFrame → NumPy → back
arr = df.values
arr = arr * 2
df_new = pd.DataFrame(arr)
print("New Data",df_new)

# Random DataFrame
df_rand = pd.DataFrame(np.random.randint(1,100,(5,3)))
print("DataFrame",df_rand)

#Filter multiple conditions
filtered = df_rand[(df_rand[0] > 10) & (df_rand[1] < 50)]
print("filtered:",filtered)
# Custom function
def add(x,y):
    return x + y

df_custom = pd.DataFrame(add(np.array([1,2]), np.array([3,4])))
print("df_custom:",df_custom)

#11. Reshape
arr = df['num_col'].values.reshape(-1,1)
print("arr:",arr)

# Stack DataFrames
combined = pd.concat([df, df], axis=0)
print(combined)
# 3D array
arr3d = np.random.randint(1,10,(2,2,2))
print(arr3d)

#12.Time Series

# Convert to datetime
df['date'] = pd.to_datetime(df['date'])
print(df['date'])

# Moving average
df['ma'] = df['num_col'].rolling(3).mean()
print(df['ma'])

# Time difference
df['diff'] = df['date'].diff()
print(df['diff'])
