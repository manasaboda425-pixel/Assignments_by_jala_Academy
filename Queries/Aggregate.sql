-- Q26: Orders count per date.
SELECT ODATE, COUNT(*) FROM ORDERS GROUP BY ODATE;

-- Q27: Commission (12%) per order.
SELECT ONUM, SNUM, AMT * 0.12 AS COMMISSION FROM ORDERS;

-- Q28: Highest rating per city.
SELECT CITY, MAX(RATING) FROM CUST GROUP BY CITY;

-- Q29: Total orders per day in descending order.
SELECT ODATE, SUM(AMT) FROM ORDERS GROUP BY ODATE ORDER BY SUM(AMT) DESC;

-- Q30: Salespeople and customers sharing same city.
SELECT S.SNAME, C.CNAME FROM SALESPEOPLE S JOIN CUST C ON S.CITY = C.CITY;

-- Q31: Customer with their salesperson.
SELECT C.CNAME, S.SNAME FROM CUST C JOIN SALESPEOPLE S ON C.SNUM = S.SNUM;

-- Q32: Orders with customer names.
SELECT O.ONUM, C.CNAME FROM ORDERS O JOIN CUST C ON O.CNUM = C.CNUM;

-- Q33: Orders with customer and salesperson names.
SELECT O.ONUM, S.SNAME, C.CNAME
FROM ORDERS O
JOIN SALESPEOPLE S ON O.SNUM = S.SNUM
JOIN CUST C ON O.CNUM = C.CNUM;

-- Q34: Customers served by commission >12%.
SELECT C.* FROM CUST C JOIN SALESPEOPLE S ON C.SNUM = S.SNUM WHERE S.COMM > 0.12;

-- Q35: Commission on orders where rating >100.
SELECT O.ONUM, O.AMT, O.AMT*0.12
FROM ORDERS O JOIN CUST C ON O.CNUM = C.CNUM
WHERE C.RATING > 100;

-- Q36: Pairs of customers with same rating.
SELECT A.CNAME, B.CNAME FROM CUST A, CUST B WHERE A.RATING = B.RATING;

-- Q37: Unique customer pairs with same rating.
SELECT A.CNAME, B.CNAME FROM CUST A, CUST B WHERE A.RATING = B.RATING AND A.CNUM < B.CNUM;

-- Q38: All combinations (3 salespeople per customer).
SELECT * FROM SALESPEOPLE CROSS JOIN CUST;

-- Q39: Customers in same cities as Serres customers.
SELECT * FROM CUST WHERE CITY IN
(SELECT CITY FROM CUST WHERE SNUM =
(SELECT SNUM FROM SALESPEOPLE WHERE SNAME='Serres'));

-- Q40: Customer pairs served by same salesperson.
SELECT A.CNAME, B.CNAME FROM CUST A, CUST B WHERE A.SNUM = B.SNUM AND A.CNUM < B.CNUM;