-- Insertar categorías
INSERT INTO Categoria (Nombre)
VALUES
    ('Electrónica'),
    ('Ropa'),
    ('Alimentos');

-- Insertar marcas
INSERT INTO Marca (Nombre)
VALUES
    ('Marca1'),
    ('Marca2'),
    ('Marca3'),
    ('Marca4');

-- Insertar productos
DECLARE @i INT = 1;
WHILE @i <= 20
BEGIN
    INSERT INTO Producto (Nombre, Descripcion, Precio, CategoriaID, MarcaID)
    VALUES
        ('Producto' + CAST(@i AS VARCHAR), 
         'Descripción del producto ' + CAST(@i AS VARCHAR), 
         RAND() * 1000, 
         (SELECT TOP 1 CategoriaID FROM Categoria ORDER BY NEWID()), 
         (SELECT TOP 1 MarcaID FROM Marca ORDER BY NEWID()));
    
    SET @i = @i + 1;
END;

