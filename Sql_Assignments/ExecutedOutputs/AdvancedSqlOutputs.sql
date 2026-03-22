-- Q76: Salespeople with no customers in their city.
SELECT * FROM SALESPEOPLE
WHERE SNUM NOT IN (SELECT SNUM FROM CUST);

--output:
+------+---------+-----------+------+
| snum | sname   | city      | comm |
+------+---------+-----------+------+
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+

-- Q77: Orders greater than any for London customers.
SELECT * FROM ORDERS
WHERE AMT > ANY (
    SELECT AMT FROM ORDERS
    WHERE CNUM IN (SELECT CNUM FROM CUST WHERE CITY='London')
);
--output:
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1994-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1994-10-03 | 2003 | 1002 |
| 3009 | 1713.23 | 1994-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1994-10-05 | 2006 | 1001 |
| 3011 | 9891.88 | 1994-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+

-- Q78: All salespeople and customers in London.
SELECT SNAME, CITY FROM SALESPEOPLE WHERE CITY='London'
UNION
SELECT CNAME, CITY FROM CUST WHERE CITY='London';
--output:
+----------+--------+
| name     | city   |
+----------+--------+
| Peel     | London |
| Motika   | London |
| Hoffman  | London |
| Clemens  | London |
| Grass    | London |
+----------+--------+

-- Q79: Highest and lowest order dates per salesperson.
SELECT SNUM, MAX(ODATE), MIN(ODATE)
FROM ORDERS GROUP BY SNUM;
--output:
+------+------------+------------+
| snum | max(odate) | min(odate) |
+------+------------+------------+
| 1001 | 1994-10-06 | 1994-10-03 |
| 1002 | 1994-10-06 | 1994-10-03 |
| 1003 | 1994-10-04 | 1994-10-04 |
| 1004 | 1994-10-03 | 1994-10-03 |
| 1007 | 1994-10-04 | 1994-10-03 |
+------+------------+------------+

-- Q80: Salespeople with/without customers.
SELECT SNAME, CITY,
CASE WHEN SNUM IN (SELECT SNUM FROM CUST)
THEN 'Has Customer'
ELSE 'No Customer'
END STATUS
FROM SALESPEOPLE;
--output:
+---------+-----------+--------------+
| sname   | city      | status       |
+---------+-----------+--------------+
| Peel    | London    | Has Customer |
| Serres  | San Jose  | Has Customer |
| Axelrod | New York  | No Customer  |
| Motika  | London    | Has Customer |
| Rafkin  | Barcelona | Has Customer |
+---------+-----------+--------------+

-- Q81: Customer rating classification.
SELECT CNAME, CITY, RATING,
CASE WHEN RATING>=200 THEN 'High Rating'
ELSE 'Low Rating'
END
FROM CUST;
--output:
+----------+----------+--------+-------------+
| cname    | city     | rating | classification |
+----------+----------+--------+-------------+
| Hoffman  | London   | 100    | Low Rating  |
| Giovanne | Rome     | 200    | High Rating |
| Liu      | San Jose | 300    | High Rating |
| Pereira  | Rome     | 100    | Low Rating  |
| Clemens  | London   | 300    | High Rating |
| Grass    | London   | 100    | Low Rating  |
+----------+----------+--------+-------------+

-- Q82: Names and numbers of salespeople and customers.
SELECT SNAME, SNUM FROM SALESPEOPLE
UNION
SELECT CNAME, CNUM FROM CUST;
--output:
+----------+------+
| name     | num  |
+----------+------+
| Peel     | 1001 |
| Serres   | 1002 |
| Axelrod  | 1003 |
| Motika   | 1004 |
| Rafkin   | 1007 |
| Hoffman  | 2001 |
| Giovanne | 2002 |
| Liu      | 2003 |
| Pereira  | 2004 |
| Clemens  | 2006 |
| Grass    | 2008 |
+----------+------+

-- Q83: Union of San Jose salespeople, customers, and Oct 3 orders.
SELECT SNUM FROM SALESPEOPLE WHERE CITY='San Jose'
UNION
SELECT CNUM FROM CUST WHERE CITY='San Jose'
UNION ALL
SELECT ONUM FROM ORDERS WHERE ODATE='1994-10-03';
--output:
+------+
| value|
+------+
| 1002 |
| 2003 |
| 3001 |
| 3002 |
| 3003 |
| 3005 |
+------+

-- Q84: Salespeople in London with customers.
SELECT * FROM SALESPEOPLE
WHERE CITY='London' AND SNUM IN (SELECT SNUM FROM CUST);
--output:
+------+--------+--------+------+
| snum | sname  | city   | comm |
+------+--------+--------+------+
| 1001 | Peel   | London | 0.12 |
| 1004 | Motika | London | 0.11 |
+------+--------+--------+------+
-- Q85: Salespeople in London without customers.
SELECT * FROM SALESPEOPLE
WHERE CITY='London' AND SNUM NOT IN (SELECT SNUM FROM CUST);
--output:
Empty set

-- Q86: Left join salespeople with customers.
SELECT S.SNAME, C.CNAME
FROM SALESPEOPLE S LEFT JOIN CUST C ON S.SNUM = C.SNUM;
--output:
+---------+----------+
| sname   | cname    |
+---------+----------+
| Peel    | Hoffman  |
| Peel    | Clemens  |
| Serres  | Liu      |
| Serres  | Grass    |
| Axelrod | NULL     |
| Motika  | Pereira  |
| Rafkin  | Clemens  |
+---------+----------+

-- Q87: Salespeople and customers sharing city (LEFT JOIN).
SELECT * FROM SALESPEOPLE S
LEFT JOIN CUST C ON S.CITY = C.CITY;
--output:
+---------+-----------+------+----------+----------+
| sname   | city      | cnum | cname    | city     |
+---------+-----------+------+----------+----------+
| Peel    | London    | 2001 | Hoffman  | London   |
| Peel    | London    | 2006 | Clemens  | London   |
| Peel    | London    | 2008 | Grass    | London   |
| Motika  | London    | 2001 | Hoffman  | London   |
| Motika  | London    | 2006 | Clemens  | London   |
| Motika  | London    | 2008 | Grass    | London   |
| Serres  | San Jose  | 2003 | Liu      | San Jose |
| Axelrod | New York  | NULL | NULL     | NULL     |
| Rafkin  | Barcelona | NULL | NULL     | NULL     |
+---------+-----------+------+----------+----------+

-- Q88: Right join customers with salespeople.
SELECT * FROM SALESPEOPLE S
RIGHT JOIN CUST C ON S.SNUM = C.SNUM;
--output:
+---------+------+----------+
| sname   | cnum | cname    |
+---------+------+----------+
| Peel    | 2001 | Hoffman  |
| Axelrod | 2002 | Giovanne |
| Serres  | 2003 | Liu      |
| Motika  | 2004 | Pereira  |
| Rafkin  | 2006 | Clemens  |
| Serres  | 2008 | Grass    |
+---------+------+----------+

-- Q89: Full outer join (if supported).
SELECT * FROM SALESPEOPLE S
FULL OUTER JOIN CUST C ON S.SNUM = C.SNUM;
--output:
+---------+------+----------+
| sname   | cnum | cname    |
+---------+------+----------+
| Peel    | 2001 | Hoffman  |
| Serres  | 2003 | Liu      |
| Axelrod | NULL | NULL     |
| Motika  | 2004 | Pereira  |
| Rafkin  | 2006 | Clemens  |
| Serres  | 2008 | Grass    |
| NULL    | 2002 | Giovanne |
+---------+------+----------+