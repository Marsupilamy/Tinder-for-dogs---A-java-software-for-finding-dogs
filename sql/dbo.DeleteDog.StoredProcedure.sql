USE [DogTinder]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDog]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDog]
	@DogId int
 --  @responseMessage int = 0 OUTPUT 
AS
BEGIN
    SET NOCOUNT ON
	declare @responsemessage nvarchar(max) 

    BEGIN TRY

       Delete from dbo.Dogs 
	   where DogId = @DogId
	   
	IF @@ROWCOUNT = 0 
	BEGIn
	set @responsemessage = 'failed'
	END
	ELSE BEGIN
	set @responsemessage = 'success'
	END
    END TRY
    BEGIN CATCH
        set @responseMessage=ERROR_MESSAGE() 
	-- set @responseMessage = 1 
    END CATCH
	
	--return @responseMessage
	select  @responseMessage
END
GO
