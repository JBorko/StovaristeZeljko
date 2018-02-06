CREATE TABLE [dbo].[BankovniNalozi]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [BrojZiroRacuna] VARCHAR(50) NOT NULL, 
    [NazivVlasnika] VARCHAR(50) NOT NULL, 
    [NazivBanke] VARCHAR(50) NOT NULL, 
    [Drzava] NCHAR(10) NOT NULL 
)
