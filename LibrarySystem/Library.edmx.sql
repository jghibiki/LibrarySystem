
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/19/2015 15:01:31
-- Generated from EDMX file: C:\Users\ACM Admin\Source\Repos\LibrarySystem\LibrarySystem\LibrarySystem\Library.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LibraryEntities];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerResevation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Resevations] DROP CONSTRAINT [FK_CustomerResevation];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerCheckedOut]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CheckedOuts] DROP CONSTRAINT [FK_CustomerCheckedOut];
GO
IF OBJECT_ID(N'[dbo].[FK_LibrarianCheckedOut]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CheckedOuts] DROP CONSTRAINT [FK_LibrarianCheckedOut];
GO
IF OBJECT_ID(N'[dbo].[FK_CheckedOutOverDue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OverDues] DROP CONSTRAINT [FK_CheckedOutOverDue];
GO
IF OBJECT_ID(N'[dbo].[FK_CopyMedia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Copies] DROP CONSTRAINT [FK_CopyMedia];
GO
IF OBJECT_ID(N'[dbo].[FK_CopyResevation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Copies] DROP CONSTRAINT [FK_CopyResevation];
GO
IF OBJECT_ID(N'[dbo].[FK_CopyCheckedOut]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Copies] DROP CONSTRAINT [FK_CopyCheckedOut];
GO
IF OBJECT_ID(N'[dbo].[FK_Book_inherits_Media]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Media_Book] DROP CONSTRAINT [FK_Book_inherits_Media];
GO
IF OBJECT_ID(N'[dbo].[FK_Video_inherits_Media]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Media_Video] DROP CONSTRAINT [FK_Video_inherits_Media];
GO
IF OBJECT_ID(N'[dbo].[FK_Audio_inherits_Media]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Media_Audio] DROP CONSTRAINT [FK_Audio_inherits_Media];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Librarians]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Librarians];
GO
IF OBJECT_ID(N'[dbo].[Resevations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Resevations];
GO
IF OBJECT_ID(N'[dbo].[CheckedOuts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CheckedOuts];
GO
IF OBJECT_ID(N'[dbo].[OverDues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OverDues];
GO
IF OBJECT_ID(N'[dbo].[Copies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Copies];
GO
IF OBJECT_ID(N'[dbo].[Media]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Media];
GO
IF OBJECT_ID(N'[dbo].[Media_Book]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Media_Book];
GO
IF OBJECT_ID(N'[dbo].[Media_Video]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Media_Video];
GO
IF OBJECT_ID(N'[dbo].[Media_Audio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Media_Audio];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [JoinDate] datetime  NOT NULL
);
GO

-- Creating table 'Librarians'
CREATE TABLE [dbo].[Librarians] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Resevations'
CREATE TABLE [dbo].[Resevations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [ReservationDate] nvarchar(max)  NOT NULL,
    [CustomerId] int  NOT NULL
);
GO

-- Creating table 'CheckedOuts'
CREATE TABLE [dbo].[CheckedOuts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IssuedDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [CustomerId] int  NOT NULL,
    [LibrarianId] int  NOT NULL
);
GO

-- Creating table 'OverDues'
CREATE TABLE [dbo].[OverDues] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReturnDate] datetime  NOT NULL,
    [CheckedOut_Id] int  NOT NULL
);
GO

-- Creating table 'Copies'
CREATE TABLE [dbo].[Copies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Availability] smallint  NOT NULL,
    [Medium_Id] int  NOT NULL,
    [Resevation_Id] int  NOT NULL,
    [CheckedOut_Id] int  NOT NULL
);
GO

-- Creating table 'Media'
CREATE TABLE [dbo].[Media] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Year] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Publisher] nvarchar(max)  NOT NULL,
    [Genre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Media_Book'
CREATE TABLE [dbo].[Media_Book] (
    [Author] nvarchar(max)  NOT NULL,
    [ISBN] nvarchar(max)  NOT NULL,
    [Synopsis] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Media_Video'
CREATE TABLE [dbo].[Media_Video] (
    [Director] nvarchar(max)  NOT NULL,
    [Producer] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Media_Audio'
CREATE TABLE [dbo].[Media_Audio] (
    [Artist] nvarchar(max)  NOT NULL,
    [Album] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Librarians'
ALTER TABLE [dbo].[Librarians]
ADD CONSTRAINT [PK_Librarians]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Resevations'
ALTER TABLE [dbo].[Resevations]
ADD CONSTRAINT [PK_Resevations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CheckedOuts'
ALTER TABLE [dbo].[CheckedOuts]
ADD CONSTRAINT [PK_CheckedOuts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OverDues'
ALTER TABLE [dbo].[OverDues]
ADD CONSTRAINT [PK_OverDues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Copies'
ALTER TABLE [dbo].[Copies]
ADD CONSTRAINT [PK_Copies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Media'
ALTER TABLE [dbo].[Media]
ADD CONSTRAINT [PK_Media]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Media_Book'
ALTER TABLE [dbo].[Media_Book]
ADD CONSTRAINT [PK_Media_Book]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Media_Video'
ALTER TABLE [dbo].[Media_Video]
ADD CONSTRAINT [PK_Media_Video]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Media_Audio'
ALTER TABLE [dbo].[Media_Audio]
ADD CONSTRAINT [PK_Media_Audio]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'Resevations'
ALTER TABLE [dbo].[Resevations]
ADD CONSTRAINT [FK_CustomerResevation]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerResevation'
CREATE INDEX [IX_FK_CustomerResevation]
ON [dbo].[Resevations]
    ([CustomerId]);
GO

-- Creating foreign key on [CustomerId] in table 'CheckedOuts'
ALTER TABLE [dbo].[CheckedOuts]
ADD CONSTRAINT [FK_CustomerCheckedOut]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerCheckedOut'
CREATE INDEX [IX_FK_CustomerCheckedOut]
ON [dbo].[CheckedOuts]
    ([CustomerId]);
GO

-- Creating foreign key on [LibrarianId] in table 'CheckedOuts'
ALTER TABLE [dbo].[CheckedOuts]
ADD CONSTRAINT [FK_LibrarianCheckedOut]
    FOREIGN KEY ([LibrarianId])
    REFERENCES [dbo].[Librarians]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LibrarianCheckedOut'
CREATE INDEX [IX_FK_LibrarianCheckedOut]
ON [dbo].[CheckedOuts]
    ([LibrarianId]);
GO

-- Creating foreign key on [CheckedOut_Id] in table 'OverDues'
ALTER TABLE [dbo].[OverDues]
ADD CONSTRAINT [FK_CheckedOutOverDue]
    FOREIGN KEY ([CheckedOut_Id])
    REFERENCES [dbo].[CheckedOuts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CheckedOutOverDue'
CREATE INDEX [IX_FK_CheckedOutOverDue]
ON [dbo].[OverDues]
    ([CheckedOut_Id]);
GO

-- Creating foreign key on [Medium_Id] in table 'Copies'
ALTER TABLE [dbo].[Copies]
ADD CONSTRAINT [FK_CopyMedia]
    FOREIGN KEY ([Medium_Id])
    REFERENCES [dbo].[Media]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CopyMedia'
CREATE INDEX [IX_FK_CopyMedia]
ON [dbo].[Copies]
    ([Medium_Id]);
GO

-- Creating foreign key on [Resevation_Id] in table 'Copies'
ALTER TABLE [dbo].[Copies]
ADD CONSTRAINT [FK_CopyResevation]
    FOREIGN KEY ([Resevation_Id])
    REFERENCES [dbo].[Resevations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CopyResevation'
CREATE INDEX [IX_FK_CopyResevation]
ON [dbo].[Copies]
    ([Resevation_Id]);
GO

-- Creating foreign key on [CheckedOut_Id] in table 'Copies'
ALTER TABLE [dbo].[Copies]
ADD CONSTRAINT [FK_CopyCheckedOut]
    FOREIGN KEY ([CheckedOut_Id])
    REFERENCES [dbo].[CheckedOuts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CopyCheckedOut'
CREATE INDEX [IX_FK_CopyCheckedOut]
ON [dbo].[Copies]
    ([CheckedOut_Id]);
GO

-- Creating foreign key on [Id] in table 'Media_Book'
ALTER TABLE [dbo].[Media_Book]
ADD CONSTRAINT [FK_Book_inherits_Media]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Media]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Media_Video'
ALTER TABLE [dbo].[Media_Video]
ADD CONSTRAINT [FK_Video_inherits_Media]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Media]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Media_Audio'
ALTER TABLE [dbo].[Media_Audio]
ADD CONSTRAINT [FK_Audio_inherits_Media]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Media]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------