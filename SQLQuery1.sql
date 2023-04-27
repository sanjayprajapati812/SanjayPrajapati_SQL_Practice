--Create a Parameterized Store Procedure to retrive all the OrderDetails as per Customer (If CustomerId not passed then retrive all the orders) ( Make sure to Add Everything in Single Procedure) [8]
	--Information I want : 
		--CustomerName
		--ItemName
		--Item Rate
		--Qty
		--OrderAmount (Qty * ItemRate)



use SP353SanjayPrajapati


select * from Customer
select * from OrderDetails



create or alter proc RatriveOrderDetails(@CustomerId int = null)
as
begin
SELECT C.Name as CustomerName,
		I.Name as ItemName,
		I.rate as [Item Rate],
		od.OrderQty as Qty,
		I.rate*od.OrderQty as OrderAmount

FROM OrderDetails OD 
inner join Orders O on OD.OrderId = O.Id
inner join Customer C on O.Customer = C.Id
inner join Items I on OD.ItemId = I.Id

WHERE C.Id =

CASE
WHEN @CustomerId is null  THEN C.Id
ELSE @CustomerId

END
end


exec RatriveOrderDetails 1
