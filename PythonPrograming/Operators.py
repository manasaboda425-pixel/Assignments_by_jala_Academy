"""Task 1: Write a function for arithmetic operators(+,-,*,/)
Function name: arithmetic_operations(a, b)
Takes two numbers as input
Performs:
+ → Addition
- → Subtraction
* → Multiplication
/ → Division"""
def arithmetic_operations(a, b):
    print("Addition:", a + b)
    print("Subtraction:", a - b)
    print("Multiplication:", a * b)
    
    if b != 0:
        print("Division:", a / b)
    else:
        print("Division: Cannot divide by zero")

# Example usage
arithmetic_operations(10, 5)
#output:
#Addition: 15
#Subtraction: 5
#Multiplication: 50
#Division: 2.0
"""Task 2: Write a method for increment and decrement operators(++, --)
Python does not allow:

x++
x--
ERROR

Instead use:

x += 1   # increment
x -= 1   # decrement
"""
def increment_decrement(x):
    # Increment
    inc = x + 1
    
    # Decrement
    dec = x - 1
    
    print("Original value:", x)
    print("After Increment:", inc)
    print("After Decrement:", dec)

# Example usage
increment_decrement(10)
#output:
#Original value: 10
#After Increment: 11
#After Decrement: 9
"""Task 3: Write a program to find the two numbers equal or not.
Explanation:
== → comparison operator
Checks whether two values are equal"""
a = 7
b = 6

if a == b:
    print("Equal")
else:
    print("Not Equal")
#Output:
#Equal
#Not Equal
"""Task 4: Program for relational operators (<,<==, >, >==)
Explanation:

Relational operators compare two values and return True or False

Operator	Meaning
<	Less than
<=	Less than or equal
>	Greater than
>=	Greater than or equal"""
def relational_operators(a, b):
    print("a =", a, ", b =", b)
    
    print("a < b :", a < b)
    print("a <= b:", a <= b)
    print("a > b :", a > b)
    print("a >= b:", a >= b)

# Example usage
relational_operators(10, 5)
# Output
#a = 10 , b = 5
#a < b : False
#a <= b: False
#a > b : True
#a >= b: True
"""Task 5: Print the smaller and larger number.
Explanation:
Compare two numbers using 
Decide:
which is larger
which is smaller
If equal → print special message"""
def find_small_large(a, b):
    if a > b:
        print("Larger number:", a)
        print("Smaller number:", b)
    elif b > a:
        print("Larger number:", b)
        print("Smaller number:", a)
    else:
        print("Both numbers are equal")

# Example usage
find_small_large(10, 5)
find_small_large(7, 7)
#Output
#Larger number: 10
#Smaller number: 5
#Both numbers are equal