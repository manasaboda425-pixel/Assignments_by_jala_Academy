-- Q1: Display snum, sname, city and comm of all salespeople.
SELECT SNUM, SNAME, CITY, COMM FROM SALESPEOPLE;

-- Q2: Display all snum without duplicates from all orders.
SELECT DISTINCT SNUM FROM ORDERS;

-- Q3: Display names and commissions of all salespeople in London.
SELECT SNAME, COMM FROM SALESPEOPLE WHERE CITY = 'London';

-- Q4: Display all customers with rating of 100.
SELECT * FROM CUST WHERE RATING = 100;

-- Q5: Produce order number, amount and date from all rows in orders.
SELECT ONUM, AMT, ODATE FROM ORDERS;

-- Q6: All customers in San Jose with rating more than 200.
SELECT * FROM CUST WHERE CITY = 'San Jose' AND RATING > 200;

-- Q7: Customers located in San Jose OR rating above 200.
SELECT * FROM CUST WHERE CITY = 'San Jose' OR RATING > 200;

-- Q8: All orders for more than $1000.
SELECT * FROM ORDERS WHERE AMT > 1000;

-- Q9: Names and cities of salespeople in London with commission > 0.10.
SELECT SNAME, CITY FROM SALESPEOPLE WHERE CITY = 'London' AND COMM > 0.10;

-- Q10: Customers excluding rating <=100 unless in Rome.
SELECT * FROM CUST WHERE NOT (RATING <= 100 AND CITY != 'Rome');

