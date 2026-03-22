import numpy as np
# 1. BASIC ARRAY OPERATIONS
# 1. Create 3x3 array and calculate sum, mean, std
arr = np.random.randint(0, 11, (3, 3))  # random integers 0–10
print("Array:\n", arr)

print("Sum:", np.sum(arr))        # total of all elements
print("Mean:", np.mean(arr))      # average value
print("Std:", np.std(arr))        # standard deviation

# 2. Cumulative sum
arr = np.arange(1, 11)            # array from 1 to 10
print("Cumulative Sum:", np.cumsum(arr))  # running total

# 3. Element-wise operations
a = np.random.randint(1, 10, (2, 3))
b = np.random.randint(1, 10, (2, 3))
print("Array:\n", arr)


print("Addition:\n", a + b)       # element-wise add
print("Subtraction:\n", a - b)    # element-wise subtract
print("Multiplication:\n", a * b) # element-wise multiply
print("Division:\n", a / b)       # element-wise divide

# 4. Identity matrix
print("Identity Matrix:\n", np.eye(4))  # diagonal = 1

# 5. Broadcasting division
a = np.array([5, 10, 15, 20, 25])
print("Divide by 5:", a / 5)  # broadcast scalar






# 2. ARRAY MANIPULATION
# 6. Reshape 1D to 3x4
arr = np.arange(12)
print("Reshape:\n", arr.reshape(3, 4))  # change shape

# 7. Flatten matrix
mat = np.random.randint(1, 10, (3, 3))
print("Flatten:", mat.flatten())  # convert to 1D

# 8. Stack matrices
a = np.ones((3, 3))
b = np.zeros((3, 3))

print("Horizontal Stack:\n", np.hstack((a, b)))  # side-by-side
print("Vertical Stack:\n", np.vstack((a, b)))    # top-bottom

# 9. Concatenate arrays
a = np.array([1, 2, 3])
b = np.array([4, 5])
print("Concatenate:", np.concatenate((a, b)))  # join arrays

# 10. Transpose and reshape
mat = np.random.randint(1, 10, (3, 2))
print("Transpose + Reshape:\n", mat.T.reshape(3, 2))




# 3. INDEXING & SLICING


# 11. Slice with step
arr = np.arange(15)
print("Sliced:", arr[2:11:2])  # start:end:step

# 12. Submatrix extraction
mat = np.random.randint(1, 10, (5, 5))
print("Submatrix:\n", mat[1:4, 2:5])  # rows 1-3, cols 2-4

# 13. Replace values > 10
arr = np.array([5, 12, 8, 20])
arr[arr > 10] = 10  # condition replace
print("Replaced:", arr)

# 14. Fancy indexing
arr = np.arange(10)
print(arr)
print("Fancy Indexing:", arr[[0, 2, 4, 6]])

# 15. Reverse array
arr = np.arange(10)
print("Reversed:", arr[::-1])  # step -1



# 4. BROADCASTING
# 16. Add 1x3 to 3x3
mat = np.ones((3, 3))
row = np.array([1, 2, 3])
print("Broadcast Add:\n", mat + row)  # row added to each row

# 17. Multiply by scalar
arr = np.array([1, 2, 3, 4, 5])
print("Scalar Multiply:", arr * 5)

# 18. Subtract column vector
mat = np.ones((3, 3)) * 5
print(mat)
col = np.array([[1], [2], [3]])
print(col)
print("Column Subtract:\n", mat - col)

# 19. Add scalar to 3D array
arr = np.ones((2, 2, 2))
print("array:",arr)
print("3D + Scalar:\n", arr + 10)

# 20. Broadcasting shapes (4,1) + (1,5)
a = np.ones((4, 1))
print("a:",a)
b = np.ones((1, 5))
print("b:",b)
print("Broadcast Result:\n", a + b)



# 5. VECTORIZED OPERATIONS


# 21. Square root
arr = np.array([[1, 4, 9], [16, 25, 36]])
print("Arr:",arr)
print("Square Root:\n", np.sqrt(arr))

# 22. Dot product
a = np.array([1, 2, 3, 4, 5])
print("a:",a)
b = np.array([5, 4, 3, 2, 1])
print("b:",b)
print("Dot Product:", np.dot(a, b))

# 23. Element-wise comparison
a = np.array([1, 5, 3])
print("a:",a)
b = np.array([2, 2, 4])
print("b:",b)
print("Comparison:", a > b)  # returns True/False

# 24. Double elements
arr = np.array([[1, 2], [3, 4]])
print("Arr:",arr)
print("Doubled:\n", arr * 2)

# 25. Sum of even numbers
arr = np.random.randint(1, 100, 100)
print("Arr:",arr)
even_sum = np.sum(arr[arr % 2 == 0])  # filter evens
print("Sum of Even:", even_sum)




# 6. LINEAR ALGEBRA


# 26. Determinant
mat = np.random.randint(1, 10, (3, 3))
print("Matrix:\n", mat)
print("Determinant:", np.linalg.det(mat))

# 27. Inverse and verify identity
mat = np.array([[1, 2], [3, 4]])
print("mat:",mat)
inv = np.linalg.inv(mat)
print("Inverse:\n", inv)

print("Verification (A * A^-1):\n", np.dot(mat, inv))  # should be identity

# 28. Eigenvalues & Eigenvectors
mat = np.array([[2, 1], [1, 2]])
print("mat:",mat)
values, vectors = np.linalg.eig(mat)
print("Eigenvalues:", values)
print("Eigenvectors:\n", vectors)

# 29. Solve linear equations
# 2x + 3y = 5
# 4x + 6y = 10
A = np.array([[2, 3], [4, 6]])
B = np.array([5, 10])

# Note: This system has infinite solutions (dependent equations)
# Using least squares method
solution = np.linalg.lstsq(A, B, rcond=None)
print("Solution:", solution[0])

# 30. SVD decomposition
mat = np.random.randint(1, 10, (3, 3))
U, S, Vt = np.linalg.svd(mat)

# reconstruct matrix
reconstructed = np.dot(U, np.dot(np.diag(S), Vt))
print("Original:\n", mat)
print("Reconstructed:\n", reconstructed)





