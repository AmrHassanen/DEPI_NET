<<<<<<< HEAD
---------------------------------------  Week 3 -----------------------------------------------------
--------------------------------------- Questions Using JOIN  ---------------------------------------

-------------------1. List all products with their respective categories and brands. -------------------
Select *
From production.products PP INNER JOIN production.categories PC
ON PC.category_id = PP.category_id
INNER JOIN production.brands PB
ON PB.brand_id =  PP.brand_id


------------------ 2. Find the total quantity of each product sold.
Select PP.product_id,Sum(quantity) As TOTAL_QUANTITY
From sales.order_items SOI INNER JOIN production.products PP
ON PP.product_id = SOI.product_id
group by PP.product_id
----------------- 3. Get the list of customers who have placed orders along with the store where they placed the order. ---------
Select first_name+' '+last_name as Full_Name , order_date , order_status , store_name
From sales.customers SC 
INNER JOIN sales.orders SO
ON SC.customer_id = SO.customer_id
INNER JOIN sales.stores SS
ON SS.store_id = SO.store_id

---------------- 4. Find the total sales amount for each store.  ---------------- 
Select SS.store_id,Count(order_id) AS TOTAL_SAlES
From sales.stores SS INNER JOIN sales.orders SO
ON SS.store_id = SO.store_id
Group by SS.store_id
order by SS.store_id 

---------------  5. Retrieve the details of orders along with the customer name, store name, and the staff who processed the order --------------
Select  SO.* , (SC.first_name+' '+SC.last_name) as Customer_Name ,store_name , (SST.first_name+' '+SST.last_name) AS STAFF_NAME
FROM sales.customers SC INNER JOIN sales.orders SO
ON SC.customer_id = SO.customer_id
INNER JOIN sales.stores SS
ON SS.store_id = SO.store_id
INNER JOIN sales.staffs SST
ON SS.store_id = SST.store_id

---------------   6. Get the list of products that have never been ordered.  -------------
SELECT *
FROM production.products PP
LEFT OUTER JOIN sales.order_items SO ON PP.product_id = SO.product_id
WHERE SO.product_id IS NULL;

--------------   7. Find the average price of products in each category.
Select PC.category_id, AVG(list_price) As Average_Price
From production.products PP INNER JOIN production.categories PC
ON PC.category_id = PP.category_id
Group By PC.category_id

---------------  8. List all products along with their current stock quantities. --------------
Select PP.* ,PS.quantity AS Current_Stock_Quantity
From production.products PP INNER JOIN production.stocks PS
ON PP.product_id = PS.product_id
order by Current_Stock_Quantity desc

-------------- 9. Find the number of orders placed by each customer. --------------
Select SC.customer_id, Count(*) AS Number_OF_Order
From sales.customers SC INNER JOIN sales.orders SO
ON SC.customer_id = SO.customer_id
Group by SC.customer_id

-------------  10. Get the total number of distinct products sold by each store. -------
Select SS.store_id, COUNT(DISTINCT PS.product_id) AS Total_Distinct_Products
From production.stocks PS INNER JOIN sales.stores SS
ON SS.store_id = PS.store_id
INNER JOIN production.products PP
ON PP.product_id = PS.product_id
Group by SS.store_id

--------------------------------------------------------------------------------------------------------
-------------------------------------  Questions Using LEFT JOIN ----------------------------------

------------  1. List all products along with their categories. Include products that do not belong to any category.   ---------- 

Select product_name , category_name
From production.Products PP LEFT OUTER JOIN production.categories PS
ON PS.category_id = PP.category_id

------------ 2. Find the total quantity of each product sold. Include products that have never been sold.
Select PP.product_name,SUM(quantity) AS TOTAL_QUANTITY
FROM production.products PP LEFT OUTER JOIN sales.order_items SOI
ON SOI.product_id = PP.product_id
GROUP BY product_name

------------ 3. Retrieve the details of all orders along with the . Include orders placed by customers who are not yet registered.
Select SO.* , SC.first_name +' '+SC.last_name AS customer_name
From sales.orders SO  LEFT OUTER JOIN sales.customers SC  
ON SC.customer_id =SO.customer_id

------------- 4. List all staff members along with the store they are assigned to. Include staff members who are not currently assigned to any store. ------------------
Select SS.first_name +' '+SS.last_name AS Full_Name , store_name
From sales.staffs SS LEFT OUTER JOIN sales.stores SSTO
ON SSTO.store_id = SS.store_id

------------- 5. Find the average rating of products in each category. Include categories that do not have any products yet.
Select category_name, AVG(list_price) AS Rating_Of_Products
From production.categories PS LEFT OUTER JOIN production.products PP
ON PS.category_id = PP.category_id
group by category_name

------------- 6. Get the list of all customers along with the total number of orders they have placed. Include customers who have not placed any orders.
Select SS.customer_id ,count(order_id)
From sales.customers SS LEFT OUTER JOIN sales.orders SO
ON SS.customer_id = SO.customer_id
group by SS.customer_id 


---------------------------------------------------------------------------------------------
------------------------------------ Question Using Self Join  --------------------------------------------------

--------- 1. Retrieve the names of employees along with the names of their managers.

Select MM.first_name+' '+MM.last_name AS Managers , EE.first_name+' '+EE.last_name AS Employees
From sales.staffs MM Join sales.staffs EE
ON MM.staff_id  = EE.manager_id


=======
---------------------------------------  Week 3 -----------------------------------------------------
--------------------------------------- Questions Using JOIN  ---------------------------------------

-------------------1. List all products with their respective categories and brands. -------------------
Select *
From production.products PP INNER JOIN production.categories PC
ON PC.category_id = PP.category_id
INNER JOIN production.brands PB
ON PB.brand_id =  PP.brand_id


------------------ 2. Find the total quantity of each product sold.
Select PP.product_id,Sum(quantity) As TOTAL_QUANTITY
From sales.order_items SOI INNER JOIN production.products PP
ON PP.product_id = SOI.product_id
group by PP.product_id
----------------- 3. Get the list of customers who have placed orders along with the store where they placed the order. ---------
Select first_name+' '+last_name as Full_Name , order_date , order_status , store_name
From sales.customers SC 
INNER JOIN sales.orders SO
ON SC.customer_id = SO.customer_id
INNER JOIN sales.stores SS
ON SS.store_id = SO.store_id

---------------- 4. Find the total sales amount for each store.  ---------------- 
Select SS.store_id,Count(order_id) AS TOTAL_SAlES
From sales.stores SS INNER JOIN sales.orders SO
ON SS.store_id = SO.store_id
Group by SS.store_id
order by SS.store_id 

---------------  5. Retrieve the details of orders along with the customer name, store name, and the staff who processed the order --------------
Select  SO.* , (SC.first_name+' '+SC.last_name) as Customer_Name ,store_name , (SST.first_name+' '+SST.last_name) AS STAFF_NAME
FROM sales.customers SC INNER JOIN sales.orders SO
ON SC.customer_id = SO.customer_id
INNER JOIN sales.stores SS
ON SS.store_id = SO.store_id
INNER JOIN sales.staffs SST
ON SS.store_id = SST.store_id

---------------   6. Get the list of products that have never been ordered.  -------------
SELECT *
FROM production.products PP
LEFT OUTER JOIN sales.order_items SO ON PP.product_id = SO.product_id
WHERE SO.product_id IS NULL;

--------------   7. Find the average price of products in each category.
Select PC.category_id, AVG(list_price) As Average_Price
From production.products PP INNER JOIN production.categories PC
ON PC.category_id = PP.category_id
Group By PC.category_id

---------------  8. List all products along with their current stock quantities. --------------
Select PP.* ,PS.quantity AS Current_Stock_Quantity
From production.products PP INNER JOIN production.stocks PS
ON PP.product_id = PS.product_id
order by Current_Stock_Quantity desc

-------------- 9. Find the number of orders placed by each customer. --------------
Select SC.customer_id, Count(*) AS Number_OF_Order
From sales.customers SC INNER JOIN sales.orders SO
ON SC.customer_id = SO.customer_id
Group by SC.customer_id

-------------  10. Get the total number of distinct products sold by each store. -------
Select SS.store_id, COUNT(DISTINCT PS.product_id) AS Total_Distinct_Products
From production.stocks PS INNER JOIN sales.stores SS
ON SS.store_id = PS.store_id
INNER JOIN production.products PP
ON PP.product_id = PS.product_id
Group by SS.store_id

--------------------------------------------------------------------------------------------------------
-------------------------------------  Questions Using LEFT JOIN ----------------------------------

------------  1. List all products along with their categories. Include products that do not belong to any category.   ---------- 

Select product_name , category_name
From production.Products PP LEFT OUTER JOIN production.categories PS
ON PS.category_id = PP.category_id

------------ 2. Find the total quantity of each product sold. Include products that have never been sold.
Select PP.product_name,SUM(quantity) AS TOTAL_QUANTITY
FROM production.products PP LEFT OUTER JOIN sales.order_items SOI
ON SOI.product_id = PP.product_id
GROUP BY product_name

------------ 3. Retrieve the details of all orders along with the . Include orders placed by customers who are not yet registered.
Select SO.* , SC.first_name +' '+SC.last_name AS customer_name
From sales.orders SO  LEFT OUTER JOIN sales.customers SC  
ON SC.customer_id =SO.customer_id

------------- 4. List all staff members along with the store they are assigned to. Include staff members who are not currently assigned to any store. ------------------
Select SS.first_name +' '+SS.last_name AS Full_Name , store_name
From sales.staffs SS LEFT OUTER JOIN sales.stores SSTO
ON SSTO.store_id = SS.store_id

------------- 5. Find the average rating of products in each category. Include categories that do not have any products yet.
Select category_name, AVG(list_price) AS Rating_Of_Products
From production.categories PS LEFT OUTER JOIN production.products PP
ON PS.category_id = PP.category_id
group by category_name

------------- 6. Get the list of all customers along with the total number of orders they have placed. Include customers who have not placed any orders.
Select SS.customer_id ,count(order_id)
From sales.customers SS LEFT OUTER JOIN sales.orders SO
ON SS.customer_id = SO.customer_id
group by SS.customer_id 


---------------------------------------------------------------------------------------------
------------------------------------ Question Using Self Join  --------------------------------------------------

--------- 1. Retrieve the names of employees along with the names of their managers.

Select MM.first_name+' '+MM.last_name AS Managers , EE.first_name+' '+EE.last_name AS Employees
From sales.staffs MM Join sales.staffs EE
ON MM.staff_id  = EE.manager_id


>>>>>>> f7f78c69eb03d91f167306b0622047e277718e79
