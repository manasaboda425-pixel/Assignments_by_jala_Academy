
"""
Task 1: Write a program to demonstrate default constructors and basic inheritance.
"""
class A:
    # default constructor
    def __init__(self):
        self.name = "Mahima"

    # a method for printing data members
    def print_A(self):
        print(self.name)

class B(A):
    def __init__(self):
        self.name = "MAHI"

    def print_B(self):
        print(self.name)


# creating object of the class
obj_a = A()
# calling the instance method using the object obj
obj_a.print_A()

obj_b = B()
obj_b.print_B()

# Output:

# Mahima
# MAHI



"""
Task 2: Write a program to demonstrate parameterized constructors and access modifiers in inheritance.
"""
class C:
    # public data member
    name = None

    # protected data members
    _roll = None

    # private data member
    __branch = None

    # constructor
    def __init__(self, name, roll, branch):
        self.name = name
        self._roll = roll
        self.__branch = branch

    def displayName(self):
        print("Name:", self.name)

    # protected member function
    def _displayRoll(self):
        # accessing protected data members
        print("Roll:", self._roll)

    # private member function
    def __displayBranch(self):
        # accessing private data members
        print("Branch:", self.__branch)

    # public member function
    def access__displayBranch(self):
        # accessing private member function
        self.__displayBranch()

class D(C):
    def __init__(self, name, roll, branch):
        super().__init__(name, roll, branch)

    # public member function
    def access_displayRoll(self):
        # accessing protected member functions of super class
        self._displayRoll()

print("\n")
# creating objects of the derived class
obj_d = D("Kaveri", 5, "CSE")

# calling public member functions of the class
obj_d.displayName()
obj_d.access_displayRoll()
obj_d.access__displayBranch()

# Output:
#
# Name: Kaveri
# Roll: 5
# Branch: CSE
