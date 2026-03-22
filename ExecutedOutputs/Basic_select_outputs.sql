1. Display snum, sname, city and comm of all salespeople. [cite: 29]
SELECT SNUM, SNAME, CITY, COMM
FROM SALESPEOPLE;
 snum |  sname  |   city    | comm 
------+---------+-----------+------
 1001 | Peel    | London    | 0.12
 1002 | Serres  | San Jose  | 0.13
 1004 | Motika  | London    | 0.11
 1007 | Rafkin  | Barcelona | 0.15
 1003 | Axelrod | New york  | 0.10
(5 rows)

-- 2. Display all snum without duplicates from all orders. [cite: 30]
SELECT DISTINCT SNUM
FROM ORDERS;
 snum 
------
 1002
 1003
 1004
 1001
 1007
(5 rows)

-- 3. Display names and commissions of all salespeople in London. [cite: 31]
SELECT SNAME, COMM
FROM SALESPEOPLE
WHERE CITY = 'London';
 sname  | comm 
--------+------
 Peel   | 0.12
 Motika | 0.11
(2 rows)

-- 4. All customers with rating of 100. [cite: 32]
SELECT * FROM CUST
WHERE RATING = 100;
 cnum |  cname  |  city  | rating | snum 
------+---------+--------+--------+------
 2001 | Hoffman | London |    100 | 1001
 2004 | Grass   | Brelin |    100 | 1002
 2007 | Pereira | Rome   |    100 | 1004
(3 rows)

-- 5. Produce orderno, amount and date form all rows in the order table. [cite: 33]
SELECT ONUM, AMT, ODATE
FROM ORDERS;
 onum |   amt   |   odate    
------+---------+------------
 3001 |   18.69 | 1994-10-03
 3003 |  767.19 | 1994-10-03
 3002 | 1900.10 | 1994-10-03
 3005 | 5160.45 | 1994-10-03
 3006 | 1098.16 | 1994-10-04
 3009 | 1713.23 | 1994-10-04
 3007 |   75.75 | 1994-10-05
 3008 | 4723.00 | 1994-10-05
 3010 | 1309.95 | 1994-10-06
 3011 | 9891.88 | 1994-10-06
(10 rows)

-- 6. All customers in San Jose, who have rating more than 200. [cite: 34]
SELECT * FROM CUST
WHERE CITY = 'San Jose' AND RATING > 200;
 cnum |   cname   |   city   | rating | snum 
------+-----------+----------+--------+------
 2003 | Liu       | San Jose |    300 | 1002
 2008 | Cisnerous | San Jose |    300 | 1007
(2 rows)

-- 7. All customers who were either located in San Jose or had a rating above 200. [cite: 35]
SELECT * FROM CUST
WHERE CITY = 'San Jose' OR RATING > 200;
 cnum |   cname   |   city   | rating | snum 
------+-----------+----------+--------+------
 2003 | Liu       | San Jose |    300 | 1002
 2006 | Clemens   | London   |    300 | 1007
 2008 | Cisnerous | San Jose |    300 | 1007
(3 rows)

-- 8. All orders for more than $1000. [cite: 36]
SELECT * FROM ORDERS
WHERE AMT > 1000;
 onum |   amt   |   odate    | cnum | snum 
------+---------+------------+------+------
 3002 | 1900.10 | 1994-10-03 | 2007 | 1004
 3005 | 5160.45 | 1994-10-03 | 2003 | 1002
 3006 | 1098.16 | 1994-10-04 | 2008 | 1007
 3009 | 1713.23 | 1994-10-04 | 2002 | 1003
 3008 | 4723.00 | 1994-10-05 | 2006 | 1001
 3010 | 1309.95 | 1994-10-06 | 2004 | 1002
 3011 | 9891.88 | 1994-10-06 | 2006 | 1001
(7 rows)

-- 9. Names and cities of all salespeople in London with commission above 0.10. [cite: 37]
SELECT SNAME, CITY
FROM SALESPEOPLE
WHERE CITY = 'London' AND COMM > 0.10;
 sname  |  city  
--------+--------
 Peel   | London
 Motika | London
(2 rows)

-- 10. All customers excluding those with rating <= 100 unless they are located in Rome. [cite: 38]
SELECT * FROM CUST
WHERE RATING > 100 OR CITY = 'Rome';
 cnum |   cname   |   city   | rating | snum 
------+-----------+----------+--------+------
 2002 | Giovanne  | Rome     |    200 | 1003
 2003 | Liu       | San Jose |    300 | 1002
 2006 | Clemens   | London   |    300 | 1007
 2007 | Pereira   | Rome     |    100 | 1004
 2008 | Cisnerous | San Jose |    300 | 1007
(5 rows)