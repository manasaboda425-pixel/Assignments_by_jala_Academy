"""Task 1: Write a program to print “Bright IT Career” ten times using for loop.
A for loop is used to repeat something multiple times
range(10) → runs loop 10 times (0 to 9)
Each iteration prints the same text"""
for i in range(10):
    print("Bright IT Career")
    
#OutPut:
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
#Bright IT Career
"""Task 2: Write a program to print 1 to 20 numbers using the while loop.
A while loop repeats code as long as a condition is TRUE
 while loop is used when:

You do not know exact repetitions
You depend on a condition
i = 1 → starting value
while i <= 20 → condition
i += 1 → increase value each time

 Loop runs until condition becomes False"""
i = 1

while i <= 20:
    print(i)
    i += 1
    #Output:
   # 1
#2
#3
#4
#5
#6
#7
#8
#9
#10
#11
#12
#13
#14
#15
#16
#17
#18
#19
#20
    """Task 3: Program to equal operator and not equal operators.
    == → checks if both values are equal
!= → checks if values are not equal"""
def check_operators(a, b):
    print("a =", a, ", b =", b)
    
    # Equal operator
    print("a == b :", a == b)
    
    # Not equal operator
    print("a != b :", a != b)

# Example usage
check_operators(10, 10)
check_operators(10, 5)
# Output
#a = 10 , b = 10
#a == b : True
#a != b : False

#a = 10 , b = 5
#a == b : False
#a != b : True
"""Task 4: Write a program to print the odd and even numbers.
% → modulus operator (gives remainder)
i % 2 == 0 → Even number
i % 2 != 0 → Odd number"""
print("Even numbers:")
for i in range(1, 21):
    if i % 2 == 0:
        print(i)

print("\nOdd numbers:")
for i in range(1, 21):
    if i % 2 != 0:
        print(i)
#Output
#Even numbers:
#2
#4
#6
#8
#10
#12
#14
#16
#18
#20

#Odd numbers:
#1
#3
#5
#7
#9
#11
#13
#15
#17
#19
"""Task 5: Write a program to print largest number among three numbers.
Compare all three numbers using >=
Check:
If a is greater than both → print a
Else if b is greater → print b
Otherwise → print c"""
def find_largest(a, b, c):
    if a >= b and a >= c:
        print("Largest number:", a)
    elif b >= a and b >= c:
        print("Largest number:", b)
    else:
        print("Largest number:", c)

# Example usage
find_largest(10, 25, 15)
find_largest(5, 5, 5)
# Output
#Largest number: 25
#Largest number: 5
"""Task 6: Write a program to print even number between 10 and 20 using while.
Start from i = 10
Loop runs until i <= 20
i % 2 == 0 → checks even number
i += 1 → increases value each time
"""
i = 10

while i <= 20:
    if i % 2 == 0:
        print(i)
    i += 1
# #Output
#10
#12
#14
#16
#18
#20
"""Task 7: Write a program to print 1 to 10 using the do-while loop statement.
n do-while loop (C/Java):

Code runs at least once
Condition checked after execution

Python alternative:

while True → runs continuously
break → stops loop when condition is met"""
i = 1

while True:
    print(i)
    i += 1
    
    if i > 10:
        break
# Output
#1
#2
#3
#4
#5
#6
#7
#8
#9
#10
"""Task 8: Write a program to find Armstrong number or not.
What is an Armstrong Number?

A number is Armstrong if:

Sum of its digits raised to power of number of digits
= original number
Count digits → len(str(num))
Take each digit → num % 10
Raise to power → digit ** digits
Add all values
Compare with original number"""
def check_armstrong(num):
    # Convert number to string to count digits
    digits = len(str(num))
    
    temp = num
    total = 0

    while temp > 0:
        digit = temp % 10
        total += digit ** digits
        temp //= 10

    if total == num:
        print(num, "is an Armstrong number")
    else:
        print(num, "is NOT an Armstrong number")

# Example usage
check_armstrong(153)
check_armstrong(123)
# Output
#153 is an Armstrong number
#123 is NOT an Armstrong number
"""Task 9: # Write a program to find the prime or not.
What is a Prime Number?

 A number is prime if:

It has only 2 factors → 1 and itself
Examples: 2, 3, 5, 7, 11
Loop from 2 to num-1
If any number divides evenly → not prime
If no divisors found → prime"""
def check_prime(num):
    if num <= 1:
        print(num, "is NOT a prime number")
        return
    
    for i in range(2, num):
        if num % i == 0:
            print(num, "is NOT a prime number")
            return
    
    print(num, "is a prime number")

# Example usage
check_prime(7)
check_prime(10)
#Output
#7 is a prime number
#10 is NOT a prime number
"""Task 10: Write a program to palindrome or not.
What is a Palindrome?

 A number or string is palindrome if it reads the same forward and backward

Examples:
121 Yes
1331 Yes
123 (wrong)
Reverse the number using loop
Compare:
Original number
Reversed number

 If both same → Palindrome"""
def check_palindrome(num):
    original = num
    reverse = 0

    while num > 0:
        digit = num % 10
        reverse = reverse * 10 + digit
        num //= 10

    if original == reverse:
        print(original, "is a Palindrome")
    else:
        print(original, "is NOT a Palindrome")

# Example usage
check_palindrome(121)
check_palindrome(123)
#Output
#121 is a Palindrome
#123 is NOT a Palindrome
"""Task 11: Program to check whether a number is EVEN or ODD.
% → modulus operator (gives remainder)
num % 2 == 0 → EVEN
otherwise → ODD"""
def check_even_odd(num):
    if num % 2 == 0:
        print(num, "is EVEN")
    else:
        print(num, "is ODD")

# Example usage
check_even_odd(10)
check_even_odd(7)
# Output
#10 is EVEN
#7 is ODD



