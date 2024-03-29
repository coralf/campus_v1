USE [master]
GO
/****** Object:  Database [campusDB]    Script Date: 2017/3/6 12:20:50 ******/
CREATE DATABASE [campusDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'campusDB', FILENAME = N'f:\SqlServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\campusDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'campusDB_log', FILENAME = N'f:\SqlServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\campusDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [campusDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [campusDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [campusDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [campusDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [campusDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [campusDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [campusDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [campusDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [campusDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [campusDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [campusDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [campusDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [campusDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [campusDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [campusDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [campusDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [campusDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [campusDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [campusDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [campusDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [campusDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [campusDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [campusDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [campusDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [campusDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [campusDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [campusDB] SET  MULTI_USER 
GO
ALTER DATABASE [campusDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [campusDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [campusDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [campusDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [campusDB]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[activitiesId] [int] NULL,
	[activitieType] [int] NULL,
	[activitiesTitle] [varchar](50) NOT NULL,
	[activitiesContent] [nvarchar](2000) NOT NULL,
	[starttime] [datetime] NOT NULL,
	[endtime] [datetime] NOT NULL,
	[activitynumber] [int] NULL,
	[actImg] [varchar](100) NULL,
	[actIssueTime] [datetime] NULL,
	[readCount] [int] NULL,
	[praiseCount] [int] NULL,
	[isEnd] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActivitieType]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivitieType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[activitytype] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActivityComment]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityComment](
	[id] [int] NULL,
	[userId] [int] NULL,
	[content] [nvarchar](120) NOT NULL,
	[addtime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdminInfo]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
	[pwd] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Community]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Community](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[title] [varchar](50) NULL,
	[content] [nvarchar](1000) NULL,
	[imgs] [varchar](100) NULL,
	[addtime] [datetime] NULL,
	[readCount] [int] NULL,
	[praiseCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommunityCountComment]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunityCountComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commid] [int] NULL,
	[userId] [int] NULL,
	[content] [nvarchar](120) NULL,
	[addtime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryUser]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistoryUser](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[history_id] [int] NOT NULL,
	[password] [varchar](16) NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[newsTypeId] [int] NOT NULL,
	[userId] [int] NULL,
	[newsTitle] [varchar](50) NOT NULL,
	[newsContent] [nvarchar](3000) NOT NULL,
	[newsImg] [varchar](255) NULL,
	[publishDate] [datetime] NULL,
	[readCount] [int] NULL,
	[praiseCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsComment]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[newsId] [int] NULL,
	[userId] [int] NULL,
	[content] [nvarchar](120) NOT NULL,
	[addtime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsType]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[newsType] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserActivities]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[activitiesId] [int] NULL,
	[addtiem] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](10) NOT NULL,
	[pwd] [varchar](16) NOT NULL,
	[email] [varchar](16) NOT NULL,
	[phone] [varchar](16) NULL,
	[age] [int] NULL,
	[UserIcon] [varchar](200) NULL,
	[UserDes] [varchar](50) NULL,
	[registerDate] [datetime] NULL,
	[score] [int] NULL,
	[experience] [int] NULL,
	[state] [int] NOT NULL,
	[sex] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMessageBoard]    Script Date: 2017/3/6 12:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMessageBoard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[user_mess_id] [int] NULL,
	[content] [varchar](120) NOT NULL,
	[endtime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT ((0)) FOR [activitynumber]
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT (getdate()) FOR [actIssueTime]
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT ((0)) FOR [readCount]
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT ((0)) FOR [praiseCount]
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT ((0)) FOR [isEnd]
GO
ALTER TABLE [dbo].[ActivityComment] ADD  DEFAULT (getdate()) FOR [addtime]
GO
ALTER TABLE [dbo].[Community] ADD  DEFAULT (getdate()) FOR [addtime]
GO
ALTER TABLE [dbo].[Community] ADD  DEFAULT ((0)) FOR [readCount]
GO
ALTER TABLE [dbo].[Community] ADD  DEFAULT ((0)) FOR [praiseCount]
GO
ALTER TABLE [dbo].[CommunityCountComment] ADD  DEFAULT (getdate()) FOR [addtime]
GO
ALTER TABLE [dbo].[HistoryUser] ADD  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [publishDate]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((0)) FOR [readCount]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((0)) FOR [praiseCount]
GO
ALTER TABLE [dbo].[NewsComment] ADD  DEFAULT (getdate()) FOR [addtime]
GO
ALTER TABLE [dbo].[UserActivities] ADD  DEFAULT (getdate()) FOR [addtiem]
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT (getdate()) FOR [registerDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT ((0)) FOR [score]
GO
ALTER TABLE [dbo].[UserInfo] ADD  DEFAULT ((0)) FOR [experience]
GO
ALTER TABLE [dbo].[UserMessageBoard] ADD  DEFAULT (getdate()) FOR [endtime]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([activitiesId])
REFERENCES [dbo].[AdminInfo] ([id])
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([activitieType])
REFERENCES [dbo].[ActivitieType] ([id])
GO
ALTER TABLE [dbo].[ActivityComment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[ActivityComment]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Activities] ([id])
GO
ALTER TABLE [dbo].[Community]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[CommunityCountComment]  WITH CHECK ADD FOREIGN KEY([commid])
REFERENCES [dbo].[Community] ([id])
GO
ALTER TABLE [dbo].[CommunityCountComment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[HistoryUser]  WITH CHECK ADD FOREIGN KEY([history_id])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([newsTypeId])
REFERENCES [dbo].[NewsType] ([id])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[AdminInfo] ([id])
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD FOREIGN KEY([newsId])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD FOREIGN KEY([activitiesId])
REFERENCES [dbo].[Activities] ([id])
GO
ALTER TABLE [dbo].[UserActivities]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[UserMessageBoard]  WITH CHECK ADD FOREIGN KEY([user_mess_id])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[UserMessageBoard]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[UserInfo] ([id])
GO
USE [master]
GO
ALTER DATABASE [campusDB] SET  READ_WRITE 
GO
