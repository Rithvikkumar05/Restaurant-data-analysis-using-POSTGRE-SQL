-- Creating table named restaurant:

CREATE TABLE restaurant(
	Dates DATE,
	INVOICE_NO NUMERIC(100),
	ITEM_Name VARCHAR(1000),
	PRICE FLOAT,
	QUANTITY VARCHAR(1000),
	SUB_TOTAL FLOAT(50),
	Discount FLOAT(50),
	Tax FLOAT(50),
	Final_Total FLOAT(50),
	Table_NUMBER VARCHAR(100),
	SERVER_NAME VARCHAR(20),
	CATEGORY VARCHAR(50)
);

---------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM restaurant;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Items ordered on 21-07-2023

SELECT * FROM restaurant 
WHERE Dates ='2023-07-21';

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Customers ordered Chicken Biriyani With Raitha And Gravy

SELECT * FROM restaurant 
WHERE item_name ='Chicken Biriyani With Raitha And Gravy';

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Invoice no. and Total amount

SELECT invoice_no,SUM(final_total) FROM restaurant 
GROUP BY invoice_no;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Invoice no., Total amount and Item name

SELECT invoice_no,SUM(final_total),STRING_AGG(ITEM_Name, ', ') AS aggregated_item_names FROM restaurant 
GROUP BY invoice_no;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Invoice no., Total amount, Date and Item name

SELECT invoice_no,SUM(final_total),MIN(Dates) AS agg_date,STRING_AGG(ITEM_Name, ', ') AS aggregated_item_names FROM restaurant 
GROUP BY invoice_no;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Invoice no. with highest Total Amount

SELECT invoice_no,SUM(final_total) AS ft FROM restaurant 
GROUP BY invoice_no 
ORDER BY ft DESC
LIMIT 1;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Average total amount

SELECT AVG(final_total) as avg_amt FROM restaurant;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Total quantity of items sold per day

SELECT dates,sum(quantity) as tot_qty FROM restaurant GROUP BY dates;

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Unique items in the invoice

SELECT invoice_no,STRING_AGG(distinct item_name,',') as uni_item FROM restaurant
GROUP BY invoice_no;

---------------------------------------------------------------------------------------------------------------------------------------------------------
