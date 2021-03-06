USE [master]
GO
/****** Object:  Database [FightFleet]    Script Date: 10/30/2012 17:19:28 ******/
CREATE DATABASE [FightFleet] ON  PRIMARY 
( NAME = N'FightFleet', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\FightFleet.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FightFleet_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\FightFleet_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FightFleet] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FightFleet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FightFleet] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [FightFleet] SET ANSI_NULLS OFF
GO
ALTER DATABASE [FightFleet] SET ANSI_PADDING OFF
GO
ALTER DATABASE [FightFleet] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [FightFleet] SET ARITHABORT OFF
GO
ALTER DATABASE [FightFleet] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [FightFleet] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [FightFleet] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [FightFleet] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [FightFleet] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [FightFleet] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [FightFleet] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [FightFleet] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [FightFleet] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [FightFleet] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [FightFleet] SET  DISABLE_BROKER
GO
ALTER DATABASE [FightFleet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [FightFleet] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [FightFleet] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [FightFleet] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [FightFleet] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [FightFleet] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [FightFleet] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [FightFleet] SET  READ_WRITE
GO
ALTER DATABASE [FightFleet] SET RECOVERY SIMPLE
GO
ALTER DATABASE [FightFleet] SET  MULTI_USER
GO
ALTER DATABASE [FightFleet] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [FightFleet] SET DB_CHAINING OFF
GO
USE [FightFleet]
GO
/****** Object:  User [FightFleet]    Script Date: 10/30/2012 17:19:28 ******/
CREATE USER [FightFleet] FOR LOGIN [FightFleet] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2012 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GameStatus]    Script Date: 10/30/2012 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GameStatus](
	[GameStatusId] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GameStatus] PRIMARY KEY CLUSTERED 
(
	[GameStatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authentication]    Script Date: 10/30/2012 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authentication](
	[AuthenticationId] [int] IDENTITY(1,1) NOT NULL,
	[AccessToken] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ExpiresOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED 
(
	[AuthenticationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 10/30/2012 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameId] [int] IDENTITY(1,1) NOT NULL,
	[Player1Id] [int] NOT NULL,
	[Player2Id] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[GameStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Move]    Script Date: 10/30/2012 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Move](
	[MoveId] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[CreatedDate] [int] NOT NULL,
 CONSTRAINT [PK_Move] PRIMARY KEY CLUSTERED 
(
	[MoveId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Board]    Script Date: 10/30/2012 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Board](
	[BoardId] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BoardData] [xml] NOT NULL,
 CONSTRAINT [PK_Board] PRIMARY KEY CLUSTERED 
(
	[BoardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Authentication_User]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Authentication]  WITH CHECK ADD  CONSTRAINT [FK_Authentication_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Authentication] CHECK CONSTRAINT [FK_Authentication_User]
GO
/****** Object:  ForeignKey [FK_Game_GameStatus]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GameStatus] FOREIGN KEY([GameStatusId])
REFERENCES [dbo].[GameStatus] ([GameStatusId])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_GameStatus]
GO
/****** Object:  ForeignKey [FK_Game_User]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_User] FOREIGN KEY([Player1Id])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_User]
GO
/****** Object:  ForeignKey [FK_Game_User1]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_User1] FOREIGN KEY([Player2Id])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_User1]
GO
/****** Object:  ForeignKey [FK_Move_Game]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Move]  WITH CHECK ADD  CONSTRAINT [FK_Move_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
GO
ALTER TABLE [dbo].[Move] CHECK CONSTRAINT [FK_Move_Game]
GO
/****** Object:  ForeignKey [FK_Move_User]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Move]  WITH CHECK ADD  CONSTRAINT [FK_Move_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Move] CHECK CONSTRAINT [FK_Move_User]
GO
/****** Object:  ForeignKey [FK_Board_Game]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Board]  WITH CHECK ADD  CONSTRAINT [FK_Board_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
GO
ALTER TABLE [dbo].[Board] CHECK CONSTRAINT [FK_Board_Game]
GO
/****** Object:  ForeignKey [FK_Board_User]    Script Date: 10/30/2012 17:19:30 ******/
ALTER TABLE [dbo].[Board]  WITH CHECK ADD  CONSTRAINT [FK_Board_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Board] CHECK CONSTRAINT [FK_Board_User]
GO
