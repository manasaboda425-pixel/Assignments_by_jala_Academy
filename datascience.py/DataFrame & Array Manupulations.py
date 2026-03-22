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