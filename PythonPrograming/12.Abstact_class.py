
"""
Task 1: Create an abstract class and implement its abstract method in multiple subclasses.
"""
from abc import ABC, abstractmethod

# Base class / Super class inheriting from ABC (Abstract Base Class)
class Polygon(ABC):

    @abstractmethod
    def noofsides(self):
        pass

# Subclasses overriding the abstract method
class Triangle(Polygon):
    def noofsides(self):
        print("Triangle: I have 3 sides")

class Pentagon(Polygon):
    def noofsides(self):
        print("Pentagon: I have 5 sides")

class Hexagon(Polygon):
    def noofsides(self):
        print("Hexagon: I have 6 sides")

class Quadrilateral(Polygon):
    def noofsides(self):
        print("Quadrilateral: I have 4 sides")




# Driver code
# Creating the objects to call the abstract method.
R = Triangle()
R.noofsides()

K = Quadrilateral()
K.noofsides()

R = Pentagon()
R.noofsides()

K = Hexagon()
K.noofsides()

# Output:

# Triangle: I have 3 sides
# Quadrilateral: I have 4 sides
# Pentagon: I have 5 sides
# Hexagon: I have 6 sides
