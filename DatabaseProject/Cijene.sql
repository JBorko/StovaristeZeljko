﻿CREATE TABLE [dbo].[Cijene]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Bruto] MONEY NOT NULL, 
    [Porez] FLOAT NOT NULL, 
    [Neto] MONEY NOT NULL
)
