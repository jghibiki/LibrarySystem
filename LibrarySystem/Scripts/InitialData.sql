SET QUOTED_IDENTIFIER OFF;
GO

-- Librarians --
SET IDENTITY_INSERT [dbo].[Librarians] ON
INSERT INTO [dbo].[Librarians] ([Id], [FirstName], [LastName], [Email], [Phone]) 
VALUES (1, N'ELECTRONIC LIBRARIAN', N'', N'e-library@librarysystem.com', N'456-788-999')
SET IDENTITY_INSERT [dbo].[Librarians] OFF

-- Customers --
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT INTO [dbo].[Customers] ([Id], [FirstName], [LastName], [Email], [Phone], [JoinDate]) 
VALUES (1, N'wei', N'Bob', N'Daniels', N'123', N'2015-05-05 00:28:18')
SET IDENTITY_INSERT [dbo].[Customers] OFF

-- Media First --
SET IDENTITY_INSERT [dbo].[Media] ON
INSERT INTO [dbo].[Media] ([Id], [Title], [Year], [Description], [Publisher], [Genre], [Author1], [ISBN1]) VALUES (1, N'Introduction to Databases', N'1998', N'CSci 366 Textbook', N'Wiley Publishing', N'Textbook', N'FamousAuthor', N'5678910')
INSERT INTO [dbo].[Media] ([Id], [Title], [Year], [Description], [Publisher], [Genre], [Author1], [ISBN1]) VALUES (2, N'Angels & Demons', N'2003', N'Angels and demons.', N'Scholastic', N'Fiction', N'Dan Brown', N'1923098')
INSERT INTO [dbo].[Media] ([Id], [Title], [Year], [Description], [Publisher], [Genre], [Author1], [ISBN1]) VALUES (3, N'C How to Program', N'2006', N'How to Program in C', N'Deitel Publishing', N'Self-Learning Manual', N'Elite Programmer', N'1230913')
INSERT INTO [dbo].[Media] ([Id], [Title], [Year], [Description], [Publisher], [Genre], [Author1], [ISBN1]) VALUES (4, N'Fifty Shades of Green', N'2014', N'Green colors and what not', N'Independent', N'Romance Comedy', N'Cody O'' Brien', N'123912830')
SET IDENTITY_INSERT [dbo].[Media] OFF

-- Then Media Books -- 
INSERT INTO [dbo].[Media_Book] ([Author], [ISBN], [Synopsis], [Id]) VALUES (N'FamousAuthor', N'5678910', N'Learn Databases.', 1)
INSERT INTO [dbo].[Media_Book] ([Author], [ISBN], [Synopsis], [Id]) VALUES (N'Dan Brown', N'1923098', N'Mysteries surround the birth of christianity.', 2)
INSERT INTO [dbo].[Media_Book] ([Author], [ISBN], [Synopsis], [Id]) VALUES (N'Elite Programmer', N'1230913', N'Don''t know C? Now you do.', 3)
INSERT INTO [dbo].[Media_Book] ([Author], [ISBN], [Synopsis], [Id]) VALUES (N'Cody O'' Brien', N'123912830', N'Inspired by the romance novel, comes this romance comedy spinoff.', 4)

-- Copies -- 
SET IDENTITY_INSERT [dbo].[Copies] ON
INSERT INTO [dbo].[Copies] ([Id], [Availability], [Medium_Id]) VALUES (1, 1, 1)
INSERT INTO [dbo].[Copies] ([Id], [Availability], [Medium_Id]) VALUES (2, 1, 1)
INSERT INTO [dbo].[Copies] ([Id], [Availability], [Medium_Id]) VALUES (3, 1, 2)
INSERT INTO [dbo].[Copies] ([Id], [Availability], [Medium_Id]) VALUES (4, 1, 3)
INSERT INTO [dbo].[Copies] ([Id], [Availability], [Medium_Id]) VALUES (5, 1, 4)
INSERT INTO [dbo].[Copies] ([Id], [Availability], [Medium_Id]) VALUES (8, 1, 4)
SET IDENTITY_INSERT [dbo].[Copies] OFF

