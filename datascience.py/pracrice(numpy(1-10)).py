import numpy as np

#1.Min-Max Normalization

# Step 1: Create random array
arr = np.random.randint(1, 100, 8)
print("Original:", arr)

# Step 2: Apply Min-Max Scaling formula
# formula = (x - min) / (max - min)
normalized = (arr - arr.min()) / (arr.max() - arr.min())

# Step 3: Print normalized data
print("Normalized:", normalized)

#2.Replace Specific Value in 5*5 Matrix

import numpy as np

# Step 1: Create 5x5 matrix
mat = np.random.randint(1, 10, (5, 5))
print("Original:\n", mat)

# Step 2: Replace all occurrences of a value (example: 5 → 99)
mat[mat == 5] = 99

# Step 3: Print updated matrix
print("Updated:\n", mat)

#3.Element Wise Operations

import numpy as np

# Step 1: Create two arrays
a = np.array([10, 20, 30])
b = np.array([5, 10, 15])

# Step 2: Perform operations
print("Addition:", a + b)        # element-wise add
print("Subtraction:", a - b)     # element-wise subtract
print("Multiplication:", a * b)  # element-wise multiply
print("Division:", a / b)        # element-wise divide


#4.Solve Linear equations



# Step 1: Coefficient matrix
A = np.array([[3, 4],
              [5, 2]])
print(A)

# Step 2: Constant values
B = np.array([7, 8])
print(B)

# Step 3: Solve using numpy
solution = np.linalg.solve(A, B)

# Step 4: Print result
print("Solution (x, y):", solution)


#5.Broadcasting (3x3 + 1D array)

# Step 1: Create 3x3 matrix
mat = np.array([[1,2,3],
                [4,5,6],
                [7,8,9]])

# Step 2: Create 1D array
arr = np.array([10, 20, 30])

# Step 3: Broadcasting (adds to each row)
result = mat + arr

# Step 4: Print result
print("Result:\n", result)

#6.Identity Matrix

# Step 1: Create identity matrix of size 3x3
identity = np.eye(3)

# Step 2: Print matrix
print("Identity Matrix:\n", identity)


#7.Matrix multiplication between two 2D arrays


A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

# Method 1
result = np.dot(A, B)

# Method 2 (recommended)
#result = A @ B

print("result:",result)

#8.Dot product and cross product of two vectors

v1 = np.array([1, 2, 3])
v2 = np.array([4, 5, 6])

# Dot product
dot_product = np.dot(v1, v2)

# Cross product
cross_product = np.cross(v1, v2)

print("Dot:", dot_product)
print("Cross:", cross_product)

#9.Generate 20 random integers and find unique elements

arr = np.random.randint(0, 50, 20)

unique_elements = np.unique(arr)

print("Array:", arr)
print("Unique:", unique_elements)

#10.Function to return inverse of a matrix

def inverse_matrix(matrix):
    return np.linalg.inv(matrix)

A = np.array([[1, 2], [3, 4]])

inv_A = inverse_matrix(A)

print(inv_A)



