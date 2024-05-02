use AdventureWorks2022;
/*
Se utiliza una common table expression para filtrar
los empleados contratados en el año más antiguo de contrato 
de la tabla employees y se calcula un incremento salarial del 50%
*/
WITH OldestEmployees AS (
    SELECT        
        E.BusinessEntityID,
        P.FirstName,
        P.LastName,
        E.HireDate,
        EPH.Rate AS Salary
    FROM 
        Person.Person P
    JOIN 
        HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID
    JOIN 
        HumanResources.EmployeePayHistory EPH ON E.BusinessEntityID = EPH.BusinessEntityID
    WHERE 
        year(E.HireDate) = (SELECT year(MIN(HireDate)) FROM HumanResources.Employee)
		-- filtrar los empleados del primer año que se hicieron contratos
)
SELECT    
    OE.FirstName,
    OE.LastName,
    OE.HireDate,
    OE.Salary,
    format(OE.Salary * 1.5,'00.00') AS IncrementedSalary
FROM 
    OldestEmployees OE;

	
