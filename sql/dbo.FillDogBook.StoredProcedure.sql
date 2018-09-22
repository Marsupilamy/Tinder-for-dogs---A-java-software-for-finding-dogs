USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[FillDogBook]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillDogBook]
	@UserName nvarchar(100)
 --  @responseMessage int = 0 OUTPUT 
AS
BEGIN
   select   DogName, DogLocation, UserName 
   from Dogs
   inner join Users 
	on Users.UserId = Dogs.OwnerId
   where UserName = @UserName  or @UserName = 'All'
END
GO
