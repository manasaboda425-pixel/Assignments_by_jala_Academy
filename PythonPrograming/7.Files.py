
"""
Task 1: Write a program to read an entire text file.
"""
file1 = open("HW.txt", "r")
data = file1.read()
print(data)
print()

# Output:

# Hello World!




"""
Task 2: Write a program to write a string into a new text file.
"""
file2 = open("Blank.txt", "w")
str1 = 'Python'
file2.write(str1)

print("\n")
print("Successfully wrote 'Python' to Blank.txt") # Added a print statement to show execution on console
print()

# Output:
# Successfully wrote 'Python' to Blank.txt
#



"""
Task 3: Write a program to read a specific number of characters/bytes from a file.
"""
file3 = open("HW.txt", "r+")

print("\n")
print(file3.readline(11))
print()

# Output:

# Hello World
#
