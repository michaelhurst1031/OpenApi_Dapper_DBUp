
CREATE TABLE [dbo].[Pet_Type](
	[Pet_Type_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Animal_Desc] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 8/8/2020 1:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[Pets_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Pet_Name] [varchar](255) NULL,
	[Birth_Year] [int] NULL,
	[Pet_Type_ID] [nchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pet_Type] ON 

INSERT [dbo].[Pet_Type] ([Pet_Type_ID], [Animal_Desc]) VALUES (1, N'Dog')
SET IDENTITY_INSERT [dbo].[Pet_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([Pets_ID], [Pet_Name], [Birth_Year], [Pet_Type_ID]) VALUES (CAST(1 AS Numeric(18, 0)), N'Rosa', 2015, N'1         ')
INSERT [dbo].[Pets] ([Pets_ID], [Pet_Name], [Birth_Year], [Pet_Type_ID]) VALUES (CAST(2 AS Numeric(18, 0)), N'Skye', 2017, N'1         ')
INSERT [dbo].[Pets] ([Pets_ID], [Pet_Name], [Birth_Year], [Pet_Type_ID]) VALUES (CAST(3 AS Numeric(18, 0)), N'Begura', 2017, N'1         ')
INSERT [dbo].[Pets] ([Pets_ID], [Pet_Name], [Birth_Year], [Pet_Type_ID]) VALUES (CAST(4 AS Numeric(18, 0)), N'Garson', 2019, N'1         ')
SET IDENTITY_INSERT [dbo].[Pets] OFF
GO
/****** Object:  StoredProcedure [dbo].[Get_Pet_By_ID]    Script Date: 8/8/2020 1:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Get_Pet_By_ID]
	@Pets_ID bigint
AS
BEGIN
	SET NOCOUNT ON

	SELECT 
		P.Pet_Name,
		P.Birth_Year,
		P.Pet_Type_ID
	FROM dbo.Pets P
		INNER JOIN dbo.Pet_Type T ON T.Pet_Type_ID=P.Pet_Type_ID
	WHERE P.Pets_ID=@Pets_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Post_Pets]    Script Date: 8/8/2020 1:58:21 PM ******/
SET ANSI_NULLS ON
GO