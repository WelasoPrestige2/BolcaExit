USE [Bolca]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 28.12.2023 11:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imya] [nvarchar](50) NOT NULL,
	[Age] [nvarchar](50) NOT NULL,
	[Diagnoz] [nvarchar](50) NOT NULL,
	[IDvr] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28.12.2023 11:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.12.2023 11:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vrach]    Script Date: 28.12.2023 11:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vrach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Special] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vrach] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Id], [Imya], [Age], [Diagnoz], [IDvr]) VALUES (2, N'ыфв', N'12', N'голо', 1)
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (1, N'1', N'1', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (2, N'2', N'2', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (3, N'3243', N'4324', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (4, N'222', N'222', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (5, N'22', N'22', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (6, N'', N'', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [IdRole]) VALUES (7, N'3', N'1', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Vrach] ON 

INSERT [dbo].[Vrach] ([Id], [FIO], [Special]) VALUES (1, N'Рузиев Иван Г.', N'Стоматолог')
INSERT [dbo].[Vrach] ([Id], [FIO], [Special]) VALUES (2, N'Иван Рузиев М.', N'Кардиолог')
SET IDENTITY_INSERT [dbo].[Vrach] OFF
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Vrach] FOREIGN KEY([IDvr])
REFERENCES [dbo].[Vrach] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Vrach]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
