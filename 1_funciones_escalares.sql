use Adventureworks2022;

/*************************************************************************************
Contexto:	Funciones escalares en SQL Server son aquellas que toman uno o más argumentos 
			y devuelven un único valor basado en esos argumentos
			, sin afectar el estado de la base de datos.
**************************************************************************************/


/*************************************************************************************
-- I Funciones de fecha
**************************************************************************************/

-- 1. Calcular el tiempo de duración de venta de un producto, en días
SELECT name,SellStartDate,SellEndDate, DATEDIFF(DAY, SellStartDate, SellEndDate) AS DaysInMarket 
FROM Production.Product WHERE SellEndDate IS NOT NULL;

-- 2. Productos que actualmente se encuetran en venta
SELECT name,SellStartDate,SellEndDate, DATEDIFF(YEAR, SellStartDate, SellEndDate) AS YearsInMarket 
FROM Production.Product WHERE SellEndDate IS NOT NULL;

-- 3. Qué fecha resulta si agregamos 10 dias, a una fecha
SELECT name,SellStartDate, DATEADD(DAY, 10, SellStartDate) AS Dia_llegada 
FROM Production.Product WHERE SellEndDate IS NOT NULL;

-- 4. Qué fecha resulta si agregamos 10 dias a la fecha de hoy
SELECT getdate() as toda, dateadd(day, 10 ,getdate());



/*************************************************************************************
-- II Funciones numéricas
**************************************************************************************/

-- 1. Cálculo del precio promedio de todos producto en las ordenes del año 2011
SELECT AVG(ListPrice) AS AvgQtyOrdered
FROM Sales.SalesOrderDetail  s
inner join Sales.SalesOrderHeader h
on s.SalesOrderID = h.SalesOrderID
inner join Production.Product p
on s.ProductID = p.productID
WHERE YEAR(h.OrderDate) =2011;
-- 

-- 2. Suma de cantidad vendida de productos cuyo nombre contengan la palabra 'bike'
select sum(OrderQty)
-- select p.Name, OrderQty
FROM Sales.SalesOrderDetail s
inner join Production.Product p
on s.ProductID = p.productID
WHERE p.name like '%bike%'



/*************************************************************************************
-- III funciones de cadena
**************************************************************************************/

--  IV Regular expressions
-- 1. Second character is 'r'
select * from Production.Product
where ProductNumber like '_r%'

-- 2. Fourth character is 'u'
select * from Production.Product
where ProductNumber like '___u%'

-- 3. Devolver el nombre del producto y también sólo el primer nombre, a partir del espacio en blanco, en caso de encontrarse.
SELECT ProductID, name,
		CASE	WHEN CHARINDEX(' ', Name) > 0 THEN LEFT(Name, CHARINDEX(' ', Name) - 1)
				ELSE Name
				END AS FirstName
FROM Production.Product;

/*************************************************************************************
-- IV Conversión de datos
**************************************************************************************/
--  CAST: Utilizada para conversiones sin formato especifico, formato standar ANSI
SELECT CAST('2022-05-15' AS varchar) AS ConvertedDate;
--  CONVERT: Permite convertir y a la vez, formatear el argumento

SELECT CONVERT(VARCHAR, GETDATE(), 126) AS FormattedDate;




