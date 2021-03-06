USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[AddDog]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDog]
	@Owner nvarchar(100) = 'PuppyLover123',
	@DogName nvarchar(100),
	@DogLocation nvarchar(100) = '',
    @DogBreed nvarchar(100) = null,
	@birthDate date = '1900-01-01'
 --  @responseMessage int = 0 OUTPUT 
AS
BEGIN
    SET NOCOUNT ON
	declare @responsemessage nvarchar(max) 

    BEGIN TRY

        INSERT INTO dbo.Dogs(OwnerId, DogName, DogLocation, DogBreed, Birthdate)
       -- VALUES(@UserFirstName,@UserLastName , @UserName, @UserBio, HASHBYTES('SHA2_512', @Password + convert(nvarchar(36), @Salt)), @Salt)
	   VALUES((select Userid from dbo.Users where Username = @Owner),@DogName , @DogLocation, @DogBreed,  @birthDate)
        set @responseMessage= 'success'

    END TRY
    BEGIN CATCH
        set @responseMessage=ERROR_MESSAGE() 
	-- set @responseMessage = 1 
    END CATCH
	--return @responseMessage
	select  @responseMessage
END
GO
