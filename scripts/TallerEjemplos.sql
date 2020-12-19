SELECT 'Hello World' as Mensaje

declare @num1 int=10,@num2 int=3

/*
declare @num1 varchar(100)='dev',
        @num2 varchar(100)='master'
*/
select @num1+@num2,@num1-@num2,
       @num1*@num2,@num1/@num2,
       @num1%@num2

go

declare @num1 int=10,@num2 int=3

GO

select ListPrice,1.10*ListPrice
from SalesLT.Product

/*Cálculos en TSQL (PAC)*/
declare @t1 int=1,@r int=3,@n int=201

select @t1+(@n-1)*@r as TN
go

select 1+(201-1)*3

/*Elementos de la clausula SELECT*/
select ProductCategoryID as PCID,
       count(ProductID) as total,
       count(ProductID)*1.1 as total2
from SalesLT.Product
where ListPrice>100 
group by ProductCategoryID
having count(ProductID)>10
order by total asc
/*
select ProductCategoryID,ProductID
from SalesLT.Product
order by  ProductCategoryID,ProductID
*/

/*Uso de DISTINCT*/
select distinct color from SalesLT.Product
order by color

select count(distinct ProductCategoryID)
from SalesLT.Product
order by ProductCategoryID

select distinct color,size from SalesLT.Product
order by color,size

select count(*) from
(select distinct color,size from SalesLT.Product) rp

select isnull(color,'Sin definir') as color,
       count(ProductID) 
from SalesLT.Product
group by color

/*Uso de alias*/
select cu.CustomerID 'CodCliente',
       concat(Title,' ',FirstName,' ',LastName) as Cliente,
       'Compañia'=CompanyName,
       CompanyName as [Mi Compañia]
--from SalesLT.Customer cu
from SalesLT.Customer as cu
where CustomerID=21

/*Expresiones CASE*/
select AddressID,AddressLine1,CountryRegion,
case 
    when CountryRegion='United States' then 'US'
    when CountryRegion='Canada' then 'CA'
    else 'NN'
end as CC1,
case CountryRegion
    when 'United States' then 'US'
    when 'Canada' then 'CA'
    else 'NN'
end as CC2,
IIF(CountryRegion='United States','US',
    IIF(CountryRegion='Canada','CA','NN')
   ) as CC3
from SalesLT.Address

/*Uso de ORDER BY*/
select SalesOrderID,OrderQty,UnitPrice
from SalesLT.SalesOrderDetail
--order by SalesOrderID asc
--order by UnitPrice desc
order by SalesOrderID desc,OrderQty desc,
UnitPrice asc

select * from SalesLT.Product
order by Name desc

select SellStartDate from SalesLT.Product
--order by SellStartDate desc --Más reciente a más antiguo
order by SellStartDate asc  --Más antiguo a más reciente

/*Predicados y operadores*/
select ProductID,color,size from SalesLT.Product
where color='Black' and ProductID=680

select ProductID,color,size from SalesLT.Product
where color='Black' or ProductID=680

select ProductID,color,size from SalesLT.Product
where NOT(color='Black' and ProductID=680)