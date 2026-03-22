-- Q51: Produce names and rating of customers who have above average orders.
SELECT CNAME FROM CUST 
WHERE CNUM IN (
    SELECT CNUM FROM ORDERS 
    WHERE AMT > (SELECT AVG(AMT) FROM ORDERS)
);

-- Output
+----------+
| cname    |
+----------+
| Liu      |
| Clemens  |
+----------+


-- Q52: Total amount per salesperson greater than largest order.
SELECT SNUM, SUM(AMT)
FROM ORDERS
GROUP BY SNUM
HAVING SUM(AMT) > (SELECT MAX(AMT) FROM ORDERS);

-- Output
+------+-----------+
| snum | sum(amt)  |
+------+-----------+
| 1001 | 15382.88  |
+------+-----------+


-- Q53: Customers with orders on Oct 3
SELECT * FROM CUST 
WHERE CNUM IN (
    SELECT CNUM FROM ORDERS WHERE ODATE='1994-10-03'
);

-- Output
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   | 100    | 1001 |
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2008 | Grass    | London   | 100    | 1002 |
+------+----------+----------+--------+------+


-- Q54: Salespeople with more than one customer
SELECT SNUM, SNAME
FROM SALESPEOPLE
WHERE SNUM IN (
    SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)>1
);

-- Output
+------+--------+
| snum | sname  |
+------+--------+
| 1002 | Serres |
+------+--------+



-- Q55: Check correct salesperson credited.
SELECT *
FROM ORDERS O
JOIN CUST C ON O.CNUM=C.CNUM
WHERE O.SNUM = C.SNUM;

-- Output
+------+---------+------------+------+------++------+----------+----------+--------+------+
| onum | amt     | odate      | cnum | snum || cnum | cname    | city     | rating | snum |
+------+---------+------------+------+------++------+----------+----------+--------+------+
| 3003 | 767.19  | 1994-10-03 | 2001 | 1001 || 2001 | Hoffman  | London   | 100    | 1001 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 || 2003 | Liu      | San Jose | 300    | 1002 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 || 2002 | Giovanne | Rome     | 200    | 1003 |
| 3007 | 75.75   | 1994-10-05 | 2004 | 1002 || 2004 | Pereira  | Rome     | 100    | 1004 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 || 2006 | Clemens  | London   | 300    | 1007 |
| 3010 | 1309.95 | 1994-10-06 | 2004 | 1002 || 2004 | Pereira  | Rome     | 100    | 1004 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 || 2006 | Clemens  | London   | 300    | 1007 |
+------+---------+------------+------+------++------+----------+----------+--------+------+


-- Q56: Orders above avg per customer
SELECT *
FROM ORDERS O
WHERE AMT > (
    SELECT AVG(AMT) FROM ORDERS WHERE CNUM=O.CNUM
);

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
| 3010 | 1309.95 | 1994-10-06 | 2004 | 1002 |
+------+---------+------------+------+------+


-- Q57: Sum per date >2000
SELECT ODATE, SUM(AMT)
FROM ORDERS
GROUP BY ODATE
HAVING SUM(AMT)>2000;

-- Output
+------------+----------+
| odate      | total    |
+------------+----------+
| 1994-10-03 | 7846.43  |
| 1994-10-04 | 2811.39  |
| 1994-10-05 | 4798.75  |
| 1994-10-06 | 11201.83 |
+------------+----------+

-- Q58: Customers with max rating per city
SELECT *
FROM CUST C1
WHERE RATING = (
    SELECT MAX(RATING)
    FROM CUST C2
    WHERE C1.CITY = C2.CITY
);

-- Output
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2006 | Clemens  | London   | 300    | 1007 |
| 2002 | Giovanne | Rome     | 200    | 1003 |
| 2003 | Liu      | San Jose | 300    | 1002 |
+------+----------+----------+--------+------+



-- Q59: Salespeople with customers in same city but not servicing them
SELECT *
FROM SALESPEOPLE S
WHERE EXISTS (
    SELECT * FROM CUST C
    WHERE S.CITY=C.CITY AND S.SNUM<>C.SNUM
);

-- Output

+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2006 | Clemens  | London   | 300    | 1007 |
| 2002 | Giovanne | Rome     | 200    | 1003 |
| 2003 | Liu      | San Jose | 300    | 1002 |
+------+----------+----------+--------+------+
-- Q60: Extract all customers if any in San Jose
SELECT * FROM CUST
WHERE EXISTS (SELECT * FROM CUST WHERE CITY='San Jose');

-- Output
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   | 100    | 1001 |
| 2002 | Giovanne | Rome     | 200    | 1003 |
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2004 | Pereira  | Rome     | 100    | 1004 |
| 2006 | Clemens  | London   | 300    | 1007 |
| 2008 | Grass    | London   | 100    | 1002 |
+------+----------+----------+--------+------+


--61:Salespeople Numbers with multiple Customers
SELECT SNUM
FROM CUST
GROUP BY SNUM
HAVING COUNT(*) > 1;

--Output
+------+
| snum |
+------+
| 1002 |
+------+


-- Q62: Salespeople details with multiple customers.
SELECT * FROM SALESPEOPLE
WHERE SNUM IN (
    SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)>1
);
--Output
+------+--------+----------+------+
| snum | sname  | city     | comm |
+------+--------+----------+------+
| 1002 | Serres | San Jose | 0.13 |
+------+--------+----------+------+

--Q63: Salespeople serving only one customer.
SELECT SNUM FROM CUST GROUP BY SNUM HAVING COUNT(*)=1;

--Output
+------+
| snum |
+------+
| 1001 |
| 1003 |
| 1004 |
| 1007 |
+------+

--64:Salespeople with more than one order
SELECT * FROM SALESPEOPLE
WHERE SNUM IN (
    SELECT SNUM 
    FROM ORDERS 
    GROUP BY SNUM 
    HAVING COUNT(*) > 1
);
--output
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1007 | Rafkin  | Barcelona | 0.15 |
+------+---------+-----------+------+


-- Q65: Salespeople having customers with rating 300 (EXISTS).
SELECT * FROM SALESPEOPLE S
WHERE EXISTS (
    SELECT * FROM CUST C
    WHERE S.SNUM = C.SNUM AND C.RATING = 300
);
--output
+------+--------+----------+------+
| snum | sname  | city     | comm |
+------+--------+----------+------+
| 1002 | Serres | San Jose | 0.13 |
| 1007 | Rafkin | Barcelona| 0.15 |
+------+--------+----------+------+

-- Q66: Salespeople having customers with rating 300 (JOIN).
SELECT DISTINCT S.*
FROM SALESPEOPLE S
JOIN CUST C ON S.SNUM = C.SNUM
WHERE C.RATING = 300;
--output
+------+--------+----------+------+
| snum | sname  | city     | comm |
+------+--------+----------+------+
| 1002 | Serres | San Jose | 0.13 |
| 1007 | Rafkin | Barcelona| 0.15 |
+------+--------+----------+------+

-- Q67: Salespeople with customers in same city but not assigned.
SELECT *
FROM SALESPEOPLE S
WHERE NOT EXISTS (
    SELECT * FROM CUST C
    WHERE S.CITY = C.CITY AND S.SNUM = C.SNUM
);
--output:
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1003 | Axelrod | New York  | 0.10 |
| 1007 | Rafkin  | Barcelona | 0.15 |
+------+---------+-----------+------+

-- Q68: Customers whose salesperson has another customer with orders.
SELECT *
FROM CUST C
WHERE EXISTS (
    SELECT * FROM CUST C2
    WHERE C.SNUM = C2.SNUM AND C.CNUM <> C2.CNUM
);
--output:
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2008 | Grass    | London   | 100    | 1002 |
+------+----------+----------+--------+------+

-- Q69: Salespeople with customers in their cities (IN).
SELECT * FROM SALESPEOPLE
WHERE CITY IN (SELECT CITY FROM CUST);
--output:
+------+--------+----------+------+
| snum | sname  | city     | comm |
+------+--------+----------+------+
| 1001 | Peel   | London   | 0.12 |
| 1002 | Serres | San Jose | 0.13 |
| 1004 | Motika | London   | 0.11 |
+------+--------+----------+------+

-- Q70: Salespeople alphabetically before any customer.
SELECT * FROM SALESPEOPLE
WHERE SNAME < ANY (SELECT CNAME FROM CUST);
--output:
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1003 | Axelrod | New York  | 0.10 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rafkin  | Barcelona | 0.15 |
+------+---------+-----------+------+

-- Q71: Customers with rating greater than any in Rome.
SELECT * FROM CUST
WHERE RATING > ANY (
    SELECT RATING FROM CUST WHERE CITY='Rome'
);
--output:
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2006 | Clemens  | London   | 300    | 1007 |
+------+----------+----------+--------+------+

-- Q72: Orders greater than any order on Oct 6.
SELECT * FROM ORDERS
WHERE AMT > ANY (
    SELECT AMT FROM ORDERS WHERE ODATE='1994-10-06'
);
--output:
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
+------+---------+------------+------+------+

-- Q73: Orders smaller than any for San Jose customers.
SELECT * FROM ORDERS
WHERE AMT < ANY (
    SELECT AMT FROM ORDERS
    WHERE CNUM IN (
        SELECT CNUM FROM CUST WHERE CITY='San Jose'
    )
);
--output:
+------+--------+------------+------+------+
| onum | amt    | odate      | cnum | snum |
+------+--------+------------+------+------+
| 3001 | 18.69  | 1994-10-03 | 2008 | 1007 |
| 3003 | 767.19 | 1994-10-03 | 2001 | 1001 |
| 3007 | 75.75  | 1994-10-05 | 2004 | 1002 |
+------+--------+------------+------+------+
-- Q74: Customers rating higher than all in Paris.
SELECT * FROM CUST
WHERE RATING > ALL (
    SELECT RATING FROM CUST WHERE CITY='Paris'
);
--output:
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   | 100    | 1001 |
| 2002 | Giovanne | Rome     | 200    | 1003 |
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2004 | Pereira  | Rome     | 100    | 1004 |
| 2006 | Clemens  | London   | 300    | 1007 |
| 2008 | Grass    | London   | 100    | 1002 |
+------+----------+----------+--------+------+

-- Q75: Customers rating >= any of Serres customers.
SELECT * FROM CUST
WHERE RATING >= ANY (
    SELECT RATING FROM CUST
    WHERE SNUM = (
        SELECT SNUM FROM SALESPEOPLE WHERE SNAME='Serres'
    )
);
--output:
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   | 100    | 1001 |
| 2002 | Giovanne | Rome     | 200    | 1003 |
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2004 | Pereira  | Rome     | 100    | 1004 |
| 2006 | Clemens  | London   | 300    | 1007 |
| 2008 | Grass    | London   | 100    | 1002 |
+------+----------+----------+--------+------+