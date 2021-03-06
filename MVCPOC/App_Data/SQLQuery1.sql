/****** Object:  Database [POCDB]    Script Date: 8/20/2018 6:06:37 PM ******/
CREATE DATABASE [POCDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POCDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\POCDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'POCDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\POCDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [POCDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POCDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POCDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POCDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POCDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POCDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POCDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [POCDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POCDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POCDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POCDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POCDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POCDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POCDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POCDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POCDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POCDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POCDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POCDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POCDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POCDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POCDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POCDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POCDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POCDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [POCDB] SET  MULTI_USER 
GO
ALTER DATABASE [POCDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POCDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POCDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POCDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [POCDB] SET DELAYED_DURABILITY = DISABLED 
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/20/2018 6:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([Name], [Email], [Password], [Department], [ID]) VALUES (N'testing123', N'test@gmail.com', N'test', N'Financial Services', 56)
GO
INSERT [dbo].[Employee] ([Name], [Email], [Password], [Department], [ID]) VALUES (N'gmail', N'hkahj@gmail.com', N'hello', N'Life Sciences', 58)
GO
INSERT [dbo].[Employee] ([Name], [Email], [Password], [Department], [ID]) VALUES (N'qwerty', N'qwerty@gmail.com', N'qwerty', N'Pharmacy', 61)
GO
INSERT [dbo].[Employee] ([Name], [Email], [Password], [Department], [ID]) VALUES (N'efsdf', N'kackie@gmail.com', N'hello', N'financial services', 67)
GO
INSERT [dbo].[Employee] ([Name], [Email], [Password], [Department], [ID]) VALUES (N'hello', N'kackie@gmail.com', N'poco', N'financial services', 68)
GO
INSERT [dbo].[Employee] ([Name], [Email], [Password], [Department], [ID]) VALUES (N'kll', N'jksd@gmail.com', N'jks', N'jks', 69)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
/****** Object:  StoredProcedure [dbo].[DisplayAll]    Script Date: 8/20/2018 6:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext [insertReg]

create procedure [dbo].[DisplayAll] 
 AS
 Begin

select * from Employee

End
GO
/****** Object:  StoredProcedure [dbo].[insertReg]    Script Date: 8/20/2018 6:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertReg]
 @name nvarchar(50), @email nvarchar(50), @password nvarchar(50), @department nvarchar(50)
 AS
 Begin

insert into Employee(Name, Email, [Password], Department) values(@name, @email, @password, @department)

End

GO
/****** Object:  StoredProcedure [dbo].[MyStoredProcedure]    Script Date: 8/20/2018 6:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MyStoredProcedure]
@name NVARCHAR(50) = NULL,
@email NVARCHAR(50) = NULL ,
@password NVARCHAR(50) = NULL, 
@department NVARCHAR(50) = NULL,
@id VARCHAR(50) = NULL,
@Action VARCHAR(50) = NULL

AS
 
BEGIN

	IF @Action = 'Insert'

	INSERT INTO Employee
	(	
		Name,
		Email,
		[Password],
		Department
	) VALUES 
	(
		@name,
		@email,
		@password,
		@department
	)

	IF @Action = 'Update'

	UPDATE Employee SET
	Name = @name,
	Email = @email, 
	[Password] = @password,
	Department = @department 
	WHERE ID = @id

	IF @Action = 'Delete'

	DELETE FROM Employee WHERE ID = @id

	if @Action = 'Show'

	SELECT * FROM Employee

END
GO
/****** Object:  StoredProcedure [dbo].[selectallCustomers]    Script Date: 8/20/2018 6:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectallCustomers]
	as select * from Employee
	go;
GO
ALTER DATABASE [POCDB] SET  READ_WRITE 
GO
