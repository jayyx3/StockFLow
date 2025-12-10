DELIMITER //

CREATE PROCEDURE month_quantity(IN months VARCHAR(50))
BEGIN
    SELECT 
        MONTHNAME(o.orderdate) AS month,
        SUM(o.QuantityOrdered) AS quantity
    FROM 
        customer as c
        JOIN order_details o ON o.CustomerID = c.CustomerID
    WHERE 
        MONTHNAME(o.orderdate) = months
    GROUP BY 1;
END; //



DELIMITER //

CREATE PROCEDURE location_stock(IN locations VARCHAR(50))
BEGIN
    SELECT 
        p.productname,
        i.QuantityAvailable,
        w.WarehouseName,
        w.location
    FROM 
        warehouse w
        JOIN inventory AS i ON i.warehouseid = w.Warehouseid
        JOIN product AS p ON i.ProductID = p.ProductID
    WHERE 
        w.location = locations;
END; //

call location_stock('Pune')


DELIMITER //

CREATE PROCEDURE product_location(IN product_id VARCHAR(50))
BEGIN
    SELECT 
        p.productname,
        i.QuantityAvailable,
        w.WarehouseName,
        w.location
    FROM 
        warehouse w
        JOIN inventory AS i ON i.warehouseid = w.Warehouseid
        JOIN product AS p ON i.ProductID = p.ProductID
    WHERE 
        p.productid = product_id;
END; //

call product_location('IN12FacMou')