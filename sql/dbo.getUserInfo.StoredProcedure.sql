USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[getUserInfo]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[getUserInfo]
@Username nvarchar(100)
as 

select	UserName
		,[Password]
		,[UserFirstName]
		,EmailAddress
		,UserLastName
		,UserBio

from dbo.Users 
where UserName = @UserName  or @Username = 'All'
GO
