use AdventureWorks2022;
WITH RankedEmployees AS (
    SELECT        
        E.BusinessEntityID,
        P.FirstName,
        P.LastName,
        E.HireDate,
        EPH.Rate AS Salary,
        ROW_NUMBER() OVER (ORDER BY E.HireDate ASC) AS RowNumber
    FROM 
        Person.Person P
    JOIN 
        HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID
    JOIN 
        HumanResources.EmployeePayHistory EPH ON E.BusinessEntityID = EPH.BusinessEntityID
),
OldestEmployees AS (
    SELECT        
        BusinessEntityID,
        FirstName,
        LastName,
        HireDate,
        Salary,
        RowNumber
    FROM 
        RankedEmployees
    WHERE 
        RowNumber <= 3
)
SELECT    
    oe.BusinessEntityID,
	OE.FirstName,
    OE.LastName,
    OE.HireDate,
    format(OE.Salary, '00.00'),
    format(OE.Salary * 1.5,'00.00') AS IncrementedSalary
FROM 
    OldestEmployees OE;

