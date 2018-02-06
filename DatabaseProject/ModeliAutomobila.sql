CREATE TABLE [dbo].[ModeliAutomobila]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Naziv] VARCHAR(50) NOT NULL, 
    [MarkaAutomobila] INT NOT NULL,
	CONSTRAINT MODEL_MARKA_AUTOMOBILA_FK FOREIGN KEY (MarkaAutomobila) REFERENCES MarkeAutomobila(id)
)
