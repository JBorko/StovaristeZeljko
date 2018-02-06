CREATE TABLE [dbo].[Prodavci]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Naziv] VARCHAR(50) NOT NULL, 
    [Opis] TEXT NULL, 
    [BrojTelefona] VARCHAR(50) NULL
)
