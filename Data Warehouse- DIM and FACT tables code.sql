USE [AUSTRALIA_PROPERTY_ANALYSIS_DW]
GO

/****** Object:  Table [dbo].[DimGeography]    Script Date: 18/03/2023 7:27:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[SuburbAltKey] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[District] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Postcode] [nvarchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[GeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimState]    Script Date: 18/03/2023 7:29:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimState](
	[DWStateKey] [int] IDENTITY(1,1) NOT NULL,
	[StateAltKey] [int] NULL,
	[GeographyKey] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[StateName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DWStateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimState]  WITH CHECK ADD  CONSTRAINT [FK_DimAuState_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[DimState] CHECK CONSTRAINT [FK_DimAuState_DimGeography]
GO


/****** Object:  Table [dbo].[DimAuLocalSchool]    Script Date: 18/03/2023 7:30:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAuLocalSchool](
	[SchoolKey] [int] IDENTITY(1,1) NOT NULL,
	[SchoolAltKey] [int] NULL,
	[GeographyKey] [int] NULL,
	[SchoolCode] [int] NULL,
	[SchoolName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
	[SchoolType] [nvarchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[CollectionYear] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimAuLocalSchool]  WITH CHECK ADD  CONSTRAINT [FK_DimAusSchool_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[DimAuLocalSchool] CHECK CONSTRAINT [FK_DimAusSchool_DimGeography]
GO

/****** Object:  Table [dbo].[DimTransport]    Script Date: 18/03/2023 7:31:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimTransport](
	[TransportKey] [int] IDENTITY(1,1) NOT NULL,
	[TransportAltKey] [int] NULL,
	[GeographyKey] [int] NULL,
	[StopId] [int] NULL,
	[StopName] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[PostCode] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[Mode] [nvarchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransportKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimTransport]  WITH CHECK ADD  CONSTRAINT [FK_DimSTransport_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[DimTransport] CHECK CONSTRAINT [FK_DimSTransport_DimGeography]
GO


/****** Object:  Table [dbo].[DimDate]    Script Date: 18/03/2023 7:32:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [datetime] NULL,
	[DayOfMonth] [float] NULL,
	[DayOfYear] [float] NULL,
	[MonthName] [nvarchar](255) NULL,
	[MonthOfYear] [int] NULL,
	[CalendarYear] [int] NULL,
	[CalendarYearMonth] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactCrimeByYear]    Script Date: 18/03/2023 7:32:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactCrimeByYear](
	[FactcrimeKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[DateKey] [int] NULL,
	[CrimeId] [int] NOT NULL,
	[Offence Category] [nvarchar](255) NULL,
	[Offence Subcategory] [nvarchar](255) NULL,
	[Recorded Incidents] [int] NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FactcrimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactCrimeByYear_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FK_FactCrimeByYear_DimDate]
GO

ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactCrimeByYear_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FK_FactCrimeByYear_DimGeography]
GO

/****** Object:  Table [dbo].[FactMedianPropertyValueByYear]    Script Date: 18/03/2023 7:33:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactMedianPropertyValueByYear](
	[FactmedianpropertyvalueKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[DateKey] [int] NULL,
	[PropertyId] [int] NOT NULL,
	[No of Sales] [nvarchar](255) NULL,
	[Property Type] [nvarchar](255) NULL,
	[PropertyMedianValue] [int] NULL,
	[Quarter] [nvarchar](255) NULL,
	[Updated Month] [int] NULL,
	[Updated Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FactmedianpropertyvalueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactMedianPropertyValueByYear_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FK_FactMedianPropertyValueByYear_DimDate]
GO

ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactMedianPropertyValueByYear_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FK_FactMedianPropertyValueByYear_DimGeography]
GO


/****** Object:  Table [dbo].[FactSuburbPopulation]    Script Date: 18/03/2023 7:33:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSuburbPopulation](
	[FactsuburbpopulationKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[DateKey] [int] NULL,
	[Population Id] [int] NOT NULL,
	[Population Estimate] [int] NULL,
	[Collection Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FactsuburbpopulationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactSuburbPopulation]  WITH CHECK ADD  CONSTRAINT [FK_FactSuburbPopulation_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactSuburbPopulation] CHECK CONSTRAINT [FK_FactSuburbPopulation_DimDate]
GO

ALTER TABLE [dbo].[FactSuburbPopulation]  WITH CHECK ADD  CONSTRAINT [FK_FactSuburbPopulation_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[FactSuburbPopulation] CHECK CONSTRAINT [FK_FactSuburbPopulation_DimGeography]
GO


/****** Object:  Table [dbo].[FactSuburbRentalMedian]    Script Date: 18/03/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactSuburbRentalMedian](
	[FactsuburbrentalmedianKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NULL,
	[RentalId] [int] NOT NULL,
	[Dwelling Type] [nvarchar](255) NULL,
	[Rent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FactsuburbrentalmedianKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactSuburbRentalMedian]  WITH CHECK ADD  CONSTRAINT [FK_FactSuburbRentalMedian_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO

ALTER TABLE [dbo].[FactSuburbRentalMedian] CHECK CONSTRAINT [FK_FactSuburbRentalMedian_DimGeography]
GO


----------------------------------------------END----------------------------------------------------------