
"""
Task 1: Write a program to demonstrate multilevel inheritance and method overriding.
"""
class A():
    def display(self):
        print("Display Inside class A")

    # class A show method
    def show(self):
        print("Show Inside class A")

# Inherited or Sub class (Note A in bracket)
class B(A):
    def print_info(self):
        print("Print Inside class B")

    # class B show method (overrides A's show method)
    def show(self):
        print("Show Inside class B")

# Inherited or Sub class (Note B in bracket)
class C(B):
    # class C show method (overrides B's show method)
    def show(self):
        print("Show Inside class C")

print("\n")

# Driver code
s = A()
s.display()

k = B()
k.print_info()

g = C()
g.show()

# Output:
# 
# Display Inside class A
# Print Inside class B
# Show Inside class C
