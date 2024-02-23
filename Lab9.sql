--- Project ONE

---Step 3

-- Script for table creation and population
create table sales2024
(divID varchar2(10), q1 number, q2 number, q3 number, q4 number);

Insert into sales2024 
Values ('d1', 8592, 7591, 9497, 7909);

Insert into sales2024 
Values ('d1a', 5092, 4090,5995, 4406);

Insert into sales2024
Values ('d1b', 3500, 3501,3502, 3503);

Insert into sales2024 
Values ('d2', 7564, 8265,8503, 8191);

Insert into sales2024 
Values ('d3', 8496, 7720,7634, 9120);

Insert into sales2024 
Values ('d4', 7753, 8834,8603, 9124);

create table sales2025
(divID varchar2(10), q1 number, q2 number, q3 number, q4 number);

Insert into sales2025 
Values ('d1', 9145, 7874,9138, 9204);

Insert into sales2025 
Values ('d1a', 5119, 4088, 5880, 4816);

Insert into sales2025
Values ('d1b', 4033, 3786, 3251, 4388);

Insert into sales2025 
Values ('d2', 8948, 8478,8147, 8697);

Insert into sales2025 
Values ('d3', 8100, 8933,7740, 8270);

Insert into sales2025 
Values ('d4', 9217, 7799,8902, 8884);

commit;

select * from sales2024;

select * from sales2025;


---Step 4

---Row Totals

SELECT divID,
       SUM(q1 + q2 + q3 + q4) AS total_sales
FROM sales2024
GROUP BY divID;


SELECT divID,
       SUM(q1 + q2 + q3 + q4) AS total_sales
FROM sales2025
GROUP BY divID;


---Column Totals


SELECT
    SUM(q1) AS q1_total,
    SUM(q2) AS q2_total,
    SUM(q3) AS q3_total,
    SUM(q4) AS q4_total
FROM sales2024;


SELECT
    SUM(q1) AS q1_total,
    SUM(q2) AS q2_total,
    SUM(q3) AS q3_total,
    SUM(q4) AS q4_total
FROM sales2025;


---Drill Down

-- Division 'd1' drill-down
SELECT
    divID,
    q1,
    q2,
    q3,
    q4,
    q1 + q2 + q3 + q4 AS total_division_sales
FROM sales2024
WHERE divID = 'd1';

-- Region 'd1a' drill-down
SELECT
    divID,
    q1,
    q2,
    q3,
    q4,
    q1 + q2 + q3 + q4 AS total_region_sales
FROM sales2024
WHERE divID = 'd1a';

-- Region 'd1b' drill-down
SELECT
    divID,
    q1,
    q2,
    q3,
    q4,
    q1 + q2 + q3 + q4 AS total_region_sales
FROM sales2024
WHERE divID = 'd1b';



-- Division 'd1' drill-down
SELECT
    divID,
    q1,
    q2,
    q3,
    q4,
    q1 + q2 + q3 + q4 AS total_division_sales
FROM sales2025
WHERE divID = 'd1';

-- Region 'd1a' drill-down
SELECT
    divID,
    q1,
    q2,
    q3,
    q4,
    q1 + q2 + q3 + q4 AS total_region_sales
FROM sales2025
WHERE divID = 'd1a';

-- Region 'd1b' drill-down
SELECT
    divID,
    q1,
    q2,
    q3,
    q4,
    q1 + q2 + q3 + q4 AS total_region_sales
FROM sales2025
WHERE divID = 'd1b';



---Roll Up


-- Total regional sales for 'd1a' and 'd1b'
SELECT
    divID,
    SUM(q1) AS q1_total,
    SUM(q2) AS q2_total,
    SUM(q3) AS q3_total,
    SUM(q4) AS q4_total,
    SUM(q1 + q2 + q3 + q4) AS total_region_sales
FROM sales2024
WHERE divID IN ('d1a', 'd1b')
GROUP BY divID;

-- Total quarterly sales for 'd1'
SELECT
    'd1' AS divID,
    SUM(q1) AS q1_total,
    SUM(q2) AS q2_total,
    SUM(q3) AS q3_total,
    SUM(q4) AS q4_total,
    SUM(q1 + q2 + q3 + q4) AS total_quarterly_sales
FROM sales2024
WHERE divID = 'd1';


-- Total regional sales for 'd1a' and 'd1b'
SELECT
    divID,
    SUM(q1) AS q1_total,
    SUM(q2) AS q2_total,
    SUM(q3) AS q3_total,
    SUM(q4) AS q4_total,
    SUM(q1 + q2 + q3 + q4) AS total_region_sales
FROM sales2025
WHERE divID IN ('d1a', 'd1b')
GROUP BY divID;

-- Total quarterly sales for 'd1'
SELECT
    'd1' AS divID,
    SUM(q1) AS q1_total,
    SUM(q2) AS q2_total,
    SUM(q3) AS q3_total,
    SUM(q4) AS q4_total,
    SUM(q1 + q2 + q3 + q4) AS total_quarterly_sales
FROM sales2025
WHERE divID = 'd1';



---Slicing


-- Slicing activity for Q1 in sales2024
SELECT
    divID,
    q1 AS sales_q1
FROM sales2024;



-- Slicing activity for Q1 in sales2025
SELECT
    divID,
    q1 AS sales_q1
FROM sales2025;



---Dicing

-- Intersection of 'd1' division and Q1 for the year 2024
SELECT
    q1 AS sales_q1
FROM sales2024
WHERE divID = 'd1';

commit;
