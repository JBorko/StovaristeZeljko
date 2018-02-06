﻿CREATE TABLE [dbo].[GodineProizvodnje]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Datum] DATE NOT NULL, 
    [ModelAutomobila] INT NOT NULL,
	CONSTRAINT GODINA_PROIZVODNJE_MODEL_AUTOMOBILA_FK FOREIGN KEY (ModelAutomobila) REFERENCES ModeliAutomobila(id)
)

GO
