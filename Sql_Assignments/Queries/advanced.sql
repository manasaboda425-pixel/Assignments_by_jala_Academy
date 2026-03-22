-- Q76: Salespeople with no customers in their city.
SELECT * FROM SALESPEOPLE
WHERE SNUM NOT IN (SELECT SNUM FROM CUST);

-- Q77: Orders greater than any for London customers.
SELECT * FROM ORDERS
WHERE AMT > ANY (
    SELECT AMT FROM ORDERS
    WHERE CNUM IN (SELECT CNUM FROM CUST WHERE CITY='London')
);

-- Q78: All salespeople and customers in London.
SELECT SNAME, CITY FROM SALESPEOPLE WHERE CITY='London'
UNION
SELECT CNAME, CITY FROM CUST WHERE CITY='London';

-- Q79: Highest and lowest order dates per salesperson.
SELECT SNUM, MAX(ODATE), MIN(ODATE)
FROM ORDERS GROUP BY SNUM;

-- Q80: Salespeople with/without customers.
SELECT SNAME, CITY,
CASE WHEN SNUM IN (SELECT SNUM FROM CUST)
THEN 'Has Customer'
ELSE 'No Customer'
END STATUS
FROM SALESPEOPLE;

-- Q81: Customer rating classification.
SELECT CNAME, CITY, RATING,
CASE WHEN RATING>=200 THEN 'High Rating'
ELSE 'Low Rating'
END
FROM CUST;

-- Q82: Names and numbers of salespeople and customers.
SELECT SNAME, SNUM FROM SALESPEOPLE
UNION
SELECT CNAME, CNUM FROM CUST;

-- Q83: Union of San Jose salespeople, customers, and Oct 3 orders.
SELECT SNUM FROM SALESPEOPLE WHERE CITY='San Jose'
UNION
SELECT CNUM FROM CUST WHERE CITY='San Jose'
UNION ALL
SELECT ONUM FROM ORDERS WHERE ODATE='1994-10-03';

-- Q84: Salespeople in London with customers.
SELECT * FROM SALESPEOPLE
WHERE CITY='London' AND SNUM IN (SELECT SNUM FROM CUST);

-- Q85: Salespeople in London without customers.
SELECT * FROM SALESPEOPLE
WHERE CITY='London' AND SNUM NOT IN (SELECT SNUM FROM CUST);

-- Q86: Left join salespeople with customers.
SELECT S.SNAME, C.CNAME
FROM SALESPEOPLE S LEFT JOIN CUST C ON S.SNUM = C.SNUM;

-- Q87: Salespeople and customers sharing city (LEFT JOIN).
SELECT * FROM SALESPEOPLE S
LEFT JOIN CUST C ON S.CITY = C.CITY;

-- Q88: Right join customers with salespeople.
SELECT * FROM SALESPEOPLE S
RIGHT JOIN CUST C ON S.SNUM = C.SNUM;

-- Q89: Full outer join (if supported).
SELECT * FROM SALESPEOPLE S
FULL OUTER JOIN CUST C ON S.SNUM = C.SNUM;