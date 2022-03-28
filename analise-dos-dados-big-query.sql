-- Query 1 - Escreva uma query que retorna a quantidade de linhas na tabela Sales.SalesOrderDetail pelo campo SalesOrderID, desde que tenham pelo menos três linhas de detalhes

Select 
	count(1) as number_rows 
from (
	Select 
		SalesOrderID
	From `teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderDetail` 
	Group By SalesOrderID
	having count(SalesOrderDetailID) > 3
) t

-- Query 2 - Escreva uma query que ligue as tabelas Sales.SalesOrderDetail, Sales.SpecialOfferProduct e Production.Product e retorne os 3 produtos (Name) mais vendidos 
--			 (pela soma de OrderQty), agrupados pelo número de dias para manufatura (DaysToManufacture).

Select 
	PROD.Name
From `teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderDetail` as SOD
Inner Join 
	`teste-roxpartner.bicyclesales_roxpartner.Production_Product` as PROD 
on 
	PROD.ProductID = SOD.ProductID
Inner Join 
	`teste-roxpartner.bicyclesales_roxpartner.Sales_SpecialOfferProduct` as SOP 
on 
	SOP.ProductID = SOD.ProductID
Group by PROD.DaysToManufacture, 
		 PROD.Name
Order by sum(cast(OrderQty as int)) desc
LIMIT 3

-- Query 3 - Escreva uma query ligando as tabelas Person.Person, Sales.Customer e Sales.SalesOrderHeader de forma a obter uma lista de nomes de clientes e uma contagem de pedidos efetuados.

BEGIN
    CREATE TEMP TABLE TMP_TotalOrders AS
    Select 
    	CustomerID, 
    	count(customerID) 	as num_orders, 
    	sum(totaldue) 		as tot_price
	From `teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderHeader`
	Group by customerID
;
Select C.CustomerID
	   ,P.FirstName
	   ,P.MiddleName
	   ,P.LastName
	   ,T.num_orders
	   ,T.tot_price
From `teste-roxpartner.bicyclesales_roxpartner.Person_Person` as P
Inner Join 
	`teste-roxpartner.bicyclesales_roxpartner.Sales_Customer` as C 
on 
	C.PersonID = P.BusinessEntityID
Inner Join 
	`teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderHeader` as SOH 
on 
	SOH.CustomerID = C.CustomerID
Inner Join 
	TMP_TotalOrders as T 
on 
	T.CustomerID = C.CustomerID
Order By T.num_orders, 
		 T.tot_price desc
;END

-- Query 4 - Escreva uma query usando as tabelas Sales.SalesOrderHeader, Sales.SalesOrderDetail e Production.Product, de forma a obter a soma total de produtos (OrderQty) por ProductID e OrderDate.

Select 
	SOD.ProductID, 
	sum(cast(OrderQty as int)) as Tot_Prod_byID_Date
From 
	`teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderDetail` as SOD
Inner Join 
	`teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderHeader` as SOH 
on 
	SOH.SalesOrderID = SOD.SalesOrderID
Inner Join 
	`teste-roxpartner.bicyclesales_roxpartner.Production_Product` as PROD 
on 
	PROD.ProductID = SOD.ProductID
Group by SOD.ProductID, 
		 SOH.OrderDate

-- Query 5 - Escreva uma query mostrando os campos SalesOrderID, OrderDate e TotalDue da tabela Sales.SalesOrderHeader. 
--			 Obtenha apenas as linhas onde a ordem tenha sido feita durante o mês de setembro/2011 e o total devido esteja acima de 1.000. Ordene pelo total devido decrescente.

Select 
	SalesOrderID, 
	OrderDate, 
	TotalDue 
From `teste-roxpartner.bicyclesales_roxpartner.Sales_SalesOrderHeader`
Where OrderDate between '2011-09-01' and '2011-09-30' 
And TotalDue > 1000
Order by TotalDue desc