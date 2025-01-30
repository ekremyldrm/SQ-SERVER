-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	EKREM YILDIRIM
-- Create date: 
-- Description:	bu PROCEDURE SHİPPERS TABLOSUNA KAYIT YAPAR....
-- =============================================
CREATE PROCEDURE AddShipers
	@CompanyName nvarchar(50),
	@Phone nvarchar(50)
AS
BEGIN
	
	IF NOT EXISTS (SELECT * FROM Shippers WHERE CompanyName = @CompanyName)
	BEGIN
			insert Shippers
			(CompanyName,Phone)
			values
			(@CompanyName,@Phone)

			return 1
	END
	ELSE
	BEGIN
			RETURN 0
	END

END
GO
