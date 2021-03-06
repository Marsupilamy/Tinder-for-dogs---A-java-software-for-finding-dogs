USE [DogTinder]
GO
/****** Object:  Table [dbo].[Dogs]    Script Date: 23/04/2018 14:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dogs](
	[DogId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[DogName] [nvarchar](100) NULL,
	[DogBreed] [nvarchar](50) NULL,
	[DogLocation] [nvarchar](100) NULL,
	[Birthdate] [date] NULL,
 CONSTRAINT [PK_Dogs] PRIMARY KEY CLUSTERED 
(
	[DogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
