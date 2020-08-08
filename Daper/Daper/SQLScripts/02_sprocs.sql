
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Post_Pets]
	@Pet_Name varchar(255),
	@Birth_Year int,
	@Pet_Type_ID int
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.Pets
	(
		Pet_Name,
		Birth_Year,
		Pet_Type_ID
		)
	VALUES
	(
		@Pet_Name,
		@Birth_Year,
		@Pet_Type_ID
	)

	SELECT SCOPE_IDENTITY() AS Pets_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Put_Pets]    Script Date: 8/8/2020 1:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Put_Pets]
	@Pets_ID bigint,
	@Pet_Name varchar(255),
	@Birth_Year int,
	@Pet_Type_ID int
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.Pets
	SET 
		Pet_Name=@Pet_Name,
		Birth_Year=@Birth_Year,
		Pet_Type_ID=@Pet_Type_ID
	WHERE 
		Pets_ID=@Pets_ID
END
GO