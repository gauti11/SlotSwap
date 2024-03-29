USE [Scheduler]
GO
/****** Object:  StoredProcedure [dbo].[IsValidUser]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP PROCEDURE [dbo].[IsValidUser]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[UserProfile] DROP CONSTRAINT [FK_UserProfile_Users_MangerId]
GO
ALTER TABLE [dbo].[UserProfile] DROP CONSTRAINT [FK_UserProfile_Users]
GO
ALTER TABLE [dbo].[SlotSwap] DROP CONSTRAINT [FK_SlotSwap_Users_TakenBy]
GO
ALTER TABLE [dbo].[SlotSwap] DROP CONSTRAINT [FK_SlotSwap_Users_CancelledBy]
GO
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [FK_Schedule_Users]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UpdatedOn]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_CreatedOn]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_IsActive]
GO
ALTER TABLE [dbo].[UserProfile] DROP CONSTRAINT [DF_UserProfile_CreatedOn]
GO
ALTER TABLE [dbo].[SlotSwap] DROP CONSTRAINT [DF_SlotSwap_CreatedOn]
GO
ALTER TABLE [dbo].[SlotSwap] DROP CONSTRAINT [DF_SlotSwap_IsActive]
GO
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [DF_Schedule_CreatedOn]
GO
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [DF_Schedule_IsActive]
GO
ALTER TABLE [dbo].[Role] DROP CONSTRAINT [DF_Role_IsActive]
GO
ALTER TABLE [dbo].[Restaurant] DROP CONSTRAINT [DF_Restaurant_IsActive]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP TABLE [dbo].[UserProfile]
GO
/****** Object:  Table [dbo].[SlotSwap]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP TABLE [dbo].[SlotSwap]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP TABLE [dbo].[Schedule]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP TABLE [dbo].[Restaurant]
GO
/****** Object:  User [SlotSwap]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP USER [SlotSwap]
GO
USE [master]
GO
/****** Object:  Database [Scheduler]    Script Date: 11/27/2017 7:29:54 PM ******/
DROP DATABASE [Scheduler]
GO
/****** Object:  Database [Scheduler]    Script Date: 11/27/2017 7:29:54 PM ******/
CREATE DATABASE [Scheduler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scheduler', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Scheduler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scheduler_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Scheduler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Scheduler] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scheduler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scheduler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scheduler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scheduler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scheduler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scheduler] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scheduler] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Scheduler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scheduler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scheduler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scheduler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scheduler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scheduler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scheduler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scheduler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scheduler] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Scheduler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scheduler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scheduler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scheduler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scheduler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scheduler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scheduler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scheduler] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Scheduler] SET  MULTI_USER 
GO
ALTER DATABASE [Scheduler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scheduler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scheduler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scheduler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scheduler] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Scheduler] SET QUERY_STORE = OFF
GO
USE [Scheduler]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Scheduler]
GO
/****** Object:  User [SlotSwap]    Script Date: 11/27/2017 7:29:55 PM ******/
CREATE USER [SlotSwap] FOR LOGIN [SlotSwap] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 11/27/2017 7:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/27/2017 7:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/27/2017 7:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[WeekDay] [varchar](10) NULL,
	[TimeFrom] [time](7) NULL,
	[TimeTo] [time](7) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotSwap]    Script Date: 11/27/2017 7:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotSwap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CancelledById] [int] NULL,
	[SlotDate] [date] NULL,
	[SlotTimeFrom] [time](7) NULL,
	[SlotTimeTo] [time](7) NULL,
	[TakenById] [int] NULL,
	[Msg] [text] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Slot_swap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/27/2017 7:29:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Dob] [date] NULL,
	[City] [varchar](255) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[Mobile] [varchar](10) NULL,
	[EmpRole] [varchar](255) NULL,
	[SSN] [varchar](10) NULL,
	[UserId] [int] NOT NULL,
	[RestraurantId] [int] NULL,
	[ManagerId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[WeeklyMaxHours] [int] NULL,
	[SalaryPerHour] [float] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/27/2017 7:29:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[EmailId] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([Id], [Name], [IsActive]) VALUES (1, N'Sodexo', 1)
INSERT [dbo].[Restaurant] ([Id], [Name], [IsActive]) VALUES (2, N'Coper Top', 1)
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (2, N'User', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([Id], [FirstName], [LastName], [Dob], [City], [StateId], [CountryId], [Mobile], [EmpRole], [SSN], [UserId], [RestraurantId], [ManagerId], [CreatedOn], [UpdatedOn], [WeeklyMaxHours], [SalaryPerHour]) VALUES (1, N'Amit', N'Kumar', CAST(N'1990-11-03' AS Date), N'Binghamton', 1, 1, N'6073040738', N'Owner', NULL, 1, 1, 1, CAST(N'2017-11-27T16:38:05.523' AS DateTime), NULL, 20, 10)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [RoleId], [EmailId], [Password], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (1, 1, N'admin', N'admin', 1, CAST(N'2017-11-27T16:19:31.027' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Restaurant] ADD  CONSTRAINT [DF_Restaurant_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SlotSwap] ADD  CONSTRAINT [DF_SlotSwap_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SlotSwap] ADD  CONSTRAINT [DF_SlotSwap_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Users]
GO
ALTER TABLE [dbo].[SlotSwap]  WITH CHECK ADD  CONSTRAINT [FK_SlotSwap_Users_CancelledBy] FOREIGN KEY([CancelledById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SlotSwap] CHECK CONSTRAINT [FK_SlotSwap_Users_CancelledBy]
GO
ALTER TABLE [dbo].[SlotSwap]  WITH CHECK ADD  CONSTRAINT [FK_SlotSwap_Users_TakenBy] FOREIGN KEY([TakenById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SlotSwap] CHECK CONSTRAINT [FK_SlotSwap_Users_TakenBy]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Users]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Users_MangerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Users_MangerId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
/****** Object:  StoredProcedure [dbo].[IsValidUser]    Script Date: 11/27/2017 7:29:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IsValidUser] 
	-- Add the parameters for the stored procedure here
	@email varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @userid int = 0
    
	SELECT @userid = ID from Users Where EmailId = @email and [Password] = @password and IsActive = 1
	
	if(@userid > 0)
	begin 
		Select 
		u.EmailId as Email
		,u.RoleId As RoleId
		,up.FirstName As FirstName
		,up.LastName as LastName  
		From Users u
		inner join UserProfile up on u.Id = up.UserId 
		Where u.Id = @userid	
	end	 
END
GO
USE [master]
GO
ALTER DATABASE [Scheduler] SET  READ_WRITE 
GO
