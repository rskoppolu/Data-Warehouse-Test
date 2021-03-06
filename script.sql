USE [Assignment]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/20/2018 12:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[NationalIDNumber] [int] NULL,
	[LoginID] [nvarchar](150) NULL,
	[ShiftID] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[HireDate] [date] NULL,
	[SalariedFlag] [bit] NULL,
	[VacationHours] [float] NULL,
	[SickLeaveHours] [float] NULL,
	[CurrentFlag] [bit] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[BusinessEntityID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 6/20/2018 12:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [varchar](50) NULL,
	[NameStyle] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](250) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastNAme] [varchar](50) NULL,
	[Suffix] [varchar](50) NULL,
	[EmailPromotion] [varchar](250) NULL,
	[AdditionalContactInfo] [varchar](50) NULL,
	[Demographics] [varchar](250) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderDetail]    Script Date: 6/20/2018 12:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetail](
	[BusinessEntityID] [int] NULL,
	[SalesOrderID] [int] NULL,
	[SalesorderDetailID] [int] NULL,
	[CarrierTrackingNumber] [int] NULL,
	[OrderQty] [money] NULL,
	[ProductID] [int] NULL,
	[SpecialOrderID] [int] NULL,
	[UnitProice] [money] NULL,
	[UnitPriceDiscount] [money] NULL,
	[LineTotal] [money] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrderHeader]    Script Date: 6/20/2018 12:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderHeader](
	[BusinessEntityID] [int] NULL,
	[SalesOrderID] [int] NOT NULL,
	[ShipMethodID] [int] NULL,
	[RevisionNumber] [int] NULL,
	[OrderDate] [date] NULL,
	[DueDate] [date] NULL,
	[ShipDate] [date] NULL,
	[Status] [nvarchar](500) NULL,
	[OnlineOrderFlag] [bit] NULL,
	[SalesOrderNumber] [int] NULL,
	[PurchaseOrderNumber] [int] NULL,
	[AccountNumber] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [nvarchar](50) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NULL,
	[TaxAmt] [money] NULL,
	[Freight] [money] NULL,
	[TotalDue] [money] NULL,
	[Comment] [nvarchar](500) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [SalesOrderIDPK] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 6/20/2018 12:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[BusinessEntityID] [int] NULL,
	[TerritoryID] [int] NULL,
	[SalesQuota] [float] NULL,
	[Bonus] [money] NULL,
	[CommisionPct] [float] NULL,
	[SalesYTD] [money] NULL,
	[SalesLastYear] [money] NULL,
	[CostYTD] [money] NULL,
	[CostLastYear] [money] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPersonQuotaHistory]    Script Date: 6/20/2018 12:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPersonQuotaHistory](
	[BusinessEntityID] [int] NULL,
	[QuotaDate] [date] NULL,
	[SalesQuota] [float] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesTerritory]    Script Date: 6/20/2018 12:00:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTerritory](
	[TerritoryID] [int] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[CountryRegionCode] [nvarchar](50) NULL,
	[Groups] [nvarchar](50) NULL,
	[SalesYTD] [money] NULL,
	[SalesLastYear] [money] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([NationalIDNumber], [LoginID], [ShiftID], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [rowguid], [ModifiedDate], [BusinessEntityID]) VALUES (67676, N'MS\rkopp', N'A2', CAST(N'1990-06-06' AS Date), N'Married', N'Female', CAST(N'2018-06-20' AS Date), 1, 12.3, 1.5, 1, N'e3c3641f-5074-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime), 100)
INSERT [dbo].[Employee] ([NationalIDNumber], [LoginID], [ShiftID], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [rowguid], [ModifiedDate], [BusinessEntityID]) VALUES (7899, N'MS\auto', N'B3', CAST(N'2010-07-07' AS Date), N'Unmarried', N'Male', CAST(N'2018-06-20' AS Date), 1, 11.1, 1.23, 1, N'14084a47-5074-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime), 200)
INSERT [dbo].[Person] ([BusinessEntityID], [PersonType], [NameStyle], [Title], [FirstName], [MiddleName], [LastNAme], [Suffix], [EmailPromotion], [AdditionalContactInfo], [Demographics], [rowguid], [ModifiedDate]) VALUES (100, N'Professional', N'', N'Mr', N'Rajasekhar', N'M', N'Reddy', N'Rao', N'email@gmail.com', N'Hyderabad', N'Hyderabad', N'73b5db95-4f74-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Person] ([BusinessEntityID], [PersonType], [NameStyle], [Title], [FirstName], [MiddleName], [LastNAme], [Suffix], [EmailPromotion], [AdditionalContactInfo], [Demographics], [rowguid], [ModifiedDate]) VALUES (200, N'Worker', NULL, N'Ms', N'Malini', N'K', N'Reddy', N'Smt', N'email@gmail.com', N'Canada', N'Canada', N'42ba84b3-4f74-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesOrderDetail] ([BusinessEntityID], [SalesOrderID], [SalesorderDetailID], [CarrierTrackingNumber], [OrderQty], [ProductID], [SpecialOrderID], [UnitProice], [UnitPriceDiscount], [LineTotal], [rowguid], [ModifiedDate]) VALUES (100, 100, 1, 2000, 8.0000, 564, 345, 8979.0000, 56.0000, 346666.0000, N'568841ce-5174-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesOrderDetail] ([BusinessEntityID], [SalesOrderID], [SalesorderDetailID], [CarrierTrackingNumber], [OrderQty], [ProductID], [SpecialOrderID], [UnitProice], [UnitPriceDiscount], [LineTotal], [rowguid], [ModifiedDate]) VALUES (200, 101, 2, 4000, 5.0000, 45, 656, 6543.0000, 4.0000, 55556.0000, N'110fbf08-5274-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([BusinessEntityID], [SalesOrderID], [ShipMethodID], [RevisionNumber], [OrderDate], [DueDate], [ShipDate], [Status], [OnlineOrderFlag], [SalesOrderNumber], [PurchaseOrderNumber], [AccountNumber], [TerritoryID], [BillToAddressID], [ShipToAddressID], [CreditCardID], [CreditCardApprovalCode], [CurrencyRateID], [SubTotal], [TaxAmt], [Freight], [TotalDue], [Comment], [rowguid], [ModifiedDate]) VALUES (100, 100, 1, 1, CAST(N'2018-06-20' AS Date), CAST(N'2018-06-25' AS Date), CAST(N'2018-06-30' AS Date), N'Sent', 1, 100, 1001, 120, 100, 1, 1, 1, N'1', 1, 2300.0000, 1290.0000, 213.0000, 12345.0000, N'no idea', N'161d0763-5174-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesOrderHeader] ([BusinessEntityID], [SalesOrderID], [ShipMethodID], [RevisionNumber], [OrderDate], [DueDate], [ShipDate], [Status], [OnlineOrderFlag], [SalesOrderNumber], [PurchaseOrderNumber], [AccountNumber], [TerritoryID], [BillToAddressID], [ShipToAddressID], [CreditCardID], [CreditCardApprovalCode], [CurrencyRateID], [SubTotal], [TaxAmt], [Freight], [TotalDue], [Comment], [rowguid], [ModifiedDate]) VALUES (200, 101, 2, 2, CAST(N'2018-06-08' AS Date), CAST(N'2018-06-23' AS Date), CAST(N'2018-06-23' AS Date), N'sent', 1, 90, 900, 989, 200, 22, 44, 4, N'4', 4, 67676.0000, 6767.0000, 454.0000, 545.0000, N'yes', N'20a9489b-5174-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesPerson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommisionPct], [SalesYTD], [SalesLastYear], [CostYTD], [CostLastYear], [rowguid], [ModifiedDate]) VALUES (100, 101, 100, 75.0000, 12, 2400.0000, 2300.0000, 1200.0000, 1100.0000, N'05beedcb-5074-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesPerson] ([BusinessEntityID], [TerritoryID], [SalesQuota], [Bonus], [CommisionPct], [SalesYTD], [SalesLastYear], [CostYTD], [CostLastYear], [rowguid], [ModifiedDate]) VALUES (200, 102, 98, 67.0000, 11, 2300.0000, 2100.0000, 1270.0000, 1280.0000, N'dca090de-5074-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesPersonQuotaHistory] ([BusinessEntityID], [QuotaDate], [SalesQuota], [rowguid], [ModifiedDate]) VALUES (200, CAST(N'2018-06-20' AS Date), 78, N'9913c421-5274-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesPersonQuotaHistory] ([BusinessEntityID], [QuotaDate], [SalesQuota], [rowguid], [ModifiedDate]) VALUES (100, CAST(N'2017-06-06' AS Date), 34, N'9141092f-5274-e811-a4db-7c67a2fe54c4', CAST(N'2017-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesTerritory] ([TerritoryID], [Name], [CountryRegionCode], [Groups], [SalesYTD], [SalesLastYear], [rowguid], [ModifiedDate]) VALUES (101, N'EMEA', N'Europe', N'E1', 23000.0000, 22000.0000, N'c2abf87a-5074-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[SalesTerritory] ([TerritoryID], [Name], [CountryRegionCode], [Groups], [SalesYTD], [SalesLastYear], [rowguid], [ModifiedDate]) VALUES (102, N'APAC', N'ASIA', N'A1', 23400.0000, 22300.0000, N'7480da97-5074-e811-a4db-7c67a2fe54c4', CAST(N'2018-06-20T00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [Guid_Default1]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [Guid_Default]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SalesOrderDetail] ADD  CONSTRAINT [Guid_Default5]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SalesOrderHeader] ADD  CONSTRAINT [Guid_Default4]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SalesPerson] ADD  CONSTRAINT [Guid_Default3]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SalesPersonQuotaHistory] ADD  CONSTRAINT [Guid_Default6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SalesTerritory] ADD  CONSTRAINT [Guid_Default2]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[Person] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[Person] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[SalesOrderDetail]  WITH CHECK ADD FOREIGN KEY([SalesOrderID])
REFERENCES [dbo].[SalesOrderHeader] ([SalesOrderID])
GO
ALTER TABLE [dbo].[SalesOrderHeader]  WITH CHECK ADD FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[Person] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[SalesPerson]  WITH CHECK ADD FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[Person] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[SalesPerson]  WITH CHECK ADD FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[SalesTerritory] ([TerritoryID])
GO
ALTER TABLE [dbo].[SalesPersonQuotaHistory]  WITH CHECK ADD FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[Person] ([BusinessEntityID])
GO
