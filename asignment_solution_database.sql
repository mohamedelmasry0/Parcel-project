-- a.	Give the total number of arrived orders in a Point of Sale
SELECT COUNT(*) FROM parcel.store
-- b.	Give the total number of arrived orders for one specific customer
SELECT COUNT(*) FROM parcel.orders WHERE customer_id = 1
-- a.	Build a search query that will be able to look for customer orders by date, name, or article (like in a simple search query : demo)
SELECT parcel.orders.article, parcel.customer.username, parcel.orders.creation_date
FROM parcel.orders
INNER JOIN parcel.customer ON parcel.orders.customer_id=customer.customer_id where  parcel.customer.username='Martin Martin' 
 or parcel.orders.creation_date='2021-01-30' or parcel.orders.article='shoes' ;
 
--  b.	Build a search query that can take at least 2 of the parameters cited in the previous question, 
-- leaving the other search parameters optional (like in an advanced search : demo)
SELECT parcel.orders.article, parcel.customer.username, parcel.orders.creation_date
FROM parcel.orders
INNER JOIN parcel.customer ON parcel.orders.customer_id=customer.customer_id where  parcel.customer.username='Martin Martin' 
 and parcel.orders.creation_date='2021-01-30' or (parcel.orders.article is null or parcel.orders.article = 'shoes') ;
--  c.	For a specific customer, display the list of orders with the following information :
-- 	Parcel number
-- 	Order number
-- 	Customer name
-- 	Last Status Date (arrival date)
-- 	Parcel Status
SELECT parcel.pracels.pracels_id, parcel.pracels.order_id, parcel.pracels.customer_id , parcel.pracels.current_state, parcel.orders.completion_date, parcel.customer.username
FROM parcel.pracels
INNER JOIN parcel.customer ON parcel.parcels.customer_id=parcel.customer.customer_id
inner join parcel.orders on parcel.customer.customer_id=orders.customer_id
where  parcel.customer.username='Martin Martin' 
and parcel.orders.creation_date='2021-01-30' and parcel.orders.current_state='delivered' or (parcel.orders.article is null or parcel.orders.article = 'shoes') ;