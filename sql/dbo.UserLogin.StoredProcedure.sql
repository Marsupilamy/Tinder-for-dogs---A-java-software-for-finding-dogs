USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[UserLogin]
@Username nvarchar(100),
@Password nvarchar(100)
as 

select case when exists (select 1 from dbo.Users where UserName = @Username and Password = @Password) then 'success'
else 'failed' end as ReturnValue
GO
