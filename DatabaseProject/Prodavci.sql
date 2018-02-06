CREATE TABLE [dbo].[Prodavci]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Naziv] VARCHAR(50) NOT NULL, 
    [Opis] TEXT NULL, 
    [BrojTelefona] VARCHAR(50) NULL, 
    [BankovniNalog] INT NULL,
	CONSTRAINT PRODAVAC_BANK_NALOG FOREIGN KEY (BankovniNalog) REFERENCES BankovniNalozi(id)
)
