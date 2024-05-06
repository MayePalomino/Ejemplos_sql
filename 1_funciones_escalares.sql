use Adventureworks2022;
-- I funciones de fecha
/*************************************************************************************
Contexto:	Funciones escalares en SQL Server son aquellas que toman uno o más argumentos 
			y devuelven un único valor basado en esos argumentos
			, sin afectar el estado de la base de datos.
**************************************************************************************/

-- 1. Calcular el tiempo de duración de venta de un producto, en días
SELECT DATEDIFF(DAY, SellStartDate, SellEndDate) AS DaysInMarket 
FROM Production.Product WHERE SellEndDate IS NOT NULL;

-- 2. Productos que actualmente se encuetran en venta
SELECT ProductID FROM Sales.Product WHERE SellEndDate IS NULL;

-- 3. Productos que han estado en venta por más de un año
SELECT ProductID FROM Sales.Product 
WHERE DATEDIFF(YEAR, SellStartDate, GETDATE()) >= 1 AND SellEndDate IS NOT NULL;

--  II funciones numericas
-- 1. Cálculo del precio promedio de un producto en todas las órdenes
SELECT p.name, AVG(OrderQty * UnitPrice) AS AvgPricePerOrder 
FROM Sales.SalesOrderDetail  s
inner join Production.Product p
on s.ProductID = p.productID
GROUP BY p.name order by p.Name;

-- 2. Producto más vendido en términos de cantidad
SELECT p.Name, SUM(OrderQty) AS TotalQuantity 
FROM Sales.SalesOrderDetail s
inner join Production.Product p
on s.ProductID = p.productID
GROUP BY p.name ORDER BY TotalQuantity;



--  III funciones de cadena

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





