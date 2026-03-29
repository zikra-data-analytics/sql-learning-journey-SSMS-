
CREATE DATABASE Case_Study

USE Case_Study

SELECT * FROM fact

SELECT * FROM Product

SELECT * FROM Location

-- AGGREGATE FUNCTION

--- 1.Display the number of states present in Location table

SELECT COUNT(DISTINCT State) AS NUM_OF_STATES
FROM Location

---- 2. HOW many products are of regular type

SELECT COUNT(*) AS Reg_Prod
FROM Product
WHERE TYPE = 'REGULAR'

---- 3.How much spending has been done on marketing of product ID 1? 
SELECT SUM(Marketing) AS Total_Spend
FROM fact
WHERE ProductId = 1

---- 4.What is the minimum sales of a product 

SELECT MIN(Sales) AS Minimum_Sales
FROM fact

 ---5. Display the max Cost of Good Sold (COGS).

SELECT MAX(COGS) Max_Cost
FROM fact
---  if you want max COGS per product
SELECT ProductId, MAX(COGS) AS Max_COGS
FROM fact
GROUP BY ProductId
ORDER BY ProductId DESC

--6. Display the details of the product where product type is coffee. 

SELECT * FROM Product
WHERE Product_Type = 'COffee'

--7. Display the details where total expenses are greater than 40. 

SELECT *
FROM fact
WHERE Total_Expenses > 40

--- 8. What is the average sales in area code 179

SELECT AVG(Sales)
FROM fact
WHERE Area_Code='719'

-- 9.

SELECT SUM(f.Profit) AS Total_Profit
FROM fact f
JOIN Location l ON f.Area_Code= l.Area_Code
WHERE l.State = 'Colorado'

--SELECT AS TOT_Profit
--FROM
--WHERE State='Colorado'

-- 10. Display the average inventory for each product ID.

SELECT Productid, AVG(Inventory) AS Avg_inventory
FROM fact
GROUP BY Productid
ORDER BY Productid 

-- 11. Display state in a sequential order in a Location Table. 

SELECT *
FROM Location
ORDER BY State ASC

--12. Display the average budget margin of the Product 
-- where the average budget margin should be greater than 100.

SELECT Productid, AVG(Budget_Margin) AS avg_budget 
FROM fact
GROUP BY Productid
HAVING AVG(Budget_Margin)>100
ORDER BY Productid

--13. What is the total sales done on date 2010-01-01?

SELECT SUM(Sales) AS Total_Sales
FROM fact
WHERE Date = '2010-01-01'

-- Total sales for each date:

SELECT Date, SUM(Sales) AS Total_Sales
FROM fact
GROUP BY Date
ORDER BY Date

--14. Display the average total expense of each product ID on an individual date.

SELECT Date, Productid, AVG(Total_Expenses) AS avg_tot_exp
FROM fact
GROUP BY Date, Productid
ORDER BY Date, Productid

--15. Display the table with the following attributes 
--such as date, productID, product_type, product, sales,
--profit, state, area_code

SELECT 
    f.Date,
    f.ProductId,
    p.Product_Type,
    p.Product,
    f.Sales,
    f.Profit,
    l.State,
    f.Area_Code
FROM fact f
inner JOIN Product p ON f.ProductId = p.ProductId
inner JOIN Location l ON f.Area_Code = l.Area_Code
ORDER BY f.Date, f.ProductId