USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[FillUserBook]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[FillUserBook]
	@UserName nvarchar(100)
 --  @responseMessage int = 0 OUTPUT 
AS
BEGIN
   select    [UserName]
			,[Password]
			,[UserFirstName]
			,[EmailAddress]
			,[UserLastName]
			,[UserBio] 
			from Users 
 where UserName = @UserName  or @UserName = 'All'
END
GO
