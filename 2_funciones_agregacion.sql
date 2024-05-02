/*
1. Cuantos productos salieron a la venta en cada periodo
**************************************************************
*/
select concat(month(sellstartdate),year(sellstartdate)), count(0)
from Production.Product
group by concat(month(sellstartdate),year(sellstartdate))
/*
2. Obtener la cantidad total de productos por color y tamaño, 
para items agregados durante el año 2011 y la suma
**************************************************************
*/
SELECT Color, Size, COUNT(*) AS TotalProducts 
FROM production.product 
WHERE SellStartDate >= '2011-01-01' AND SellStartDate < '2012-01-01' 
GROUP BY Color, Size
with rollup;

/*
3. Estimar el precio promedio de los productos por peso
**************************************************************
*/
SELECT round(weight,0), AVG(ListPrice) AS AvgPrice 
FROM production.product 
GROUP BY round(Weight,0);

/*
Precio maximo de productos por linea y clase
*********************************************
*/
SELECT 
	case when ProductLine is null then 'N/A' else ProductLine end as Productline
,	case when Class is null then 'N/A' else class end as Class
,	MAX(ListPrice) AS MaxPrice 
FROM production.product 
GROUP BY 
	case when ProductLine is null then 'N/A' else ProductLine end
,	case when Class is null then 'N/A' else class end 
order by ProductLine , class;
