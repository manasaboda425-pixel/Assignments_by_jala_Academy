"""
Task 1: Write a function to add integer values of an array.
"""
# Step 1: Initialize array
arr = [10, 20, 30, 40]

# Step 2: Take a variable to store sum
total = 0

# Step 3: Loop through array
for i in arr:
    total += i

# Step 4: Print result
print("total:", total)
# Output: 100

"""
Task 2: Write a function to calculate the average value of an array of integers.
"""
# Step 1: Initialize array
arr = [10, 20, 30, 40]

# Step 2: Find sum
total = sum(arr)

# Step 3: Divide by length
avg = total / len(arr)

print("Avg of Array:", avg)
# Output: 25.0


"""
Task 3: Write a program to find the index of an array element.
"""
# Step 1: Initialize array
arr = [1, 3, 5, 3]

# Step 2: Find index
print("Index of an array:", arr.index(3))
# Output: 1

"""
Task 4: Write a function to test if array contains a specific value.
"""
# Step 1: Initialize array
arr = [4, 5, 10]

# Step 2: Check element
if 5 in arr:
    print("Exists")
# Output: Exists


"""
Task 5: Write a function to remove a specific element from an array.
"""
# Step 1: Initialize array
arr = [1, 2, 3, 4]

# Step 2: Remove element
arr.remove(3)

print("After removal:", arr)
# Output: [1, 2, 4]


"""
Task 6: Write a function to copy an array to another array.
"""
# Step 1: Initialize array
arr = [1, 2, 3]

# Step 2: Copy array
arr2 = arr.copy()

print("Copy of an array:", arr2)
# Output: [1, 2, 3]


"""
Task 7: Write a function to insert an element at a specific position in the array.
"""
arr = [1, 3, 4]

# Step 2: Insert element
arr.insert(1, 2)

print("Inserted Array:", arr)
# Output: [1, 2, 3, 4]

"""
Task 8: Write a function to find the minimum and maximum value of an array.
"""
# Step 1: Initialize array
arr = [10, 5, 20]

# Step 2: Find min & max
print("Min and MAx od array:", min(arr), max(arr))
# Output: 5 20

"""
Task 9: Write a function to reverse an array of integer values.
"""
# Step 1: Initialize array
arr = [1, 2, 3]

# Step 2: Reverse array
arr.reverse()

print("Reversed array:", arr)
# Output: [3, 2, 1]


"""
Task 10: Write a function to find the duplicate values of an array.
"""
# Step 1: Initialize array
arr = [1, 2, 2, 3]

# Step 2: Find duplicates
for i in arr:
    if arr.count(i) > 1:
        print("Duplicates of an array:", i)
# Output: 2 2


"""
Task 11: Write a program to find the common values between two arrays.
"""
# Step 1: Initialize arrays
a = [1, 2, 3]
b = [2, 3, 4]

# Step 2: Find common
print("Common values between two arrays:", set(a) & set(b))
# Output: {2, 3}



"""
Task 12: Write a method to remove duplicate elements from an array.
"""
# Step 1: Initialize array
arr = [1, 2, 2, 3]

# Step 2: Remove duplicates
new = list(set(arr))

print("New Array:", new)
# Output: [1, 2, 3]

"""
Task 13: Write a method to find the second largest number in an array.
"""
# Step 1: Initialize array
arr = [10, 20, 30]

# Step 2: Sort array
arr.sort()

# Step 3: Get second largest
print("Second Largest Number:", arr[-2])
# Output: 20


"""
Task 14: Write a method to find number of even number and odd numbers in an array.
"""
# Step 1: Initialize array
arr = [1, 2, 3, 4]

even = 0
odd = 0

# Step 2: Count even & odd
for i in arr:
    if i % 2 == 0:
        even += 1
    else:
        odd += 1

print("Even and odd numbers of an array:", even, odd)
# Output: 2 2



"""
Task 15: Write a function to get the difference of largest and smallest value.
"""
# Step 1: Initialize array
arr = [10, 5, 20]

# Step 2: Find difference
print("Difference:", max(arr) - min(arr))
# Output: 15


# Step 1: Initialize array
arr = [1, 12, 23]

# Step 2: Check both values
if 12 in arr and 23 in arr:
    print("Both exist")
# Output: Both exist