
"""
Task 1: Define a static variable and access or modify it through a class and an instance.
"""
class Python:
    # Static variable defined at the class level
    staticVariable = 9

print("\n")

# Access through class
print(Python.staticVariable)

# Change within a class
Python.staticVariable = 12
print(Python.staticVariable) # Gives 12

# Access through an instance
instance = Python()
print(instance.staticVariable) # Gives 12

# Change within an instance
# Note: This creates a new instance attribute that shadows the class attribute
instance.staticVariable = 15
print(instance.staticVariable) # Gives 15

# Accessing the class variable again shows it remains unchanged by the instance
print(Python.staticVariable) # Gives 12

# Output:
# --- Task 1 Output ---
# 9
# 12
# 12
# 15
# 12
