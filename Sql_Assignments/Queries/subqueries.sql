-- Q51: Produce names and rating of customers who have above average orders.
SELECT CNAME, RATING
FROM CUST
WHERE CNUM IN (
    SELECT CNUM FROM ORDERS
    WHERE AMT > (SELECT AVG(AMT) FROM ORDERS)
);

-- Q52: Total amount per salesperson greater than largest order.
SELECT SNUM, SUM(AMT)
FROM ORDERS
GROUP BY SNUM
HAVING SUM(AMT) > (SELECT MAX(AMT) FROM ORDERS);

-- Q53: Customers with orders on Oct 3rd.
SELECT * FROM CUST
WHERE CNUM IN (
    SELECT CNUM FROM ORDERS WHERE ODATE='1994-10-03'
);

-- Q54: Salespeople with more than one customer.
SELECT SNUM, SNAME
FROM SALESPEOPLE
WHERE SNUM IN (
    SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)>1
);

-- Q55: Check correct salesperson credited.
SELECT *
FROM ORDERS O
JOIN CUST C ON O.CNUM=C.CNUM
WHERE O.SNUM = C.SNUM;

-- Q56: Orders above average per customer.
SELECT *
FROM ORDERS O
WHERE AMT > (
    SELECT AVG(AMT) FROM ORDERS WHERE CNUM = O.CNUM
);

-- Q57: Sum of orders per date > 2000.
SELECT ODATE, SUM(AMT)
FROM ORDERS
GROUP BY ODATE
HAVING SUM(AMT) > 2000;

-- Q58: Customers with max rating per city.
SELECT *
FROM CUST C1
WHERE RATING = (
    SELECT MAX(RATING)
    FROM CUST C2
    WHERE C1.CITY = C2.CITY
);

-- Q59: Salespeople having customers in same city but not servicing them.
SELECT *
FROM SALESPEOPLE S
WHERE EXISTS (
    SELECT * FROM CUST C
    WHERE S.CITY = C.CITY AND S.SNUM <> C.SNUM
);

-- Q60: Extract customers if any customer is in San Jose.
SELECT CNUM, CNAME, CITY
FROM CUST
WHERE EXISTS (SELECT * FROM CUST WHERE CITY='San Jose');

-- Q61: Salespeople numbers with multiple customers.
SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)>1;

-- Q62: Salespeople details with multiple customers.
SELECT * FROM SALESPEOPLE
WHERE SNUM IN (
    SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)>1
);

-- Q63: Salespeople serving only one customer.
SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)=1;

-- Q64: Salespeople with more than one order.
SELECT * FROM SALESPEOPLE
WHERE SNUM IN (
    SELECT SNUM FROM ORDERS GROUP BY SNUM HAVING COUNT(*)>1
);

-- Q65: Salespeople having customers with rating 300 (EXISTS).
SELECT * FROM SALESPEOPLE S
WHERE EXISTS (
    SELECT * FROM CUST C
    WHERE S.SNUM = C.SNUM AND C.RATING = 300
);

-- Q66: Salespeople having customers with rating 300 (JOIN).
SELECT DISTINCT S.*
FROM SALESPEOPLE S
JOIN CUST C ON S.SNUM = C.SNUM
WHERE C.RATING = 300;

-- Q67: Salespeople with customers in same city but not assigned.
SELECT *
FROM SALESPEOPLE S
WHERE NOT EXISTS (
    SELECT * FROM CUST C
    WHERE S.CITY = C.CITY AND S.SNUM = C.SNUM
);

-- Q68: Customers whose salesperson has another customer with orders.
SELECT *
FROM CUST C
WHERE EXISTS (
    SELECT * FROM CUST C2
    WHERE C.SNUM = C2.SNUM AND C.CNUM <> C2.CNUM
);

-- Q69: Salespeople with customers in their cities (IN).
SELECT * FROM SALESPEOPLE
WHERE CITY IN (SELECT CITY FROM CUST);

-- Q70: Salespeople alphabetically before any customer.
SELECT * FROM SALESPEOPLE
WHERE SNAME < ANY (SELECT CNAME FROM CUST);

-- Q71: Customers with rating greater than any in Rome.
SELECT * FROM CUST
WHERE RATING > ANY (
    SELECT RATING FROM CUST WHERE CITY='Rome'
);

-- Q72: Orders greater than any order on Oct 6.
SELECT * FROM ORDERS
WHERE AMT > ANY (
    SELECT AMT FROM ORDERS WHERE ODATE='1994-10-06'
);

-- Q73: Orders smaller than any for San Jose customers.
SELECT * FROM ORDERS
WHERE AMT < ANY (
    SELECT AMT FROM ORDERS
    WHERE CNUM IN (
        SELECT CNUM FROM CUST WHERE CITY='San Jose'
    )
);

-- Q74: Customers rating higher than all in Paris.
SELECT * FROM CUST
WHERE RATING > ALL (
    SELECT RATING FROM CUST WHERE CITY='Paris'
);

-- Q75: Customers rating >= any of Serres customers.
SELECT * FROM CUST
WHERE RATING >= ANY (
    SELECT RATING FROM CUST
    WHERE SNUM = (
        SELECT SNUM FROM SALESPEOPLE WHERE SNAME='Serres'
    )
);