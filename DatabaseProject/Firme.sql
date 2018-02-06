﻿CREATE TABLE [dbo].[Firme]
(
	[PIB] VARCHAR(50) NOT NULL PRIMARY KEY, 
    [Naziv] VARCHAR(50) NOT NULL, 
    [Fax] VARCHAR(50) NULL, 
    [Mejl] VARCHAR(50) NULL, 
    [Rabat] INT NULL,
	CONSTRAINT FIRME_RABAT_FK FOREIGN KEY (Rabat) REFERENCES Rabati(id)
)
