---Orders by year, Online vs non-online orders
select year(h.OrderDate) as Order_Year, 
       sum(d.OrderQty) AS Total_Qty, 
       sum(d.OrderQty * d.UnitPrice) as Total_Amt,
       count(CASE when h.OnlineOrderFlag = 1 then h.SalesOrderID END) AS Online_Ordres
from Sales.SalesOrderHeader h
Join Sales.SalesOrderDetail d
on h.SalesOrderID = d.SalesOrderID
Group by year(h.OrderDate)
ORDER BY Order_Year;

--Territory performance
---For each TerritoryID: total revenue, total orders, average order value
select t.Name,
       year(h.OrderDate) as Order_Year,
       Round(sum(d.OrderQty * d.UnitPrice),0) as Total_Amt,
       sum(d.OrderQty) AS Total_Order_Qty,
       Round(AVG(d.OrderQty * d.UnitPrice),0) as Avg_order_value
from Sales.SalesOrderHeader h
Join Sales.SalesOrderDetail d
on h.SalesOrderID = d.SalesOrderID
join sales.SalesTerritory t
on h.TerritoryID = t.TerritoryID
group by t.Name, year(h.OrderDate)
ORDER BY Order_Year;
