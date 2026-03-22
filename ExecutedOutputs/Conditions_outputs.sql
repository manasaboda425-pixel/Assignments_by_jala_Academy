-- Q11: Salespeople either in Barcelona or London
SELECT * FROM SALESPEOPLE 
WHERE CITY IN ('Barcelona','London');

-- Output
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rafkin  | Barcelona | 0.15 |
+------+---------+-----------+------+



-- Q12: Salespeople with commission between 0.10 and 0.12
SELECT * FROM SALESPEOPLE 
WHERE COMM > 0.10 AND COMM < 0.12;

-- Output
+------+--------+--------+------+
| snum | sname  | city   | comm |
+------+--------+--------+------+
| 1004 | Motika | London | 0.11 |
+------+--------+--------+------+



-- Q13: Customers with NULL city
SELECT * FROM CUST WHERE CITY IS NULL;

-- Output
Empty set



-- Q14: Orders taken on Oct 3 and Oct 4 1994
SELECT * FROM ORDERS 
WHERE ODATE IN ('1994-10-03','1994-10-04');

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 | 18.69   | 1994-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3003 | 767.19  | 1994-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
+------+---------+------------+------+------+


-- Q15: Customers serviced by Peel or Motika
SELECT * FROM CUST 
WHERE SNUM IN (
    SELECT SNUM FROM SALESPEOPLE 
    WHERE SNAME IN ('Peel','Motika')
);

-- Output
+------+----------+--------+--------+------+
| cnum | cname    | city   | rating | snum |
+------+----------+--------+--------+------+
| 2001 | Hoffman  | London | 100    | 1001 |
| 2004 | Pereira  | Rome   | 100    | 1004 |
+------+----------+--------+--------+------+



-- Q16: Customers whose names begin with A or B
SELECT * FROM CUST 
WHERE CNAME LIKE 'A%' OR CNAME LIKE 'B%';

-- Output
Empty set



-- Q17: Orders except those with 0 or NULL amount
SELECT * FROM ORDERS 
WHERE AMT IS NOT NULL AND AMT <> 0;

-- Output
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 | 18.69   | 1994-10-03 | 2008 | 1007 |
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3003 | 767.19  | 1994-10-03 | 2001 | 1001 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1994-10-04 | 2008 | 1007 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
| 3007 | 75.75   | 1994-10-05 | 2004 | 1002 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1994-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+



-- Q18: Count number of salespeople listing orders
SELECT COUNT(DISTINCT SNUM) FROM ORDERS;

-- Output
+------------------------+
| COUNT(DISTINCT SNUM)   |
+------------------------+
| 5                      |
+------------------------+



-- Q19: Largest order taken by each salesperson
SELECT SNUM, MAX(AMT) 
FROM ORDERS 
GROUP BY SNUM;

-- Output
+------+----------+
| snum | max(amt) |
+------+----------+
| 1001 | 9891.88  |
| 1002 | 5160.45  |
| 1003 | 1713.23  |
| 1004 | 1900.10  |
| 1007 | 1098.16  |
+------+----------+



-- Q20: Largest order > 3000 per salesperson
SELECT SNUM, MAX(AMT) 
FROM ORDERS 
GROUP BY SNUM 
HAVING MAX(AMT) > 3000;

-- Output
+------+----------+
| snum | max(amt) |
+------+----------+
| 1001 | 9891.88  |
| 1002 | 5160.45  |
+------+----------+



-- Q21: Day with highest total amount ordered
SELECT ODATE, SUM(AMT) AS TOTAL 
FROM ORDERS 
GROUP BY ODATE 
ORDER BY TOTAL DESC 
LIMIT 1;

-- Output
+------------+----------+
| odate      | total    |
+------------+----------+
| 1994-10-06 | 11201.83 |
+------------+----------+



-- Q22: Count all orders for Oct 3
SELECT COUNT(*) FROM ORDERS 
WHERE ODATE='1994-10-03';

-- Output
+----------+
| COUNT(*) |
+----------+
| 4        |
+----------+



-- Q23: Count distinct cities in CUST table
SELECT COUNT(DISTINCT CITY) FROM CUST;

-- Output
+----------------------+
| COUNT(DISTINCT CITY) |
+----------------------+
| 4                    |
+----------------------+



-- Q24: Smallest order for each customer
SELECT CNUM, MIN(AMT) 
FROM ORDERS 
GROUP BY CNUM;

-- Output
+------+----------+
| cnum | min(amt) |
+------+----------+
| 2001 | 767.19   |
| 2002 | 1713.23  |
| 2003 | 5160.45  |
| 2004 | 75.75    |
| 2006 | 4723.00  |
| 2007 | 1900.10  |
| 2008 | 18.69    |
+------+----------+



-- Q25: First customer alphabetically starting with G
SELECT * FROM CUST 
WHERE CNAME LIKE 'G%' 
ORDER BY CNAME 
LIMIT 1;

-- Output
+------+----------+------+--------+------+
| cnum | cname    | city | rating | snum |
+------+----------+------+--------+------+
| 2002 | Giovanne | Rome | 200    | 1003 |
+------+----------+------+--------+-----