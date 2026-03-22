-- Q41: Pairs of salespeople in same city
SELECT S1.SNAME, S2.SNAME
FROM SALESPEOPLE S1, SALESPEOPLE S2
WHERE S1.CITY = S2.CITY AND S1.SNUM < S2.SNUM;

-- Output
+--------+--------+
| sname  | sname  |
+--------+--------+
| Peel   | Motika |
+--------+--------+


-- Q42: Orders of Hoffman
SELECT * FROM ORDERS 
WHERE CNUM = (SELECT CNUM FROM CUST WHERE CNAME='Hoffman');

-- Output
+------+--------+------------+------+------+
| onum | amt    | odate      | cnum | snum |
+------+--------+------------+------+------+
| 3003 | 767.19 | 1994-10-03 | 2001 | 1001 |
+------+--------+------------+------+------+

-- Q43: Orders taken by Motika
SELECT * FROM ORDERS 
WHERE SNUM = (SELECT SNUM FROM SALESPEOPLE WHERE SNAME='Motika');

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
+------+---------+------------+------+------+


-- Q44: Orders taken by same salesperson as Hoffman
SELECT * FROM ORDERS 
WHERE SNUM = (
    SELECT SNUM FROM CUST WHERE CNAME='Hoffman'
);

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 | 767.19  | 1994-10-03 | 2001 | 1001 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+


-- Q45: Orders greater than average of Oct 4
SELECT * FROM ORDERS 
WHERE AMT > (
    SELECT AVG(AMT) FROM ORDERS WHERE ODATE='1994-10-04'
);

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1994-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+



-- Q46: Average commission of London salespeople
SELECT AVG(COMM) FROM SALESPEOPLE WHERE CITY='London';

-- Output
+------------+
| avg(comm)  |
+------------+
| 0.115      |
+------------+

-- Q47: Orders for customers in London
SELECT * FROM ORDERS 
WHERE CNUM IN (
    SELECT CNUM FROM CUST WHERE CITY='London'
);

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 | 767.19  | 1994-10-03 | 2001 | 1001 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
| 3001 | 18.69   | 1994-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
+------+---------+------------+------+------+


-- Q48: Commission of salespeople serving London customers
SELECT COMM FROM SALESPEOPLE 
WHERE SNUM IN (
    SELECT SNUM FROM CUST WHERE CITY='London'
);

-- Output
+------+
| comm |
+------+
| 0.12 |
| 0.13 |
| 0.15 |
+------+


-- Q49: Customers where cnum = snum + 1000 of Serres
SELECT * FROM CUST 
WHERE CNUM = (
    SELECT SNUM+1000 FROM SALESPEOPLE WHERE SNAME='Serres'
);

-- Output
+------+-------+----------+--------+------+
| cnum | cname | city     | rating | snum |
+------+-------+----------+--------+------+
| 2002 | Giovanne | Rome | 200    | 1003 |
+------+-------+----------+--------+------+


-- Q50: Customers with rating above San Jose average rating
SELECT COUNT(*) FROM CUST 
WHERE RATING > (
    SELECT AVG(RATING) FROM CUST WHERE CITY='San Jose'
);

-- Output
+----------+
| COUNT(*) |
+----------+
| 0        |
+----------+



