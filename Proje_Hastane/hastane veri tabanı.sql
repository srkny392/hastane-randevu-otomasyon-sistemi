USE [master]
GO
/****** Object:  Database [HastaneProje]    Script Date: 1.12.2021 00:38:00 ******/
CREATE DATABASE [HastaneProje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneProje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HastaneProje.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HastaneProje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HastaneProje_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HastaneProje] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneProje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneProje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneProje] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneProje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneProje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneProje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneProje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneProje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneProje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneProje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneProje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneProje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneProje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneProje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneProje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneProje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneProje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneProje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HastaneProje] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneProje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneProje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneProje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneProje] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HastaneProje] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HastaneProje]
GO
/****** Object:  Table [dbo].[Tbl_Branslar]    Script Date: 1.12.2021 00:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Branslar](
	[Bransid] [tinyint] IDENTITY(1,1) NOT NULL,
	[BransAd] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Doktorlar]    Script Date: 1.12.2021 00:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Doktorlar](
	[Doktorid] [tinyint] IDENTITY(1,1) NOT NULL,
	[DoktorAd] [varchar](10) NULL,
	[DoktorSoyad] [varchar](10) NULL,
	[DoktorBrans] [varchar](30) NULL,
	[DoktorTC] [char](11) NULL,
	[DoktorSifre] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Duyurular]    Script Date: 1.12.2021 00:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Duyurular](
	[Duyuruid] [smallint] IDENTITY(1,1) NOT NULL,
	[Duyuru] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Hastalar]    Script Date: 1.12.2021 00:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Hastalar](
	[Hastaid] [smallint] IDENTITY(1,1) NOT NULL,
	[HastaAd] [varchar](10) NULL,
	[HastaSoyad] [varchar](10) NULL,
	[HastaTC] [char](11) NULL,
	[HastaTelefon] [varchar](15) NULL,
	[HastaSifre] [varchar](10) NULL,
	[HastaCinsiyet] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Randevular]    Script Date: 1.12.2021 00:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Randevular](
	[Randevuid] [int] IDENTITY(1,1) NOT NULL,
	[RandevuTarih] [varchar](10) NULL,
	[Randevusaat] [varchar](5) NULL,
	[RandevuBrans] [varchar](30) NULL,
	[RandevuDoktor] [varchar](20) NULL,
	[RandevuDurum] [bit] NULL CONSTRAINT [DF_Tbl_Randevular_RandevuDurum]  DEFAULT ((0)),
	[HastaTC] [char](11) NULL,
	[HastaSikayet] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Sekreter]    Script Date: 1.12.2021 00:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Sekreter](
	[Sekreterid] [tinyint] IDENTITY(1,1) NOT NULL,
	[SekreterAdSoyad] [varchar](20) NULL,
	[SekreterTC] [char](11) NULL,
	[SekreterSifre] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Branslar] ON 

INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (1, N'Dahiliye')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (2, N'Göz')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (3, N'Kulak Burun Boğaz')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (6, N'Fizik Tedavi')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (5, N'Cilt Hastalıkları')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (7, N'Kardiyoloji')
INSERT [dbo].[Tbl_Branslar] ([Bransid], [BransAd]) VALUES (8, N'Psikoloji')
SET IDENTITY_INSERT [dbo].[Tbl_Branslar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Doktorlar] ON 

INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (1, N'Fuat', N'Toksöz', N'Dahiliye', N'22222222222', N'9876')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (2, N'Ayşe', N'Akın', N'Göz', N'33333333333', N'3333')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (5, N'Kadir', N'Demir', N'Kardiyoloji', N'78787878787', N'7878')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (4, N'Hülya', N'Kürek', N'Göz', N'66666666666', N'9876')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (6, N'Mehmet', N'Kısa', N'Psikoloji', N'87878787878', N'8787')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (8, N'İnci', N'Yüncü', N'Kulak Burun Boğaz', N'45454545454', N'4545')
INSERT [dbo].[Tbl_Doktorlar] ([Doktorid], [DoktorAd], [DoktorSoyad], [DoktorBrans], [DoktorTC], [DoktorSifre]) VALUES (7, N'Kübra', N'Şener', N'Fizik Tedavi', N'98989898989', N'9898')
SET IDENTITY_INSERT [dbo].[Tbl_Doktorlar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Duyurular] ON 

INSERT [dbo].[Tbl_Duyurular] ([Duyuruid], [Duyuru]) VALUES (1, N'Nöbetçi doktorlar 3 numaralı yoğun bakıma bekleniyorsunuz.')
SET IDENTITY_INSERT [dbo].[Tbl_Duyurular] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Hastalar] ON 

INSERT [dbo].[Tbl_Hastalar] ([Hastaid], [HastaAd], [HastaSoyad], [HastaTC], [HastaTelefon], [HastaSifre], [HastaCinsiyet]) VALUES (4, N'serkan', N'sdf', N'65656565656', N'(   )    -', N'', N'')
INSERT [dbo].[Tbl_Hastalar] ([Hastaid], [HastaAd], [HastaSoyad], [HastaTC], [HastaTelefon], [HastaSifre], [HastaCinsiyet]) VALUES (14, N'serkan', N'yıldırım', N'11111111111', N'', N'1111', N'Erkek')
INSERT [dbo].[Tbl_Hastalar] ([Hastaid], [HastaAd], [HastaSoyad], [HastaTC], [HastaTelefon], [HastaSifre], [HastaCinsiyet]) VALUES (15, NULL, NULL, NULL, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Hastalar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Randevular] ON 

INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (1, N'12.09.2021', N'12:00', N'Göz', N'Ayşe Akın', 1, N'22222222222', N'Gözüm akıyor')
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (2, N'12.10.2021', N'14:00', N'Göz', N'Tuna Çınar', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (3, N'13.09.2021', N'09:00', N'Dahiliye', N'Fuat Toksöz', 1, N'12121212121', N'khdılsıfhsdıl')
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (4, N'13.09.2021', N'08:00', N'Göz', N'Hülya Kürek', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (6, N'15.09.2021', N'11:00', N'Dahiliye', N'Fuat Toksöz', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (10, N'15.09.2021', N'10:00', N'Göz', N'Ayşe Akın', 1, N'11111111111', N'gözüm ağrıyor')
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (5, N'15.09.2021', N'10:00', N'Dahiliye', N'Fuat Toksöz', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Randevuid], [RandevuTarih], [Randevusaat], [RandevuBrans], [RandevuDoktor], [RandevuDurum], [HastaTC], [HastaSikayet]) VALUES (11, N'20.05.2021', N'10:00', N'Göz', N'Hülya Kürek', 1, N'11111111111', N'gözüm ağrıyor')
SET IDENTITY_INSERT [dbo].[Tbl_Randevular] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] ON 

INSERT [dbo].[Tbl_Sekreter] ([Sekreterid], [SekreterAdSoyad], [SekreterTC], [SekreterSifre]) VALUES (1, N'Emel Öztürk', N'99999999999', N'9999')
INSERT [dbo].[Tbl_Sekreter] ([Sekreterid], [SekreterAdSoyad], [SekreterTC], [SekreterSifre]) VALUES (2, N'Ali Güneş', N'88888888888', N'8888')
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] OFF
USE [master]
GO
ALTER DATABASE [HastaneProje] SET  READ_WRITE 
GO
