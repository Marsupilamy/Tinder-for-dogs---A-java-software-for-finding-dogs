USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]
    @UserFirstName nvarchar(100),
	@UserLastName nvarchar(100),
	@UserName nvarchar(100),
	@UserBio nvarchar(MAX),
	@Password nvarchar(50),
	@UserType nvarchar(100),
	@EmailAddress nvarchar(100)
 --  @responseMessage int = 0 OUTPUT 
AS

    SET NOCOUNT ON
	declare @responsemessage nvarchar(max) 
	declare @Salt uniqueidentifier = NewId()
	IF Len(@UserName) > 0 and len(@Password) > 0 and len(@UserFirstName) > 0 and len(@UserLastName) > 0 
	BEGIN 
		BEGIN TRY
		        INSERT INTO dbo.[Users] (UserFirstName, UserLastName, UserName, UserBio, Password, Salt, UserType, EmailAddress)
				 -- VALUES(@UserFirstName,@UserLastName , @UserName, @UserBio, HASHBYTES('SHA2_512', @Password + convert(nvarchar(36), @Salt)), @Salt)
				VALUES(@UserFirstName,@UserLastName , @UserName, @UserBio,  @Password ,@Salt, @UserType, @EmailAddress)
				set @responseMessage= 'success'
	    END TRY
		BEGIN CATCH
			set @responseMessage=ERROR_MESSAGE() 
		END CATCH
	END
	ELSE BEGIN
	set @responsemessage = 'FAILED BECAUSE YOU DID NOT FILL IN THE FIELDS'
	END
	
	--return @responseMessage
	select  @responseMessage
GO
