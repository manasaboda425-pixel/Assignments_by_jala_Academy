
"""
Task 1: Write a program to create a dictionary with at least 5 key-value pairs and print it.
"""
# Creating dictionary
Dict = dict([(1,'Mahima'), (2,'Kritika'), (3,'Aastha'), (4,'Vasu'), (5,'Muskan')])

print("\n")
print("Dictionary with each item as a pair:", Dict)

# Output:

# Dictionary with each item as a pair: {1: 'Mahima', 2: 'Kritika', 3: 'Aastha', 4: 'Vasu', 5: 'Muskan'}



"""
Task 2: Write a program to add a new element to the dictionary.
"""
# adding element in dictionary
Dict[6] = 'Naveen'

print("\n")
print("Dictionary with new item added:", Dict)

# Output:

# Dictionary with new item added: {1: 'Mahima', 2: 'Kritika', 3: 'Aastha', 4: 'Vasu', 5: 'Muskan', 6: 'Naveen'}



"""
Task 3: Write a program to update values in the dictionary.
"""
# updating values in dictionary
Dict[3] = 'Navdisha'

print("\n")
print("Dictionary with updated values:", Dict)

# Output:

# Dictionary with updated values: {1: 'Kashish', 2: 'Kritika', 3: 'Navdisha', 4: 'Vaishali', 5: 'Muskan', 6: 'Nitya'}



"""
Task 4: Write a program to access a specific value in the dictionary.
"""
print("\n")
print("Accessing one value in Dictionary:", Dict[1])

# Output:

# Accessing one value in Dictionary:Mahima



"""
Task 5: Write a program to delete a value from the dictionary.
"""
# deleting value from drictionary
del Dict[6]


print("Delete a value from a Dictionary:", Dict)

# Output:

# Delete a value from a Dictionary: {1: 'Mahima', 2: 'Kritika', 3: 'Navdisha', 4: 'Vasu', 5: 'Muskan'}



"""
Task 6: Write a program to create a nested dictionary and access its elements.
"""
# creating a nested dictionary
Dict1 = {1: 'Manasa', 2: 'Malli',
         3:{'Age' : 18, 'Branch' : 'CSE', 'Year' : 'Third Year'}}

print("\n")
print("Nested loop Dictionary:", Dict1)
print("Accessing an element of a Nested Dictionary:", Dict1[2])

# Output:
# Nested loop Dictionary: {1: 'Manasa', 2: 'Malli', 3: {'Age': 18, 'Branch': 'CSE', 'Year': 'Third Year'}}
# Accessing an element of a Nested Dictionary: Malli
