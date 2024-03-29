USE [master]
GO
/****** Object:  Database [Scheduler]    Script Date: 12/5/2017 7:53:34 PM ******/
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
/****** Object:  User [SlotSwap]    Script Date: 12/5/2017 7:53:35 PM ******/
CREATE USER [SlotSwap] FOR LOGIN [SlotSwap] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 12/5/2017 7:53:35 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/5/2017 7:53:35 PM ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/5/2017 7:53:35 PM ******/
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
/****** Object:  Table [dbo].[SlotSwap]    Script Date: 12/5/2017 7:53:35 PM ******/
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
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/5/2017 7:53:35 PM ******/
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
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/5/2017 7:53:35 PM ******/
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
/****** Object:  Table [dbo].[wkTable]    Script Date: 12/5/2017 7:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wkTable](
	[wkDay] [varchar](50) NOT NULL,
	[CrDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
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
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Users] FOREIGN KEY([UserID])
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
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 12/5/2017 7:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUser] 
	-- Add the parameters for the stored procedure here
	(
	@email varchar(50) = 'amitk@gmail.com',
	@password varchar(50) = 'amit',
	@resId int = 2,
	@fName varchar(50) = 'Amit',
	@lName varchar(50) = 'Kumar',
	@mondayStartTime time = '8:00:00',
	@tuesdayStartTime time = '8:00:00',
	@wednesdayStartTime time ='',
	@thursdayStartTime time = '',
	@fridayStartTime time = '',
	@saturdayStartTime time = '',
	@sundayStartTime time = '',
	@mondayEndTime time = '10:00:00',
	@tuesdayEndTime time = '9:00:00',
	@wednesdayEndTime time = '',
	@thursdayEndTime time ='',
	@fridayEndTime time ='',
	@saturdayEndTime time ='',
	@sundayEndTime time =''
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @userid int = 0
    
	INSERT INTO Users(EmailId,[Password],RoleId)  values (@email,@password,2)
	Set @userid = IDENT_CURRENT('Users')
	INSERT INTO UserProfile(FirstName,LastName,UserId,RestraurantId,ManagerId)  values (@fName,@lName,@userid,@resId,1)
	if(@mondayStartTime != '' and @mondayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Monday',@mondayStartTime,@mondayEndTime,@userid)
	End
	if(@tuesdayStartTime != '' and @tuesdayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Tuesday',@tuesdayStartTime,@tuesdayEndTime,@userid)
	End
	if(@wednesdayStartTime != '' and @wednesdayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Wednesday',@wednesdayStartTime,@wednesdayEndTime,@userid)
	End
	if(@thursdayStartTime != '' and @thursdayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Thursday',@thursdayStartTime,@thursdayEndTime,@userid)
	End
	if(@fridayStartTime != '' and @fridayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Friday',@fridayStartTime,@fridayEndTime,@userid)
	End
	if(@saturdayStartTime != '' and @saturdayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Saturday',@saturdayStartTime,@saturdayEndTime,@userid)
	End
	if(@sundayStartTime != '' and @sundayEndTime != '')
	Begin 
	INSERT INTO Schedule([WeekDay],TimeFrom,TimeTo,UserID)  values ('Sunday',@sundayStartTime,@sundayEndTime,@userid)
	 End
	
END
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 12/5/2017 7:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditUser] 
	-- Add the parameters for the stored procedure here
	@email varchar(50),
	@password varchar(50),
	@roleId int,
	@fName varchar(50),
	@lName varchar(50),
	@mondayStartTime time,
	@tuesdayStartTime time,
	@wednesdayStartTime time,
	@thursdayStartTime time,
	@fridayStartTime time,
	@saturdayStartTime time,
	@sundayStartTime time,
	@mondayEndTime time,
	@tuesdayEndTime time,
	@wednesdayEndTime time,
	@thursdayEndTime time,
	@fridayEndTime time,
	@saturdayEndTime time,
	@sundayEndTime time,
	@userId int
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    
	UPDATE Users SET EmailId = @email, [Password]= @password where Id = @userid
	UPDATE  UserProfile SET FirstName = @fName,LastName = @lName where Id = @userid
	UPDATE Schedule SET TimeFrom = @mondayStartTime, TimeTo = @mondayEndTime where [WeekDay] = 'Monday' and Id = @userid
	UPDATE Schedule SET TimeFrom = @tuesdayStartTime, TimeTo = @tuesdayEndTime where [WeekDay] = 'Tuesday' and Id = @userid
	UPDATE Schedule SET TimeFrom = @wednesdayStartTime, TimeTo = @wednesdayEndTime where [WeekDay] = 'Wednesday' and Id = @userid
	UPDATE Schedule SET TimeFrom = @thursdayStartTime, TimeTo = @thursdayEndTime where [WeekDay] = 'Thursday' and Id = @userid
	UPDATE Schedule SET TimeFrom = @fridayStartTime, TimeTo = @fridayEndTime where [WeekDay] = 'Friday' and Id = @userid
	UPDATE Schedule SET TimeFrom = @saturdayStartTime, TimeTo = @saturdayEndTime where [WeekDay] = 'Saturday' and Id = @userid
	UPDATE Schedule SET TimeFrom = @sundayStartTime, TimeTo = @sundayEndTime where [WeekDay] = 'Sunday' and Id = @userid
	 
END
GO
/****** Object:  StoredProcedure [dbo].[EditUserProfile]    Script Date: 12/5/2017 7:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditUserProfile] 
	-- Add the parameters for the stored procedure here
	@password varchar(255),
	@fName varchar(50),
	@lName varchar(50),
	@dob date,
	@city varchar(50),
	@state varchar(50),
	@country varchar(50),
	@mobile varchar(10),
	@ssn varchar(10),
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    
	UPDATE Users SET [Password]= @password where Id = @userid
	UPDATE  UserProfile SET FirstName = @fName,LastName = @lName, Dob = @dob, City = @city,[state]
	 = @state, Country = @country, Mobile = @mobile, SSN = @ssn where Id = @userid
	 
END
GO
/****** Object:  StoredProcedure [dbo].[IsValidUser]    Script Date: 12/5/2017 7:53:36 PM ******/
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
		,up.UserId as UserId    
		From Users u
		inner join UserProfile up on u.Id = up.UserId 
		Where u.Id = @userid	
	end	 
END
GO
/****** Object:  StoredProcedure [dbo].[PeopleWorking]    Script Date: 12/5/2017 7:53:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PeopleWorking] 
	-- Add the parameters for the stored procedure here
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT
	CASE
	when [weekday] = 'Monday' then count(1)
	 when [weekday] = 'Tuesday' then count(1)
	 when [weekday] = 'Wednesday' then count(1)
	 when [weekday] = 'Thursday' then count(1)
	 when [weekday] = 'Friday' then count(1)
	 when [weekday] = 'Saturday' then count(1)
	 when [weekday] = 'Sunday' then count(1)
	 END
	from Schedule group by [WeekDay]

	
	
	 
END
GO
/****** Object:  StoredProcedure [dbo].[SlotList]    Script Date: 12/5/2017 7:53:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- [SlotList] 7
CREATE PROCEDURE [dbo].[SlotList]
(
	@userId INT
)
	AS
	BEGIN
	SET NOCOUNT ON;
	Declare @StartWeek DateTime
	Declare @EndWeek DateTime
	--DECLARE @wktable TABLE (wkDay varchar(50), CrDate DateTime)
	Truncate table wktable
	SELECT @StartWeek = DATEADD(week, DATEDIFF(day, 0, getdate())/7, 0),
       @EndWeek = DATEADD(week, DATEDIFF(day, 0, getdate())/7, 6)
	While(@StartWeek <= @EndWeek )
	Begin
		
		Insert into wktable (wkDay,CrDate) values (DATENAME(DW, @StartWeek),@StartWeek)
		Set @StartWeek = @StartWeek+ 1
	End
	SELECT 
	Count(1) AS TotalCount
	,Sch.TimeFrom
	,Sch.TimeTo
	,Sch.[WeekDay]
	,wk.CrDate As SlotDate
	,ss.IsActive
	FROM Schedule Sch
	Inner Join wktable wk ON Sch.[WeekDay] = wk.wkDay
	Left Join SlotSwap ss ON ss.SlotDate = wk.CrDate 
	WHERE
	UserID = @userId
	Group By TimeFrom, TimeTo,WeekDay,SlotDate,ss.IsActive,wk.CrDate
	--Drop Table @wktable
END

GO
/****** Object:  StoredProcedure [dbo].[TotalHours]    Script Date: 12/5/2017 7:53:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TotalHours] 
	-- Add the parameters for the stored procedure here
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
	SELECT
	Weekday,
	CASE
	when [weekday] = 'Monday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 when [weekday] = 'Tuesday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 when [weekday] = 'Wednesday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 when [weekday] = 'Thursday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 when [weekday] = 'Friday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 when [weekday] = 'Saturday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 when [weekday] = 'Sunday' then AVG(DATEDIFF(HH,TimeFrom,TimeTo))
	 END As hrsavg
	from Schedule group by [WeekDay]

	
	
	 
END
GO
/****** Object:  StoredProcedure [dbo].[UserList]    Script Date: 12/5/2017 7:53:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- [UserList] 
CREATE PROCEDURE [dbo].[UserList]

(
	/*– Pagination Parameters */
	@PageNo INT = 1,
	@PageSize INT = 10,
   
	/*– Sorting Parameters */
	@SortColumn NVARCHAR(20) = 'FirstName',
	@IsSortOrderAsc bit =0,
   
	/* Optional Filters for Dynamic Search*/
	@SearchBy NVARCHAR(Max) = ''
 	
	)
	AS
	BEGIN
	/*–Declaring Local Variables corresponding to parameters for modification */
	DECLARE 
	@lSearchBy NVARCHAR(Max),
	@lSortOrder NVARCHAR(4),

	@lPageNbr INT,
	@lPageSize INT,
	@lSortCol NVARCHAR(20),
	@lFirstRec INT,
	@lLastRec INT,
	@lTotalRows INT

	/*Setting Local Variables*/
	SET @lSearchBy = @SearchBy

	SET @lPageNbr = @PageNo
	SET @lPageSize = @PageSize
	SET @lSortCol = LTRIM(RTRIM(@SortColumn))
	if(@IsSortOrderAsc = 1)
	BEGIN
	SET @lSortOrder = 'ASC'
	END
	ELSE
	BEGIN
	SET @lSortOrder = 'DESC'
	END

	SET @lFirstRec = ( @lPageNbr - 1 ) * @lPageSize
	SET @lLastRec = ( @lPageNbr * @lPageSize + 1 )
	SET @lTotalRows = @lFirstRec - @lLastRec + 1

	; WITH UserList_Results
	AS (
	SELECT ROW_NUMBER() OVER (ORDER BY
		CASE WHEN (@lSortCol = 'FirstName' AND @lSortOrder='ASC')
					THEN UP.FirstName
		END ASC,
		CASE WHEN (@lSortCol = 'FirstName' AND @lSortOrder='DESC')
					THEN UP.FirstName
		END DESC,

		CASE WHEN (@lSortCol = 'LastName' AND @lSortOrder='ASC')
					THEN UP.LastName
		END ASC,
		CASE WHEN @lSortCol = 'LastName' AND @lSortOrder='DESC'
					THEN UP.LastName
		END DESC,

		CASE WHEN @lSortCol = 'Email' AND @lSortOrder='ASC'
				THEN Usr.EmailId
		END ASC,
		CASE WHEN @lSortCol = 'Email' AND @lSortOrder='DESC'
				THEN Usr.EmailId
		END DESC,

		CASE WHEN @lSortCol = 'EmpRole' AND @lSortOrder='ASC'
				THEN UP.EmpRole
		END ASC,
		CASE WHEN @lSortCol = 'EmpRole' AND @lSortOrder='DESC'
				THEN UP.EmpRole
		END DESC

		--,CASE WHEN @lSortCol = 'Manager' AND @lSortOrder='ASC'
		--		THEN Mgr.Name
		--END ASC,
		--CASE WHEN @lSortCol = 'Manager' AND @lSortOrder='DESC'
		--		THEN Mgr.Name
		--END DESC

	) AS ROWNUM,
	Count(*) over () AS TotalCount
	,Usr.EmailId as EmailId
	,UP.FirstName
	,Up.LastName
	,Up.EmpRole
	,Mgr.FirstName + ' ' + Mgr.LastName  As Manager
	,UP.SalaryPerHour
	,Usr.Id as userid
	FROM Users Usr
	LEFT Join UserProfile UP on UP.ID = Usr.Id
	LEFT Join UserProfile Mgr on  Mgr.UserId = UP.ManagerId
	WHERE
	(
			(@lSearchBy IS NULL OR Usr.EmailId Like '%'+@lSearchBy+'%')
			OR
			(@lSearchBy IS NULL OR UP.FirstName Like '%'+@lSearchBy+'%')
			OR
			(@lSearchBy IS NULL OR UP.LastName Like '%'+@lSearchBy+'%')
			OR
			(@lSearchBy IS NULL OR UP.EmpRole Like '%'+@lSearchBy+'%')
			OR
			(@lSearchBy IS NULL OR Mgr.FirstName + ' '+ Mgr.LastName Like '%'+@lSearchBy+'%')

			)
)
SELECT
   *
FROM UserList_Results
WHERE
         ROWNUM > @lFirstRec
               AND ROWNUM < @lLastRec And userid != 1
 ORDER BY ROWNUM ASC

END
GO
USE [master]
GO
ALTER DATABASE [Scheduler] SET  READ_WRITE 
GO
