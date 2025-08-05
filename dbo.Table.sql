CREATE TABLE [dbo].[Table]
(
	[username] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [password] NVARCHAR(50) NULL, 
    [firstname] NVARCHAR(50) NULL, 
    [lastname] NVARCHAR(50) NULL, 
    [email] NVARCHAR(50) NULL, 
    [year] INT NULL, 
    [address] NVARCHAR(50) NULL
)
