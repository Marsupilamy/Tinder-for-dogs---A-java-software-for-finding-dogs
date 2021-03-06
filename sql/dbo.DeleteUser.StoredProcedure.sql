USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteUser]
	@UserName nvarchar(100)
 --  @responseMessage int = 0 OUTPUT 
AS
BEGIN
    SET NOCOUNT ON
	declare @responsemessage nvarchar(max) = ''

    Delete from dbo.Dogs 
	where OwnerId = (select Userid from dbo.Users where UserName =  @UserName)

	set @responsemessage = (select convert(nvarchar(100), @@ROWCOUNT) + ' dogs deleted.'   )

	delete from dbo.Users
	where UserName = @UserName

	IF @@ROWCOUNT = 1
	BEGIN
	set  @responsemessage =  @responsemessage + ' User Deleted'
	END
	ELSE BEGIN
	set @responsemessage =  @responsemessage + ' No user Deleted'
	END
	
	select  @responseMessage
END
GO
