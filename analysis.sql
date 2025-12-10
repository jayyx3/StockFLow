SELECT * FROM inventory.warehouse;
SELECT * from inventory.category;
SELECT * from inventory.product;
SELECT * from inventory.customer;
SELECT * from inventory.warehouse;
SELECT * from inventory.order_details;

-- Retrieve all product information, including its category and inventory levels

WITH INVENTORY AS (
    SELECT PRODUCTID, SUM(QuantityAvailable) AS QUANTITY
    FROM inventory
    GROUP BY 1
)

SELECT p.productid,
       p.productname,
       c.categoryname,
       i.QUANTITY
FROM product AS p
JOIN category c ON c.CategoryID = p.CategoryID
JOIN INVENTORY i ON i.PRODUCTID = p.ProductID;

-- ## Get all orders placed by customers, showing product names, order date, and quantity ordered

SELECT C.customername,
       p.productname,
       o.orderdate,
       o.QuantityOrdered
FROM order_details AS o
JOIN customer AS c ON o.CustomerID = c.customerid
JOIN product AS p ON p.productid = o.ProductID;

-- Find products that are below their reorder level in inventory

SELECT p.productname,
       p.ReorderLevel,
       i.QuantityAvailable
FROM product p
JOIN inventory AS i ON i.ProductID = p.productid
WHERE p.ReorderLevel > i.QuantityAvailable;

-- List all customers who have placed an order, along with their contact information

SELECT c.customerid,
       c.customername,
       c.phone,
       c.email,
       c.address,
       o.QuantityOrdered,
       o.OrderID,
       o.OrderDate
FROM customer AS c
JOIN order_details o ON o.CustomerID = c.CustomerID;

 -- Total quantity of products ordered by per customer and month 

SELECT monthname(orderdate) AS month,
       c.customername,
       SUM(o.QuantityOrdered) AS quantity
FROM customer AS c
JOIN order_details o ON o.CustomerID = c.CustomerID
GROUP BY 1, 2;

SELECT monthname(orderdate) AS month,
       SUM(o.QuantityOrdered) AS quantity
FROM customer AS c
JOIN order_details o ON o.CustomerID = c.CustomerID
GROUP BY 1;

-- check delimiter file also for this analysis part 

-- Get details of all products stored in a particular warehouse

-- check delimiter file for this analysis part 
