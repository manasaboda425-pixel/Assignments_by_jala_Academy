"""
Task 1: Write a program to demonstrate different ways of creating a string.
"""
string = 'Hello'
string_double = "Hello"
string1 = '''World'''
string2 = """Welcome to the world of Python""" # triple quotes string can extend multiple lines


print("string",string)
print("string_double",string_double)
print("string1",string1)
print("string2 ",string2)

# Output:
# Hello
# Hello
# World
# Welcome to
# the world of Python



"""
Task 2: Write a program to concatenate two strings using the + operator.
"""
# Concatenating two strings using + operator

str1 = string + string1

print("Concatenated two different strings:", str1)

# Output:
# Concatenated two different strings: HelloWorld



"""
Task 3: Write a program to find the length of the string.
"""
print("length of the string:", len(str1))

# Output:
# length of the string: 10



"""
Task 4: Write a program to search in strings using index().
"""
str3 = 'Manasa'

str_search1 = 'asa'

str_search2 = 'M'


print("Position of ish:", str3.index(str_search1))

print("Position of h:", str3.index(str_search2))

# Output:
# Position of asa: 3
# Position of M: 0



"""
Task 5: Write a program to match a String Against a Regular Expression.
"""
from ast import Str
import re

Substr = 'Madara'
str6 = 'Madara once said- Wake up to relity nothing goes as planned in this cursed world'


print(re.match(Substr, str6))

# Output:

# <re.Match object; span=(0, 6), match='Madara'>



"""
Task 6: Write a program to compare strings.
"""
str8 = 'Java Script'
str_comp1 = 'Type Script'
str_comp2 = str8



print(str8 == str_comp1)

print(str8 == str_comp2)

print(str_comp1 == str_comp2)

print(str8 != str_comp1)

# Output:

# False
# True
# False
# True



"""
Task 7: Write a program to demonstrate startsWith() and endsWith().
"""
string_name = 'Python Programming'



print(string_name.startswith("Python"))
print(string_name.endswith("Programming"))

# Output:
# True
# True



"""
Task 8: Write a program to trim strings with strip().
"""
str7 = 'Hello World hi'

print(str7.strip("hi"))

# Output:

# Hello World





"""
Task 9: Write a program to replace characters in strings.
"""
string_replace = 'Hi World'




print(string_replace.replace("Hi", "Hello"))

# Output:

# Hello World




"""
Task 10: Write a program to split strings.
"""
str9 = 'hi-hello-bye'


print(str9.split("-"))

# Output:

# ['hi', 'hello', 'bye']




"""
Task 11: Write a program to convert integer objects to Strings.
"""
numb = 18
numb1 = str(numb)



print(numb1)
print(type(numb1))

# Output:
# 18
# <class 'str'>




"""
Task 12: Write a program to convert to uppercase and lowercase.
"""
string_lower = 'hi'
string_upper = 'WELCOME'



print(string_lower.upper())
print(string_upper.lower())

# Output:
# HELLO
# world