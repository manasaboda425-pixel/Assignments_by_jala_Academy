-- Q26: Count number of orders for each date
SELECT ODATE, COUNT(*) 
FROM ORDERS 
GROUP BY ODATE;

-- Output
+------------+----------+
| odate      | count(*) |
+------------+----------+
| 1994-10-03 | 4        |
| 1994-10-04 | 2        |
| 1994-10-05 | 2        |
| 1994-10-06 | 2        |
+------------+----------+



-- Q27: Show commission (12%) for each order
SELECT ONUM, SNUM, AMT*0.12 AS COMMISSION 
FROM ORDERS;

-- Output
+------+------+
| onum | commission |
+------+------+
| 3001 | 2.24 |
| 3002 | 228.01 |
| 3003 | 92.06 |
| 3005 | 619.25 |
| 3006 | 131.78 |
| 3009 | 205.59 |
| 3007 | 9.09 |
| 3008 | 566.76 |
| 3010 | 157.19 |
| 3011 | 1187.03 |
+------+------+



-- Q28: Highest rating in each city
SELECT CITY, MAX(RATING) 
FROM CUST 
GROUP BY CITY;

-- Output
+----------+-------------+
| city     | max(rating) |
+----------+-------------+
| London   | 300         |
| Rome     | 200         |
| San Jose | 300         |
| Berlin   | 100         |
+----------+-------------+



-- Q29: Total amount per day (descending order)
SELECT ODATE, SUM(AMT) 
FROM ORDERS 
GROUP BY ODATE 
ORDER BY SUM(AMT) DESC;

-- Output
+------------+-----------+
| odate      | sum(amt)  |
+------------+-----------+
| 1994-10-06 | 11201.83  |
| 1994-10-03 | 7846.43   |
| 1994-10-05 | 4798.75   |
| 1994-10-04 | 2811.39   |
+------------+-----------+



-- Q30: Salespeople and customers in same city
SELECT S.SNAME, C.CNAME 
FROM SALESPEOPLE S 
JOIN CUST C ON S.CITY = C.CITY;

-- Output
+---------+----------+
| sname   | cname    |
+---------+----------+
| Peel    | Hoffman  |
| Peel    | Clemens  |
| Motika  | Hoffman  |
| Motika  | Clemens  |
| Serres  | Liu      |
| Axelrod | Giovanne |
+---------+----------+



-- Q31: Show customer name and their salesperson name
SELECT C.CNAME, S.SNAME 
FROM CUST C 
JOIN SALESPEOPLE S ON C.SNUM = S.SNUM;

-- Output
+----------+---------+
| cname    | sname   |
+----------+---------+
| Hoffman  | Peel    |
| Giovanne | Axelrod |
| Liu      | Serres  |
| Pereira  | Motika  |
| Clemens  | Rafkin  |
| Grass    | Serres  |
+----------+---------+


-- Q32: Show orders along with customer names
SELECT O.ONUM, C.CNAME 
FROM ORDERS O 
JOIN CUST C ON O.CNUM = C.CNUM;

-- Output
+------+----------+
| onum | cname    |
+------+----------+
| 3003 | Hoffman  |
| 3005 | Liu      |
| 3009 | Giovanne |
| 3007 | Pereira  |
| 3008 | Clemens  |
| 3010 | Pereira  |
| 3011 | Clemens  |
| 3001 | Grass    |
| 3006 | Grass    |
+------+----------+



-- Q33: Orders with customer and salesperson names
SELECT O.ONUM, C.CNAME, S.SNAME
FROM ORDERS O
JOIN CUST C ON O.CNUM = C.CNUM
JOIN SALESPEOPLE S ON O.SNUM = S.SNUM;

-- Output
+------+----------+---------+
| onum | cname    | sname   |
+------+----------+---------+
| 3003 | Hoffman  | Peel    |
| 3005 | Liu      | Serres  |
| 3009 | Giovanne | Axelrod |
| 3007 | Pereira  | Serres  |
| 3008 | Clemens  | Peel    |
| 3010 | Pereira  | Serres  |
| 3011 | Clemens  | Peel    |
| 3001 | Grass    | Rafkin  |
| 3006 | Grass    | Rafkin  |
+------+----------+---------+


-- Q34: Customers served by salespeople with commission > 0.12
SELECT C.*
FROM CUST C
JOIN SALESPEOPLE S ON C.SNUM = S.SNUM
WHERE S.COMM > 0.12;

-- Output
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2003 | Liu      | San Jose | 300    | 1002 |
| 2008 | Grass    | London   | 100    | 1002 |
| 2006 | Clemens  | London   | 300    | 1007 |
+------+----------+----------+--------+------+



-- Q35: Commission on orders where customer rating >100
SELECT O.ONUM, O.AMT, O.AMT*0.12 AS COMMISSION
FROM ORDERS O
JOIN CUST C ON O.CNUM = C.CNUM
WHERE C.RATING > 100;

-- Output
+------+---------+------------+
| onum | amt     | commission |
+------+---------+------------+
| 3005 | 5160.45 | 619.25     |
| 3009 | 1713.23 | 205.59     |
| 3008 | 4723.00 | 566.76     |
| 3011 | 9891.88 | 1187.03    |
+------+---------+------------+



-- Q36: Pairs of customers with same rating
SELECT A.CNAME, B.CNAME
FROM CUST A, CUST B
WHERE A.RATING = B.RATING;

-- Output

 +----------+----------+
| cname    | cname    |
+----------+----------+
| Hoffman  | Hoffman  |
| Hoffman  | Grass    |
| Hoffman  | Pereira  |
| Grass    | Hoffman  |
| Grass    | Grass    |
| Grass    | Pereira  |
| Pereira  | Hoffman  |
| Pereira  | Grass    |
| Pereira  | Pereira  |

| Liu      | Liu      |
| Liu      | Clemens  |
| Clemens  | Liu      |
| Clemens  | Clemens  |

| Giovanne | Giovanne |
+----------+----------+


-- Q37: Unique customer pairs with same rating
SELECT A.CNAME, B.CNAME
FROM CUST A, CUST B
WHERE A.RATING = B.RATING AND A.CNUM < B.CNUM;

-- Output
+----------+----------+
| cname    | cname    |
+----------+----------+
| Hoffman  | Grass    |
| Hoffman  | Pereira  |
| Grass    | Pereira  |
| Liu      | Clemens  |
+----------+----------+


-- Q38: All combinations of salespeople and customers
SELECT * FROM SALESPEOPLE CROSS JOIN CUST;

-- Output
+------+---------+-----------+------+------+
| snum | sname   | city      | comm | cnum |
+------+---------+-----------+------+------+
| 1001 | Peel    | London    | 0.12 | 2001 |
| 1001 | Peel    | London    | 0.12 | 2002 |
| 1001 | Peel    | London    | 0.12 | 2003 |
| 1001 | Peel    | London    | 0.12 | 2004 |
| 1001 | Peel    | London    | 0.12 | 2006 |
| 1001 | Peel    | London    | 0.12 | 2008 |

| 1002 | Serres  | San Jose  | 0.13 | 2001 |
| 1002 | Serres  | San Jose  | 0.13 | 2002 |
| 1002 | Serres  | San Jose  | 0.13 | 2003 |
| 1002 | Serres  | San Jose  | 0.13 | 2004 |
| 1002 | Serres  | San Jose  | 0.13 | 2006 |
| 1002 | Serres  | San Jose  | 0.13 | 2008 |

| 1003 | Axelrod | New York  | 0.10 | 2001 |
| 1003 | Axelrod | New York  | 0.10 | 2002 |
| 1003 | Axelrod | New York  | 0.10 | 2003 |
| 1003 | Axelrod | New York  | 0.10 | 2004 |
| 1003 | Axelrod | New York  | 0.10 | 2006 |
| 1003 | Axelrod | New York  | 0.10 | 2008 |

| 1004 | Motika  | London    | 0.11 | 2001 |
| 1004 | Motika  | London    | 0.11 | 2002 |
| 1004 | Motika  | London    | 0.11 | 2003 |
| 1004 | Motika  | London    | 0.11 | 2004 |
| 1004 | Motika  | London    | 0.11 | 2006 |
| 1004 | Motika  | London    | 0.11 | 2008 |

| 1007 | Rafkin  | Barcelona | 0.15 | 2001 |
| 1007 | Rafkin  | Barcelona | 0.15 | 2002 |
| 1007 | Rafkin  | Barcelona | 0.15 | 2003 |
| 1007 | Rafkin  | Barcelona | 0.15 | 2004 |
| 1007 | Rafkin  | Barcelona | 0.15 | 2006 |
| 1007 | Rafkin  | Barcelona | 0.15 | 2008 |
+------+---------+-----------+------+------+


-- Q39: Customers in same city as customers of Serres
SELECT * FROM CUST 
WHERE CITY IN (
    SELECT CITY FROM CUST 
    WHERE SNUM = (
        SELECT SNUM FROM SALESPEOPLE WHERE SNAME='Serres'
    )
);

-- Output
+------+-------+----------+--------+------+
| cnum | cname | city     | rating | snum |
+------+-------+----------+--------+------+
| 2003 | Liu   | San Jose | 300    | 1002 |
+------+-------+----------+--------+------+



-- Q40: Customer pairs served by same salesperson
SELECT A.CNAME, B.CNAME
FROM CUST A, CUST B
WHERE A.SNUM = B.SNUM AND A.CNUM < B.CNUM;

-- Output
+--------+--------+
| cname  | cname  |
+--------+--------+
| Liu    | Grass  |
+--------+--------+