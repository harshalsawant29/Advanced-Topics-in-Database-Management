---------------- Step 1 --------------

----------- suppliers table -------------

CREATE TABLE SUPPLIERS
(SUPPLIER_ID INT PRIMARY KEY,
SUPPLIER_NAME VARCHAR(25),
LOCATION_CODE INT,
CONTACT_PERSON VARCHAR(25),
OTHER_DETAILS VARCHAR(50));

------------- Products table ------------

CREATE TABLE PRODUCTS
(PRODUCT_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR2(25),
PRODUCT_DESCRIPTION VARCHAR2(30),
PRICE NUMBER,
SUPPLIER_ID INT CONSTRAINT FK_SUPPLIER_ID REFERENCES SUPPLIERS (SUPPLIER_ID),
STATUS VARCHAR2(20));

-------------- Customers Table -------------

CREATE TABLE CUSTOMERS
(CUSTOMER_ID INT PRIMARY KEY,
CUST_NAME VARCHAR2(50),
CUST_LOCALE INT,
PAYMENT_CODE INT,
CUST_DETAILS VARCHAR2(50));

------------- Orders Table ------------

CREATE TABLE ORDERS
( ORDER_ID INT PRIMARY KEY,
CUSTOMER_ID INT CONSTRAINT FK_CUSTOMER_ID REFERENCES CUSTOMERS(CUSTOMER_ID),
ORDER_STATUS VARCHAR2(25),
SALES_ID INT CONSTRAINT FK_SALES REFERENCES SALES(SALES_ID));

--------------- Invoices table -----------

CREATE TABLE INVOICES
( INVOICE_ID INT PRIMARY KEY,
CUSTOMER_ID INT CONSTRAINT FK_CUSTOMER_ID1 REFERENCES CUSTOMERS(CUSTOMER_ID),
INVOICE_AMT NUMBER,
Inv_Date Date);

------------- Shippers Table -----------

CREATE TABLE SHIPPERS
(SHIPPER_ID NUMBER PRIMARY KEY,
SHIPPER_NAME VARCHAR2(50));

------------- Order items -----------

CREATE TABLE ORDER_ITEMS
(ORDERS_ITEMS_ID INT PRIMARY KEY,
INVOICE_ID INT CONSTRAINT FK_INVOICE_ID1 REFERENCES INVOICES(INVOICE_ID),
PRODUCT_ID INT CONSTRAINT FK_PRODUCT_ID1 REFERENCES PRODUCTS(PRODUCT_ID),
QUANTITY INT);

------------ Sales table -------------

CREATE TABLE SALES
(SALES_ID INT PRIMARY KEY,
SALEPERSON VARCHAR2(50),
ORDER_STATUS VARCHAR2(25));

----------- Step 2 ---------------

------------ suppliers ----------------

INSERT INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, LOCATION_CODE, CONTACT_PERSON, OTHER_DETAILS)
VALUES (1, 'Milwaukee Tools', 60645, 'Johnny', 'N/A');

INSERT INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, LOCATION_CODE, CONTACT_PERSON, OTHER_DETAILS)
VALUES (2, 'REVL', 60656, 'Maria', 'N/A');


SELECT * FROM SUPPLIERS;

------------------ products ------------

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, PRICE, SUPPLIER_ID, STATUS)
VALUES (100, 'ReyProd', 'Wires', 500, 1, 'Ready');

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, PRICE, SUPPLIER_ID, STATUS)
VALUES (200, 'AutoProd', 'Bearings', 750, 2, 'Processing');


SELECT * FROM PRODUCTS;


---------------- customers ---------------

INSERT INTO CUSTOMERS (CUSTOMER_ID, CUST_NAME, CUST_LOCALE, PAYMENT_CODE, CUST_DETAILS)
VALUES (300, 'Michael', 17, 456, 'Wholesale Dealer');

INSERT INTO CUSTOMERS (CUSTOMER_ID, CUST_NAME, CUST_LOCALE, PAYMENT_CODE, CUST_DETAILS)
VALUES (400, 'Shawn', 20, 789, 'Mechanic');


SELECT * FROM CUSTOMERS;

------------- sales ----------

INSERT INTO SALES (SALES_ID, SALEPERSON, ORDER_STATUS)
VALUES (101, 300, 'Ready');

INSERT INTO SALES (SALES_ID, SALEPERSON, ORDER_STATUS)
VALUES (102, 400, 'Pending');


SELECT * FROM SALES;

------------ invoice -----------

INSERT INTO INVOICES (INVOICE_ID, CUSTOMER_ID, INVOICE_AMT, Inv_Date)
VALUES (101, 300, 500, '10-Dec-2022');

INSERT INTO INVOICES (INVOICE_ID, CUSTOMER_ID, INVOICE_AMT, Inv_Date)
VALUES (102, 400, 750, '20-Dec-2022');

SELECT * FROM INVOICES;

-------------- Order items -----

INSERT INTO ORDER_ITEMS (ORDERS_ITEMS_ID, INVOICE_ID, PRODUCT_ID, QUANTITY)
VALUES (901, 101, 100, 69);

INSERT INTO ORDER_ITEMS (ORDERS_ITEMS_ID, INVOICE_ID, PRODUCT_ID, QUANTITY)
VALUES (902, 102, 200, 96);


SELECT * FROM ORDER_ITEMS;

------------- shippers ------------

INSERT INTO SHIPPERS (SHIPPER_ID, SHIPPER_NAME)
VALUES (1234, 'UPS');

INSERT INTO SHIPPERS (SHIPPER_ID, SHIPPER_NAME)
VALUES (2345, 'DHL');


SELECT * FROM SHIPPERS;

-----------------  orders --------------

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_STATUS, SALES_ID)
VALUES (29, 300, 'Ready', 101);

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_STATUS, SALES_ID)
VALUES (25, 400, 'Processing', 102);


SELECT * FROM ORDERS;

Commit;
------------------ Step 3 ------------------

-----------------action 1 ---------------

-------------Insert Harshal as a new customer

INSERT INTO CUSTOMERS (CUSTOMER_ID, CUST_NAME, CUST_LOCALE, PAYMENT_CODE, CUST_DETAILS)
VALUES (29, 'Harshal', 22, 234, 'Student');

---------------Add two office supply items

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, PRICE, SUPPLIER_ID, STATUS)
VALUES (300, 'Pen', 'Ballpoint Pen', 1.5, 2, 'Ready');

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, PRODUCT_DESCRIPTION, PRICE, SUPPLIER_ID, STATUS)
VALUES (400, 'Notepad', 'A4 Notepad', 2.5, 2, 'Ready');

----------------------- Create an order for Harshal

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_STATUS, SALES_ID)
VALUES (30, 400, 'Processing', 101);

------------------Insert records in ORDER_ITEMS for the items ordered by Harshal

-------------------------- Create an invoice for Harshal's order

INSERT INTO INVOICES (INVOICE_ID, CUSTOMER_ID, INVOICE_AMT, Inv_Date)
VALUES (103, 400, 122, '09-Dec-2023');


--------------------- Harshal orders 10 Pens
INSERT INTO ORDER_ITEMS (ORDERS_ITEMS_ID, INVOICE_ID, PRODUCT_ID, QUANTITY)
VALUES (903, 103, 300, 10); 

--------------------- Harshal orders 5 Notepads
INSERT INTO ORDER_ITEMS (ORDERS_ITEMS_ID, INVOICE_ID, PRODUCT_ID, QUANTITY)
VALUES (904, 103, 400, 5); 


COMMIT;


select * from order_items;

select * from customers;


select * from invoices;

-----------------
SELECT * FROM products WHERE product_id = 300 or product_id = 400;

---------------



UPDATE ORDERS
SET ORDER_STATUS = 'Ready to ship'
WHERE ORDER_ID = 29 or ORDER_ID = 25; 

Commit;


select * from orders;

------------------

Update PRODUCTS
SET STATUS = 'Handed to shipping'
WHERE PRODUCT_ID = 300 OR PRODUCT_ID = 400;

Commit;


---------------

CREATE TABLE WAREHOUSE
(WAREHOUSE_ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR2(25),
PRODUCT_QUANTITY NUMBER);


select * from warehouse;


INSERT INTO warehouse (warehouse_id, product_name, product_quantity)
VALUES (1001, 'Pen', 100);
INSERT INTO warehouse (warehouse_id, product_name, product_quantity)
VALUES (1002, 'Notepad', 50);

commit;




Update WAREHOUSE
SET PRODUCT_QUANTITY = PRODUCT_QUANTITY - 10
WHERE PRODUCT_NAME = 'Pen';
 
Update WAREHOUSE
SET PRODUCT_QUANTITY = PRODUCT_QUANTITY - 5
WHERE PRODUCT_NAME = 'Notepad';

commit;


-------------------------

Update ORDERS
SET order_status = 'Shipped'
WHERE ORDER_ID = 30;

select * from orders;


--------------- Action 3 ------------


------------ 1 --------------

ALTER TABLE ORDERS
ADD shipping_Id INT;


Update orders
SET shipping_id = 89755
Where order_id = 30;

select * from orders;

----------------------- 2 --------------

ALTER TABLE PRODUCTS
ADD QUANTITY INT;


Update PRODUCTS
SET quantity = 100
Where product_id = 100;

Update PRODUCTS
SET quantity = 28
Where product_id = 200;

Update PRODUCTS
SET quantity = 95
Where product_id = 300;

Update PRODUCTS
SET quantity = 45
Where product_id = 400;


select * from products;


----------------- 4 --------------

ALTER TABLE WAREHOUSE
RENAME to WAREHOUSE_QUANTITY


commit;

select * from warehouse_quantity;



--------------- 5 ------------

CREATE TABLE Invoice_Detail (
    INVOICE_DETAIL_ID INT PRIMARY KEY, -- Adjust the primary key based on your needs
    INVOICE_ID INT,
    PRODUCT_ID INT,
    QUANTITY INT,
    AMOUNT DECIMAL(10, 2), -- Modify data type as needed for amount
    TAX DECIMAL(5, 2), -- Example for tax column
    DISCOUNT DECIMAL(5, 2) -- Example for discount column
);


INSERT INTO Invoice_Detail (INVOICE_DETAIL_ID, INVOICE_ID, PRODUCT_ID, QUANTITY, AMOUNT, TAX, DISCOUNT)
VALUES (1021, 101, 100, 5, 250.00, 12.50, 10.00);


select * from invoice_detail;


------------------ step 4 ---------

UPDATE shippers
SET SHIPMENT_STATUS = 'In Transit'
WHERE SHIPPER_ID = 1234; 

UPDATE shippers
SET SHIPMENT_STATUS = 'In Transit'
WHERE SHIPPER_ID = 2345;

UPDATE shippers
SET SHIPMENT_STATUS = 'Shipped'
WHERE SHIPPER_ID = 4567; 


ALTER TABLE SHIPPERS
ADD SHIPMENT_STATUS VARCHAR2(30);

INSERT INTO SHIPPERS (SHIPPER_ID, SHIPPER_NAME, SHIPMENT_STATUS)
VALUES 
    (4567, 'UPS', 'SHIPPED');

select * from shippers;


----------------
select * from orders;


------------------ lag --------
select * from shippers;


ALTER TABLE shippers
ADD SHIPMENT_DATE DATE;

INSERT INTO shippers (SHIPPER_ID, SHIPMENT_DATE)
VALUES (1234, '2023-12-31'); -- Replace '2023-12-31' with the specific date



-- Update SHIPMENT_DATE for SHIPPER_ID 1234
UPDATE shippers
SET SHIPMENT_DATE = '31-dec-2023' -- Replace with the specific date
WHERE SHIPPER_ID = 1234;

-- Update SHIPMENT_DATE for SHIPPER_ID 2345
UPDATE shippers
SET SHIPMENT_DATE = '30-dec-2023' -- Replace with the specific date
WHERE SHIPPER_ID = 2345;

-- Update SHIPMENT_DATE for SHIPPER_ID 4567
UPDATE shippers
SET SHIPMENT_DATE = '29-dec-2023' -- Replace with the specific date
WHERE SHIPPER_ID = 4567;


commit;


select SHIPMENT_DATE, 
SHIPMENT_DATE - LAG(SHIPMENT_DATE) OVER (ORDER BY SHIPMENT_DATE) AS lag_time
FROM Shippers;

---------------








-- Adding sample ORDER_DATE for Shipper ID 1234
UPDATE shippers
SET ORDER_DATE = '2023-12-01' -- Replace with a specific order date
WHERE SHIPPER_ID = 1234;

-- Adding sample ORDER_DATE for Shipper ID 2345
UPDATE shippers
SET ORDER_DATE = '2023-11-15' -- Replace with a specific order date
WHERE SHIPPER_ID = 2345;

-- Adding sample ORDER_DATE for Shipper ID 4567
UPDATE shippers
SET ORDER_DATE = '2023-10-20' -- Replace with a specific order date
WHERE SHIPPER_ID = 4567;

-- Adding sample DELIVERY_DATE for Shipper ID 1234
UPDATE shippers
SET DELIVERY_DATE = '2024-01-01' -- Replace with a specific delivery date
WHERE SHIPPER_ID = 1234;

-- Adding sample DELIVERY_DATE for Shipper ID 2345
UPDATE shippers
SET DELIVERY_DATE = '2023-12-05' -- Replace with a specific delivery date
WHERE SHIPPER_ID = 2345;

-- Adding sample DELIVERY_DATE for Shipper ID 4567
UPDATE shippers
SET DELIVERY_DATE = '2023-11-10' -- Replace with a specific delivery date
WHERE SHIPPER_ID = 4567;






SELECT SHIPPER_ID, Shipment_date - ORDER_DATE AS LEAD_TIME
FROM shippers
WHERE SHIPPER_ID IN (1234, 2345, 4567);
