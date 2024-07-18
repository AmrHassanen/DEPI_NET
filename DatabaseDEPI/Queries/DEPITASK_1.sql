------------------ Examples Of Select -----------------
---   1. Write a query to select all columns from the `products` table  ---------
Select * 
From production.products ;

-------   2. Write a query to select the `product_name` and `list_price` from the  `products` table. ---------
Select product_name ,list_price
From production.products ;

------   3. Write a query to select the distinct `category_id` from the `products` table.  ------
Select distinct category_id
From production.products ;

------    4. Write a query to select the `first_name` and `last_name` of customers from  the `customers` table    ------
Select first_name , last_name
From sales.customers
----------------------------------------------------------------------------------------------------------------------------
---------------------    Example Of Select Top   -----------------------------------     5. Write a query to select the top 5 products with the highest `list_price` from  the `products` table.  -----------
Select Top(5) * 
From production.products 
order by list_price desc;
------------------------------------------------------------------------------------------------------------------------------
---------------------    Exaple Of Filering With Where    -----------------------------------
--------------  6. Write a query to select all products with a `list_price` greater than 100. -----------
Select * 
From production.products 
where list_price > 100 ;

----------    7. Write a query to select all customers who live in the city 'New York'.  -----------
Select * 
From sales.customers
where city = 'New York'

----------    8. Write a query to select all orders with an `order_status` of 1.  --------------
Select *
From sales.orders
where order_status =1
-------------------------------------------------------------------------------------------------------
-----------------------       Example OF Order By      ---------------------------------
-----------     9. Write a query to select all products and order them by `list_price` indescending order  ---------
Select * 
From production.products 
Order by list_price

-----------    10. Write a query to select all customers and order them by `last_name` and then `first_name`. -------------
Select * 
From sales.customers
Order by last_name , first_name
------------------------------------------------------------------------------------------------------------------
------------------------------  Example Of Grouping -----------------------------

----------  11. Write a query to find the total `list_price` of all products grouped by`category_id`.-----------------Select category_id , SUM(list_price) As TotalPriceFrom production.products 
Group by category_id

----------  12. Write a query to find the total number of orders grouped by `customer_id`.  -------------
Select customer_id , SUM(order_id) as TotalOFOrders
From sales.orders
Group by customer_id;
----------------------------------------------------------------------------------------------------------------
---------------------------------- Example OF Having -----------------------------------------------
-----------------  13. Write a query to find the total `list_price` of all products grouped by `category_id` and show only those categories with a total `list_price` greater than 500.Select category_id , SUM(list_price) AS TOTALPRICEFrom production.products
group by category_id
Having SUM(list_price) > 500;
-----------------------------------------------------------------------------------------------------------------
----------------------------  Example Of Insertions ----------------------------
-----   14. Insert a new brand into the `brands` table with the name 'BrandX'.-------------
INSERT INTO production.brands 
Values ('BrandX')

Select * 
From production.brands

----------------      15. Insert a new category into the `categories` table with the name 'Electronics'. ----------------------------

INSERT INTO production.categories (category_name)
Values ('Electronics');

Select * 
From production.categories

-------  16. Insert a new customer into the `customers` table with the following details: first name 'Alice', last name 'Johnson', phone '987-654-3210', email alice.johnson@example.com', street '456 Elm St', city 'Othertown', state 'TX',  zip code '54321'------
INSERT INTO sales.customers
Values ('Alice','Johnson','987-654-3210','alice.johnson@example.com','456 Elm St','Othertown','TX','54321');


Select *
From sales.customers
where first_name = 'Alice';
-------------  17. Insert a new store into the `stores` table with the following details: storename 'Tech Store', phone '555-123-4567', email 'contact@techstore.com',street '789 Tech Ave', city 'Techville', state 'CA', zip code '67890'.  -----------------
INSERT INTO sales.stores
VALUES ('Tech Store', '555-123-4567','contact@techstore.com','789 Tech Ave','Techville','CA', '67890');

Select *
From sales.stores
where store_name = 'Tech Store';

------------   18. Insert a new staff member into the `staffs` table with the following details: first name 'Bob', last name 'Smith', email 'bob.smith@example.com', phone'555-987-6543', active status 1, store_id 1, manager_id NULL -----------
INSERT INTO sales.staffs
VALUES ('Bob', 'Smith','bob.smith@example.com','555-987-6543',1,1,NULL);

Select *
From sales.staffs
where first_name = 'Bob';
-------------------------------------------------------------------------------------------------------------------------------
-----------------------   Example Of Updates ----------------------------------------
---------------- 19. Update the `list_price` of the product with `product_id` 1 to 119.99. ----------
UPDATE production.products
set list_price = 199.99
where product_id = 1

select *
from production.products
where product_id =1

---------20. Update the `email` of the customer with `customer_id` 2 to 'new.email@example.com'. --------UPDATE sales.customersset email = 'new.email@example.com'where customer_id = 2 ;select *from sales.customerswhere customer_id = 2;---------- 21. Update the `phone` number of the store with `store_id` 3 to '123-456-7890'. ------------UPDATE sales.storesset phone ='123-456-7890'where store_id = 3;select *from sales.storeswhere store_id = 3;-----------   22. Update the `category_name` of the category with `category_id` 2 to 'Home Appliances'. --------UPDATE production.categoriesset category_name = 'Home Appliances'where category_id = 2;select * from production.categorieswhere category_id = 2;----------  23. Update the `active` status of all staff members in store 1 to 0. ----------
UPDATE sales.staffs
set active = 0
where store_id = 1 ;


select *
from sales.staffs
where store_id = 1
----------------------------------------------------------------------------------------------------
--------------------     Example Of Deletion   -------------------------------
----------24. Delete the brand with `brand_id` 2 from the `brands` table. ---------
Delete 
From production.brands
where brand_id = 2 ;

Select *
from production.brands

--------------------   25. Delete the category with `category_id` 3 from the `categories` table. --------
Delete 
From production.categories
where category_id = 3 ;


Select *
From production.categories

-------------------  26. Delete the customer with `customer_id` 4 from the `customers` table. ----------
Delete 
From sales.customers
where customer_id = 4;


select *
from sales.customers

---------------  27. Delete the store with `store_id` 5 from the `stores` table. -------
Delete 
From sales.stores
where store_id = 5


select *
from sales.stores

-----------------  28. Delete the staff member with `staff_id` 6 from the `staffs` table. --------
update sales.orders
set staff_id = 2
where staff_id = 6

Delete 
From sales.staffs
where staff_id = 6

select *
from sales.staffs

---------------------------------------------------------------------------------------------------------
---------------------       ### Additional Complex DML Questions    ----------------
--------     29. Insert a new order into the `orders` table with the following details:customer_id 1, order_status 1, order_date '2024-07-01', required_date'2024-07-10', shipped_date NULL, store_id 1, staff_id 1.------------------INSERT INTO sales.ordersVALUES (1,1,'2024-07-01','2024-07-10',NULL,1,1);select *from sales.orderswhere required_date = '2024-07-10'-------------      30. Update the `shipped_date` of the order with `order_id` 1 to '2024-07-05'. -----
UPDATE sales.orders	
SET shipped_date = '2024-07-05'
where order_id = 1;

select *
from sales.orders
where order_id = 1

-------------  31. Delete all orders that have an `order_status` of 3 (Rejected). ------
Delete 
From sales.orders
where order_status = 3;


select *
from sales.orders

--------------------------  32. Insert multiple products into the `products` table in a single query. -----
INSERT INTO production.products
VALUES ('product1',3,1,2021,144.99),
       ('product2',3,1,2022,155.99),
	   ('product3',3,1,2023,199.99)

select * from 
production.products
where brand_id = 3


--------------   33. Update the `quantity` of all `stocks` for the store with `store_id` 1 to 0. -------
UPDATE production.stocks
set quantity  = 0
where store_id =  1

select quantity 
from production.stocks
where store_id =1
------------------------------------------------------------------------------------------