USE [master]
GO
/****** Object:  Database [ClinicalHospitalRecords]    Script Date: 04.11.2022 0:16:27 ******/
CREATE DATABASE [ClinicalHospitalRecords]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicalHospitalRecords', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ClinicalHospitalRecords.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicalHospitalRecords_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ClinicalHospitalRecords_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClinicalHospitalRecords] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicalHospitalRecords].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET RECOVERY FULL 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicalHospitalRecords] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicalHospitalRecords] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClinicalHospitalRecords', N'ON'
GO
ALTER DATABASE [ClinicalHospitalRecords] SET QUERY_STORE = OFF
GO
USE [ClinicalHospitalRecords]
GO
/****** Object:  Table [dbo].[DescriptionPatient]    Script Date: 04.11.2022 0:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DescriptionPatient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ApproximateHeight] [nvarchar](100) NOT NULL,
	[HairColor] [nvarchar](100) NULL,
	[SpecialSigns] [nvarchar](100) NULL,
	[ApproximateAge] [int] NOT NULL,
	[NumberOfChambers] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EndOfThreatment]    Script Date: 04.11.2022 0:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndOfThreatment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DischargeDate] [date] NOT NULL,
	[ReasonForDischargeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntryMethod]    Script Date: 04.11.2022 0:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntryMethod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MethodName] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineCard]    Script Date: 04.11.2022 0:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [nvarchar](30) NOT NULL,
	[PreliminaryDiagnosis] [nvarchar](300) NOT NULL,
	[EntryMethodId] [int] NOT NULL,
	[RecieptDate] [date] NOT NULL,
	[DescriptionsId] [int] NULL,
	[EndOfThreatmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReasonForDischarge]    Script Date: 04.11.2022 0:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReasonForDischarge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ReasonName] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfer]    Script Date: 04.11.2022 0:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MedicineCardId] [int] NOT NULL,
	[DateOdTransfer] [date] NOT NULL,
	[ChamberPhone] [nvarchar](16) NOT NULL,
	[NewChamber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DescriptionPatient] ON 
GO
INSERT [dbo].[DescriptionPatient] ([id], [ApproximateHeight], [HairColor], [SpecialSigns], [ApproximateAge], [NumberOfChambers]) VALUES (1, N'175', N'Черные', N'Родинка на правой щеке', 18, 375)
GO
INSERT [dbo].[DescriptionPatient] ([id], [ApproximateHeight], [HairColor], [SpecialSigns], [ApproximateAge], [NumberOfChambers]) VALUES (2, N'190', N'Русые', N'Татуировка на левой руке', 19, 245)
GO
INSERT [dbo].[DescriptionPatient] ([id], [ApproximateHeight], [HairColor], [SpecialSigns], [ApproximateAge], [NumberOfChambers]) VALUES (3, N'183', N'Белые', N'Родимое пятно в центре живота', 24, 113)
GO
SET IDENTITY_INSERT [dbo].[DescriptionPatient] OFF
GO
SET IDENTITY_INSERT [dbo].[EndOfThreatment] ON 
GO
INSERT [dbo].[EndOfThreatment] ([id], [DischargeDate], [ReasonForDischargeId]) VALUES (1, CAST(N'2022-01-01' AS Date), 1)
GO
INSERT [dbo].[EndOfThreatment] ([id], [DischargeDate], [ReasonForDischargeId]) VALUES (2, CAST(N'2022-02-02' AS Date), 2)
GO
INSERT [dbo].[EndOfThreatment] ([id], [DischargeDate], [ReasonForDischargeId]) VALUES (3, CAST(N'2022-03-03' AS Date), 3)
GO
INSERT [dbo].[EndOfThreatment] ([id], [DischargeDate], [ReasonForDischargeId]) VALUES (4, CAST(N'2022-04-04' AS Date), 3)
GO
INSERT [dbo].[EndOfThreatment] ([id], [DischargeDate], [ReasonForDischargeId]) VALUES (5, CAST(N'2022-05-05' AS Date), 2)
GO
INSERT [dbo].[EndOfThreatment] ([id], [DischargeDate], [ReasonForDischargeId]) VALUES (6, CAST(N'2022-06-06' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[EndOfThreatment] OFF
GO
SET IDENTITY_INSERT [dbo].[EntryMethod] ON 
GO
INSERT [dbo].[EntryMethod] ([id], [MethodName]) VALUES (1, N'Направление поликлинники')
GO
INSERT [dbo].[EntryMethod] ([id], [MethodName]) VALUES (2, N'Доставлен на скорой')
GO
SET IDENTITY_INSERT [dbo].[EntryMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicineCard] ON 
GO
INSERT [dbo].[MedicineCard] ([id], [FIO], [Age], [Gender], [PreliminaryDiagnosis], [EntryMethodId], [RecieptDate], [DescriptionsId], [EndOfThreatmentId]) VALUES (1, N'Махмудов Арсен Евгеньевич', 18, N'Мужской', N'Аппендицит', 1, CAST(N'2021-11-01' AS Date), 1, 1)
GO
INSERT [dbo].[MedicineCard] ([id], [FIO], [Age], [Gender], [PreliminaryDiagnosis], [EntryMethodId], [RecieptDate], [DescriptionsId], [EndOfThreatmentId]) VALUES (2, N'Артушкин Игорь Андреевич', 500, N'Мужской', N'Перелом правой руки', 1, CAST(N'2021-12-01' AS Date), 2, 2)
GO
INSERT [dbo].[MedicineCard] ([id], [FIO], [Age], [Gender], [PreliminaryDiagnosis], [EntryMethodId], [RecieptDate], [DescriptionsId], [EndOfThreatmentId]) VALUES (3, N'Мармышкина Ирина Алексеевна', 24, N'Женский', N'Проблема дыхательных путей', 2, CAST(N'2021-12-03' AS Date), 2, 2)
GO
SET IDENTITY_INSERT [dbo].[MedicineCard] OFF
GO
SET IDENTITY_INSERT [dbo].[ReasonForDischarge] ON 
GO
INSERT [dbo].[ReasonForDischarge] ([id], [ReasonName]) VALUES (1, N'Полное излечение')
GO
INSERT [dbo].[ReasonForDischarge] ([id], [ReasonName]) VALUES (2, N'Отправлен(-а) в санаторий')
GO
INSERT [dbo].[ReasonForDischarge] ([id], [ReasonName]) VALUES (3, N'Отправлен(-а) домой долечиваться')
GO
SET IDENTITY_INSERT [dbo].[ReasonForDischarge] OFF
GO
SET IDENTITY_INSERT [dbo].[Transfer] ON 
GO
INSERT [dbo].[Transfer] ([id], [MedicineCardId], [DateOdTransfer], [ChamberPhone], [NewChamber]) VALUES (1, 1, CAST(N'2021-11-14' AS Date), N'+7(856)888-11-01', 432)
GO
INSERT [dbo].[Transfer] ([id], [MedicineCardId], [DateOdTransfer], [ChamberPhone], [NewChamber]) VALUES (2, 2, CAST(N'2021-12-14' AS Date), N'+7(842)123-43-55', 198)
GO
INSERT [dbo].[Transfer] ([id], [MedicineCardId], [DateOdTransfer], [ChamberPhone], [NewChamber]) VALUES (3, 3, CAST(N'2021-12-17' AS Date), N'+7(126)435-22-65', 254)
GO
SET IDENTITY_INSERT [dbo].[Transfer] OFF
GO
ALTER TABLE [dbo].[EndOfThreatment]  WITH CHECK ADD  CONSTRAINT [FK_EndOfThreatment_ReasonForDischarge] FOREIGN KEY([ReasonForDischargeId])
REFERENCES [dbo].[ReasonForDischarge] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EndOfThreatment] CHECK CONSTRAINT [FK_EndOfThreatment_ReasonForDischarge]
GO
ALTER TABLE [dbo].[MedicineCard]  WITH CHECK ADD  CONSTRAINT [FK_MedicineCard_DescriptionPatient] FOREIGN KEY([DescriptionsId])
REFERENCES [dbo].[DescriptionPatient] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicineCard] CHECK CONSTRAINT [FK_MedicineCard_DescriptionPatient]
GO
ALTER TABLE [dbo].[MedicineCard]  WITH CHECK ADD  CONSTRAINT [FK_MedicineCard_EndOfThreatment] FOREIGN KEY([EndOfThreatmentId])
REFERENCES [dbo].[EndOfThreatment] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicineCard] CHECK CONSTRAINT [FK_MedicineCard_EndOfThreatment]
GO
ALTER TABLE [dbo].[MedicineCard]  WITH CHECK ADD  CONSTRAINT [FK_MedicineCard_EntryMethod] FOREIGN KEY([EntryMethodId])
REFERENCES [dbo].[EntryMethod] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicineCard] CHECK CONSTRAINT [FK_MedicineCard_EntryMethod]
GO
ALTER TABLE [dbo].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_MedicineCard] FOREIGN KEY([MedicineCardId])
REFERENCES [dbo].[MedicineCard] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transfer] CHECK CONSTRAINT [FK_Transfer_MedicineCard]
GO
USE [master]
GO
ALTER DATABASE [ClinicalHospitalRecords] SET  READ_WRITE 
GO
