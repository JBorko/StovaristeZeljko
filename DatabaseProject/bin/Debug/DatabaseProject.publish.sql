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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Adrese]...';


GO
CREATE TABLE [dbo].[Adrese] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [Ulica]         VARCHAR (50) NOT NULL,
    [Broj]          INT          NOT NULL,
    [Grad]          VARCHAR (50) NOT NULL,
    [Drzava]        VARCHAR (50) NOT NULL,
    [Radnik]        CHAR (13)    NULL,
    [Firma]         VARCHAR (50) NULL,
    [BankovniNalog] INT          NULL,
    [Prodavac]      INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Automobili]...';


GO
CREATE TABLE [dbo].[Automobili] (
    [Id]                 INT          IDENTITY (1, 1) NOT NULL,
    [Boja]               VARCHAR (50) NULL,
    [Marka]              INT          NOT NULL,
    [ZapreminaMotoraCCM] INT          NOT NULL,
    [SnagaMotoraKW]      INT          NOT NULL,
    [VrstaGoriva]        INT          NOT NULL,
    [BrojVrata]          INT          NOT NULL,
    [TipMjenjaca]        INT          NOT NULL,
    [Kilometraza]        INT          NOT NULL,
    [KodMotora]          VARCHAR (50) NOT NULL,
    [Napomena]           TEXT         NULL,
    [Prodavac]           INT          NULL,
    [KupovnaCijena]      MONEY        NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[BankovniNalozi]...';


GO
CREATE TABLE [dbo].[BankovniNalozi] (
    [Id]             INT          IDENTITY (1, 1) NOT NULL,
    [BrojZiroRacuna] VARCHAR (50) NOT NULL,
    [NazivVlasnika]  VARCHAR (50) NOT NULL,
    [NazivBanke]     VARCHAR (50) NOT NULL,
    [Drzava]         NCHAR (10)   NOT NULL,
    [Firma]          VARCHAR (50) NULL,
    [Radnik]         CHAR (13)    NULL,
    [Kupac]          INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[BodyAndMainParts]...';


GO
CREATE TABLE [dbo].[BodyAndMainParts] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [EnNaziv]         VARCHAR (50) NOT NULL,
    [SrNaziv]         VARCHAR (50) NULL,
    [StepenOstecenja] SMALLINT     NULL,
    [Slika]           VARCHAR (50) NULL,
    [Automobil]       INT          NOT NULL,
    [Prodavac]        INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[BrojeviVrata]...';


GO
CREATE TABLE [dbo].[BrojeviVrata] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [OpisniBroj] VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Cijene]...';


GO
CREATE TABLE [dbo].[Cijene] (
    [Id]    INT        IDENTITY (1, 1) NOT NULL,
    [Bruto] MONEY      NOT NULL,
    [Porez] FLOAT (53) NOT NULL,
    [Neto]  MONEY      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Firme]...';


GO
CREATE TABLE [dbo].[Firme] (
    [PIB]   VARCHAR (50) NOT NULL,
    [Naziv] VARCHAR (50) NOT NULL,
    [Fax]   VARCHAR (50) NULL,
    [Mejl]  VARCHAR (50) NULL,
    [Rabat] INT          NULL,
    PRIMARY KEY CLUSTERED ([PIB] ASC)
);


GO
PRINT N'Creating [dbo].[GodineProizvodnje]...';


GO
CREATE TABLE [dbo].[GodineProizvodnje] (
    [Id]              INT  IDENTITY (1, 1) NOT NULL,
    [Datum]           DATE NOT NULL,
    [ModelAutomobila] INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[KorisnickiNalozi]...';


GO
CREATE TABLE [dbo].[KorisnickiNalozi] (
    [KorisnickoIme] VARCHAR (20)  NOT NULL,
    [Lozinka]       VARCHAR (20)  NOT NULL,
    [Radnik]        CHAR (13)     NULL,
    [Kupac]         INT           NULL,
    [Tip]           SMALLINT      NOT NULL,
    [Opis]          VARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([KorisnickoIme] ASC)
);


GO
PRINT N'Creating [dbo].[Kupci]...';


GO
CREATE TABLE [dbo].[Kupci] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Ime]          VARCHAR (50) NOT NULL,
    [Prezime]      VARCHAR (50) NOT NULL,
    [BrojTelefona] VARCHAR (50) NOT NULL,
    [Firma]        VARCHAR (50) NULL,
    [Mejl]         VARCHAR (50) NULL,
    [Rabat]        INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MarkeAutomobila]...';


GO
CREATE TABLE [dbo].[MarkeAutomobila] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [Naziv] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ModeliAutomobila]...';


GO
CREATE TABLE [dbo].[ModeliAutomobila] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [Naziv]           VARCHAR (50) NOT NULL,
    [MarkaAutomobila] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Prodavci]...';


GO
CREATE TABLE [dbo].[Prodavci] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Naziv]        VARCHAR (50) NOT NULL,
    [Opis]         TEXT         NULL,
    [BrojTelefona] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Rabati]...';


GO
CREATE TABLE [dbo].[Rabati] (
    [Id]       INT        IDENTITY (1, 1) NOT NULL,
    [Procenat] FLOAT (53) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Radnici]...';


GO
CREATE TABLE [dbo].[Radnici] (
    [JMBG]          CHAR (13)     NOT NULL,
    [Ime]           VARCHAR (50)  NOT NULL,
    [Prezime]       VARCHAR (50)  NOT NULL,
    [Mejl]          VARCHAR (100) NULL,
    [BrojTelefona]  VARCHAR (50)  NOT NULL,
    [KorisnickoIme] VARCHAR (20)  NOT NULL,
    [Sifra]         VARCHAR (20)  NOT NULL,
    PRIMARY KEY CLUSTERED ([JMBG] ASC)
);


GO
PRINT N'Creating [dbo].[TipoviMjenjaca]...';


GO
CREATE TABLE [dbo].[TipoviMjenjaca] (
    [Id]  INT          IDENTITY (1, 1) NOT NULL,
    [Tip] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[VrsteGoriva]...';


GO
CREATE TABLE [dbo].[VrsteGoriva] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [Naziv] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ADRESA_RADNIK_FK]...';


GO
ALTER TABLE [dbo].[Adrese]
    ADD CONSTRAINT [ADRESA_RADNIK_FK] FOREIGN KEY ([Radnik]) REFERENCES [dbo].[Radnici] ([JMBG]);


GO
PRINT N'Creating [dbo].[ADRESA_FIRMA_FK]...';


GO
ALTER TABLE [dbo].[Adrese]
    ADD CONSTRAINT [ADRESA_FIRMA_FK] FOREIGN KEY ([Firma]) REFERENCES [dbo].[Firme] ([PIB]);


GO
PRINT N'Creating [dbo].[ADRESA_BANKOVNI_NALOG_FK]...';


GO
ALTER TABLE [dbo].[Adrese]
    ADD CONSTRAINT [ADRESA_BANKOVNI_NALOG_FK] FOREIGN KEY ([BankovniNalog]) REFERENCES [dbo].[BankovniNalozi] ([Id]);


GO
PRINT N'Creating [dbo].[ADRESA_PRODAVAC_FK]...';


GO
ALTER TABLE [dbo].[Adrese]
    ADD CONSTRAINT [ADRESA_PRODAVAC_FK] FOREIGN KEY ([Prodavac]) REFERENCES [dbo].[Prodavci] ([Id]);


GO
PRINT N'Creating [dbo].[AUTOMOBIL_MARKA_AUTOMOBILA_FK]...';


GO
ALTER TABLE [dbo].[Automobili]
    ADD CONSTRAINT [AUTOMOBIL_MARKA_AUTOMOBILA_FK] FOREIGN KEY ([Marka]) REFERENCES [dbo].[MarkeAutomobila] ([Id]);


GO
PRINT N'Creating [dbo].[AUTOMOBIL_VRSTA_GORIVA_FK]...';


GO
ALTER TABLE [dbo].[Automobili]
    ADD CONSTRAINT [AUTOMOBIL_VRSTA_GORIVA_FK] FOREIGN KEY ([VrstaGoriva]) REFERENCES [dbo].[VrsteGoriva] ([Id]);


GO
PRINT N'Creating [dbo].[AUTOMOBIL_BROJEVI_VRATA_FK]...';


GO
ALTER TABLE [dbo].[Automobili]
    ADD CONSTRAINT [AUTOMOBIL_BROJEVI_VRATA_FK] FOREIGN KEY ([BrojVrata]) REFERENCES [dbo].[BrojeviVrata] ([Id]);


GO
PRINT N'Creating [dbo].[AUTOMOBIL_TIP_MJENJACA_FK]...';


GO
ALTER TABLE [dbo].[Automobili]
    ADD CONSTRAINT [AUTOMOBIL_TIP_MJENJACA_FK] FOREIGN KEY ([TipMjenjaca]) REFERENCES [dbo].[TipoviMjenjaca] ([Id]);


GO
PRINT N'Creating [dbo].[AUTOMOBIL_PRODAVAC_FK]...';


GO
ALTER TABLE [dbo].[Automobili]
    ADD CONSTRAINT [AUTOMOBIL_PRODAVAC_FK] FOREIGN KEY ([Prodavac]) REFERENCES [dbo].[Prodavci] ([Id]);


GO
PRINT N'Creating [dbo].[BANKOVI_NALOG_FIRMA_FK]...';


GO
ALTER TABLE [dbo].[BankovniNalozi]
    ADD CONSTRAINT [BANKOVI_NALOG_FIRMA_FK] FOREIGN KEY ([Firma]) REFERENCES [dbo].[Firme] ([PIB]);


GO
PRINT N'Creating [dbo].[BANKOVI_NALOG_RADNIK_FK]...';


GO
ALTER TABLE [dbo].[BankovniNalozi]
    ADD CONSTRAINT [BANKOVI_NALOG_RADNIK_FK] FOREIGN KEY ([Radnik]) REFERENCES [dbo].[Radnici] ([JMBG]);


GO
PRINT N'Creating [dbo].[BANKOVI_NALOG_KUPAC_FK]...';


GO
ALTER TABLE [dbo].[BankovniNalozi]
    ADD CONSTRAINT [BANKOVI_NALOG_KUPAC_FK] FOREIGN KEY ([Kupac]) REFERENCES [dbo].[Kupci] ([Id]);


GO
PRINT N'Creating [dbo].[DIO_AUTOMOBIL_FK]...';


GO
ALTER TABLE [dbo].[BodyAndMainParts]
    ADD CONSTRAINT [DIO_AUTOMOBIL_FK] FOREIGN KEY ([Automobil]) REFERENCES [dbo].[Automobili] ([Id]);


GO
PRINT N'Creating [dbo].[DIO_PRODAVAC_FK]...';


GO
ALTER TABLE [dbo].[BodyAndMainParts]
    ADD CONSTRAINT [DIO_PRODAVAC_FK] FOREIGN KEY ([Prodavac]) REFERENCES [dbo].[Prodavci] ([Id]);


GO
PRINT N'Creating [dbo].[FIRME_RABAT_FK]...';


GO
ALTER TABLE [dbo].[Firme]
    ADD CONSTRAINT [FIRME_RABAT_FK] FOREIGN KEY ([Rabat]) REFERENCES [dbo].[Rabati] ([Id]);


GO
PRINT N'Creating [dbo].[GODINA_PROIZVODNJE_MODEL_AUTOMOBILA_FK]...';


GO
ALTER TABLE [dbo].[GodineProizvodnje]
    ADD CONSTRAINT [GODINA_PROIZVODNJE_MODEL_AUTOMOBILA_FK] FOREIGN KEY ([ModelAutomobila]) REFERENCES [dbo].[ModeliAutomobila] ([Id]);


GO
PRINT N'Creating [dbo].[KORISNICKI_NALOG_RADNIK_FK]...';


GO
ALTER TABLE [dbo].[KorisnickiNalozi]
    ADD CONSTRAINT [KORISNICKI_NALOG_RADNIK_FK] FOREIGN KEY ([Radnik]) REFERENCES [dbo].[Radnici] ([JMBG]);


GO
PRINT N'Creating [dbo].[KORISNICKI_NALOG_KUPAC_FK]...';


GO
ALTER TABLE [dbo].[KorisnickiNalozi]
    ADD CONSTRAINT [KORISNICKI_NALOG_KUPAC_FK] FOREIGN KEY ([Kupac]) REFERENCES [dbo].[Kupci] ([Id]);


GO
PRINT N'Creating [dbo].[KUPAC_FIRMA_FK]...';


GO
ALTER TABLE [dbo].[Kupci]
    ADD CONSTRAINT [KUPAC_FIRMA_FK] FOREIGN KEY ([Firma]) REFERENCES [dbo].[Firme] ([PIB]);


GO
PRINT N'Creating [dbo].[KUPAC_RABAT_FK]...';


GO
ALTER TABLE [dbo].[Kupci]
    ADD CONSTRAINT [KUPAC_RABAT_FK] FOREIGN KEY ([Rabat]) REFERENCES [dbo].[Rabati] ([Id]);


GO
PRINT N'Creating [dbo].[MODEL_MARKA_AUTOMOBILA_FK]...';


GO
ALTER TABLE [dbo].[ModeliAutomobila]
    ADD CONSTRAINT [MODEL_MARKA_AUTOMOBILA_FK] FOREIGN KEY ([MarkaAutomobila]) REFERENCES [dbo].[MarkeAutomobila] ([Id]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ba43c4c2-7ff2-4c77-a746-cfdc673206f6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ba43c4c2-7ff2-4c77-a746-cfdc673206f6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3081e959-b702-4ddb-84b2-014df0f5df7a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3081e959-b702-4ddb-84b2-014df0f5df7a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '12d66d3a-95a4-4863-9795-a4f83ed5efcb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('12d66d3a-95a4-4863-9795-a4f83ed5efcb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b7bdd3b1-88d6-4784-9002-c096efd15a6e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b7bdd3b1-88d6-4784-9002-c096efd15a6e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2ca2660c-f76b-48fb-aea6-8f848f73edd0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2ca2660c-f76b-48fb-aea6-8f848f73edd0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c6f13389-3187-40ba-9c31-ed3396b93bae')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c6f13389-3187-40ba-9c31-ed3396b93bae')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '958f23b7-9853-4121-9791-ea28a10121b8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('958f23b7-9853-4121-9791-ea28a10121b8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b2352e5e-add7-4119-a00d-ce4ad8b7721c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b2352e5e-add7-4119-a00d-ce4ad8b7721c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '70653c3a-d995-4caf-9352-cdc05ffa1fed')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('70653c3a-d995-4caf-9352-cdc05ffa1fed')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '57110cec-5727-40cb-be2f-c5beebe73e5f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('57110cec-5727-40cb-be2f-c5beebe73e5f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2e8b1b71-0b29-4dde-8057-bd005a1049a3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2e8b1b71-0b29-4dde-8057-bd005a1049a3')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO