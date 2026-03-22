-- Q11: Salespeople either in Barcelona or London.
SELECT * FROM SALESPEOPLE WHERE CITY IN ('Barcelona', 'London');

-- Q12: Salespeople with commission between 0.10 and 0.12 (exclusive).
SELECT * FROM SALESPEOPLE WHERE COMM > 0.10 AND COMM < 0.12;

-- Q13: Customers with NULL values in city column.
SELECT * FROM CUST WHERE CITY IS NULL;

-- Q14: Orders taken on Oct 3rd and Oct 4th 1994.
SELECT * FROM ORDERS WHERE ODATE IN ('1994-10-03', '1994-10-04');

-- Q15: Customers serviced by Peel or Motika.
SELECT * FROM CUST WHERE SNUM IN 
(SELECT SNUM FROM SALESPEOPLE WHERE SNAME IN ('Peel','Motika'));

-- Q16: Customers whose names begin with A to B.
SELECT * FROM CUST WHERE CNAME LIKE 'A%' OR CNAME LIKE 'B%';

-- Q17: Orders except those with 0 or NULL amount.
SELECT * FROM ORDERS WHERE AMT IS NOT NULL AND AMT <> 0;

-- Q18: Count number of salespeople listing orders.
SELECT COUNT(DISTINCT SNUM) FROM ORDERS;

-- Q19: Largest order by each salesperson.
SELECT SNUM, MAX(AMT) FROM ORDERS GROUP BY SNUM;

-- Q20: Largest order > $3000.
SELECT SNUM, MAX(AMT) FROM ORDERS GROUP BY SNUM HAVING MAX(AMT) > 3000;

-- Q21: Day with highest total amount ordered.
SELECT ODATE, SUM(AMT) AS TOTAL FROM ORDERS GROUP BY ODATE ORDER BY TOTAL DESC LIMIT 1;

-- Q22: Count orders for Oct 3rd.
SELECT COUNT(*) FROM ORDERS WHERE ODATE = '1994-10-03';

-- Q23: Count distinct non-null cities.
SELECT COUNT(DISTINCT CITY) FROM CUST;

-- Q24: Smallest order per customer.
SELECT CNUM, MIN(AMT) FROM ORDERS GROUP BY CNUM;

-- Q25: First customer alphabetically starting with G.
SELECT * FROM CUST WHERE CNAME LIKE 'G%' ORDER BY CNAME LIMIT 1;