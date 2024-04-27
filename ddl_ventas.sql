USE DEMODB;
CREATE TABLE Categoria (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Marca (
    MarcaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Producto (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    CategoriaID INT,
    MarcaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID),
    FOREIGN KEY (MarcaID) REFERENCES Marca(MarcaID)
);
