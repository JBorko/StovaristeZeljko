CREATE TABLE [dbo].[Radnici]
(
	[JMBG] CHAR(13) NOT NULL PRIMARY KEY, 
    [Ime] VARCHAR(50) NOT NULL, 
    [Prezime] VARCHAR(50) NOT NULL, 
    [Mejl] VARCHAR(100) NULL, 
    [BrojTelefona] VARCHAR(50) NOT NULL, 
    [KorisnickoIme] VARCHAR(20) NOT NULL, 
    [Sifra] VARCHAR(20) NOT NULL
)
