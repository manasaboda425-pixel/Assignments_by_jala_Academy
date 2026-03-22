import pandas as pd

#11. Load CSV/Excel and display first 10 rows
df = pd.read_csv("Sales_data.csv")
print(df.head(10))

#12. Groupby (mean & sum by Category)

grouped = df.groupby("Category").agg({
    "Price": ["mean", "sum"],
    "Quantity": ["mean", "sum"]
})
print(grouped)

#13. Handle missing data (fill with mean)

df_filled = df.fillna(df.mean(numeric_only=True))
print(df_filled)


#14. Merge DataFrames
df2 = df[["OrderID", "Region"]]
print(df2)

merged_inner = pd.merge(df, df2, on="OrderID", how="inner")
print("merged_inner:",merged_inner)
merged_left = pd.merge(df, df2, on="OrderID", how="left")
print("merged_left:",merged_left)
merged_right = pd.merge(df, df2, on="OrderID", how="right")
print("merged_right:",merged_right)
merged_outer = pd.merge(df, df2, on="OrderID", how="outer")
print("merged_outer:",merged_outer)


#5. Convert object column to int or float

df["Price"] = pd.to_numeric(df["Price"], errors="coerce")
print(df["Price"])

#16. Filter rows (Price between 100 and 500)

filtered = df[(df["Price"] >= 100) & (df["Price"] <= 500)]
print(filtered)

#17. Pivot table

pivot = pd.pivot_table(df, values="Price", index="Category",
                       columns="Region", aggfunc=["mean", "sum"])
print(pivot)

#18. Apply custom function

def discount(price):
    return price * 0.9

df["DiscountedPrice"] = df["Price"].apply(discount)
print(df)

#19. Create bins (categorize Price)

df["PriceCategory"] = pd.cut(df["Price"],
                            bins=[0, 100, 500, 1000],
                            labels=["Low", "Medium", "High"])
print(df)

#20. Replace values

df["Region"] = df["Region"].replace("North", "NORTH_ZONE")
print(df)