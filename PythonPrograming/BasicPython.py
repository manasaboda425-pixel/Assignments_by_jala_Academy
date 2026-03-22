
"""
Task 1: Write a program to print your name.
"""
print("--- Task 1 Output ---")
print("Hi, my name is Manasa.")

# Output:
# Hi, my name is Manasa.



"""
Task 2: Write a program for a Single line comment and multi-line comments.
"""
# Single Line Comment
# In Python, comments are used to explain the code for humans, and Python ignores them during execution.

# Mulit Line Commments
# Python technically does not have a special mulit-line syntax like some languages.
# Instead, we write multiple single-line comments together.
# When you type a '#', the Python interpreter completely ignores that comes after it on that line.
# It doesn't read it, it doesn't process it, and it takes up zero memory when the code runs.



"""
Task 3: Define variables for different Data Types (int, Boolean, char, float, double) and print on the Console.
"""
age = 21                           # Integer (int)

is_employed = False                # Boolean

# Character (char)    -->    String in Python
# Python doesn't have specific "char" or "double".
# Here characters are strings of length 1
initial = 'M'

salary = 3244.141             # float

# double
# Python doesn't have double, instead it handles double precision implicitly.
# So technically in Python float acts as double by default.

# Type Checking
print("--- Task 3 Output ---")
print(f'Type of age:         {type(age)}')
print(f'Type of is_employed: {type(is_employed)}')
print(f'Type of initial:     {type(initial)}')
print(f'Type of salary:          {type(salary)}')

# Output:
# Type of age: <class 'int'>
# Type of is_employed: <class 'bool'>
# Type of initial: <class 'str'>
# Type of pi: <class 'float'>



"""
Task 4: Define the local and Global variables with the same name and print both variables and understand the scope of the variables.
"""
"""Global Variable
Defined outside the function
Accessible everywhere

x = 10"""

"""Local Variable
Defined inside the function
Accessible only inside that function
 x = 20"""
 
 # Global variable
x = 10

def my_function():
    # Local variable with same name
    x = 20
    print("Inside function (Local x):", x)

# Call function
my_function()

# Print global variable
print("Outside function (Global x):", x)

#Output
#Inside function (Local x): 20
#Outside function (Global x): 10