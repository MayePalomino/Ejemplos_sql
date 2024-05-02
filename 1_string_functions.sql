use Adventureworks2022;

-- 2. Second character is 'r'
select * from Production.Product
where ProductNumber like '_r%'

-- 3. Fourth character is 'u'
select * from Production.Product
where ProductNumber like '___u%'

-- 4. Posicion de primera ocurrencia de una cadena dentro de otra cadena
select distinct CHARINDEX('-',ProductNumber) from production.product
