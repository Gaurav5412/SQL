
--1 what is the total sales revenue?

SELECT 
	SUM(Quantity * Cost) AS total_revenue 
FROM 
	Sales_Data;

--2 list all the different category? 

SELECT
	Category,count(Category) AS total 
FROM
	Sales_Data
GROUP BY
	Category;

--3 Join sales tables with supervisor tables?

SELECT 
	s.Sales,
	s.Customer_Name,
	s.Product,
	s.Total_Sales,
	sup.Supervisor
FROM 
	Sales_Data s
JOIN
	Supervisor sup ON s.Supervisor=sup.Supervisor

--4 what is the total sales by particular supervisor?

SELECT 
	s.Supervisor,COUNT(Total_Sales) as total_sales
FROM 
	Sales_Data s
JOIN
	Supervisor sup ON s.Supervisor=sup.Supervisor
GROUP BY
	s.Supervisor

--5 Top 5 sales by supervisor?

SELECT
	TOP 5
	s.Customer_Name,
	S.Total_Sales,
	s.Status,
	s.Product,
	s.Category,
	sup.Supervisor
FROM
	Sales_Data s
JOIN
	Supervisor sup ON s.Supervisor=sup.Supervisor
ORDER BY 
	sup.Supervisor,s.Total_Sales DESC

--6 list the customer name whose parcel was delivered?

SELECT 
	Customer_Name,Status 
FROM
	Sales_Data
WHERE
	Status='Delivered'

--7 find the supervisor name and whose selled maximum total sales ?

SELECT 
	TOP 5 
	Total_Sales,
	Supervisor 
FROM
	Sales_Data
WHERE
	Total_Sales>=50000

--8 find the total profit in each items?

SELECT *,
	(Total_Sales - Total_Cost) AS Total_Profit
FROM 
	Sales_Data 

--9 find the average sales amount per state ?

SELECT 
	s.State_Code,AVG(Total_Sales) AS Average_Sales
FROM 
	Sales_Data s
JOIN
	State_list st ON s.State_Code=st.State_Code
GROUP BY
	s.State_Code

--10 what is the count of sales records per state?

SELECT
	st.State,count(s.Total_Sales) AS Number_of_Sales
FROM 
	Sales_Data s
JOIN
	State_list st ON s.State_Code=st.State_Code
GROUP BY
	st.State

