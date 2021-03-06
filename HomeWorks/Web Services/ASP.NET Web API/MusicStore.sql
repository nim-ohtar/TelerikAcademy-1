USE [master]
GO
/****** Object:  Database [MusicStore]    Script Date: 7.8.2013 г. 21:02:05 ******/
CREATE DATABASE [MusicStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MusicStore.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MusicStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MusicStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MusicStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicStore] SET  MULTI_USER 
GO
ALTER DATABASE [MusicStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MusicStore]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 7.8.2013 г. 21:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[AlbumTitle] [nvarchar](50) NOT NULL,
	[AlbumYear] [int] NULL,
	[Producer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artists]    Script Date: 7.8.2013 г. 21:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArtistsAlbums]    Script Date: 7.8.2013 г. 21:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistsAlbums](
	[ArtistId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
 CONSTRAINT [PK_ArtistsAlbums] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC,
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Songs]    Script Date: 7.8.2013 г. 21:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[SongId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistId] [int] NULL,
	[SongTitle] [nvarchar](100) NOT NULL,
	[SongYear] [int] NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SongsAlbums]    Script Date: 7.8.2013 г. 21:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsAlbums](
	[SongId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
 CONSTRAINT [PK_SongsAlbums] PRIMARY KEY CLUSTERED 
(
	[SongId] ASC,
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SongsArtists]    Script Date: 7.8.2013 г. 21:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongsArtists](
	[SongID] [int] NOT NULL,
	[ArtistID] [int] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (1, N'The Best', 1980, N'Virginia Records')
INSERT [dbo].[Albums] ([AlbumId], [AlbumTitle], [AlbumYear], [Producer]) VALUES (11, N'Never', 1337, N'Payner')
SET IDENTITY_INSERT [dbo].[Albums] OFF
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (2, N'Madonna', N'USA', CAST(0x0000539B00000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (6, N'Mariah Carey', N'USA', CAST(0x00003A2E00000000 AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (7, N'Whitney Houston', N'Canada', NULL)
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Country], [DateOfBirth]) VALUES (10, N'Norma Jeane Mortenson', N'USA', CAST(0x00003A2F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Artists] OFF
INSERT [dbo].[ArtistsAlbums] ([ArtistId], [AlbumId]) VALUES (10, 11)
SET IDENTITY_INSERT [dbo].[Songs] ON 

INSERT [dbo].[Songs] ([SongId], [ArtistId], [SongTitle], [SongYear], [Genre]) VALUES (13, 10, N'Season love 3', 1999, N'pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [SongTitle], [SongYear], [Genre]) VALUES (14, 10, N'Happy Birthday', 1999, N'pop')
INSERT [dbo].[Songs] ([SongId], [ArtistId], [SongTitle], [SongYear], [Genre]) VALUES (15, 10, N'Hush', 2013, N'pop')
SET IDENTITY_INSERT [dbo].[Songs] OFF
INSERT [dbo].[SongsAlbums] ([SongId], [AlbumId]) VALUES (13, 11)
INSERT [dbo].[SongsAlbums] ([SongId], [AlbumId]) VALUES (14, 11)
INSERT [dbo].[SongsAlbums] ([SongId], [AlbumId]) VALUES (15, 11)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UC_Artists_ArtistName]    Script Date: 7.8.2013 г. 21:02:05 ******/
ALTER TABLE [dbo].[Artists] ADD  CONSTRAINT [UC_Artists_ArtistName] UNIQUE NONCLUSTERED 
(
	[ArtistName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtistsAlbums]  WITH CHECK ADD  CONSTRAINT [FK_ArtistsAlbums_Albums] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistsAlbums] CHECK CONSTRAINT [FK_ArtistsAlbums_Albums]
GO
ALTER TABLE [dbo].[ArtistsAlbums]  WITH CHECK ADD  CONSTRAINT [FK_ArtistsAlbums_Artists] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistsAlbums] CHECK CONSTRAINT [FK_ArtistsAlbums_Artists]
GO
ALTER TABLE [dbo].[Songs]  WITH CHECK ADD  CONSTRAINT [FK_Songs_Artists] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Songs] CHECK CONSTRAINT [FK_Songs_Artists]
GO
ALTER TABLE [dbo].[SongsAlbums]  WITH CHECK ADD  CONSTRAINT [FK_SongsAlbums_Albums] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongsAlbums] CHECK CONSTRAINT [FK_SongsAlbums_Albums]
GO
ALTER TABLE [dbo].[SongsAlbums]  WITH CHECK ADD  CONSTRAINT [FK_SongsAlbums_Songs] FOREIGN KEY([SongId])
REFERENCES [dbo].[Songs] ([SongId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongsAlbums] CHECK CONSTRAINT [FK_SongsAlbums_Songs]
GO
USE [master]
GO
ALTER DATABASE [MusicStore] SET  READ_WRITE 
GO
