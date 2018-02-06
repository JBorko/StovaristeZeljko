﻿/*
Deployment script for stovariste_dev_db

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "stovariste_dev_db"
:setvar DefaultFilePrefix "stovariste_dev_db"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column [dbo].[Automobili].[Cijena] on table [dbo].[Automobili] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Automobili])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Dijelovi].[Cijena] on table [dbo].[Dijelovi] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Dijelovi])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Altering [dbo].[Automobili]...';


GO
ALTER TABLE [dbo].[Automobili]
    ADD [Cijena] INT NOT NULL;


GO
PRINT N'Altering [dbo].[Dijelovi]...';


GO
ALTER TABLE [dbo].[Dijelovi]
    ADD [Cijena] INT NOT NULL;


GO
PRINT N'Creating [dbo].[AUTOMOBIL_CIJENA_FK]...';


GO
ALTER TABLE [dbo].[Automobili] WITH NOCHECK
    ADD CONSTRAINT [AUTOMOBIL_CIJENA_FK] FOREIGN KEY ([Cijena]) REFERENCES [dbo].[Cijene] ([Id]);


GO
PRINT N'Creating [dbo].[DIO_CIJENA_FK]...';


GO
ALTER TABLE [dbo].[Dijelovi] WITH NOCHECK
    ADD CONSTRAINT [DIO_CIJENA_FK] FOREIGN KEY ([Cijena]) REFERENCES [dbo].[Cijene] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Automobili] WITH CHECK CHECK CONSTRAINT [AUTOMOBIL_CIJENA_FK];

ALTER TABLE [dbo].[Dijelovi] WITH CHECK CHECK CONSTRAINT [DIO_CIJENA_FK];


GO
PRINT N'Update complete.';


GO