USE [master]
GO
/****** Object:  Database [Nm_Admin]    Script Date: 2019/10/24 11:44:04 ******/
CREATE DATABASE [Nm_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Admin', FILENAME = N'D:\Database\SqlServer\Nm_Admin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_Admin_log', FILENAME = N'D:\Database\SqlServer\Nm_Admin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_Admin] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Admin] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nm_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Admin] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Admin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Admin', N'ON'
GO
ALTER DATABASE [Nm_Admin] SET QUERY_STORE = OFF
GO
USE [Nm_Admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [smallint] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginIP] [nvarchar](50) NOT NULL,
	[Status] [smallint] NOT NULL,
	[IsLock] [bit] NOT NULL,
	[ClosedTime] [datetime] NOT NULL,
	[ClosedBy] [uniqueidentifier] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Config]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Skin] [nvarchar](50) NOT NULL,
	[Theme] [nvarchar](50) NOT NULL,
	[FontSize] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditInfo]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[ControllerDesc] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NOT NULL,
	[ActionDesc] [nvarchar](50) NULL,
	[Parameters] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[ExecutionTime] [datetime] NOT NULL,
	[ExecutionDuration] [bigint] NOT NULL,
	[BrowserInfo] [nvarchar](500) NOT NULL,
	[Platform] [smallint] NOT NULL,
	[IP] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button](
	[Id] [uniqueidentifier] NOT NULL,
	[MenuCode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Button_Permission]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Button_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ButtonCode] [nvarchar](50) NOT NULL,
	[PermissionCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](500) NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RouteName] [nvarchar](50) NOT NULL,
	[RouteParams] [nvarchar](500) NOT NULL,
	[RouteQuery] [nvarchar](500) NOT NULL,
	[Url] [nvarchar](300) NOT NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[IconColor] [nvarchar](50) NULL,
	[Level] [int] NOT NULL,
	[Show] [bit] NOT NULL,
	[Sort] [int] NOT NULL,
	[Target] [smallint] NOT NULL,
	[DialogWidth] [nvarchar](50) NULL,
	[DialogHeight] [nvarchar](50) NULL,
	[DialogFullscreen] [bit] NOT NULL,
	[Remarks] [nvarchar](50) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Permission]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuCode] [nvarchar](50) NOT NULL,
	[PermissionCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleInfo]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](200) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ModuleCode] [nvarchar](50) NOT NULL,
	[Controller] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[HttpMethod] [smallint] NOT NULL,
	[Code] [nvarchar](200) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](300) NOT NULL,
	[IsSpecified] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Menu_Button]    Script Date: 2019/10/24 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Menu_Button](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[ButtonId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [Type], [UserName], [Password], [Name], [Phone], [Email], [LoginTime], [LoginIP], [Status], [IsLock], [ClosedTime], [ClosedBy], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'9a4f201b-aff8-de87-1a7a-39f08d463d93', 0, N'admin', N'E739279CB28CDAFD7373618313803524', N'管理员', N'', N'', CAST(N'2019-10-24T11:41:59.427' AS DateTime), N'0.0.0.1', 1, 0, CAST(N'2019-09-29T11:38:45.007' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-09-29T11:38:45.010' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-09-29T11:38:45.010' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-09-29T11:38:45.010' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Account_Role] ON 

INSERT [dbo].[Account_Role] ([Id], [AccountId], [RoleId]) VALUES (1, N'9a4f201b-aff8-de87-1a7a-39f08d463d93', N'94f75efd-d6ad-84f1-021f-39f08d463cf8')
SET IDENTITY_INSERT [dbo].[Account_Role] OFF
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'410a309b-5be7-a210-c7b4-39f08d4e445e', N'personnelfiles_company', N'添加', N'add', N'personnelfiles_company_add', CAST(N'2019-09-29T11:47:31.037' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:31.037' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c348b547-a339-d07d-09d3-39f08d4e44ca', N'personnelfiles_company', N'编辑', N'edit', N'personnelfiles_company_edit', CAST(N'2019-09-29T11:47:31.147' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:31.147' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'08e4b3d5-d7bb-9559-ba9a-39f08d4e4520', N'personnelfiles_company', N'删除', N'delete', N'personnelfiles_company_del', CAST(N'2019-09-29T11:47:31.233' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:31.233' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3ae10349-4bdc-b6eb-2b37-39f08d4e522c', N'personnelfiles_department', N'添加', N'add', N'personnelfiles_department_add', CAST(N'2019-09-29T11:47:34.573' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:34.573' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'699ca78b-699d-7a7d-2983-39f08d4e527f', N'personnelfiles_department', N'编辑', N'edit', N'personnelfiles_department_edit', CAST(N'2019-09-29T11:47:34.657' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:34.657' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'453f6c53-d137-86fa-b4a4-39f08d4e52ce', N'personnelfiles_department', N'删除', N'delete', N'personnelfiles_department_del', CAST(N'2019-09-29T11:47:34.733' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:34.733' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7415195e-936f-e111-389d-39f08d4e5320', N'personnelfiles_department', N'岗位', N'edit', N'personnelfiles_department_position', CAST(N'2019-09-29T11:47:34.817' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:34.817' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1cfcd4fe-f720-7f37-8048-39f08d4e536f', N'personnelfiles_department', N'岗位添加', N'add', N'personnelfiles_department_position_add', CAST(N'2019-09-29T11:47:34.897' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:34.897' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e72af737-4666-91c5-76ae-39f08d4e53be', N'personnelfiles_department', N'岗位编辑', N'edit', N'personnelfiles_department_position_edit', CAST(N'2019-09-29T11:47:34.973' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:34.973' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'362ed64f-cb0e-4802-10e3-39f08d4e540a', N'personnelfiles_department', N'岗位删除', N'delete', N'personnelfiles_department_position_del', CAST(N'2019-09-29T11:47:35.050' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:35.050' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'91c83e0a-7f8d-e3dd-cd6f-39f08d4e6360', N'personnelfiles_position', N'删除', N'delete', N'personnelfiles_position_del', CAST(N'2019-09-29T11:47:38.977' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:38.977' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2bbb3d47-f9d2-1d00-cb73-39f08d4e8fae', N'personnelfiles_user', N'添加', N'add', N'personnelfiles_user_add', CAST(N'2019-09-29T11:47:50.320' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:50.320' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'34a6a389-4570-2c62-b1ae-39f08d4e8ffb', N'personnelfiles_user', N'编辑', N'edit', N'personnelfiles_user_edit', CAST(N'2019-09-29T11:47:50.397' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:50.397' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e757244b-6ea5-289d-3cb4-39f08d4e9054', N'personnelfiles_user', N'删除', N'delete', N'personnelfiles_user_del', CAST(N'2019-09-29T11:47:50.483' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:50.483' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e99aa10d-6661-b5af-fd8e-39f08d4e90a5', N'personnelfiles_user', N'工作经历', N'work', N'personnelfiles_user_work_history', CAST(N'2019-09-29T11:47:50.567' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:50.567' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c376cc20-879f-e5d5-995f-39f08d4e90fc', N'personnelfiles_user', N'教育经历', N'education', N'personnelfiles_user_education_history', CAST(N'2019-09-29T11:47:50.653' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:47:50.653' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'42114854-ab36-ad85-d3d9-39f08d4ec288', N'common_area', N'添加', N'add', N'common_area_add', CAST(N'2019-09-29T11:48:03.337' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:41.563' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a5e423bc-a2fe-15a3-7aeb-39f08d4ec2e0', N'common_area', N'编辑', N'edit', N'common_area_edit', CAST(N'2019-09-29T11:48:03.423' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:41.633' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6eaa5d7c-96a4-2024-bef3-39f08d4ec335', N'common_area', N'删除', N'delete', N'common_area_del', CAST(N'2019-09-29T11:48:03.510' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:41.690' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3e8f0423-876f-2ea4-6d5a-39f08d4ecfc2', N'common_attachment', N'删除', N'delete', N'common_attachment_del', CAST(N'2019-09-29T11:48:06.723' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:46.450' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8fc12b1f-646a-aedd-d719-39f08d4ed027', N'common_attachment', N'导出', N'export', N'common_attachment_export', CAST(N'2019-09-29T11:48:06.823' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:46.520' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cac5daee-9ba3-f0e8-b3f6-39f08d4ef8cc', N'quartz_group', N'添加', N'add', N'quartz_group_add', CAST(N'2019-09-29T11:48:17.227' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:17.227' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a10fda55-749d-61d9-450a-39f08d4ef922', N'quartz_group', N'删除', N'delete', N'quartz_group_del', CAST(N'2019-09-29T11:48:17.313' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:17.313' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'622daef3-248e-2290-c476-39f08d4f0391', N'quartz_job', N'添加', N'add', N'quartz_job_add', CAST(N'2019-09-29T11:48:19.987' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:19.987' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f3b02e7b-4690-82d6-6b0a-39f08d4f03fa', N'quartz_job', N'编辑', N'edit', N'quartz_job_edit', CAST(N'2019-09-29T11:48:20.090' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:20.090' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cbfb4bdc-485a-4095-44c3-39f08d4f0441', N'quartz_job', N'暂停', N'pause', N'quartz_job_pause', CAST(N'2019-09-29T11:48:20.163' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:20.163' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8d1f00e9-0249-0c63-54fd-39f08d4f048e', N'quartz_job', N'启动', N'run', N'quartz_job_resume', CAST(N'2019-09-29T11:48:20.240' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:20.240' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4d484364-9bdb-4422-4ab5-39f08d4f04da', N'quartz_job', N'日志', N'log', N'quartz_job_log', CAST(N'2019-09-29T11:48:20.313' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:20.313' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8540cc8d-2bdf-17a0-b829-39f08d4f0530', N'quartz_job', N'删除', N'delete', N'quartz_job_del', CAST(N'2019-09-29T11:48:20.400' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:20.400' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'90684566-6800-a930-5412-39f08d4f322e', N'admin_moduleinfo', N'同步', N'refresh', N'admin_moduleinfo_sync', CAST(N'2019-09-29T11:48:31.917' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:31.917' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ab091f87-18dc-093b-4fab-39f08d4f3295', N'admin_moduleinfo', N'删除', N'delete', N'admin_moduleinfo_del', CAST(N'2019-09-29T11:48:32.020' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:32.020' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6f803ff0-bd79-3712-9281-39f08d4f3f61', N'admin_permission', N'同步', N'refresh', N'admin_permission_sync', CAST(N'2019-09-29T11:48:35.297' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:35.297' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6c592301-36e7-b7da-777a-39f08d4f57cd', N'admin_menu', N'添加', N'add', N'admin_menu_add', CAST(N'2019-09-29T11:48:41.550' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:41.550' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'56fbcc53-e9c0-2e81-e0aa-39f08d4f5828', N'admin_menu', N'编辑', N'edit', N'admin_menu_edit', CAST(N'2019-09-29T11:48:41.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:41.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd4f4f34c-266a-f3dc-e4d4-39f08d4f5876', N'admin_menu', N'删除', N'delete', N'admin_menu_del', CAST(N'2019-09-29T11:48:41.717' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:41.717' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6e35c614-a4a0-f810-9b61-39f08d4f58cb', N'admin_menu', N'排序', N'sort', N'admin_menu_sort', CAST(N'2019-09-29T11:48:41.803' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:41.803' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd5f0586a-d6a0-cfe4-33c6-39f08d4f73be', N'admin_role', N'添加', N'add', N'admin_role_add', CAST(N'2019-09-29T11:48:48.703' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:48.703' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7b5ac5dd-ded0-a175-9dd1-39f08d4f741b', N'admin_role', N'编辑', N'edit', N'admin_role_edit', CAST(N'2019-09-29T11:48:48.797' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:48.797' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd94089e2-9fe4-74ef-a54a-39f08d4f7461', N'admin_role', N'删除', N'delete', N'admin_role_del', CAST(N'2019-09-29T11:48:48.867' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:48.867' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'13f370ef-9eba-a50c-c8ec-39f08d4f74ae', N'admin_role', N'绑定菜单', N'bind', N'admin_role_bind_menu', CAST(N'2019-09-29T11:48:48.943' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:48.943' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'cf144c6a-6ea5-1154-7414-39f08d4f8507', N'admin_account', N'添加', N'add', N'admin_account_add', CAST(N'2019-09-29T11:48:53.127' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:53.127' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1d91a430-46ae-d8d7-fb04-39f08d4f855f', N'admin_account', N'编辑', N'edit', N'admin_account_edit', CAST(N'2019-09-29T11:48:53.217' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:53.217' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3163a1c3-605c-7644-f4db-39f08d4f85a7', N'admin_account', N'删除', N'delete', N'admin_account_del', CAST(N'2019-09-29T11:48:53.287' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:53.287' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8b472e30-c43f-3c7e-4123-39f08d4f85ed', N'admin_account', N'重置密码', N'refresh', N'admin_account_reset_password', CAST(N'2019-09-29T11:48:53.357' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:53.357' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'050777c3-fa69-13ae-10ee-39f08d4f9e78', N'admin_auditinfo', N'详情', N'detail', N'admin_auditinfo_details', CAST(N'2019-09-29T11:48:59.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:59.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'89447b1a-0dfd-0080-ddf7-39f08d500aa4', N'admin_config', N'添加', N'add', N'admin_config_add', CAST(N'2019-09-29T11:49:27.333' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:27.333' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a1d18388-622c-768b-a31e-39f08d500b02', N'admin_config', N'编辑', N'edit', N'admin_config_edit', CAST(N'2019-09-29T11:49:27.427' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:27.427' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a8258d9f-a6c9-36f4-4104-39f08d500b52', N'admin_config', N'删除', N'delete', N'admin_config_del', CAST(N'2019-09-29T11:49:27.507' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:27.507' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'01631adc-b947-e592-0412-39f08d5055f1', N'codegenerator_project', N'添加', N'add', N'codegenerator_project_add', CAST(N'2019-09-29T11:49:46.610' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:46.610' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'609429c1-93f6-de87-eec1-39f08d505654', N'codegenerator_project', N'编辑', N'edit', N'codegenerator_project_edit', CAST(N'2019-09-29T11:49:46.710' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:46.710' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6c2b7366-8223-4154-640c-39f08d5056a0', N'codegenerator_project', N'删除', N'delete', N'codegenerator_project_del', CAST(N'2019-09-29T11:49:46.783' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:46.783' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'25746499-e7a3-4e8c-17aa-39f08d5056ed', N'codegenerator_project', N'生成', N'download', N'codegenerator_project_build_code', CAST(N'2019-09-29T11:49:46.860' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:46.860' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ac77ab1e-4e8a-1057-7784-39f08d506240', N'codegenerator_enum', N'添加', N'add', N'codegenerator_enum_add', CAST(N'2019-09-29T11:49:49.760' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:49.760' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6f7ef765-8fbb-85ef-88ef-39f08d50629c', N'codegenerator_enum', N'编辑', N'edit', N'codegenerator_enum_edit', CAST(N'2019-09-29T11:49:49.853' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:49.853' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Button] ([Id], [MenuCode], [Name], [Icon], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9b9fb168-befe-81d1-6cb0-39f08d5062e7', N'codegenerator_enum', N'删除', N'delete', N'codegenerator_enum_del', CAST(N'2019-09-29T11:49:49.927' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:49.927' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
SET IDENTITY_INSERT [dbo].[Button_Permission] ON 

INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (1, N'personnelfiles_company_add', N'personnelfiles_company_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (2, N'personnelfiles_company_edit', N'personnelfiles_company_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (3, N'personnelfiles_company_edit', N'personnelfiles_company_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (4, N'personnelfiles_company_del', N'personnelfiles_company_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (5, N'personnelfiles_department_add', N'personnelfiles_department_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (6, N'personnelfiles_department_edit', N'personnelfiles_department_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (7, N'personnelfiles_department_edit', N'personnelfiles_department_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (8, N'personnelfiles_department_del', N'personnelfiles_department_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (9, N'personnelfiles_department_position', N'personnelfiles_position_query_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (10, N'personnelfiles_department_position_add', N'personnelfiles_position_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (11, N'personnelfiles_department_position_edit', N'personnelfiles_position_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (12, N'personnelfiles_department_position_edit', N'personnelfiles_position_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (13, N'personnelfiles_department_position_del', N'personnelfiles_position_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (14, N'personnelfiles_position_del', N'personnelfiles_position_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (15, N'personnelfiles_user_add', N'personnelfiles_user_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (16, N'personnelfiles_user_add', N'personnelfiles_user_uploadpicture_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (17, N'personnelfiles_user_edit', N'personnelfiles_user_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (18, N'personnelfiles_user_edit', N'personnelfiles_user_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (19, N'personnelfiles_user_edit', N'personnelfiles_user_uploadpicture_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (20, N'personnelfiles_user_edit', N'personnelfiles_user_editcontact_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (21, N'personnelfiles_user_edit', N'personnelfiles_user_updatecontact_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (22, N'personnelfiles_user_edit', N'personnelfiles_user_contactdetails_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (23, N'personnelfiles_user_del', N'personnelfiles_user_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (24, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_query_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (25, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (26, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (27, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_update_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (28, N'personnelfiles_user_work_history', N'personnelfiles_userworkhistory_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (29, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_query_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (30, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (31, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (32, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_update_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (33, N'personnelfiles_user_education_history', N'personnelfiles_usereducationhistory_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (40, N'quartz_group_add', N'quartz_group_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (41, N'quartz_group_del', N'quartz_group_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (42, N'quartz_job_add', N'quartz_job_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (43, N'quartz_job_edit', N'quartz_job_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (44, N'quartz_job_edit', N'quartz_job_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (45, N'quartz_job_pause', N'quartz_job_pause_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (46, N'quartz_job_resume', N'quartz_job_resume_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (47, N'quartz_job_log', N'quartz_job_log_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (48, N'quartz_job_del', N'quartz_job_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (49, N'admin_moduleinfo_sync', N'admin_moduleinfo_sync_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (50, N'admin_moduleinfo_del', N'admin_moduleinfo_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (51, N'admin_permission_sync', N'admin_permission_sync_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (52, N'admin_menu_add', N'admin_menu_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (53, N'admin_menu_edit', N'admin_menu_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (54, N'admin_menu_edit', N'admin_menu_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (55, N'admin_menu_del', N'admin_menu_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (56, N'admin_menu_sort', N'admin_menu_sort_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (57, N'admin_menu_sort', N'admin_menu_sort_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (58, N'admin_role_add', N'admin_role_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (59, N'admin_role_edit', N'admin_role_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (60, N'admin_role_edit', N'admin_role_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (61, N'admin_role_del', N'admin_role_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (62, N'admin_role_bind_menu', N'admin_role_menulist_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (63, N'admin_role_bind_menu', N'admin_role_bindmenu_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (64, N'admin_role_bind_menu', N'admin_role_menubuttonlist_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (65, N'admin_role_bind_menu', N'admin_role_bindmenubutton_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (66, N'admin_account_add', N'admin_account_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (67, N'admin_account_edit', N'admin_account_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (68, N'admin_account_edit', N'admin_account_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (69, N'admin_account_del', N'admin_account_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (70, N'admin_account_reset_password', N'admin_account_updatepassword_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (71, N'admin_auditinfo_details', N'admin_auditinfo_details_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (72, N'admin_config_add', N'admin_config_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (73, N'admin_config_edit', N'admin_config_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (74, N'admin_config_edit', N'admin_config_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (75, N'admin_config_del', N'admin_config_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (76, N'codegenerator_project_add', N'codegenerator_project_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (77, N'codegenerator_project_edit', N'codegenerator_project_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (78, N'codegenerator_project_edit', N'codegenerator_project_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (79, N'codegenerator_project_del', N'codegenerator_project_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (80, N'codegenerator_project_build_code', N'codegenerator_project_buildcode_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (81, N'codegenerator_enum_add', N'codegenerator_enum_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (82, N'codegenerator_enum_edit', N'codegenerator_enum_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (83, N'codegenerator_enum_edit', N'codegenerator_enum_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (84, N'codegenerator_enum_del', N'codegenerator_enum_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (85, N'common_area_add', N'common_area_add_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (86, N'common_area_edit', N'common_area_edit_get')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (87, N'common_area_edit', N'common_area_update_post')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (88, N'common_area_del', N'common_area_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (89, N'common_attachment_del', N'common_attachment_delete_delete')
INSERT [dbo].[Button_Permission] ([Id], [ButtonCode], [PermissionCode]) VALUES (90, N'common_attachment_export', N'common_attachment_export_get')
SET IDENTITY_INSERT [dbo].[Button_Permission] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (1, N'sys_title', N'通用权限管理系统', N'系统标题', CAST(N'2019-09-29T11:44:16.287' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.037' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (2, N'sys_logo', N'', N'系统Logo', CAST(N'2019-09-29T11:44:16.377' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.157' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (3, N'sys_home', N'/admin/home', N'系统首页', CAST(N'2019-09-29T11:44:16.440' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.233' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (4, N'sys_userinfo_page', N'', N'个人信息页', CAST(N'2019-09-29T11:44:16.500' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.293' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (5, N'sys_button_permission', N'True', N'启用按钮权限', CAST(N'2019-09-29T11:44:16.560' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.353' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (6, N'sys_permission_validate', N'True', N'启用权限验证功能', CAST(N'2019-09-29T11:44:16.627' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.410' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (7, N'sys_auditing', N'True', N'启用审计日志', CAST(N'2019-09-29T11:44:16.683' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.463' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (8, N'sys_verify_code', N'False', N'启用登录验证码功能', CAST(N'2019-09-29T11:44:16.747' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.523' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (9, N'sys_toolbar_fullscreen', N'True', N'显示工具栏全屏按钮', CAST(N'2019-09-29T11:44:16.800' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.583' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (10, N'sys_toolbar_skin', N'True', N'显示工具栏皮肤按钮', CAST(N'2019-09-29T11:44:16.867' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (11, N'sys_toolbar_logout', N'True', N'显示工具栏退出按钮', CAST(N'2019-09-29T11:44:16.933' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.707' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (12, N'sys_toolbar_userinfo', N'True', N'显示工具栏用户信息按钮', CAST(N'2019-09-29T11:44:17.007' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.770' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Config] ([Id], [Key], [Value], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (13, N'sys_toolbar_customcss', N'', N'自定义CSS样式', CAST(N'2019-09-29T11:44:17.067' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:50:58.830' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'', 0, N'00000000-0000-0000-0000-000000000000', N'权限管理', N'', N'', N'', N'', N'permission', N'', 0, 1, 1, -1, N'', N'', 1, N'', CAST(N'2019-09-29T11:44:36.713' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:55.513' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ed894d38-9420-e937-c08f-39f08d4bb867', N'', 0, N'00000000-0000-0000-0000-000000000000', N'系统设置', N'', N'', N'', N'', N'system', N'', 0, 1, 2, -1, N'', N'', 1, N'', CAST(N'2019-09-29T11:44:44.133' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:55.553' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'906e2621-f333-742a-f139-39f08d4de0eb', N'', 2, N'00000000-0000-0000-0000-000000000000', N'GitHub', N'', N'', N'', N'https://github.com/iamoldli/NetModular', N'github', N'', 0, 1, 4, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:47:05.580' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:55.630' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'1854f66a-0d4a-7c5b-e03e-39f08d4f31a3', N'Admin', 1, N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'模块管理', N'admin_moduleinfo', N'', N'', N'', N'product', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:48:31.723' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:31.723' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9959f4cd-e12e-9341-3cba-39f08d4f3ed9', N'Admin', 1, N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'权限列表', N'admin_permission', N'', N'', N'', N'verifycode', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:48:35.103' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:35.103' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'da86e995-aa71-ed2d-b7e6-39f08d4f5736', N'Admin', 1, N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'菜单管理', N'admin_menu', N'', N'', N'', N'menu', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:48:41.337' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:41.337' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3c945d9b-a1e9-18c3-b15e-39f08d4f7330', N'Admin', 1, N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'角色管理', N'admin_role', N'', N'', N'', N'role', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:48:48.493' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:48.493' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd256dc6d-ed27-7828-418f-39f08d4f847c', N'Admin', 1, N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'账户管理', N'admin_account', N'', N'', N'', N'user', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:48:52.930' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:52.930' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a3c22868-dfe6-37b6-e5f6-39f08d4f9dee', N'Admin', 1, N'696598ac-7711-70c3-3aa6-39f08d4b9b6b', N'审计日志', N'admin_auditinfo', N'', N'', N'', N'log', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:48:59.440' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:48:59.440' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd149f03a-b70c-82e7-d394-39f08d4fde3c', N'Admin', 1, N'ed894d38-9420-e937-c08f-39f08d4bb867', N'系统配置', N'admin_system', N'', N'', N'', N'system', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:49:15.907' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:15.907' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'18bd445f-479b-db64-9015-39f08d500a04', N'Admin', 1, N'ed894d38-9420-e937-c08f-39f08d4bb867', N'配置项管理', N'admin_config', N'', N'', N'', N'tag', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:49:27.110' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:27.110' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'695db3e3-388f-3b24-3129-39f08d502886', N'Admin', 1, N'ed894d38-9420-e937-c08f-39f08d4bb867', N'图标管理', N'admin_icon', N'', N'', N'', N'photo', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-09-29T11:49:34.933' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-09-29T11:49:34.933' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'3f769739-c97a-cf97-3863-39f10dcc0bb2', N'', 2, N'00000000-0000-0000-0000-000000000000', N'官方文档', N'', N'', N'', N'https://nm.iamoldli.com/docs', N'archives', N'', 0, 1, 3, 0, N'', N'', 1, N'', CAST(N'2019-10-24T10:36:17.683' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:55.590' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'67568cf6-b014-3875-5f0d-39f10e08a9a3', N'', 0, N'00000000-0000-0000-0000-000000000000', N'基础数据', N'', N'', N'', N'', N'database', N'', 0, 1, 0, -1, N'', N'', 1, N'', CAST(N'2019-10-24T11:42:30.303' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:55.467' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5a768b6a-1b48-1033-0ac4-39f10e08d4f8', N'Common', 1, N'67568cf6-b014-3875-5f0d-39f10e08a9a3', N'区划代码', N'common_area', N'', N'', N'', N'area', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-10-24T11:42:41.343' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:41.343' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Menu] ([Id], [ModuleCode], [Type], [ParentId], [Name], [RouteName], [RouteParams], [RouteQuery], [Url], [Icon], [IconColor], [Level], [Show], [Sort], [Target], [DialogWidth], [DialogHeight], [DialogFullscreen], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'130e45b5-c0e6-929d-af8d-39f10e08e83f', N'Common', 1, N'67568cf6-b014-3875-5f0d-39f10e08a9a3', N'附件管理', N'common_attachment', N'', N'', N'', N'attachment', N'', 1, 1, 0, 0, N'', N'', 1, N'', CAST(N'2019-10-24T11:42:46.300' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:46.300' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
SET IDENTITY_INSERT [dbo].[Menu_Permission] ON 

INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (1, N'personnelfiles_company', N'personnelfiles_company_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (2, N'personnelfiles_department', N'personnelfiles_department_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (3, N'personnelfiles_department', N'personnelfiles_department_tree_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (4, N'personnelfiles_user', N'personnelfiles_user_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (8, N'quartz_group', N'quartz_group_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (9, N'quartz_job', N'quartz_job_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (10, N'admin_moduleinfo', N'admin_moduleinfo_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (11, N'admin_permission', N'admin_permission_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (12, N'admin_menu', N'admin_menu_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (13, N'admin_menu', N'admin_menu_tree_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (14, N'admin_role', N'admin_role_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (15, N'admin_account', N'admin_account_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (16, N'admin_auditinfo', N'admin_auditinfo_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (17, N'admin_system', N'admin_system_config_post')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (18, N'admin_system', N'admin_system_uploadlogo_post')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (19, N'admin_config', N'admin_config_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (20, N'codegenerator_project', N'codegenerator_project_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (21, N'codegenerator_enum', N'codegenerator_enum_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (22, N'common_area', N'common_area_query_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (23, N'common_area', N'common_area_querychildren_get')
INSERT [dbo].[Menu_Permission] ([Id], [MenuCode], [PermissionCode]) VALUES (24, N'common_attachment', N'common_attachment_query_get')
SET IDENTITY_INSERT [dbo].[Menu_Permission] OFF
INSERT [dbo].[ModuleInfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd80d7c33-16c0-ff99-c1a8-39f08d48da6e', N'权限管理', N'Admin', N'1.4.0-beta1', N'', CAST(N'2019-09-29T11:41:36.173' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:06.800' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[ModuleInfo] ([Id], [Name], [Code], [Version], [Remarks], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'54f29063-1241-ed29-3df5-39f10e084e11', N'通用模块', N'Common', N'1.4.0', NULL, CAST(N'2019-10-24T11:42:06.827' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:06.827' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ad0d50e1-95b8-a69a-0c67-39f08d48f8a1', N'账户管理_绑定角色', N'Admin', N'Account', N'BindRole', 2, N'admin_account_bindrole_post', CAST(N'2019-09-29T11:41:43.900' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.750' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5e78c8d6-3f48-9d50-e35c-39f08d48f8d7', N'账户管理_查询', N'Admin', N'Account', N'Query', 0, N'admin_account_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.850' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'eae00ede-321c-81a4-b47f-39f08d48f908', N'账户管理_添加', N'Admin', N'Account', N'Add', 2, N'admin_account_add_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.900' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c2738a9d-0601-5e56-70c5-39f08d48f936', N'账户管理_编辑', N'Admin', N'Account', N'Edit', 0, N'admin_account_edit_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.947' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'699c4186-d42e-fb92-d1df-39f08d48f96a', N'账户管理_更新', N'Admin', N'Account', N'Update', 2, N'admin_account_update_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.000' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'aa5ba840-3fc0-efab-cc03-39f08d48f9a7', N'账户管理_删除', N'Admin', N'Account', N'Delete', 3, N'admin_account_delete_delete', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.050' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'8663952e-1834-aef4-998f-39f08d48f9e1', N'账户管理_重置密码', N'Admin', N'Account', N'ResetPassword', 2, N'admin_account_resetpassword_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.097' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b2062f0d-5b6f-b35f-39ae-39f08d48fa25', N'审计信息_查询', N'Admin', N'AuditInfo', N'Query', 0, N'admin_auditinfo_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.143' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c64f2acd-cf78-4f4e-8cbf-39f08d48fa94', N'审计信息_详情', N'Admin', N'AuditInfo', N'Details', 0, N'admin_auditinfo_details_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.203' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c3434726-b2b3-da99-88da-39f08d48fac4', N'按钮管理_查询', N'Admin', N'Button', N'Query', 0, N'admin_button_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.253' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e2c95a42-90f5-d948-27a5-39f08d48faf1', N'配置项管理_查询', N'Admin', N'Config', N'Query', 0, N'admin_config_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.303' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'73775783-e4f4-0752-990a-39f08d48fb2f', N'配置项管理_添加', N'Admin', N'Config', N'Add', 2, N'admin_config_add_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.350' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9ee362f9-894e-47dc-37b6-39f08d48fb6f', N'配置项管理_删除', N'Admin', N'Config', N'Delete', 3, N'admin_config_delete_delete', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.403' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd4a03db5-727b-a52c-7a2a-39f08d48fbad', N'配置项管理_编辑', N'Admin', N'Config', N'Edit', 0, N'admin_config_edit_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.453' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'703f5e4f-6d44-69b1-83b0-39f08d48fbdf', N'配置项管理_修改', N'Admin', N'Config', N'Update', 2, N'admin_config_update_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.500' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fa804fda-c572-e7d0-1851-39f08d48fc17', N'菜单管理_菜单树', N'Admin', N'Menu', N'Tree', 0, N'admin_menu_tree_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.550' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'884bfdc6-a80c-5991-c8e5-39f08d48fc55', N'菜单管理_查询菜单列表', N'Admin', N'Menu', N'Query', 0, N'admin_menu_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.600' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2a8cb972-42fa-a22d-0b6b-39f08d48fc87', N'菜单管理_添加', N'Admin', N'Menu', N'Add', 2, N'admin_menu_add_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.650' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2a7951df-eb84-83d8-88d0-39f08d48fcc9', N'菜单管理_删除', N'Admin', N'Menu', N'Delete', 3, N'admin_menu_delete_delete', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.700' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f83e5fc7-be04-e003-a23e-39f08d48fcff', N'菜单管理_编辑', N'Admin', N'Menu', N'Edit', 0, N'admin_menu_edit_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.750' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2c2fae97-2f56-1df5-655e-39f08d48fd33', N'菜单管理_更新', N'Admin', N'Menu', N'Update', 2, N'admin_menu_update_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.817' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'21eae4ed-6d8a-e941-4ed7-39f08d48fd62', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 0, N'admin_menu_sort_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.923' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'6bb076e2-27f9-d6dd-d647-39f08d48fd90', N'菜单管理_更新排序信息', N'Admin', N'Menu', N'Sort', 2, N'admin_menu_sort_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.923' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c41d9473-228e-9bda-51f8-39f08d48fdba', N'模块信息_查询', N'Admin', N'ModuleInfo', N'Query', 0, N'admin_moduleinfo_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:11.963' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b7bc2f4d-25d8-2237-7a66-39f08d48fde4', N'模块信息_同步模块数据', N'Admin', N'ModuleInfo', N'Sync', 2, N'admin_moduleinfo_sync_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.010' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'54af7306-b9e9-13ca-7a9d-39f08d48fe19', N'模块信息_删除', N'Admin', N'ModuleInfo', N'Delete', 3, N'admin_moduleinfo_delete_delete', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.063' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'f6dbe718-055f-f33f-2861-39f08d48fe55', N'权限接口_查询', N'Admin', N'Permission', N'Query', 0, N'admin_permission_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.110' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'2c385597-2f01-1b71-3f03-39f08d48fe91', N'权限接口_同步', N'Admin', N'Permission', N'Sync', 2, N'admin_permission_sync_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.160' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5395b9f0-9ee9-89b6-6b95-39f08d48fec2', N'角色管理_查询', N'Admin', N'Role', N'Query', 0, N'admin_role_query_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.207' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'32bda386-1c21-bf1e-7cf0-39f08d48fef4', N'角色管理_添加', N'Admin', N'Role', N'Add', 2, N'admin_role_add_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.260' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'd37b3b24-0ecd-7acb-079e-39f08d48ff26', N'角色管理_删除', N'Admin', N'Role', N'Delete', 3, N'admin_role_delete_delete', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.300' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'be380d4c-04b6-307c-ca9b-39f08d48ff5a', N'角色管理_编辑', N'Admin', N'Role', N'Edit', 0, N'admin_role_edit_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.343' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b2e08087-580a-efa5-47ea-39f08d48ff89', N'角色管理_修改', N'Admin', N'Role', N'Update', 2, N'admin_role_update_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.393' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c1d50914-d56b-4cca-ee87-39f08d48ffb9', N'角色管理_获取角色的关联菜单列表', N'Admin', N'Role', N'MenuList', 0, N'admin_role_menulist_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.447' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c1db6248-7aa0-b567-5244-39f08d48ffe0', N'角色管理_绑定菜单', N'Admin', N'Role', N'BindMenu', 2, N'admin_role_bindmenu_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.497' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'fdb3096d-3b56-0ed1-c06a-39f08d49001b', N'角色管理_获取角色关联的菜单按钮列表', N'Admin', N'Role', N'MenuButtonList', 0, N'admin_role_menubuttonlist_get', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.543' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'e3eb35b4-974d-47a9-d25c-39f08d49004a', N'角色管理_绑定菜单按钮', N'Admin', N'Role', N'BindMenuButton', 2, N'admin_role_bindmenubutton_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.593' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'7ff01107-001b-e5d5-0831-39f08d490070', N'系统_修改系统配置', N'Admin', N'System', N'Config', 2, N'admin_system_config_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9aedfc87-13f6-1da8-0788-39f08d49009b', N'系统_上传Logo', N'Admin', N'System', N'UploadLogo', 2, N'admin_system_uploadlogo_post', CAST(N'2019-09-29T11:41:43.903' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:12.690' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'902fdb02-67cb-b76b-d7fc-39f10e086505', N'区划代码管理_查询', N'Common', N'Area', N'Query', 0, N'common_area_query_get', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'5a4416e8-83e7-d31c-13da-39f10e08653d', N'区划代码管理_添加', N'Common', N'Area', N'Add', 2, N'common_area_add_post', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4954c0b0-d536-2ece-6f7c-39f10e086573', N'区划代码管理_删除', N'Common', N'Area', N'Delete', 3, N'common_area_delete_delete', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a6b7e28f-fdd1-a544-81d1-39f10e0865b1', N'区划代码管理_编辑', N'Common', N'Area', N'Edit', 0, N'common_area_edit_get', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'4b3c0933-f996-b4ed-001c-39f10e0865fd', N'区划代码管理_修改', N'Common', N'Area', N'Update', 2, N'common_area_update_post', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.640' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'639004e5-798e-b588-5cda-39f10e086639', N'附件表管理_查询', N'Common', N'Attachment', N'Query', 0, N'common_attachment_query_get', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'9b42be61-12e6-da32-cd97-39f10e086682', N'字典管理_查询', N'Common', N'Dict', N'Query', 0, N'common_dict_query_get', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'941fe16d-dfb5-a624-8d27-39f10e0866af', N'字典管理_添加', N'Common', N'Dict', N'Add', 2, N'common_dict_add_post', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'03b290cb-3176-530d-08e6-39f10e0866d5', N'字典管理_删除', N'Common', N'Dict', N'Delete', 3, N'common_dict_delete_delete', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'971f7e72-0202-0b40-f710-39f10e0866fe', N'字典管理_编辑', N'Common', N'Dict', N'Edit', 0, N'common_dict_edit_get', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'b0429599-eda5-7aba-3fb8-39f10e086728', N'字典管理_修改', N'Common', N'Dict', N'Update', 2, N'common_dict_update_post', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'c6b4b085-5abf-9a3e-f24e-39f10e08675a', N'多媒体管理_查询', N'Common', N'MediaType', N'Query', 0, N'common_mediatype_query_get', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'ccb548ca-a508-c112-6a72-39f10e086786', N'多媒体管理_添加', N'Common', N'MediaType', N'Add', 2, N'common_mediatype_add_post', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'a1bec2e1-dbe6-fc36-3ccb-39f10e0867b2', N'多媒体管理_删除', N'Common', N'MediaType', N'Delete', 3, N'common_mediatype_delete_delete', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'753bb6ad-feb6-46a9-5298-39f10e0867e0', N'多媒体管理_编辑', N'Common', N'MediaType', N'Edit', 0, N'common_mediatype_edit_get', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Permission] ([Id], [Name], [ModuleCode], [Controller], [Action], [HttpMethod], [Code], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy]) VALUES (N'80a81e64-6b76-c132-57a8-39f10e08680c', N'多媒体管理_修改', N'Common', N'MediaType', N'Update', 2, N'common_mediatype_update_post', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93', CAST(N'2019-10-24T11:42:10.643' AS DateTime), N'9a4f201b-aff8-de87-1a7a-39f08d463d93')
INSERT [dbo].[Role] ([Id], [Name], [Remarks], [IsSpecified], [CreatedTime], [CreatedBy], [ModifiedTime], [ModifiedBy], [Deleted], [DeletedTime], [DeletedBy]) VALUES (N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'超级管理员', N'超级管理员', 0, CAST(N'2019-09-29T11:38:44.850' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2019-09-29T11:38:44.850' AS DateTime), N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2019-09-29T11:38:44.850' AS DateTime), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[Role_Menu] ON 

INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (93, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'67568cf6-b014-3875-5f0d-39f10e08a9a3')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (94, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'5a768b6a-1b48-1033-0ac4-39f10e08d4f8')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (95, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'130e45b5-c0e6-929d-af8d-39f10e08e83f')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (96, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'696598ac-7711-70c3-3aa6-39f08d4b9b6b')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (97, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'1854f66a-0d4a-7c5b-e03e-39f08d4f31a3')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (98, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'9959f4cd-e12e-9341-3cba-39f08d4f3ed9')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (99, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'da86e995-aa71-ed2d-b7e6-39f08d4f5736')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (100, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'3c945d9b-a1e9-18c3-b15e-39f08d4f7330')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (101, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'd256dc6d-ed27-7828-418f-39f08d4f847c')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (102, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'a3c22868-dfe6-37b6-e5f6-39f08d4f9dee')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (103, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'ed894d38-9420-e937-c08f-39f08d4bb867')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (104, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'd149f03a-b70c-82e7-d394-39f08d4fde3c')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (105, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'18bd445f-479b-db64-9015-39f08d500a04')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (106, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'695db3e3-388f-3b24-3129-39f08d502886')
INSERT [dbo].[Role_Menu] ([Id], [RoleId], [MenuId]) VALUES (107, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'906e2621-f333-742a-f139-39f08d4de0eb')
SET IDENTITY_INSERT [dbo].[Role_Menu] OFF
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] ON 

INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (30, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'1854f66a-0d4a-7c5b-e03e-39f08d4f31a3', N'90684566-6800-a930-5412-39f08d4f322e')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (31, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'1854f66a-0d4a-7c5b-e03e-39f08d4f31a3', N'ab091f87-18dc-093b-4fab-39f08d4f3295')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (32, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'9959f4cd-e12e-9341-3cba-39f08d4f3ed9', N'6f803ff0-bd79-3712-9281-39f08d4f3f61')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (33, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'da86e995-aa71-ed2d-b7e6-39f08d4f5736', N'6c592301-36e7-b7da-777a-39f08d4f57cd')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (34, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'da86e995-aa71-ed2d-b7e6-39f08d4f5736', N'56fbcc53-e9c0-2e81-e0aa-39f08d4f5828')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (35, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'da86e995-aa71-ed2d-b7e6-39f08d4f5736', N'd4f4f34c-266a-f3dc-e4d4-39f08d4f5876')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (36, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'da86e995-aa71-ed2d-b7e6-39f08d4f5736', N'6e35c614-a4a0-f810-9b61-39f08d4f58cb')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (37, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'3c945d9b-a1e9-18c3-b15e-39f08d4f7330', N'd5f0586a-d6a0-cfe4-33c6-39f08d4f73be')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (38, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'3c945d9b-a1e9-18c3-b15e-39f08d4f7330', N'7b5ac5dd-ded0-a175-9dd1-39f08d4f741b')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (39, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'3c945d9b-a1e9-18c3-b15e-39f08d4f7330', N'd94089e2-9fe4-74ef-a54a-39f08d4f7461')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (40, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'3c945d9b-a1e9-18c3-b15e-39f08d4f7330', N'13f370ef-9eba-a50c-c8ec-39f08d4f74ae')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (41, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'd256dc6d-ed27-7828-418f-39f08d4f847c', N'cf144c6a-6ea5-1154-7414-39f08d4f8507')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (42, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'd256dc6d-ed27-7828-418f-39f08d4f847c', N'1d91a430-46ae-d8d7-fb04-39f08d4f855f')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (43, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'd256dc6d-ed27-7828-418f-39f08d4f847c', N'3163a1c3-605c-7644-f4db-39f08d4f85a7')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (44, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'd256dc6d-ed27-7828-418f-39f08d4f847c', N'8b472e30-c43f-3c7e-4123-39f08d4f85ed')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (45, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'a3c22868-dfe6-37b6-e5f6-39f08d4f9dee', N'050777c3-fa69-13ae-10ee-39f08d4f9e78')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (46, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'18bd445f-479b-db64-9015-39f08d500a04', N'89447b1a-0dfd-0080-ddf7-39f08d500aa4')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (47, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'18bd445f-479b-db64-9015-39f08d500a04', N'a1d18388-622c-768b-a31e-39f08d500b02')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (48, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'18bd445f-479b-db64-9015-39f08d500a04', N'a8258d9f-a6c9-36f4-4104-39f08d500b52')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (49, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'5a768b6a-1b48-1033-0ac4-39f10e08d4f8', N'42114854-ab36-ad85-d3d9-39f08d4ec288')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (50, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'5a768b6a-1b48-1033-0ac4-39f10e08d4f8', N'a5e423bc-a2fe-15a3-7aeb-39f08d4ec2e0')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (51, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'5a768b6a-1b48-1033-0ac4-39f10e08d4f8', N'6eaa5d7c-96a4-2024-bef3-39f08d4ec335')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (52, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'130e45b5-c0e6-929d-af8d-39f10e08e83f', N'3e8f0423-876f-2ea4-6d5a-39f08d4ecfc2')
INSERT [dbo].[Role_Menu_Button] ([Id], [RoleId], [MenuId], [ButtonId]) VALUES (53, N'94f75efd-d6ad-84f1-021f-39f08d463cf8', N'130e45b5-c0e6-929d-af8d-39f10e08e83f', N'8fc12b1f-646a-aedd-d719-39f08d4ed027')
SET IDENTITY_INSERT [dbo].[Role_Menu_Button] OFF
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [ClosedTime]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  DEFAULT (getdate()) FOR [ExecutionTime]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  DEFAULT ((0)) FOR [ExecutionDuration]
GO
ALTER TABLE [dbo].[AuditInfo] ADD  DEFAULT ((0)) FOR [Platform]
GO
ALTER TABLE [dbo].[Button] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Button] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [Show]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [Target]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT ((0)) FOR [DialogFullscreen]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[ModuleInfo] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  DEFAULT ((0)) FOR [HttpMethod]
GO
ALTER TABLE [dbo].[Permission] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Permission] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [IsSpecified]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [DeletedTime]
GO
USE [master]
GO
ALTER DATABASE [Nm_Admin] SET  READ_WRITE 
GO
