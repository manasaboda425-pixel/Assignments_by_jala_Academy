"""
Task 1: Write a program to demonstrate a basic try-except block.
"""
a = [1, 2, 3]


try:
    print ("Second element = ", a[1])

    # Throws error since there are only 3 elements in array
    print ("Fourth element = ", a[3])

except:
    print ("An error occurred")

# Output:

# Second element =  2
# An error occurred



"""
Task 2: Write a program to demonstrate a try-except-else block.
"""
b = [3, 2, 1]

print("\n")
try:
    # This comparison evaluates to False, but does not raise an exception.
    # Therefore, the 'else' block will execute.
    a == b
except:
    print("They are not equal")
else:
    print("Both Equal")

# Output:

# Both Equal



"""
Task 3: Write a program to demonstrate a try-except-finally block with a specific exception.
"""
print("\n")
try:
    k = 5/0
    print(k)
except ZeroDivisionError:
    print("Can't divide by zero")
finally:
    print('This is always executed')

# Output:

# Can't divide by zero
# This is always executed