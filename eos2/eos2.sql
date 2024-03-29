USE [master]
GO
/****** Object:  Database [eos2]    Script Date: 01/14/2013 13:56:26 ******/
CREATE DATABASE [eos2] ON  PRIMARY 
( NAME = N'eos2', FILENAME = N'D:\db\eos2.mdf' , SIZE = 92160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eos2_log', FILENAME = N'D:\db\eos2_log.ldf' , SIZE = 84416KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eos2] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eos2].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [eos2] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [eos2] SET ANSI_NULLS OFF
GO
ALTER DATABASE [eos2] SET ANSI_PADDING OFF
GO
ALTER DATABASE [eos2] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [eos2] SET ARITHABORT OFF
GO
ALTER DATABASE [eos2] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [eos2] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [eos2] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [eos2] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [eos2] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [eos2] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [eos2] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [eos2] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [eos2] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [eos2] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [eos2] SET  DISABLE_BROKER
GO
ALTER DATABASE [eos2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [eos2] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [eos2] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [eos2] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [eos2] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [eos2] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [eos2] SET  READ_WRITE
GO
ALTER DATABASE [eos2] SET RECOVERY FULL
GO
ALTER DATABASE [eos2] SET  MULTI_USER
GO
ALTER DATABASE [eos2] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [eos2] SET DB_CHAINING OFF
GO
USE [eos2]
GO
/****** Object:  Table [dbo].[B2B_DEPARTMENT]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_DEPARTMENT](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[serial_number] [varchar](6) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[type] [varchar](2) NOT NULL,
	[parent_dept_id] [bigint] NULL,
	[is_active] [bit] NULL,
	[description] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_INDUSTRY]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_INDUSTRY](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[serial_number] [varchar](6) NOT NULL,
	[short_name] [varchar](10) NOT NULL,
	[full_name] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[is_active] [bit] NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_PRODUCT]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_PRODUCT](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[serial_number] [varchar](20) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[standard] [varchar](60) NOT NULL,
	[price] [numeric](19, 6) NOT NULL,
	[is_include_tax] [bit] NULL,
	[unit] [varchar](4) NOT NULL,
	[is_active] [bit] NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYNCHRONOUS]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYNCHRONOUS](
	[job_id] [nvarchar](36) NOT NULL,
	[job_name] [nvarchar](100) NOT NULL,
	[begin_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[error_times] [smallint] NOT NULL,
	[error_limited] [smallint] NOT NULL,
	[begin_timestamp] [datetime] NOT NULL,
	[end_timestamp] [datetime] NOT NULL,
	[data_rows] [numeric](18, 0) NOT NULL,
	[data_finished] [numeric](18, 0) NOT NULL,
	[data_surplus] [numeric](18, 0) NOT NULL,
	[execute_times] [numeric](18, 0) NOT NULL,
	[finished] [bit] NOT NULL,
 CONSTRAINT [PK_SYNCHRONOUS] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BIRT_REPORT]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BIRT_REPORT](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[name] [varchar](200) NOT NULL,
	[title] [varchar](200) NULL,
	[author] [varchar](200) NULL,
	[_file] [varchar](200) NULL,
	[fullfile] [varchar](200) NULL,
	[help_guide] [varchar](200) NULL,
	[units] [varchar](200) NULL,
	[comment] [varchar](200) NULL,
	[description] [varchar](200) NULL,
	[created_by] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SHIRO_ROLE]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SHIRO_ROLE](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WEBSERVICE_OUTBOUND_CONFIG]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WEBSERVICE_OUTBOUND_CONFIG](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[object_name] [varchar](60) NOT NULL,
	[method] [varchar](100) NOT NULL,
	[asynchronous] [bit] NULL,
	[priority] [int] NOT NULL,
	[default_get_error_limit] [int] NULL,
	[default_send_error_limit] [int] NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[asynchronous] ASC,
	[object_name] ASC,
	[method] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ADMIN_GROUP]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN_GROUP](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[name] [varchar](20) NOT NULL,
	[is_active] [bit] NULL,
	[description] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ADMIN_PROFILE]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN_PROFILE](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[name] [varchar](40) NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[CURRENT_USER_ID]    Script Date: 01/14/2013 13:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-18
-- Description:	获取用户组
-- =============================================
CREATE FUNCTION [dbo].[CURRENT_USER_ID] 
(	
	-- Add the parameters for the function here
	@FINTUSERID NUMERIC(19, 0)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		
	SELECT
	  @FINTUSERID AS CURRENT_USER_ID
)
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R08]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-11-01
-- Description:	信用额度检查表-销退不计算折扣率
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R08] 
	-- Add the parameters for the stored procedure here
  @FINTUSERID NUMERIC(19, 0)
, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'

    -- Insert statements for procedure here
	--信用额度检查表
	/*
	客户编号
	客户简称
	部门编号
	部门简称
	订货金额
	特价金额
	未结帐销货
	应收帐款
	应收票据
	应收合计= 应收票据+应收帐款+未结帐销货+订货金额
	信用额度
	信用可超出额=可超出额度-合计
	信用余额
	*/
	CREATE TABLE #T0(
	  F001 NVARCHAR(10) --客户编号
	, F003 NUMERIC(15, 6) NULL--订货金额
	, F004 NUMERIC(15, 6) NULL--特价金额
	, F005 NUMERIC(15, 6) NULL--未结帐销货
	, F006 NUMERIC(15, 6) NULL--应收帐款
	, F007 NUMERIC(15, 6) NULL--应收票据
	, F008 NUMERIC(15, 6) NULL--信用额度
	, F009 NUMERIC(15, 6) NULL--信用可超出额
	)
	--信用额度
		INSERT INTO #T0(F001, F008, F009)
		SELECT
		  MA.MA001 --客户编号
		, MA.MA033 --信用额度
		, MA.MA033 * (1 + MA.MA034)--信用可超出额=信用额度 * (1 + 可超出率%)
		FROM [192.168.1.8].[Leader].[dbo].[COPMA] AS MA
		WITH(NOLOCK)
		WHERE
		  MA.MA082 = 'N' --信用额度由总公司控制
		  AND (MA.MA032 = 'Y' OR MA.MA032='y' )  --信用额度控制, Y.按公司参数控制,N.信用额度不控制,y.按客户信息控制
		  AND  MA.MA001 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(MA.MA001) LIKE @FCHRDEALERSERIALNUMBER
	--订货金额及特价金额
		INSERT INTO #T0(F001, F003, F004)
		SELECT
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END --客户编号
		, SUM((TD.TD008 - TD.TD009) * TD.TD200)
		, SUM(TD.TD203)
		FROM [192.168.1.8].[Leader].[dbo].[COPTC] AS TC
		WITH(NOLOCK)
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPTD] AS TD ON TD.TD001 = TC.TC001 AND TD.TD002 = TC.TC002 
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] AS MA ON MA.MA001 = TC.TC004
		WHERE 
		  TC.TC027 = 'Y' --审核码
		  AND TD.TD016='N' --结束
		  AND CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END) LIKE @FCHRDEALERSERIALNUMBER
		GROUP BY
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END
	--未结帐销货

		--销货
		INSERT INTO #T0(F001, F005)
		SELECT 
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END --客户编号
		, SUM((TH.TH008 - TH.TH042) * TH.TH200) -- (订单数量-已结帐数量) * 单价 * 折扣率
		FROM [192.168.1.8].[Leader].[dbo].[COPTG] AS TG
		WITH(NOLOCK)
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPTH] AS TH ON TH.TH001 = TG.TG001 AND TH.TH002 = TG.TG002
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] AS MA ON MA.MA001 = TG.TG004
		WHERE 
		  TG.TG023 = 'Y' --审核码
		  AND TH.TH026 = 'N' --结帐码
		  AND CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END) LIKE @FCHRDEALERSERIALNUMBER
		GROUP BY 
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END

		--销退
		INSERT INTO #T0(F001, F005)  
		SELECT 
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END
		, (-1) * SUM((TJ007 - TJ037) * TJ011 /** ISNULL(TH025, 1)*/)
		FROM [192.168.1.8].[Leader].[dbo].[COPTI] AS TI
		WITH(NOLOCK)
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPTJ] AS TJ ON TJ.TJ001 = TI.TI001 AND TJ.TJ002 = TI.TI002
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] AS MA ON MA.MA001 = TI.TI004
		LEFT  JOIN [192.168.1.8].[Leader].[dbo].[COPTH] AS TH ON TH.TH001 = TJ.TJ015 AND TH.TH002 = TJ.TJ016 AND TH.TH003 = TJ.TJ017
		WHERE 
		  TJ.TJ021 = 'Y' --审核码
		  AND TJ.TJ024 = 'N' --结帐码
		  AND CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END) LIKE @FCHRDEALERSERIALNUMBER
		GROUP BY 
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END   
	--应收帐款
		INSERT INTO #T0(F001, F006)
		SELECT
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END
		, (TA.TA029 + TA.TA030 - TA.TA031) * MQ.MQ010
		FROM [192.168.1.8].[Leader].[dbo].[ACRTA] AS TA
		WITH(NOLOCK)
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] AS MA ON MA.MA001 = TA.TA004
		INNER JOIN [192.168.1.8].[Leader].[dbo].[CMSMQ] AS MQ ON MQ.MQ001 = TA.TA001
		WHERE 
		  TA.TA025 = 'Y'--审核码
		  AND TA.TA027 = 'N'--结束
		  AND TA.TA019 = 'N'--发票作废
		  AND CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END) LIKE @FCHRDEALERSERIALNUMBER
	--应收票据
		INSERT INTO #T0(F001, F007)
		SELECT 
		  CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END
		, TC003*TC027
		FROM [192.168.1.8].[Leader].[dbo].[NOTTC] AS TC
		WITH(NOLOCK)
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] AS MA ON MA.MA001 = TC.TC013
		WHERE 
		  TC.TC012 IN ('1','2','3','5','9') --当前票况:1/收票,2/托收,3/融资,4/背书,5/转出,6/兑现,7/还票,8/呆账,9/撤票
		  AND CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(CASE WHEN MA.MA082 = 'Y' THEN MA.MA065 ELSE MA.MA001 END) LIKE @FCHRDEALERSERIALNUMBER
	--取结果
		SELECT 
		  T0.F001 AS R001--'客户编号'
		, MA.MA002 AS R002--'客户简称'
		, MA.MA015 AS R003--'部门编号'
		, ME.ME002 AS R004--'部门简称'
		, SUM(ISNULL(T0.F003, 0)) AS R005--'订货金额'
		, SUM(ISNULL(T0.F005, 0)) AS R006--'未结帐销货'
		, SUM(ISNULL(T0.F006, 0)) AS R007--'应收帐款'
		, SUM(ISNULL(T0.F007, 0)) AS R008--'应收票据'
		, SUM(ISNULL(T0.F007, 0)) 
		+ SUM(ISNULL(T0.F006, 0)) 
		+ SUM(ISNULL(T0.F005, 0)) 
		+ SUM(ISNULL(T0.F003, 0)) AS R009--'应收合计'--应收合计= 应收票据+应收帐款+未结帐销货+订货金额
		, SUM(ISNULL(T0.F008, 0)) AS R010--'信用额度'
		, SUM(ISNULL(T0.F009, 0)) AS R011--'可超出额度'
		, SUM(ISNULL(T0.F009, 0))
		- SUM(ISNULL(T0.F007, 0)) 
		- SUM(ISNULL(T0.F006, 0)) 
		- SUM(ISNULL(T0.F005, 0)) 
		- SUM(ISNULL(T0.F003, 0)) AS R012--'信用余额'
		FROM #T0 AS T0
		WITH(NOLOCK)
		INNER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] AS MA ON MA.MA001 = T0.F001 COLLATE Chinese_PRC_BIN
		INNER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] AS ME ON ME.ME001 = MA.MA015 COLLATE Chinese_PRC_BIN
		GROUP BY
		  T0.F001
		, MA.MA002
		, MA.MA015
		, ME.ME002
	--删除临时表
		DROP TABLE #T0
END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R11]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2013-01-05
-- Description:	可用产品库存查询
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_R11]
	-- Add the parameters for the stored procedure here
	@PRODUCT_SERIAL_NUMBER VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @MONTH CHAR(6), @MONTH_FIRST_DATE CHAR(8), @TODAY CHAR(8)
	SET @TODAY = REPLACE(CONVERT(CHAR(10), GETDATE(), 120), '-', '')
	SET @MONTH = LEFT(@TODAY, 6)
	SET @MONTH_FIRST_DATE = LEFT(@TODAY, 6) + '01'


	CREATE TABLE #T0(
	  F001 VARCHAR(20) NOT NULL
	, F002 NUMERIC(18, 3) NULL
	, F003 NUMERIC(18, 3) NULL
	)

	INSERT INTO #T0(F001, F002)
	SELECT
	  MB001
	, FLOOR(ABS(ISNULL(LC004,0)))
	* SIGN(ISNULL(LC004,0))
	+ SUM(ISNULL(INVLA.LA005 * FLOOR(ABS(INVLA.LA011)) * SIGN(INVLA.LA011),0)) INVNUMA
	FROM [192.168.1.8].Leader.dbo.INVMC I
	WITH(NOLOCK)
	LEFT JOIN [192.168.1.8].Leader.dbo.INVMB AS INVMB ON MB001=I.MC001
	LEFT JOIN [192.168.1.8].Leader.dbo.INVLC AS INVLC ON LC001=I.MC001 AND LC002=@MONTH AND LC003=I.MC002
	LEFT JOIN [192.168.1.8].Leader.dbo.INVLA AS INVLA ON LA001=I.MC001 AND LA009=I.MC002 AND (LA004 BETWEEN @MONTH_FIRST_DATE AND @TODAY)
	LEFT JOIN [192.168.1.8].Leader.dbo.CMSMC C ON C.MC001=I.MC002
	LEFT JOIN [192.168.1.8].Leader.dbo.INVMA AS INVMA ON MA001='1' AND MA002=MB005
	LEFT JOIN [192.168.1.8].Leader.dbo.ACTMA A ON A.MA001 =INVMA.MA004
	LEFT JOIN [192.168.1.8].Leader.dbo.CMSMF AS CMSMF ON MF001='RMB'
	LEFT JOIN [192.168.1.8].Leader.dbo.INVMD AS INVMD ON MD001=MB001 and MD002=MB072
	WHERE
	  MB001 = @PRODUCT_SERIAL_NUMBER
	  AND (I.MC002 IN ('08'))
	  AND C.MC004='1'
	GROUP BY
	  MB001
	, LC004
	, LC005
	, LC030
	HAVING 1=1  AND
	((FLOOR(ABS(ISNULL(LC004,0)))*SIGN(ISNULL(LC004,0))+SUM(ISNULL(INVLA.LA005*FLOOR(ABS(INVLA.LA011))*SIGN(INVLA.LA011),0))<>0
	OR ISNULL(LC004,0) - FLOOR(ABS(ISNULL(LC004,0)))*SIGN(ISNULL(LC004,0))+SUM(ISNULL(INVLA.LA005*(INVLA.LA011-FLOOR(ABS(INVLA.LA011))*SIGN(INVLA.LA011)),0))<>0)
	OR (ISNULL(LC030,0) + SUM(ISNULL(INVLA.LA021,0)*ISNULL(INVLA.LA005,0)))<>0
	OR (ISNULL(LC005,0) + SUM(ISNULL(INVLA.LA013,0)*ISNULL(INVLA.LA005,0)))<>0)
	ORDER BY
	  MB001

	INSERT INTO #T0(F001, F003)
	SELECT
	  TD.TD004
	, SUM(ISNULL(TD.TD008, 0) - ISNULL(TD.TD009, 0))
	FROM [192.168.1.8].Leader.dbo.COPTD TD
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].Leader.dbo.INVMB MB ON MB.MB001 = TD.TD004
	WHERE
	  TD.TD004 = @PRODUCT_SERIAL_NUMBER
	  AND TD.TD016 = 'N'
	  AND TD.TD021 = 'Y'
	GROUP BY
	  TD004

	SELECT 
	  T0.F001 AS F001--'SerialNumber'
	, MB.MB002 AS F002 --'ProductName'
	, MB.MB003 AS F003--'Standard'
	--, SUM(ISNULL(T0.F002, 0)) '库存量'
	--, SUM(ISNULL(T0.F003, 0)) '订单量'
	, SUM(ISNULL(T0.F002, 0)) - SUM(ISNULL(T0.F003, 0)) AS F004-- 'AvailableQuantity'
	FROM #T0 T0
	LEFT JOIN [192.168.1.8].Leader.dbo.INVMB MB ON MB.MB001 = T0.F001 COLLATE Chinese_PRC_BIN
	GROUP BY
	  T0.F001
	, MB.MB002
	, MB.MB003
	ORDER BY
	  T0.F001
	  
	DROP TABLE #T0
END
GO
/****** Object:  Table [dbo].[ADMIN_RECORDTYPE]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN_RECORDTYPE](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[domain] [varchar](20) NOT NULL,
	[serial_number] [varchar](3) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[is_active] [bit] NULL,
	[description] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[domain] ASC,
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[string_to_date]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-12-20
-- Description:	string to date
-- =============================================
CREATE FUNCTION [dbo].[string_to_date]
(
	-- Add the parameters for the function here
	@source nvarchar(17)
)
RETURNS nvarchar(23)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @target nvarchar(23)

	-- Add the T-SQL statements to compute the return value here

	-- Return the result of the function
	set @target =
	  left(@source, 4)
	+ '-' + substring(@source, 5, 2)
	+ '-' + substring(@source, 7, 2)
	+ ' ' + case substring(@source, 9, 2) when '' then '00' else substring(@source, 9, 2) end
	+ ':' + case substring(@source, 11, 2) when '' then '00' else substring(@source, 11, 2) end
	+ ':' + case substring(@source, 13, 2) when '' then '00' else substring(@source, 13, 2) end
	+ '.' + case right(@source, 3) when '' then '000' else right(@source, 3) end

	return @target

END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_INDUSTRY]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-12-20
-- Description:	sync industry
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_INDUSTRY]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_INDUSTRY
		WITH MARK N'Synchronous industry'

	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)

	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)

	SET @BATCH_SIZE = 50

	SELECT
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1,
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS
		ELSE DATA_FINISHED + @BATCH_SIZE
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID

 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1


	CREATE TABLE #SOURCE(
		[SerialNumber] [nvarchar](10) NOT NULL,--序号
		[ShortName] [nvarchar](20) NOT NULL,--简称
		[FullName] [nvarchar](30) NOT NULL,--全称
		[Description] [nvarchar](255) NULL,--描述
		[IsActive] [bit] not NULL,--启用
		[DateCreated] [datetime] NOT NULL,--创建日期
		[LastUpdated] [datetime] NOT NULL,--修改日期
		[sync_model] nvarchar(6) null--同步模式
		, primary key([SerialNumber])
	);

	WITH TMP_INDUSTRY AS(
	SELECT
	  ROW_NUMBER() OVER ( ORDER BY MR002 ) AS ROWNUMBER
	, RTRIM(MR002) AS [SerialNumber]
	, RTRIM(MR003) AS [ShortName]
	, RTRIM(MR004) AS [FullName]
	, RTRIM(MR005) AS [Description]
	, CASE LEFT(MR003, 1) WHEN '停' THEN 0 ELSE 1 END AS [IsActive]
  	, CAST (dbo.STRING_TO_DATE(CREATE_DATE) AS DATETIME) AS [DateCreated]
	, CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) AS [LastUpdated]
	FROM [192.168.1.8].[Leader].[dbo].[CMSMR]
	WITH (NOLOCK)
	WHERE MR001 = '0'
	)

	INSERT INTO #SOURCE(
	  [SerialNumber]
	, [ShortName]
	, [FullName]
	, [Description]
	, [IsActive]
	, [DateCreated]
	, [LastUpdated]
	)
	SELECT
	  [SerialNumber]
	, [ShortName]
	, [FullName]
	, [Description]
	, [IsActive]
	, [DateCreated]
	, [LastUpdated]
	FROM TMP_INDUSTRY
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER

	--SET ROW SYNC MODEL
	UPDATE #SOURCE
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN B2B_INDUSTRY T ON T.serial_number = S.[SerialNumber]

	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL

	INSERT INTO B2B_INDUSTRY(
	  serial_number
	, short_name
	, full_name
	, [description]
	, is_active
	, date_created
	, last_updated
	, [version]
	)
	SELECT
	  [SerialNumber]
	, [ShortName]
	, [FullName]
	, [Description]
	, [IsActive]
	, [DateCreated]
	, [LastUpdated]
	, 0
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'

	UPDATE B2B_INDUSTRY
	   SET
		   short_name =S.[ShortName]
		  ,full_name = S.[FullName]
		  ,[description] = S.[Description]
		  ,is_active = S.[IsActive]
		  ,last_updated = S.[LastUpdated]
	FROM B2B_INDUSTRY T
	JOIN #SOURCE S ON S.[SerialNumber] = T.serial_number
	WHERE S.[sync_model] = 'UPDATE'

	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_INDUSTRY
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_INDUSTRY
		SET @HAS_ERRORS = 1
	  END

	DROP TABLE #SOURCE
END
GO
/****** Object:  Table [dbo].[WF_WORKFLOW]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_WORKFLOW](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[record_type_id] [bigint] NULL,
	[domain] [varchar](30) NOT NULL,
	[department_id] [bigint] NOT NULL,
	[is_active] [bit] NULL,
	[description] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[record_type_id] ASC,
	[domain] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_STAFF]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_STAFF](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[serial_number] [varchar](5) NOT NULL,
	[name] [varchar](10) NOT NULL,
	[department_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SHIRO_USER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SHIRO_USER](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[username] [varchar](25) NOT NULL,
	[password_hash] [varchar](255) NOT NULL,
	[group_id] [bigint] NULL,
	[profile_id] [bigint] NULL,
	[role_id] [bigint] NOT NULL,
	[department_id] [bigint] NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_DEALER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_DEALER](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[serial_number] [varchar](10) NOT NULL,
	[shortcut] [varchar](20) NULL,
	[name] [varchar](72) NOT NULL,
	[alias] [varchar](255) NOT NULL,
	[pricing_mode] [varchar](10) NULL,
	[head] [varchar](30) NULL,
	[contact] [varchar](30) NULL,
	[sales_man_id] [bigint] NOT NULL,
	[department_id] [bigint] NOT NULL,
	[approval_status] [varchar](8) NOT NULL,
	[address1] [varchar](72) NULL,
	[address2] [varchar](72) NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
	[owner_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_CONTRACT]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_CONTRACT](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[serial_number] [varchar](18) NOT NULL,
	[subject] [varchar](100) NOT NULL,
	[record_type_id] [bigint] NOT NULL,
	[applicant] [varchar](10) NOT NULL,
	[filing_date] [datetime] NOT NULL,
	[effective_date] [datetime] NOT NULL,
	[dealer_id] [bigint] NOT NULL,
	[project] [varchar](100) NOT NULL,
	[industry_id] [bigint] NOT NULL,
	[description] [varchar](500) NULL,
	[created_by_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_modified_by_id] [bigint] NOT NULL,
	[last_updated] [datetime] NOT NULL,
	[owner_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_SALESORDER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_SALESORDER](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[record_type_id] [bigint] NOT NULL,
	[dealer_id] [bigint] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[industry_id] [bigint] NOT NULL,
	[project] [varchar](100) NULL,
	[serial_number] [varchar](20) NOT NULL,
	[erp_serial_number] [varchar](17) NULL,
	[account_serial_number] [varchar](40) NULL,
	[effective_date] [datetime] NULL,
	[sales_man_id] [bigint] NOT NULL,
	[address1] [varchar](500) NULL,
	[address2] [varchar](500) NULL,
	[amount] [numeric](18, 2) NULL,
	[quantity] [numeric](18, 3) NULL,
	[special_amount] [numeric](18, 2) NULL,
	[status] [varchar](20) NOT NULL,
	[description] [varchar](500) NULL,
	[owner_id] [bigint] NOT NULL,
	[created_by_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_modified_by_id] [bigint] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_SALESORDER_DETAIL]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_SALESORDER_DETAIL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[sales_order_id] [bigint] NOT NULL,
	[serial_number] [varchar](2) NULL,
	[product_id] [bigint] NOT NULL,
	[price] [numeric](18, 6) NULL,
	[is_allow_zero_price] [bit] NOT NULL,
	[quantity] [numeric](18, 3) NULL,
	[discount] [numeric](18, 4) NULL,
	[special_discount] [numeric](18, 4) NULL,
	[is_allow_special_discount] [bit] NOT NULL,
	[final_discount] [numeric](18, 4) NULL,
	[final_price] [numeric](18, 6) NULL,
	[full_amount] [numeric](18, 2) NULL,
	[amount] [numeric](18, 2) NULL,
	[special_amount] [numeric](18, 2) NULL,
	[final_amount] [numeric](18, 3) NULL,
	[open_detail] [bit] NULL,
	[contract_detail_id] [bigint] NULL,
	[delivery_cycle] [int] NOT NULL,
	[delivery_limitation] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sales_order_id] ASC,
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_SALESORDER_DETAIL_DETAIL]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[sales_order_detail_id] [bigint] NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[quantity] [numeric](18, 3) NULL,
	[dosage] [int] NOT NULL,
	[quota] [int] NOT NULL,
	[price] [numeric](18, 6) NULL,
	[is_allow_zero_price] [bit] NOT NULL,
	[discount] [numeric](18, 4) NULL,
	[special_discount] [numeric](18, 4) NULL,
	[is_allow_special_discount] [bit] NOT NULL,
	[final_discount] [numeric](18, 4) NULL,
	[final_price] [numeric](18, 6) NULL,
	[full_amount] [numeric](18, 2) NULL,
	[amount] [numeric](18, 2) NULL,
	[special_amount] [numeric](18, 2) NULL,
	[final_amount] [numeric](18, 2) NULL,
	[contract_detail_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sales_order_detail_id] ASC,
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_BOM]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[B2B_BOM](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[B2B_PRODUCTCATEGORY]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[B2B_PRODUCTCATEGORY](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[category_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[product_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[B2B_BOMDETAIL]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_BOMDETAIL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[bom_id] [bigint] NOT NULL,
	[serial_number] [varchar](4) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[dosage] [int] NOT NULL,
	[quota] [int] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC,
	[bom_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BIRT_REPORTPARAMETER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BIRT_REPORTPARAMETER](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[report_id] [bigint] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[datatype] [varchar](50) NOT NULL,
	[prompttext] [varchar](200) NULL,
	[allowblank] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[report_id] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SHIRO_ROLE_permissions]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SHIRO_ROLE_permissions](
	[role_id] [bigint] NULL,
	[permissions_string] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SHIRO_USER_roles]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIRO_USER_roles](
	[role_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADMIN_SHAREROLE]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN_SHAREROLE](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[domain] [varchar](255) NOT NULL,
	[readable] [bit] NULL,
	[editable] [bit] NULL,
	[deletable] [bit] NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_STEP]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_STEP](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[workflow_id] [bigint] NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[assignee_id] [bigint] NULL,
	[lock_record] [bit] NULL,
	[is_begin] [bit] NULL,
	[is_end] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[workflow_id] ASC,
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SNAPSHOT_CREDITCONTROL]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SNAPSHOT_CREDITCONTROL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[dealer_id] [bigint] NOT NULL,
	[order_amount] [numeric](19, 2) NOT NULL,
	[opening_sell] [numeric](19, 2) NOT NULL,
	[receivable_amout] [numeric](19, 2) NOT NULL,
	[receivable_note] [numeric](19, 2) NOT NULL,
	[receivable] [numeric](19, 2) NOT NULL,
	[credit] [numeric](19, 2) NOT NULL,
	[credit_exceed] [numeric](19, 2) NOT NULL,
	[credit_balance] [numeric](19, 2) NOT NULL,
	[created_by_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_modified_by_id] [bigint] NOT NULL,
	[last_updated] [datetime] NOT NULL,
	[owner_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBSERVICE_OUTBOUND]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WEBSERVICE_OUTBOUND](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[object_name] [varchar](60) NOT NULL,
	[object_id] [bigint] NOT NULL,
	[method] [varchar](100) NOT NULL,
	[asynchronous] [bit] NOT NULL,
	[priority] [int] NULL,
	[status] [varchar](20) NULL,
	[result] [varchar](255) NULL,
	[error] [varchar](255) NULL,
	[job_id] [varchar](64) NULL,
	[job_status] [varchar](20) NULL,
	[job_result] [varchar](255) NULL,
	[job_error] [varchar](255) NULL,
	[retry_send_error] [int] NULL,
	[retry_send_error_limit] [int] NULL,
	[retry_get] [int] NULL,
	[retry_get_error] [int] NULL,
	[retry_get_error_limit] [int] NULL,
	[stage] [varchar](20) NULL,
	[created_by_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_modified_by_id] [bigint] NOT NULL,
	[last_updated] [datetime] NOT NULL,
	[owner_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[object_name] ASC,
	[object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_HISTORY]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_HISTORY](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[step_id] [bigint] NOT NULL,
	[object_name] [varchar](30) NOT NULL,
	[object_id] [bigint] NOT NULL,
	[status] [varchar](6) NOT NULL,
	[description] [varchar](255) NULL,
	[created_by_id] [bigint] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_modified_by_id] [bigint] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SHIRO_USER_permissions]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SHIRO_USER_permissions](
	[user_id] [bigint] NULL,
	[permissions_string] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_CONTRACTDETAIL]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_CONTRACTDETAIL](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[contract_id] [bigint] NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[discount] [numeric](19, 4) NOT NULL,
	[special_discount] [numeric](19, 4) NOT NULL,
	[final_discount] [numeric](19, 4) NOT NULL,
	[expiry_date] [datetime] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC,
	[contract_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_ACTION]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_ACTION](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[belogns_to_step_id] [bigint] NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[next_step_id] [bigint] NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[B2B_CATEGORY]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[B2B_CATEGORY](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [bigint] NOT NULL,
	[record_type_id] [bigint] NOT NULL,
	[serial_number] [varchar](6) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[discount] [numeric](19, 4) NOT NULL,
	[production_cycle] [int] NOT NULL,
	[transport_cycle] [int] NOT NULL,
	[has_bom] [bit] NULL,
	[is_allow_special_discount] [bit] NULL,
	[is_allow_zero_price] [bit] NULL,
	[is_active] [bit] NULL,
	[date_created] [datetime] NOT NULL,
	[last_updated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[record_type_id] ASC,
	[serial_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SYNC_DEPARTMENT]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	sync DEPARTMENT
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_DEPARTMENT]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_DEPARTMENT
		WITH MARK N'Synchronous department'
	
	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 50
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	

	CREATE TABLE #SOURCE(
		[SerialNumber] [nvarchar](10) NOT NULL,--部门编号
		[DepartmentName] [nvarchar](30) NOT NULL,--部门名称
		[Description] [nvarchar](max) NULL,--描述
		[IsActive] [bit] NOT NULL,--启用
		[ParentID] [int] NULL,--父级ID
		[DateCreated] [datetime] NOT NULL,--创建日期
		[LastUpdated] [datetime] NOT NULL,--修改日期
		[sync_model] nvarchar(6) null--同步模式
		, primary key([SerialNumber])
	);
	
	WITH TMP_DEPARTMENT AS(
	SELECT
	  ROW_NUMBER() OVER ( ORDER BY ME001 ) AS ROWNUMBER
	, RTRIM(ME001) AS [SerialNumber]
	, RTRIM(ME002) AS [DepartmentName]
	, RTRIM(ME003) AS [Description]
	, CASE RTRIM(ME008) WHEN 'Y' THEN 1 ELSE 0 END AS [IsActive]
	, null AS [ParentID]
  	, CAST (dbo.STRING_TO_DATE(CREATE_DATE) AS DATETIME) AS [DateCreated]
	, CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) AS [LastUpdated]
	FROM [192.168.1.8].[Leader].[dbo].[CMSME]
	WITH (NOLOCK)
	WHERE ME001 between '3200' and '3900' or ME001 = '3002'
	)
	
	INSERT INTO #SOURCE(
	  [SerialNumber]
	, [DepartmentName]
	, [Description]
	, [IsActive]
	, [ParentID]
	, [DateCreated]
	, [LastUpdated]
	)
	SELECT
	  [SerialNumber]
	, [DepartmentName]
	, [Description]
	, [IsActive]
	, [ParentID]
	, [DateCreated]
	, [LastUpdated]
	FROM TMP_DEPARTMENT
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER
	
	--SET ROW SYNC MODEL
	UPDATE #SOURCE 
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN dbo.B2B_DEPARTMENT T ON T.serial_number = S.[SerialNumber]
	
	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL
	
	--插入部门
	INSERT INTO B2B_DEPARTMENT(
	  serial_number
	, name
	, [description]
	, is_active
	, parent_dept_id
	, date_created
	, last_updated
	, [version]
	, [type]
	)
	SELECT
	  [SerialNumber]
	, [DepartmentName]
	, [Description]
	, [IsActive]
	, [ParentID]
	, [DateCreated]
	, [LastUpdated]
	, 0
	, CASE 
		WHEN [SerialNumber] = '3002' THEN 'C'
		WHEN RIGHT([SerialNumber], 2) = '00' THEN 'R'
		ELSE 'B'
	  END
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'

	--更新部门
	UPDATE B2B_DEPARTMENT
	   SET 
		   name =S.[DepartmentName]
		  ,[description] = S.[Description]
		  ,is_active= S.[IsActive]
		  , [type] = CASE 
				WHEN S.[SerialNumber] = '3002' THEN 'C'
				WHEN RIGHT(S.[SerialNumber], 2) = '00' THEN 'R'
				ELSE 'B'
			END
		  ,last_updated = S.[LastUpdated]
	FROM B2B_DEPARTMENT T
	JOIN #SOURCE S ON S.[SerialNumber] = T.serial_number
	WHERE S.[sync_model] = 'UPDATE'
	
	-- UPDATE DEPARTMENT PARENT ID
	UPDATE R
	SET
	  R.[parent_dept_id] = C.[id]
	FROM [B2B_DEPARTMENT] R
	LEFT OUTER JOIN [B2B_DEPARTMENT] C ON C.[type] = 'C'
	WHERE
	  R.[type] = 'R'
	  
	UPDATE B
	SET
	  B.[parent_dept_id] = R.[id]
	FROM [B2B_DEPARTMENT] B
	LEFT OUTER JOIN [B2B_DEPARTMENT] R ON LEFT(B.[serial_number], 2) = LEFT(R.[serial_number], 2)
	WHERE
	  B.[type] = 'B' AND R.[type] = 'R'
  
	--插入组
	INSERT INTO [ADMIN_GROUP]([version],[description],[is_active],[name], date_created, last_updated)
	SELECT
	  0
	, [DepartmentName]
	, 1
	, [DepartmentName]
	, getdate()
	, getdate()
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'
	
	--插入用户和权限,C
	
	declare @role_id_approval bigint, @role_id_readonly bigint
	
	select @role_id_approval = id from SHIRO_ROLE where name = 'Department Role[Approval]'
	select @role_id_readonly = id from SHIRO_ROLE where name = 'Department Role[Readonly]'
	
	INSERT INTO [SHIRO_USER](
	  [version]
	, [date_created]
	, [department_id]
	, [group_id]
	, [last_updated]
	, [password_hash]
	, [profile_id]
	, [username]
	, [role_id]
	)
	select
	  0
	, getdate()
	, D.id
	, G.id
	, getdate()
	, 'cccf9472c73ae467ac73d189523888c48a1ea883329860f94bdaf0ffb8519ca35086f4a15b7b699683ba7f025ed2d6b57e68d31314420296637b51124b8fedd6'
	, P.id
	, 'C' + D.serial_number
	, @role_id_approval
	FROM [B2B_DEPARTMENT] D
	with(nolock)
	INNER JOIN ADMIN_GROUP G ON G.name = D.name
	LEFT OUTER JOIN [ADMIN_PROFILE] P ON P.[name] = 'Department Profile'
	where D.[type] = 'C' AND D.serial_number IN(
		SELECT [SerialNumber] FROM #SOURCE WHERE [sync_model] = 'INSERT'
	)

	--插入用户和权限,R
	INSERT INTO [SHIRO_USER](
	  [version]
	, [date_created]
	, [department_id]
	, [group_id]
	, [last_updated]
	, [password_hash]
	, [profile_id]
	, [username]
	, [role_id]
	)
	select
	  0
	, getdate()
	, D.id
	, G.id
	, getdate()
	, 'cccf9472c73ae467ac73d189523888c48a1ea883329860f94bdaf0ffb8519ca35086f4a15b7b699683ba7f025ed2d6b57e68d31314420296637b51124b8fedd6'
	, P.id
	, 'R' + D.serial_number
	, @role_id_readonly
	FROM [B2B_DEPARTMENT] D
	with(nolock)
	INNER JOIN ADMIN_GROUP G ON G.name = D.name
	LEFT OUTER JOIN [ADMIN_PROFILE] P ON P.[name] = 'Department Profile'
	where D.[type] = 'R' AND D.serial_number IN(
		SELECT [SerialNumber] FROM #SOURCE WHERE [sync_model] = 'INSERT'
	)

	--插入用户和权限,B
	INSERT INTO [SHIRO_USER](
	  [version]
	, [date_created]
	, [department_id]
	, [group_id]
	, [last_updated]
	, [password_hash]
	, [profile_id]
	, [username]
	, [role_id]
	)
	select
	  0
	, getdate()
	, D.id
	, G.id
	, getdate()
	, 'cccf9472c73ae467ac73d189523888c48a1ea883329860f94bdaf0ffb8519ca35086f4a15b7b699683ba7f025ed2d6b57e68d31314420296637b51124b8fedd6'
	, P.id
	, 'B' + D.serial_number
	, @role_id_approval
	FROM [B2B_DEPARTMENT] D
	with(nolock)
	INNER JOIN ADMIN_GROUP G ON G.name = D.name
	LEFT OUTER JOIN [ADMIN_PROFILE] P ON P.[name] = 'Department Profile'
	where D.[type] = 'B' AND D.serial_number IN(
		SELECT [SerialNumber] FROM #SOURCE WHERE [sync_model] = 'INSERT'
	)
	
	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_DEPARTMENT
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_DEPARTMENT
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_DEALER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	sync DEALER
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_DEALER]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_DEALER
		WITH MARK N'Synchronous DEALER'
	
	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 50
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	

	CREATE TABLE #SOURCE(
		[SerialNumber] [nvarchar](10) NOT NULL,--序号
		[DepartmentID] [int] NOT NULL,--部门ID
		[SalesMan] numeric(19, 0) not null,--业务员
		[DealerName] [nvarchar](72) NULL,--名称
		[AliasName] [nvarchar](20) NULL,--简称
		[Shortcut] [nvarchar](10) NULL,--快捷码
		[Leader] [nvarchar](50) NULL,--负责人
		[Contact] [nvarchar](50) NULL,--联系人
		[ApprovalStatus] [nvarchar](10) NOT NULL,--核准状态
		[PricingMode] [nvarchar](3) NULL,--计价方式
		[Address1] [nvarchar](255) NULL,--送货地址1
		[Address2] [nvarchar](255) NULL,--送货地址2
		[DateCreated] [datetime] NOT NULL,--创建日期
		[LastUpdated] [datetime] NOT NULL,--修改日期
		[sync_model] nvarchar(6) null--同步模式
		, primary key ([SerialNumber])
	);
	
	WITH TMP_DEALER AS(
	SELECT
	  ROW_NUMBER() OVER ( ORDER BY MA.MA001 ) AS ROWNUMBER
	, RTRIM(MA.MA001) AS [SerialNumber]
	, DEPT.id AS [DepartmentID]
	, STAFF.id AS [SalesMan]
	, RTRIM(MA.MA003) AS [DealerName]
	, RTRIM(MA.MA002) AS [AliasName]
	, RTRIM(MA.MA102) AS [Shortcut]
	, RTRIM(MA.MA004) AS [Leader]
	, RTRIM(MA.MA005) AS [Contact]
	, CASE MA.MA097 WHEN '1' THEN '已核准' WHEN '2' THEN '尚待核准' WHEN '3' THEN '不准交易' END AS [ApprovalStatus]
	, CASE MA.MA035 WHEN '1' THEN '利润率' WHEN '2' THEN '折扣率' END AS [PricingMode]
	, RTRIM(MA.MA027) AS [Address1]
	, RTRIM(MA.MA064) AS [Address2]
  	, CAST (dbo.STRING_TO_DATE(CREATE_DATE) AS DATETIME) AS [DateCreated]
	, CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) AS [LastUpdated]
	FROM [192.168.1.8].[Leader].[dbo].COPMA AS MA
	WITH(NOLOCK)
	INNER JOIN B2B_DEPARTMENT DEPT ON DEPT.serial_number = MA.MA015 collate Chinese_PRC_CI_AS
	INNER JOIN B2B_STAFF STAFF ON STAFF.serial_number = MA.MA016 collate Chinese_PRC_CI_AS
	)
	
	INSERT INTO #SOURCE(
	  [SerialNumber]
	, [DepartmentID]
	, [SalesMan]
	, [DealerName]
	, [AliasName]
	, [Shortcut]
	, [Leader]
	, [Contact]
	, [ApprovalStatus]
	, [PricingMode]
	, [Address1]
	, [Address2]
	, [DateCreated]
	, [LastUpdated]
	)
	SELECT
	  [SerialNumber]
	, [DepartmentID]
	, [SalesMan]
	, [DealerName]
	, [AliasName]
	, [Shortcut]
	, [Leader]
	, [Contact]
	, [ApprovalStatus]
	, [PricingMode]
	, [Address1]
	, [Address2]
	, [DateCreated]
	, [LastUpdated]
	FROM TMP_DEALER
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER
	
	--SET ROW SYNC MODEL
	UPDATE #SOURCE 
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN B2B_DEALER T ON T.serial_number = S.[SerialNumber]
	
	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL
	
	--INSERT USER
	
	declare @role_id_dealer bigint
	
	select @role_id_dealer = id from SHIRO_ROLE where name = 'Dealer Role'

	
	INSERT INTO [SHIRO_USER]
           ([version]
           ,[date_created]
           ,[department_id]
           ,[group_id]
           ,[last_updated]
           ,[password_hash]
           ,[profile_id]
           ,[username]
           , role_id
           )
	SELECT 
	  0
	, GETDATE()
	, S.[DepartmentID]
	, NULL
	, GETDATE()
	, 'cccf9472c73ae467ac73d189523888c48a1ea883329860f94bdaf0ffb8519ca35086f4a15b7b699683ba7f025ed2d6b57e68d31314420296637b51124b8fedd6'
	, P.id
	, S.[SerialNumber]
	, @role_id_dealer
	FROM #SOURCE S
	LEFT OUTER JOIN ADMIN_PROFILE P ON P.name = 'Dealer Profile'
	WHERE S.[sync_model] = 'INSERT'
		
	
	INSERT INTO B2B_DEALER(
	  serial_number
	, department_id
	, name
	, alias
	, shortcut
	, head
	, contact
	, approval_status
	, pricing_mode
	, address1
	, address2
	, date_created
	, last_updated
	, [version]
	, owner_id
	, sales_man_id
	)
	SELECT
	  S.[SerialNumber]
	, S.[DepartmentID]
	, S.[DealerName]
	, S.[AliasName]
	, S.[Shortcut]
	, S.[Leader]
	, S.[Contact]
	, S.[ApprovalStatus]
	, S.[PricingMode]
	, S.[Address1]
	, S.[Address2]
	, S.[DateCreated]
	, S.[LastUpdated]
	, 0
	, U.id
	, [SalesMan]
	FROM #SOURCE S
	INNER JOIN SHIRO_USER U ON S.[SerialNumber] = U.username
	WHERE [sync_model] = 'INSERT'

	UPDATE B2B_DEALER
	   SET 
		    department_id=S.[DepartmentID]
		  , name= S.[DealerName]
		  , alias= S.[AliasName]
		  , shortcut= S.[Shortcut]
		  , head= S.[Leader]
		  , contact= S.[Contact]
		  , approval_status= S.[ApprovalStatus]
		  , pricing_mode= S.[PricingMode]
		  , address1= S.[Address1]
		  , address2= S.[Address2]
		  , sales_man_id = S.[SalesMan]
		  , last_updated= S.[LastUpdated]
	FROM B2B_DEALER T
	JOIN #SOURCE S ON S.[SerialNumber] = T.serial_number
	WHERE S.[sync_model] = 'UPDATE'

	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_DEALER
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_DEALER
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_STAFF]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	sync STAFF
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_STAFF]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_STAFF
		WITH MARK N'Synchronous STAFF'
	
	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 500
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	

	CREATE TABLE #SOURCE(
		[SerialNumber] [nvarchar](10) NOT NULL,--序号
		[Name] [nvarchar](10) NOT NULL,--全称
		[DepartmentId] numeric(19, 0) NOT NULL, --部门ID
		[DateCreated] [datetime] NOT NULL,--创建日期
		[LastUpdated] [datetime] NOT NULL,--修改日期
		[sync_model] nvarchar(6) null--同步模式
		, primary key([SerialNumber])
	);
	
	WITH TMP_STAFF AS(
	SELECT
	  ROW_NUMBER() OVER ( ORDER BY MV001 ) AS ROWNUMBER
	, RTRIM(MV001) AS [SerialNumber]
	, RTRIM(MV002) AS [Name]
	, DEPT.id AS [DepartmentId]
  	, CAST (dbo.STRING_TO_DATE(CASE ISNULL(CREATE_DATE, '') WHEN '' THEN MODI_DATE ELSE CREATE_DATE END) AS DATETIME) AS [DateCreated]
	, CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) AS [LastUpdated]
	FROM [192.168.1.8].[Leader].[dbo].CMSMV MV
	WITH (NOLOCK)
	INNER JOIN B2B_DEPARTMENT DEPT ON DEPT.serial_number = MV.MV004 collate Chinese_PRC_CI_AS
	)
	
	INSERT INTO #SOURCE(
	  [SerialNumber]
	, [Name]
	, [DepartmentId]
	, [DateCreated]
	, [LastUpdated]
	)
	SELECT
	  [SerialNumber]
	, [Name]
	, [DepartmentId]
	, [DateCreated]
	, [LastUpdated]
	FROM TMP_STAFF
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER

	--SET ROW SYNC MODEL
	UPDATE #SOURCE
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN B2B_STAFF T ON T.serial_number = S.[SerialNumber]
	
	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL
	
	INSERT INTO B2B_STAFF(
	  serial_number
	, name
	, department_id
	, date_created
	, last_updated
	, [version]
	)
	SELECT
	  [SerialNumber]
	, [Name]
	, [DepartmentId]
	, [DateCreated]
	, [LastUpdated]
	, 0
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'

	UPDATE B2B_STAFF
	   SET 
		   name =S.[Name]
		  ,department_id = S.[DepartmentId]
		  ,last_updated = S.[LastUpdated]
	FROM B2B_STAFF T
	JOIN #SOURCE S ON S.[SerialNumber] = T.serial_number
	WHERE S.[sync_model] = 'UPDATE'

	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_STAFF
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_STAFF
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_BOM]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	SYNCHRONOUS BOM
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_BOM]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_BOM
		WITH MARK N'Synchronous BOM'
	
	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 1000
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	

CREATE TABLE #SOURCE(
	[masterProduct] numeric(19, 0) NOT NULL,--主件品号
	[DateCreated] [datetime] NOT NULL,--创建日期
	[LastUpdated] [datetime] NOT NULL,--修改日期
	[sync_model] nvarchar(6) NULL
	, primary key([masterProduct])
);

WITH TMP_BOM AS(
SELECT
  ROW_NUMBER() OVER ( ORDER BY MB.MB001 ) AS ROWNUMBER
, P.id AS [masterProduct]-- AS 主件品号
, CAST (dbo.STRING_TO_DATE(MC.CREATE_DATE) AS DATETIME) AS [DateCreated]
, CAST (dbo.STRING_TO_DATE(CASE rtrim(ISNULL(MC.MODI_DATE, '')) WHEN '' THEN MC.CREATE_DATE ELSE MC.MODI_DATE END) AS DATETIME) AS [LastUpdated]
FROM [192.168.1.8].[Leader].[dbo].BOMMC MC
WITH (NOLOCK)
INNER JOIN [192.168.1.8].[Leader].[dbo].INVMB MB on MB.MB001 = MC.MC001
INNER JOIN B2B_PRODUCT AS P ON P.serial_number = MB.MB001  collate   Chinese_PRC_CI_AS
--属性
INNER JOIN [192.168.1.8].[Leader].[dbo].INVMA MA5 ON MA5.MA002 = MB.MB200 AND MA5.MA001 = '5'
WHERE 
  MB.MB109 = 'Y'
AND MB.MB005 = '04'
AND MA5.MA201 = 'Y'
)

INSERT INTO #SOURCE(
  [masterProduct]
, [DateCreated]
, [LastUpdated]
)
SELECT
  [masterProduct]
, [DateCreated]
, [LastUpdated]
FROM TMP_BOM
WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER

--SET ROW SYNC MODEL
UPDATE #SOURCE
SET [sync_model] = 'UPDATE'
FROM #SOURCE S
INNER JOIN B2B_BOM T ON T.product_id = S.[masterProduct]

UPDATE #SOURCE
SET [sync_model] = 'INSERT'
FROM #SOURCE S
WHERE S.[sync_model] IS NULL

	IF @@ROWCOUNT > 0 BEGIN
		INSERT INTO B2B_BOM(product_id, date_created, last_updated, [version])
		SELECT
		  [masterProduct]
		, [DateCreated]
		, [LastUpdated]
		, 0
		FROM #SOURCE
		WHERE [sync_model] = 'INSERT'
	END
	
--DETAILS
CREATE TABLE #DETAIL(
	[Bom] [int] not NULL,--主件
	[serialNumber] [int] not NULL,--序号
	[detailProduct] [int] not NULL,--元件
	[dosage] [int] NULL,--组成用量
	[base_quota] [numeric](4, 0) NOT NULL,--基数
	[dateCreated] [datetime] NULL,--创建日期
	[lastUpdated] [datetime] NULL,--修改日期
	[sync_model] nvarchar(6) NULL,
	[Id] int,
	primary key([Bom], [serialNumber], [detailProduct])
)
INSERT INTO #DETAIL(
  [Bom]
, [serialNumber]
, [detailProduct]
, [dosage]
, [base_quota]
, [dateCreated]
, [lastUpdated]
)
SELECT
  BOM.ID
, MD.MD002
, D_PRODUCT.id
, MD.MD006
, MD.MD007
, CAST (dbo.STRING_TO_DATE(MD.CREATE_DATE) AS DATETIME) AS [DateCreated]-- AS [DateCreated]
, CAST (dbo.STRING_TO_DATE(CASE rtrim(ISNULL(MD.MODI_DATE, '')) WHEN '' THEN MD.CREATE_DATE ELSE MD.MODI_DATE END) AS DATETIME) AS [LastUpdated]-- AS [LastUpdated]
FROM B2B_BOM BOM
WITH (NOLOCK)
LEFT OUTER JOIN B2B_PRODUCT M_PRODUCT ON M_PRODUCT.id = BOM.product_id
LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[BOMMC] MC ON MC.MC001 = M_PRODUCT.serial_number collate   Chinese_PRC_CI_AS
LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[BOMMD] MD ON MD.MD001 = MC.MC001
LEFT OUTER JOIN B2B_PRODUCT D_PRODUCT ON D_PRODUCT.serial_number = MD.MD003 collate   Chinese_PRC_CI_AS
WHERE M_PRODUCT.id IN (
	SELECT [masterProduct] FROM #SOURCE
)
ORDER BY 
  BOM.ID
, MD.MD002

--COLLECT EXIST DETAIL
CREATE TABLE #DETAIL_EXIST(
  [ID] numeric(19, 0) NOT NULL,
  [Bom] numeric(19, 0) NULL,
  [serialNumber] varchar(4) NULL,
  [detailProduct] numeric(19, 0) NULL,
  [dosage] [int] NULL,
  [base_quota] [numeric](4, 0) NOT NULL,
  [dateCreated] [datetime] NULL,
  [lastUpdated] [datetime] NULL,
  [sync_model] nvarchar(6) NULL,
  PRIMARY KEY([ID])
)
INSERT INTO #DETAIL_EXIST(
  [ID]
, [Bom]
, [serialNumber]
, [detailProduct]
, [dosage]
, [base_quota]
, [dateCreated]
, [lastUpdated]
)
SELECT
  BD.id
, BD.bom_id
, BD.serial_number
, BD.product_id
, BD.dosage
, BD.quota
, BD.date_created
, BD.last_updated
FROM B2B_BOMDETAIL BD
WITH(NOLOCK)
LEFT OUTER JOIN B2B_BOM B ON B.id = BD.bom_id
WHERE B.product_id IN(
	SELECT [masterProduct] FROM #SOURCE
)


update new
set 
  sync_model = 'delete'
  , id = old.ID
from #DETAIL new
right outer join #DETAIL_EXIST old on new.[Bom] = old.[Bom] and new.[detailProduct] = old.[detailProduct]
where new.Bom is null

if @@rowcount > 0 begin
	delete from B2B_BOMDETAIL 
	where id in (
		select Id from #DETAIL where sync_model = 'delete'
	)
end

update new
set 
  sync_model = 'Update'
  , id = old.ID
from #DETAIL new
inner join #DETAIL_EXIST old on new.[Bom] = old.[Bom] and new.[detailProduct] = old.[detailProduct]

if @@rowcount > 0 begin
	update B2B_BOMDETAIL
	set
	  bom_id = new.[Bom]
	, serial_number = new.[serialNumber]
	, product_id = new.[detailProduct]
	, dosage = new.[dosage]
	, quota = new.[base_quota]
	, date_created = new.[dateCreated]
	, last_updated = new.[lastUpdated]
	from B2B_BOMDETAIL old
	join #DETAIL new on old.id = new.Id
	where new.sync_model = 'Update'
end

update new
set 
  sync_model = 'insert'
from #DETAIL new
left outer join #DETAIL_EXIST old on new.[Bom] = old.[Bom] and new.[detailProduct] = old.[detailProduct]
where new.sync_model is null

if @@rowcount > 0 begin
	INSERT INTO B2B_BOMDETAIL(
	  bom_id
	, serial_number
	, product_id
	, dosage
	, quota
	, date_created
	, last_updated
	, [version]
	)
	select
	  [Bom]
	, [serialNumber]
	, [detailProduct]
	, [dosage]
	, [base_quota]
	, [dateCreated]
	, [lastUpdated]
	, 0
	from #DETAIL
	where sync_model = 'insert'
end
	
	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_BOM
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_BOM
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
	DROP TABLE #DETAIL
	DROP TABLE #DETAIL_EXIST
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_PRODUCT]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	SYNCHRONOUS PRODUCT
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_PRODUCT]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_PRODUCT
		WITH MARK N'Synchronous product'
	
	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 2000
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	

	CREATE TABLE #SOURCE(
		[SerialNumber] [nvarchar](20) NOT NULL,--品号
		[ProductName] [nvarchar](60) NOT NULL,--品名
		[Standard] [nvarchar](60) NOT NULL,--规格
		[Unit] [nvarchar](10) NOT NULL,--单位
		[Price] [numeric](18, 6) NULL,--价格
		[IsIncludeTax] [bit] NULL,--含税
		[IsActive] [bit] NULL,--启用
		[DateCreated] [datetime] NOT NULL,--创建日期
		[LastUpdated] [datetime] NOT NULL,--修改日期
		[sync_model] nvarchar(6) null
		, primary key([SerialNumber])
	);
	
	WITH TMP_PRODUCT AS(
	SELECT
	  ROW_NUMBER() OVER ( ORDER BY MB.MB001 ) AS ROWNUMBER
	, RTRIM(MB.MB001) AS [SerialNumber]-- AS '品号'
	, RTRIM(MB.MB002) AS [ProductName]-- AS '品名'
	, RTRIM(MB.MB003) AS [Standard]-- AS '规格'
	, RTRIM(MB.MB004) AS [Unit]-- AS '库存单位'
	, MB.MB047 AS [Price]-- AS '标准售价'
	, CASE MB.MB101 WHEN 'Y' THEN 1 ELSE 0 END AS [IsIncludeTax]-- AS '含税'
	, CASE MB.MB109 WHEN 'Y' THEN 1 ELSE 0 END AS [IsActive] -- AS '核准状况'
	, CAST (dbo.STRING_TO_DATE(CREATE_DATE) AS DATETIME) AS [DateCreated]-- AS [DateCreated]
	, CAST (dbo.STRING_TO_DATE(CASE RTRIM(ISNULL(MODI_DATE, '')) WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) AS [LastUpdated]-- AS [LastUpdated]
	FROM [192.168.1.8].[Leader].[dbo].INVMB MB
	WITH (NOLOCK)
	)
	
	INSERT INTO #SOURCE(
	  [SerialNumber]
	, [ProductName]
	, [Standard]
	, [Unit]
	, [Price]
	, [IsIncludeTax]
	, [IsActive]
	, [DateCreated]
	, [LastUpdated]
	)
	SELECT
	  [SerialNumber]
	, [ProductName]
	, [Standard]
	, [Unit]
	, [Price]
	, [IsIncludeTax]
	, [IsActive]
	, [DateCreated]
	, [LastUpdated]
	FROM TMP_PRODUCT
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER

	--SET ROW SYNC MODEL
	UPDATE #SOURCE 
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN B2B_PRODUCT T ON T.serial_number = S.[SerialNumber]
	
	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL
	
	INSERT INTO B2B_PRODUCT(
	  serial_number
	, name
	, [standard]
	, unit
	, price
	, is_include_tax
	, is_active
	, date_created
	, last_updated
	, [version]
	)
	SELECT
	  [SerialNumber]
	, [ProductName]
	, [Standard]
	, [Unit]
	, [Price]
	, [IsIncludeTax]
	, [IsActive]
	, [DateCreated]
	, [LastUpdated]
	, 0
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'

	UPDATE B2B_PRODUCT
	   SET 
		    name=S.[ProductName]
		  , [standard]= S.[Standard]
		  , unit= S.[Unit]
		  , price= S.[Price]
		  , is_include_tax= S.[IsIncludeTax]
		  , is_active= S.[IsActive]
		  , last_updated= S.[LastUpdated]
	FROM B2B_PRODUCT T
	JOIN #SOURCE S ON S.[SerialNumber] = T.serial_number
	WHERE S.[sync_model] = 'UPDATE'
	
--DETAILS
CREATE TABLE #DETAIL(
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[sync_model] nvarchar(6) null,
	[ProductCategoryID] [int],
	Primary Key ([ProductID], [CategoryID])
)

INSERT INTO #DETAIL([ProductID], [CategoryID])
SELECT
  P.id
, C.id
FROM B2B_PRODUCT P
WITH(NOLOCK)
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMB] MB ON MB.MB001 = P.serial_number collate Chinese_PRC_CI_AS
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMA] MA1 ON MA1.MA002 = MB.MB005 and MA1.MA001 = '1'
inner JOIN B2B_CATEGORY C ON C.serial_number = MA1.MA002 collate Chinese_PRC_CI_AS
inner join ADMIN_RECORDTYPE rt on rt.id = c.record_type_id and rt.domain = 'category' and rt.serial_number = '1'
WHERE P.serial_number IN (
	SELECT [SerialNumber] FROM #SOURCE
)

INSERT INTO #DETAIL([ProductID], [CategoryID])
SELECT
  P.id
, C.id
FROM B2B_PRODUCT P
WITH(NOLOCK)
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMB] MB ON MB.MB001 = P.serial_number collate Chinese_PRC_CI_AS
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMA] MA1 ON MA1.MA002 = MB.MB006 and MA1.MA001 = '2'
inner JOIN B2B_CATEGORY C ON C.serial_number = MA1.MA002 collate Chinese_PRC_CI_AS
inner join ADMIN_RECORDTYPE rt on rt.id = c.record_type_id and rt.domain = 'category' and rt.serial_number = '2'
WHERE P.serial_number IN (
	SELECT [SerialNumber] FROM #SOURCE
)

INSERT INTO #DETAIL([ProductID], [CategoryID])
SELECT
  P.id
, C.id
FROM B2B_PRODUCT P
WITH(NOLOCK)
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMB] MB ON MB.MB001 = P.serial_number collate Chinese_PRC_CI_AS
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMA] MA1 ON MA1.MA002 = MB.MB007 and MA1.MA001 = '3'
inner JOIN B2B_CATEGORY C ON C.serial_number = MA1.MA002 collate Chinese_PRC_CI_AS
inner join ADMIN_RECORDTYPE rt on rt.id = c.record_type_id and rt.domain = 'category' and rt.serial_number = '3'
WHERE P.serial_number IN (
	SELECT [SerialNumber] FROM #SOURCE
)

INSERT INTO #DETAIL([ProductID], [CategoryID])
SELECT
  P.id
, C.id
FROM B2B_PRODUCT P
WITH(NOLOCK)
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMB] MB ON MB.MB001 = P.serial_number collate Chinese_PRC_CI_AS
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMA] MA1 ON MA1.MA002 = MB.MB008 and MA1.MA001 = '4'
inner JOIN B2B_CATEGORY C ON C.serial_number = MA1.MA002 collate Chinese_PRC_CI_AS
inner join ADMIN_RECORDTYPE rt on rt.id = c.record_type_id and rt.domain = 'category' and rt.serial_number = '4'
WHERE P.serial_number IN (
	SELECT [SerialNumber] FROM #SOURCE
)
INSERT INTO #DETAIL([ProductID], [CategoryID])
SELECT
  P.id
, C.id
FROM B2B_PRODUCT P
WITH(NOLOCK)
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMB] MB ON MB.MB001 = P.serial_number collate Chinese_PRC_CI_AS
inner JOIN [192.168.1.8].[Leader].[dbo].[INVMA] MA1 ON MA1.MA002 = MB.MB200 and MA1.MA001 = '5'
inner JOIN B2B_CATEGORY C ON C.serial_number = MA1.MA002 collate Chinese_PRC_CI_AS
inner join ADMIN_RECORDTYPE rt on rt.id = c.record_type_id and rt.domain = 'category' and rt.serial_number = '5'
WHERE P.serial_number IN (
	SELECT [SerialNumber] FROM #SOURCE
)

CREATE TABLE #DETAIL_EXIST(	
  [ProductCategoryID] [int] NOT NULL,
  [ProductID] [int] NOT NULL,
  [CategoryID] [int] NOT NULL,
  PRIMARY KEY([ProductCategoryID])
)
INSERT INTO #DETAIL_EXIST([ProductCategoryID], [ProductID] ,[CategoryID])
SELECT PC.id,PC.product_id,PC.category_id
FROM B2B_PRODUCTCATEGORY PC
WITH(NOLOCK)
LEFT OUTER JOIN B2B_PRODUCT P ON P.id = PC.product_id
WHERE P.serial_number IN(
	SELECT [SerialNumber] FROM #SOURCE
)


--SET ROW SYNC MODEL
UPDATE #DETAIL 
SET [sync_model] = 'UPDATE'
FROM #DETAIL D
INNER JOIN #DETAIL_EXIST E ON E.[ProductID] = D.[ProductID] AND E.[CategoryID] = D.[CategoryID]

UPDATE #DETAIL 
SET [sync_model] = 'INSERT'
FROM #DETAIL D
LEFT OUTER JOIN #DETAIL_EXIST E ON E.[ProductID] = D.[ProductID] AND E.[CategoryID] = D.[CategoryID]
WHERE E.[ProductID] IS NULL

IF @@ROWCOUNT > 0 BEGIN
	INSERT INTO B2B_PRODUCTCATEGORY(product_id,category_id, [version])
	SELECT [ProductID], [CategoryID], 0
	FROM #DETAIL
	WHERE [sync_model] = 'INSERT'
END

INSERT INTO #DETAIL([ProductID], [CategoryID], [sync_model], [ProductCategoryID])
SELECT
  E.[ProductID]
, E.[CategoryID]
, 'DELETE'
, E.ProductCategoryID
FROM #DETAIL D
RIGHT OUTER JOIN #DETAIL_EXIST E ON E.[ProductID] = D.[ProductID] AND E.[CategoryID] = D.[CategoryID]
WHERE D.[ProductID] IS NULL


IF @@ROWCOUNT > 0 BEGIN
	DELETE FROM B2B_PRODUCTCATEGORY
	WHERE id IN(
		SELECT ProductCategoryID FROM #DETAIL WHERE [sync_model] = 'DELETE'
	)
END

	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_PRODUCT
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_PRODUCT
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
	DROP TABLE #DETAIL
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_CATEGORY]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-02
-- Description:	synchronous	category
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_CATEGORY]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN TRANSACTION SYNC_CATEGORY 
		WITH MARK N'Synchronous category'
	
	--DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 50
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	

	CREATE TABLE #SOURCE(
		[RecordTypeID] [int] NOT NULL, --记录类型
		[SerialNumber] [nvarchar](6) NOT NULL, --品号类别编号
		[CategoryName] [nvarchar](20) NOT NULL,--品号类名称
		[Discount] [decimal](18, 4) NOT NULL, --标准折扣
		[opendetail] [int] NOT NULL,--是否有下阶主附件
		is_active tinyint null, --是否启用
		[DateCreated] [datetime] NOT NULL,
		[LastUpdated] [datetime] NOT NULL, 
		[sync_model] nvarchar(6) null
		, primary key([RecordTypeID], [SerialNumber])
	);
	
	WITH TMP_CATEGORY AS(
	SELECT
	  ROW_NUMBER() OVER ( ORDER BY MA.MA001, MA.MA002 ) AS ROWNUMBER
	, RT.id AS [RecordTypeID]
	, RTRIM(MA.[MA002]) AS [SerialNumber]
	, RTRIM(MA.[MA003]) AS [CategoryName]
	, MA.[MA200] AS [Discount]
	, CASE MA.[MA201] WHEN 'Y' THEN 1 ELSE 0 END AS [opendetail]
	, case MA.MA011 WHEN 'Y' THEN 1 ELSE 0 END AS is_active
	, CAST (dbo.STRING_TO_DATE(CREATE_DATE) AS DATETIME) AS [DateCreated]
	, CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) AS [LastUpdated]
	FROM [192.168.1.8].[Leader].[dbo].[INVMA] MA
	WITH(NOLOCK)
	LEFT OUTER JOIN ADMIN_RECORDTYPE RT ON RT.serial_number = MA.MA001 COLLATE CHINESE_PRC_CI_AS AND RT.[DOMAIN] = 'category'
	)
	
	INSERT INTO #SOURCE(
	  [RecordTypeID]
	, [SerialNumber]
	, [CategoryName]
	, [Discount]
	, [opendetail]
	, is_active
	, [DateCreated]
	, [LastUpdated]
	
	)
	SELECT
	  [RecordTypeID]
	, [SerialNumber]
	, [CategoryName]
	, [Discount]
	, [opendetail]
	, is_active
	, [DateCreated]
	, [LastUpdated]
	
	FROM TMP_CATEGORY
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER
	
	--SET ROW SYNC MODEL
	UPDATE #SOURCE 
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN B2B_CATEGORY T ON T.record_type_id = S.[RecordTypeID] AND T.serial_number = S.[SerialNumber]
	
	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL
	
	INSERT INTO B2B_CATEGORY(
	  record_type_id
	, serial_number
	, name
	, discount
	, has_bom
	, is_active
	, production_cycle
	, transport_cycle
	, date_created
	, last_updated
	, [version]
	)
	SELECT
	  [RecordTypeID]
	, [SerialNumber]
	, [CategoryName]
	, [Discount]
	, [opendetail]
	, is_active
	, 0
	, 0
	, [DateCreated]
	, [LastUpdated]
	, 0
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'

	UPDATE B2B_CATEGORY
	   SET 
		   name =S.[CategoryName]
		  ,discount = S.[Discount]
		  ,last_updated = S.[LastUpdated]
		  ,has_bom = S.[opendetail]
		  , is_active = S.is_active
	FROM B2B_CATEGORY T
	JOIN #SOURCE S ON S.[RecordTypeID] = T.record_type_id AND S.[SerialNumber] = T.serial_number
	WHERE S.[sync_model] = 'UPDATE'

	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_CATEGORY
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_CATEGORY
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_CONTRACT]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	SYNCHRONOUS BOM
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_CONTRACT]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRANSACTION SYNC_CONTRACT
		WITH MARK N'Synchronous CONTRACT'
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 10
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
 	
 	declare @admin_id numeric(19, 0)
 	select @admin_id = id FROM [SHIRO_USER] where [username] = 'ADMIN'
 	
 	declare @recordtype_221 numeric(19, 0)
 	select @recordtype_221 = id from [ADMIN_RECORDTYPE] where domain = 'contract' and serial_number = '221'
 	
 	declare @recordtype_224 numeric(19, 0)
 	select @recordtype_224 = id from [ADMIN_RECORDTYPE] where domain = 'contract' and serial_number = '224'

	CREATE TABLE #SOURCE(
		  id int 
		, serial_number VARCHAR(30)
		, record_type_id NUMERIC(19, 0)
		, dealer_id NUMERIC(19, 0)
		, applicant VARCHAR(10)
		, [subject] VARCHAR(100)
		, filing_date DATETIME
		, project VARCHAR(100)
		, industry_id NUMERIC(19, 0)
		, [description] VARCHAR(500)
		, effective_date DATETIME
		, date_created DATETIME
		, last_updated DATETIME
		, created_by_id numeric(19, 0)
		, last_modified_by_id numeric(19, 0)
		, owner_id numeric(19, 0)
		, [sync_model] nvarchar(6) NULL
		, primary key(id, serial_number)
	);

	WITH TMP_BOM AS(
	SELECT 
	  ROW_NUMBER() OVER ( ORDER BY coa.[SerialNumber] ) AS ROWNUMBER
	, coa.ContractID as id
	, coa.[SerialNumber] as serial_number
	, case rtrim(coa.[RecordTypeID]) when '行业' then @recordtype_221 when '非行业' then @recordtype_224 else null end as record_type_id
	, dealer.id as dealer_id
	, coa.[Applicant] as applicant
	, coa.[Subject] as [subject]
	, coa.[OrderDate] as filing_date
	, coa.[Project] as project
	, ind.id as industry_id
	, left(isnull(coa.[Description], ''), 250)  as [description]
	, coa.[EffectiveDate] as effective_date
	, coa.[DateCreated] as date_created
	, coa.[LastUpdated] as last_updated
	, @admin_id as created_by_id
	, @admin_id as last_modified_by_id
	, dealer.owner_id as owner_id
	FROM [copnew].[dbo].[ContractsOA] coa
	with(nolock)
	left outer join B2B_DEALER dealer on dealer.serial_number = coa.[DealerName]
	left outer join B2B_INDUSTRY ind on ind.short_name = coa.[IndustryID]
	where
	  dealer.id is not null
	  and ind.id is not null
	  and coa.ContractID in (
		SELECT max(ContractID) 
		FROM [copnew].[dbo].[ContractsOA] 
		group by [SerialNumber] --having count(*) > 1 
		)
	)

	INSERT INTO #SOURCE(
	      id
		, serial_number
		, record_type_id
		, dealer_id
		, applicant
		, [subject]
		, filing_date
		, project
		, industry_id
		, [description]
		, effective_date
		, date_created
		, last_updated
		, created_by_id 
		, last_modified_by_id
		, owner_id
	)
	SELECT
		  id
		, serial_number
		, record_type_id
		, dealer_id
		, applicant
		, [subject]
		, filing_date
		, project
		, industry_id
		, [description]
		, effective_date
		, date_created
		, last_updated
		, created_by_id 
		, last_modified_by_id
		, owner_id
	FROM TMP_BOM
	WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER

	--SET ROW SYNC MODEL
	UPDATE #SOURCE
	SET [sync_model] = 'UPDATE'
	FROM #SOURCE S
	INNER JOIN B2B_CONTRACT T ON T.serial_number = S.serial_number

	IF @@ROWCOUNT > 0 BEGIN
		update old set
		  serial_number = new.serial_number
		, record_type_id = new.record_type_id
		, dealer_id = new.dealer_id
		, applicant = new.applicant
		, [subject] = new.[subject]
		, filing_date = new.filing_date
		, project = new.project
		, industry_id = new.industry_id
		, [description] = new.[description]
		, effective_date = new.effective_date
		, date_created = new.date_created
		, last_updated = new.last_updated
		, created_by_id  = new.created_by_id
		, last_modified_by_id = new.last_modified_by_id
		, owner_id = new.owner_id
        from [B2B_CONTRACT] old 
        inner join #SOURCE new on old.serial_number = new.serial_number
		WHERE new.[sync_model] = 'UPDATE'
	END

	UPDATE #SOURCE
	SET [sync_model] = 'INSERT'
	FROM #SOURCE S
	WHERE S.[sync_model] IS NULL

	IF @@ROWCOUNT > 0 BEGIN
		INSERT INTO [B2B_CONTRACT](
		  serial_number
		, record_type_id
		, dealer_id
		, applicant
		, [subject]
		, filing_date
		, project
		, industry_id
		, [description]
		, effective_date
		, date_created
		, last_updated
		, created_by_id 
		, last_modified_by_id
		, owner_id
		, [version]
        )
		SELECT 
		  serial_number
		, record_type_id
		, dealer_id
		, applicant
		, [subject]
		, filing_date
		, project
		, industry_id
		, [description]
		, effective_date
		, date_created
		, last_updated
		, created_by_id 
		, last_modified_by_id
		, owner_id
		, 0
		FROM #SOURCE
		WHERE [sync_model] = 'INSERT'
	END
	
	
--DETAILS

declare @recordtype_category numeric(19, 0)

select @recordtype_category = id from ADMIN_RECORDTYPE where domain = 'category' and serial_number = '2'

CREATE TABLE #DETAIL(
	[contract_id] [numeric](19, 0) NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[category_id] [numeric](19, 0) NOT NULL,
	[discount] [numeric](19, 4) NOT NULL,
	[special_discount] [numeric](19, 4) NOT NULL,
	[final_discount] [numeric](19, 4) NOT NULL,
	[expiry_date] [datetime] NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[sync_model] nvarchar(6) NULL,
	id numeric(19, 0)
	PRIMARY KEY ([contract_id], [serial_number])
)
INSERT INTO #DETAIL(
  [contract_id]
, [serial_number]
, [category_id]
, [discount]
, [special_discount]
, [final_discount]
, [expiry_date]
, [version]
)
SELECT 
  newcoa.id
, cdoa.[SerialNumber]
, c.id
, case when cdoa.[Discount] > 1 then cdoa.[Discount]/100 else cdoa.[Discount] end
, case when cdoa.[SpecialDiscount] > 1 then cdoa.[SpecialDiscount]/100 else cdoa.[SpecialDiscount] end 
, case when cdoa.[FinalDiscount] > 1 then cdoa.[FinalDiscount]/100 else cdoa.[FinalDiscount] end 
, cdoa.[EndDate]
, 0
FROM [copnew].[dbo].[ContractDetailsOA] cdoa 
with(nolock)
left outer join [copnew].[dbo].[ContractsOA] oldcoa on oldcoa.ContractID = cdoa.[Contract_ContractID]
left outer join B2B_CATEGORY c on c.name = cdoa.[CategoryName] and c.record_type_id = @recordtype_category and c.is_active = 1
left outer join B2B_CONTRACT newcoa on newcoa.serial_number = oldcoa.SerialNumber
where 
  newcoa.id is not null
  and c.id is not null
  and oldcoa.ContractID in (
	select id from #SOURCE
  )
  
  

--COLLECT EXIST DETAIL
CREATE TABLE #DETAIL_EXIST(
	[id] [numeric](19, 0) NOT NULL,
	[contract_id] [numeric](19, 0) NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[category_id] [numeric](19, 0) NOT NULL,
	[discount] [numeric](19, 4) NOT NULL,
	[special_discount] [numeric](19, 4) NOT NULL,
	[final_discount] [numeric](19, 4) NOT NULL,
	[expiry_date] [datetime] NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	PRIMARY KEY CLUSTERED ([id] ASC)
)
INSERT INTO #DETAIL_EXIST(
  [id]
, [contract_id]
, [serial_number]
, [category_id]
, [discount]
, [special_discount]
, [final_discount]
, [expiry_date]
, [version]
)
SELECT 
 cd.[id]
,cd.[contract_id]
,cd.[serial_number]
,cd.[category_id]
,cd.[discount]
,cd.[special_discount]
,cd.[final_discount]
,cd.[expiry_date]
,cd.[version]
FROM [B2B_CONTRACTDETAIL] cd
left outer join B2B_CONTRACT c on c.id = cd.contract_id
WHERE c.serial_number IN(
	SELECT serial_number FROM #SOURCE
)

update new
set 
  sync_model = 'delete'
  , id = old.ID
from #DETAIL new
right outer join #DETAIL_EXIST old on new.contract_id = old.[contract_id] and new.[serial_number] = old.[serial_number]
where new.contract_id is null

if @@rowcount > 0 begin
	delete from B2B_CONTRACTDETAIL
	where id in (
		select id from #DETAIL where sync_model = 'delete'
	)
end

update new
set 
  sync_model = 'Update'
  , id = old.ID
from #DETAIL new
inner join #DETAIL_EXIST old on new.contract_id = old.[contract_id] and new.[serial_number] = old.[serial_number]
where sync_model is null

if @@rowcount > 0 begin
	update old
	set
       [category_id] = new.[category_id]
      ,[discount] = new.[discount]
      ,[special_discount] = new.[special_discount]
      ,[final_discount] = new.[final_discount]
      ,[expiry_date] = new.[expiry_date]
      , date_created = getdate()
	from B2B_CONTRACTDETAIL old
	join #DETAIL new on old.id = new.id
	where new.sync_model = 'Update'
end

update new
set 
  sync_model = 'insert'
from #DETAIL new
left outer join #DETAIL_EXIST old on new.contract_id = old.[contract_id] and new.[serial_number] = old.[serial_number]
where new.sync_model is null

if @@rowcount > 0 begin
	
	INSERT INTO B2B_CONTRACTDETAIL(
	  [contract_id]
	, [serial_number]
	, [category_id]
	, [discount]
	, [special_discount]
	, [final_discount]
	, [expiry_date]
	, [version]
	, date_created
	, last_updated
	)
	SELECT 
	  [contract_id]
	, [serial_number]
	, [category_id]
	, [discount]
	, [special_discount]
	, [final_discount]
	, [expiry_date]
	, [version]
	, getdate()
	, getdate()
	from #DETAIL
	where sync_model = 'insert'
end	
	
	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_CONTRACT
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_CONTRACT
		SET @HAS_ERRORS = 1
	  END
	
	DROP TABLE #SOURCE
	drop table #DETAIL
	drop table #DETAIL_EXIST
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_INDUSTRY_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_INDUSTRY_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)


	set @job_id = newid()
	set @job_name = 'sync_industry'
	--获取需要同步的数据起止时间戳，总行数
	declare
	  @local_timestamp datetime,
	  @begin_timestamp datetime,
	  @end_timestamp datetime,
	  @data_rows numeric(18, 0)

	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name

	SELECT
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].[CMSMR]
	WITH(NOLOCK)
	where CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) >= @local_timestamp
	AND MR001 = '0'
	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)

	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)

	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_INDUSTRY @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output

		UPDATE [SYNCHRONOUS]
		   SET
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end

END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_SALESORDER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-05-11
-- Description:	synchronous	salesOrder
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_SALESORDER]
	-- Add the parameters for the stored procedure here
	  @JOB_ID nvarchar(36)
	, @HAS_ERRORS BIT output
	, @TRANSFERRED_ROWS NUMERIC(18, 0) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN TRANSACTION SYNC_SALESORDER
		WITH MARK N'Synchronous salesorder'
	
	--获取任务信息
	DECLARE @BEGIN_ROW_NUMBER NUMERIC(18, 0), @END_ROW_NUMBER NUMERIC(18, 0), @BATCH_SIZE NUMERIC(18, 0)
	
	SET @BATCH_SIZE = 1000
	
	SELECT 
	  @BEGIN_ROW_NUMBER = DATA_FINISHED + 1, 
	  @END_ROW_NUMBER = CASE
		WHEN DATA_FINISHED + @BATCH_SIZE > DATA_ROWS THEN DATA_ROWS 
		ELSE DATA_FINISHED + @BATCH_SIZE 
	  END
	FROM SYNCHRONOUS
	WHERE
	  JOB_ID = @JOB_ID
 	
 	SELECT @HAS_ERRORS = 0, @TRANSFERRED_ROWS = @END_ROW_NUMBER - @BEGIN_ROW_NUMBER + 1
	
declare @admin_id numeric(19, 0)
select @admin_id = id FROM [SHIRO_USER] where [username] = 'admin'

CREATE TABLE #SOURCE(
	[id] [numeric](19, 0) NOT NULL,
	[record_type_id] [numeric](19, 0) NOT NULL,
	[serial_number] [varchar](20) not NULL,
	[erp_serial_number] [varchar](20) NULL,
	[dealer_id] [numeric](19, 0) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[effective_date] [datetime] NULL,
	[industry_id] [numeric](19, 0) NOT NULL,
	[project] [varchar](20) NULL,
	[account_serial_number] [varchar](40) NULL,
	[sales_man_id] [numeric](19, 0) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[address1] [varchar](144) NULL,
	[address2] [varchar](144) NULL,
	[description] [varchar](500) NULL,
	
	[amount] [numeric](19, 2) NOT NULL,
	[quantity] [numeric](18, 0) NOT NULL,
	[special_amount] [numeric](19, 2) NOT NULL,
	
	[version] [numeric](19, 0) NOT NULL,
	[owner_id] [numeric](19, 0) NOT NULL,
	[created_by_id] [numeric](19, 0) NOT NULL,
	[date_created] [datetime] NOT NULL,
	[last_modified_by_id] [numeric](19, 0) NOT NULL,
	[last_updated] [datetime] NOT NULL,
	
	[sync_model] nvarchar(6) null
	, primary key([id])
);

WITH TMP_SALESORDER AS(
SELECT
  ROW_NUMBER() OVER ( ORDER BY SO.[SalesOrderID] ) AS ROWNUMBER
, SO.[SalesOrderID] as [id]
, RT2.id as [record_type_id]
, SO.[SerialNumber] as [serial_number]
, SO.[ErpSerialNumber] as [erp_serial_number]
, D2.id as [dealer_id]
, SO.[OrderDate] as [order_date]
, SO.[EffiectiveDate] as [effective_date]
, IN2.id as [industry_id]
, LEFT(ISNULL(SO.[Project], ''), 10) as [project]
, LEFT(ISNULL(SO.[AccountSerialNumber], ''), 20)  as [account_serial_number]
, D2.sales_man_id as [sales_man_id]
, LEFT(ISNULL(SO.[Status], ''), 10) as [status]
, LEFT(ISNULL(SO.[address1], ''), 72) as [address1]
, LEFT(ISNULL(SO.[address2], ''), 72) as [address2]
, LEFT(ISNULL(SO.[Description], ''), 500) as [description]

, 0 as [amount]
, 0 as [quantity]
, 0 as [special_amount]

, 0 as [version]
, U2.id as [owner_id]
, @admin_id as [created_by_id]
, SO.[DateCreated] as [date_created]
, @admin_id as [last_modified_by_id]
, SO.[LastUpdated] as [last_updated]

FROM [copnew].[dbo].[SalesOrders] SO
WITH(NOLOCK)
--RECORDTYPE
INNER JOIN [copnew].[dbo].[RecordTypes] RT1 ON RT1.RecordTypeID = SO.[RecordTypeID]
INNER JOIN ADMIN_RECORDTYPE RT2 ON RT2.serial_number = RT1.SerialNumber AND RT2.domain = 'salesOrder'
--DEALER
INNER JOIN [copnew].[dbo].[Dealers] D1 ON D1.DealerID = SO.[DealerID]
INNER JOIN B2B_DEALER D2 ON D1.SerialNumber = D2.serial_number
--INDUSTRY
INNER JOIN [copnew].[dbo].[Industries] IN1 ON IN1.IndustryID = SO.[IndustryID]
INNER JOIN B2B_INDUSTRY IN2 ON IN1.SerialNumber = IN2.serial_number
--OWNER
INNER JOIN [copnew].[dbo].[usermanage] U1 ON U1.userID = SO.[userID]
INNER JOIN SHIRO_USER U2 ON U2.username = U1.username
)

INSERT INTO #SOURCE(
	[id],
	[record_type_id],
	[serial_number],
	[erp_serial_number],
	[dealer_id],
	[order_date],
	[effective_date],
	[industry_id],
	[project],
	[account_serial_number],
	[sales_man_id],
	[status],
	[address1],
	[address2],
	[description],
	
	[amount],
	[quantity],
	[special_amount],
	
	[version],
	[owner_id],
	[created_by_id],
	[date_created],
	[last_modified_by_id],
	[last_updated]
)
SELECT
	[id],
	[record_type_id],
	[serial_number],
	[erp_serial_number],
	[dealer_id],
	[order_date],
	[effective_date],
	[industry_id],
	[project],
	[account_serial_number],
	[sales_man_id],
	[status],
	[address1],
	[address2],
	[description],
	
	[amount],
	[quantity],
	[special_amount],
	
	[version],
	[owner_id],
	[created_by_id],
	[date_created],
	[last_modified_by_id],
	[last_updated]
FROM TMP_SALESORDER
WHERE ROWNUMBER BETWEEN @BEGIN_ROW_NUMBER AND @END_ROW_NUMBER

--TOTAL
CREATE TABLE #TOTAL(
	[id] [numeric](19, 0) NOT NULL,
	[quantity] [numeric](18, 0) NOT NULL,
	[amount] [numeric](19, 2) NOT NULL,
	[special_amount] [numeric](19, 2) NOT NULL
	, primary key([id])
)
INSERT INTO #TOTAL([id], [quantity], [amount], [special_amount])
SELECT 
  [SalesOrder_SalesOrderID]
, SUM(ISNULL([Quantity], 0)) AS [Quantity]
, SUM(ISNULL([Amount], 0)) AS [Amount]
, SUM(ISNULL([SpecialAmount], 0)) AS [SpecialAmount]
FROM [copnew].[dbo].[SalesOrderDetails]
WITH(NOLOCK)
WHERE [SalesOrder_SalesOrderID] IN (
  SELECT [id] FROM #SOURCE
)
GROUP BY
  [SalesOrder_SalesOrderID]
  
UPDATE S SET
	[amount] = T.[amount],
	[quantity] = T.[quantity],
	[special_amount] = T.[special_amount]
FROM #SOURCE S
INNER JOIN #TOTAL T ON S.id = T.id
  
--SET ROW SYNC MODEL
UPDATE #SOURCE 
SET [sync_model] = 'UPDATE'
FROM #SOURCE S
INNER JOIN B2B_SALESORDER T ON T.id = S.id

IF @@ROWCOUNT > 0 BEGIN

	UPDATE T SET
	  [record_type_id] = S.[record_type_id],
	  [serial_number] = S.[serial_number],
	  [erp_serial_number] = S.[erp_serial_number],
	  [dealer_id] = S.[dealer_id],
	  [order_date] = S.[order_date],
	  [effective_date] = S.[effective_date],
	  [industry_id] = S.[industry_id],
	  [project] = S.[project],
	  [account_serial_number] = S.[account_serial_number],
	  [sales_man_id] = S.[sales_man_id],
	  [status] = S.[status],
	  [address1] = S.[address1],
	  [address2] = S.[address2],
	  [description] = S.[description],
	
	  [amount] = S.[amount],
	  [quantity] = S.[quantity],
	  [special_amount] = S.[special_amount],
	
	  [owner_id] = S.[owner_id],
	  [created_by_id] = S.[created_by_id],
	  [date_created] = S.[date_created],
	  [last_modified_by_id] = S.[last_modified_by_id],
	  [last_updated] = S.[last_updated]	  
	FROM B2B_SALESORDER T
	JOIN #SOURCE S ON T.id = S.id
	WHERE S.[sync_model] = 'UPDATE'

END

UPDATE #SOURCE
SET [sync_model] = 'INSERT'
FROM #SOURCE S
WHERE S.[sync_model] IS NULL

IF @@ROWCOUNT > 0 BEGIN
	SET IDENTITY_INSERT B2B_SALESORDER ON
	INSERT INTO B2B_SALESORDER(
	[id],
	[record_type_id],
	[serial_number],
	[erp_serial_number],
	[dealer_id],
	[order_date],
	[effective_date],
	[industry_id],
	[project],
	[account_serial_number],
	[sales_man_id],
	[status],
	[address1],
	[address2],
	[description],
	
	[amount],
	[quantity],
	[special_amount],
	
	[version],
	[owner_id],
	[created_by_id],
	[date_created],
	[last_modified_by_id],
	[last_updated]	
	)
	SELECT
	[id],
	[record_type_id],
	[serial_number],
	[erp_serial_number],
	[dealer_id],
	[order_date],
	[effective_date],
	[industry_id],
	[project],
	[account_serial_number],
	[sales_man_id],
	[status],
	[address1],
	[address2],
	[description],
	
	[amount],
	[quantity],
	[special_amount],
	
	[version],
	[owner_id],
	[created_by_id],
	[date_created],
	[last_modified_by_id],
	[last_updated]	
	FROM #SOURCE
	WHERE [sync_model] = 'INSERT'
	SET IDENTITY_INSERT B2B_SALESORDER OFF
END


--DETAIL
DECLARE @PRODUCT_RECORDTYPE_ID INT

SELECT @PRODUCT_RECORDTYPE_ID = [RecordTypeID] 
FROM [copnew].[dbo].[RecordTypes]
WHERE[Domain] = 'category' AND [SerialNumber] = '5'


CREATE TABLE #DETAIL(
	[id] [numeric](19, 0) NOT NULL,
	[sales_order_id] [numeric](19, 0) NOT NULL,
	[serial_number] [varchar](2) NULL,
	[open_detail] [tinyint] NULL,
	[product_id] [numeric](19, 0) NOT NULL,
	[delivery_limitation] [datetime] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [numeric](19, 6) NOT NULL,
	[final_price] [numeric](19, 6) NOT NULL,
	[discount] [numeric](19, 4) NOT NULL,
	[contract_detail_id] [numeric](19, 0) NULL,
	[special_discount] [numeric](19, 4) NOT NULL,
	[final_discount] [numeric](19, 4) NOT NULL,
	[full_amount] [numeric](19, 2) NOT NULL,
	[amount] [numeric](19, 2) NOT NULL,
	[special_amount] [numeric](19, 2) NOT NULL,
	[final_amount] [numeric](19, 2) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[sync_model] nvarchar(6) null
	PRIMARY KEY CLUSTERED ([id] ASC)
)

INSERT INTO #DETAIL(
	[id],
	[sales_order_id],
	[serial_number],
	[open_detail],
	[product_id],
	[delivery_limitation],
	[quantity],
	[price],
	[final_price],
	[discount],
	[contract_detail_id],
	[special_discount],
	[final_discount],
	[full_amount],
	[amount],
	[special_amount],
	[final_amount],
	[version]
)
SELECT
  SOD.[SalesOrderDetailID]
, SOD.[SalesOrder_SalesOrderID]
, RIGHT('00' + SOD.[SerialNumber], 2) AS [SerialNumber]
, C.opendetail as [open_detail] 
, P2.id as product_id
, SOD.[DeliveryLimitation]
, SOD.[Quantity]
, SOD.[Price]
, SOD.[finalPrice]
, SOD.[Discount]
, CD2.id AS [ContractDetailID]
, SOD.[SpecialDiscount]
, SOD.[FinalDiscount]
, SOD.[fullAmount]
, SOD.[Amount]
, SOD.[SpecialAmount]
, SOD.[FinalAmount]
, 0
FROM [copnew].[dbo].[SalesOrderDetails] SOD
WITH(NOLOCK)
--PRODUCT
INNER JOIN [copnew].[dbo].[Products] P1 ON P1.ProductID = SOD.[ProductID]
INNER JOIN B2B_PRODUCT P2 ON P2.serial_number = P1.SerialNumber
--CATEGORY
INNER JOIN [copnew].[dbo].ProductCategories pc on pc.ProductID = P1.ProductID
INNER JOIN [copnew].[dbo].Categories C ON C.CategoryID = pc.CategoryID AND C.RecordTypeID = @PRODUCT_RECORDTYPE_ID

--CONTRACT
LEFT OUTER JOIN [copnew].[dbo].[ContractDetails] CD1 ON CD1.ContractDetailID = SOD.[ContractDetailID]
LEFT OUTER JOIN [copnew].[dbo].[Contracts] C1 ON C1.ContractID = CD1.Contract_ContractID
LEFT OUTER JOIN B2B_CONTRACT C2 ON C2.serial_number = C1.SerialNumber
LEFT OUTER JOIN B2B_CONTRACTDETAIL CD2 ON CD2.contract_id = C2.id AND CD2.serial_number = CD1.SerialNumber
WHERE
  SOD.[SalesOrder_SalesOrderID] IN (
	SELECT [id] FROM #SOURCE
  )
ORDER BY
  SOD.[SalesOrder_SalesOrderID]
, RIGHT('00' + SOD.[SerialNumber], 2)

--EXIST
CREATE TABLE #DETAIL_EXIST(
	[id] [numeric](19, 0) NOT NULL,
	PRIMARY KEY CLUSTERED ([id] ASC)
)
INSERT INTO #DETAIL_EXIST([id])
SELECT
  [id]
FROM B2B_SALESORDER_DETAIL
WHERE sales_order_id IN(
  SELECT [id] FROM #SOURCE 
)

--find delete
UPDATE D
SET [sync_model] = 'DELETE'
FROM #DETAIL D
RIGHT OUTER JOIN #DETAIL_EXIST E ON D.id = E.id
WHERE D.id IS NULL

IF @@ROWCOUNT > 0 BEGIN
  PRINT 'DELETE'
  DELETE FROM B2B_SALESORDER_DETAIL WHERE id IN (
    SELECT [id] FROM #DETAIL WHERE [sync_model] = 'DELETE'
  )
END
  
UPDATE D
SET [sync_model] = 'UPDATE'
FROM #DETAIL D
INNER JOIN #DETAIL_EXIST E ON D.id = E.id

IF @@ROWCOUNT > 0 BEGIN
  PRINT 'UPDATE'
  UPDATE OLD SET 
	  [serial_number] = NEW.[serial_number]
	, [open_detail] = NEW.[open_detail]
	, [product_id] = NEW.[product_id]
	, [delivery_limitation] = NEW.[delivery_limitation]
	, [quantity] = NEW.[quantity]
	, [price] = NEW.[price]
	, [final_price] = NEW.[final_price]
	, [discount] = NEW.[discount]
	, [contract_detail_id] = NEW.[contract_detail_id]
	, [special_discount] = NEW.[special_discount]
	, [final_discount] = NEW.[final_discount]
	, [full_amount] = NEW.[full_amount]
	, [amount] = NEW.[amount]
	, [special_amount] = NEW.[special_amount]
	, [final_amount] = NEW.[final_amount]
  FROM B2B_SALESORDER_DETAIL OLD
  INNER JOIN #DETAIL NEW ON OLD.id = NEW.id
  WHERE NEW.[sync_model] = 'UPDATE'
END

UPDATE D
SET [sync_model] = 'INSERT'
FROM #DETAIL D
LEFT OUTER JOIN #DETAIL_EXIST E ON D.id = E.id
WHERE E.id IS NULL

IF @@ROWCOUNT > 0 BEGIN
  PRINT 'INSERT'
  SET IDENTITY_INSERT B2B_SALESORDER_DETAIL ON
  INSERT INTO B2B_SALESORDER_DETAIL(
	[id],
	[sales_order_id],
	[serial_number],
	[open_detail],
	[product_id],
	[delivery_limitation],
	delivery_cycle,
	[quantity],
	[price],
	is_allow_zero_price,
	[final_price],
	[discount],
	[contract_detail_id],
	[special_discount],
	is_allow_special_discount,
	[final_discount],
	[full_amount],
	[amount],
	[special_amount],
	[final_amount],
	[version]
  )
  SELECT
	[id],
	[sales_order_id],
	[serial_number],
	[open_detail],
	[product_id],
	[delivery_limitation],
	0,
	[quantity],
	[price],
	0,
	[final_price],
	[discount],
	[contract_detail_id],
	[special_discount],
	0,
	[final_discount],
	[full_amount],
	[amount],
	[special_amount],
	[final_amount],
	[version]
  FROM #DETAIL  
  WHERE [sync_model] = 'INSERT'
  SET IDENTITY_INSERT B2B_SALESORDER_DETAIL OFF
END




--DETAIL_DETAIL
CREATE TABLE #DETAIL_DETAIL(
	[id] [numeric](19, 0) NOT NULL,
	[sales_order_detail_id] [numeric](19, 0) NOT NULL,
	[serial_number] [varchar](2) NOT NULL,
	[product_id] [numeric](19, 0) NOT NULL,
	[quantity] [numeric](19, 3) NOT NULL,
	[price] [numeric](19, 6) NOT NULL,
	[discount] [numeric](19, 4) NOT NULL,
	[special_discount] [numeric](19, 4) NOT NULL,
	[final_discount] [numeric](19, 4) NOT NULL,
	[final_price] [numeric](19, 6) NOT NULL,
	[amount] [numeric](19, 2) NOT NULL,
	[contract_detail_id] [numeric](19, 0) NULL,
	[full_amount] [numeric](19, 2) NOT NULL,
	[special_amount] [numeric](19, 2) NOT NULL,
	[final_amount] [numeric](19, 2) NOT NULL,
	[version] [numeric](19, 0) NOT NULL,
	[sync_model] nvarchar(6) null,
	PRIMARY KEY CLUSTERED ([id] ASC)
)

INSERT INTO #DETAIL_DETAIL(
	[id],
	[sales_order_detail_id],
	[serial_number],
	[product_id],
	[quantity],
	[price],
	[discount],
	[special_discount],
	[final_discount],
	[final_price],
	[amount],
	[contract_detail_id],
	[full_amount],
	[special_amount],
	[final_amount],
	[version]
)
SELECT 
  SODD.[ID]
, SODD.[SalesOrderDetail]
, RIGHT('00' + CONVERT(NVARCHAR(2), SODD.[serialNumber] + 1), 2) AS [SerialNumber]
, P2.id
, SODD.[quantity]
, SODD.[price]
, SODD.[discount]
, SODD.[specialDiscount]
, SODD.[finalDiscount]
, SODD.[finalPrice]
, SODD.[amount]
, CD2.id
, SODD.[fullAmount]
, SODD.[specialAmount]
, SODD.[finalAmount]
, 0
FROM [copnew].[dbo].[SalesOrderDetailDetail] SODD
WITH(NOLOCK)
--PRODUCT
INNER JOIN [copnew].[dbo].[Products] P1 ON P1.ProductID = SODD.product
INNER JOIN B2B_PRODUCT P2 ON P1.SerialNumber = P2.serial_number
--CONTRACT
LEFT OUTER JOIN B2B_CONTRACT C2 ON 
  --C2.serial_number IS NOT NULL AND
  C2.serial_number = CASE RTRIM(ISNULL(SODD.[ContractDetailNO], '')) 
	WHEN '' THEN NULL
	ELSE LEFT(SODD.[ContractDetailNO], CHARINDEX('|', SODD.[ContractDetailNO]) - 1)
  END
LEFT OUTER JOIN B2B_CONTRACTDETAIL CD2 ON 
  CD2.contract_id = C2.id
  AND CD2.serial_number = CASE RTRIM(ISNULL(SODD.[ContractDetailNO], '')) 
	WHEN '' THEN NULL
	ELSE RIGHT(SODD.[ContractDetailNO], LEN(SODD.[ContractDetailNO]) - CHARINDEX('|', SODD.[ContractDetailNO]))
  END
  --AND C2.serial_number IS NOT NULL
WHERE
  SODD.[SalesOrderDetail] IN (
	SELECT [id] FROM #DETAIL
  )
ORDER BY
  SODD.[SalesOrderDetail]
, RIGHT('00' + CONVERT(NVARCHAR(2), SODD.[serialNumber] + 1), 2)

--EXIST
CREATE TABLE #DETAIL_DETAIL_EXIST(
	[id] [numeric](19, 0) NOT NULL,
	PRIMARY KEY CLUSTERED ([id] ASC)
)
INSERT INTO #DETAIL_DETAIL_EXIST([id])
SELECT
  [id]
FROM B2B_SALESORDER_DETAIL_DETAIL
WHERE sales_order_detail_id IN(
  SELECT [id] FROM #DETAIL
)

--find delete
UPDATE D
SET [sync_model] = 'DELETE'
FROM #DETAIL_DETAIL D
RIGHT OUTER JOIN #DETAIL_DETAIL_EXIST E ON D.id = E.id
WHERE D.id IS NULL

IF @@ROWCOUNT > 0 BEGIN
  PRINT 'DELETE'
  DELETE FROM B2B_SALESORDER_DETAIL_DETAIL WHERE id IN (
    SELECT [id] FROM #DETAIL_DETAIL WHERE [sync_model] = 'DELETE'
  )
END
  
UPDATE D
SET [sync_model] = 'UPDATE'
FROM #DETAIL_DETAIL D
INNER JOIN #DETAIL_DETAIL_EXIST E ON D.id = E.id

IF @@ROWCOUNT > 0 BEGIN
  PRINT 'UPDATE'
  UPDATE OLD SET 
	[serial_number] = NEW.[serial_number],
	[product_id] = NEW.[product_id],
	[quantity] = NEW.[quantity],
	[price] = NEW.[price],
	[discount] = NEW.[discount],
	[special_discount] = NEW.[special_discount],
	[final_discount] = NEW.[final_discount],
	[final_price] = NEW.[final_price],
	[amount] = NEW.[amount],
	[contract_detail_id] = NEW.[contract_detail_id],
	[full_amount] = NEW.[full_amount],
	[special_amount] = NEW.[special_amount],
	[final_amount] = NEW.[final_amount]
  FROM B2B_SALESORDER_DETAIL_DETAIL OLD
  INNER JOIN #DETAIL_DETAIL NEW ON OLD.id = NEW.id
  WHERE NEW.[sync_model] = 'UPDATE'
END

UPDATE D
SET [sync_model] = 'INSERT'
FROM #DETAIL_DETAIL D
LEFT OUTER JOIN #DETAIL_DETAIL_EXIST E ON D.id = E.id
WHERE E.id IS NULL

IF @@ROWCOUNT > 0 BEGIN
  PRINT 'INSERT'
  SET IDENTITY_INSERT B2B_SALESORDER_DETAIL_DETAIL ON
  INSERT INTO B2B_SALESORDER_DETAIL_DETAIL(
	[id],
	[sales_order_detail_id],
	[serial_number],
	[product_id],
	[quantity],
	dosage,
	quota,
	[price],
	is_allow_zero_price,
	[discount],
	[special_discount],
	is_allow_special_discount,
	[final_discount],
	[final_price],
	[amount],
	[contract_detail_id],
	[full_amount],
	[special_amount],
	[final_amount],
	[version]
  )
  SELECT
	[id],
	[sales_order_detail_id],
	[serial_number],
	[product_id],
	[quantity],
	0,
	0,
	[price],
	0,
	[discount],
	[special_discount],
	0,
	[final_discount],
	[final_price],
	[amount],
	[contract_detail_id],
	[full_amount],
	[special_amount],
	[final_amount],
	[version]
  FROM #DETAIL_DETAIL  
  WHERE [sync_model] = 'INSERT'
  SET IDENTITY_INSERT B2B_SALESORDER_DETAIL_DETAIL OFF
END




	IF @@ERROR = 0
	  BEGIN
		COMMIT TRANSACTION SYNC_SALESORDER
		SET @HAS_ERRORS = 0
	  END
	ELSE
	  BEGIN
		ROLLBACK TRANSACTION SYNC_SALESORDER
		SET @HAS_ERRORS = 1
	  END
	
DROP TABLE #SOURCE
DROP TABLE #DETAIL
DROP TABLE #DETAIL_EXIST

DROP TABLE #DETAIL_DETAIL
DROP TABLE #DETAIL_DETAIL_EXIST

DROP TABLE #TOTAL


END
GO
/****** Object:  UserDefinedFunction [dbo].[SHARE_USER_LIST]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-18
-- Description:	获取用户组
-- =============================================
CREATE FUNCTION [dbo].[SHARE_USER_LIST] 
(	
	-- Add the parameters for the function here
	@FINTUSERID NUMERIC(19, 0)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		
SELECT
  SR.[user_id] 
FROM SHIRO_USER U
WITH(NOLOCK)
LEFT OUTER JOIN [ADMIN_SHAREROLE] SR ON SR.group_id = U.group_id
WHERE
  U.id = @FINTUSERID
  AND SR.[domain] = 'salesOrder'
  AND SR.[readable] = 1  
GROUP BY
  SR.[user_id]

UNION 

SELECT
  U.id
FROM SHIRO_USER U
WITH(NOLOCK)
WHERE
  U.id = @FINTUSERID	

)
GO
/****** Object:  UserDefinedFunction [dbo].[DEALER_LIST]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-18
-- Description:	获取用户组
-- =============================================
CREATE FUNCTION [dbo].[DEALER_LIST] 
(	
	-- Add the parameters for the function here
	@FINTUSERID NUMERIC(19, 0)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		
	SELECT
	  '' as serial_number
	, '全部' as name
	
	union 
			
	SELECT
	  D.serial_number as serial_number
	, D.serial_number + '-' + D.name as name
	FROM SHIRO_USER U
	WITH(NOLOCK)
	INNER JOIN [ADMIN_SHAREROLE] SR ON SR.group_id = U.group_id
	INNER JOIN B2B_DEALER D ON D.owner_id = SR.[user_id]
	WHERE
	  U.id = @FINTUSERID
	  AND SR.[domain] = 'salesOrder'
	  AND SR.[readable] = 1  
	GROUP BY
	  D.serial_number
	, D.name

	UNION

	SELECT
	  D.serial_number as serial_number
	, D.serial_number + '-' + D.name as name
	FROM SHIRO_USER U
	WITH(NOLOCK)
	INNER JOIN B2B_DEALER D ON D.owner_id = U.id
	WHERE
	  U.id = @FINTUSERID
)
GO
/****** Object:  StoredProcedure [dbo].[SYNC_STAFF_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_STAFF_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_staff'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].CMSMV MV
	WITH(NOLOCK)
	INNER JOIN B2B_DEPARTMENT DEPT ON DEPT.serial_number = MV.MV004 collate Chinese_PRC_CI_AS
	where CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) >= @local_timestamp
	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_STAFF @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_DEALER_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_DEALER_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_dealer'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].COPMA AS MA
	WITH(NOLOCK)
	INNER JOIN B2B_DEPARTMENT DEPT ON DEPT.serial_number = MA.MA015 collate Chinese_PRC_CI_AS
	INNER JOIN B2B_STAFF STAFF ON STAFF.serial_number = MA.MA016 collate Chinese_PRC_CI_AS
	where CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) >= @local_timestamp
	--AND DEPT.id IS NOT NULL
	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE SYNC_DEALER @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_CONTRACT_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-02
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_CONTRACT_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_CONTRACT'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(coa.[DateCreated])
	, @begin_timestamp = MIN(coa.[LastUpdated])
	FROM [copnew].[dbo].[ContractsOA] coa
	with(nolock)
	left outer join B2B_DEALER dealer on dealer.serial_number = coa.[DealerName]
	left outer join B2B_INDUSTRY ind on ind.short_name = coa.[IndustryID]
	where
	  dealer.id is not null
	  and ind.id is not null
	  and ContractID in (
		SELECT max(ContractID) 
		FROM [copnew].[dbo].[ContractsOA] 
		group by [SerialNumber] --having count(*) > 1 
		)

	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_CONTRACT @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_SALESORDER_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-05-15
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_SALESORDER_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_salesorder'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name ;
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(SO.[LastUpdated])
	, @begin_timestamp = MIN(SO.[LastUpdated])
	FROM [copnew].[dbo].[SalesOrders] SO
	WITH(NOLOCK)
	--RECORDTYPE
	INNER JOIN [copnew].[dbo].[RecordTypes] RT1 ON RT1.RecordTypeID = SO.[RecordTypeID]
	INNER JOIN ADMIN_RECORDTYPE RT2 ON RT2.serial_number = RT1.SerialNumber AND RT2.domain = 'salesOrder'
	--DEALER
	INNER JOIN [copnew].[dbo].[Dealers] D1 ON D1.DealerID = SO.[DealerID]
	INNER JOIN B2B_DEALER D2 ON D1.SerialNumber = D2.serial_number
	--INDUSTRY
	INNER JOIN [copnew].[dbo].[Industries] IN1 ON IN1.IndustryID = SO.[IndustryID]
	INNER JOIN B2B_INDUSTRY IN2 ON IN1.SerialNumber = IN2.serial_number
	--OWNER
	INNER JOIN [copnew].[dbo].[usermanage] U1 ON U1.userID = SO.[userID]
	INNER JOIN SHIRO_USER U2 ON U2.username = U1.username
	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_SALESORDER @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_BOM_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_BOM_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_BOM'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MC.MODI_DATE WHEN '' THEN MC.CREATE_DATE ELSE MC.MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE MC.MODI_DATE WHEN '' THEN MC.CREATE_DATE ELSE MC.MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].BOMMC MC
	WITH (NOLOCK)
	INNER JOIN [192.168.1.8].[Leader].[dbo].INVMB MB on MB.MB001 = MC.MC001
	INNER JOIN B2B_PRODUCT AS P ON P.serial_number = MB.MB001  collate   Chinese_PRC_CI_AS
	--属性
	INNER JOIN [192.168.1.8].[Leader].[dbo].INVMA MA5 ON MA5.MA002 = MB.MB200 AND MA5.MA001 = '5'
	WHERE 
	  MB.MB109 = 'Y'
	AND MB.MB005 = '04'
	AND MA5.MA201 = 'Y'
	AND CAST (dbo.STRING_TO_DATE(CASE MC.MODI_DATE WHEN '' THEN MC.CREATE_DATE ELSE MC.MODI_DATE END) AS DATETIME)>= @local_timestamp

	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_BOM @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_CATEGORY_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-02
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_CATEGORY_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_category'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].[INVMA] MA
	WITH(NOLOCK)
	where CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) >= @local_timestamp

	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_CATEGORY @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_PRODUCT_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_PRODUCT_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_product'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE RTRIM(ISNULL(MODI_DATE, '')) WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].[INVMB] MB
	WITH(NOLOCK)
	where CAST (dbo.STRING_TO_DATE(CASE RTRIM(ISNULL(MODI_DATE, '')) WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) >= @local_timestamp

	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE dbo.SYNC_PRODUCT @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SYNC_DEPARTMENT_TRIGGER]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2012-03-06
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[SYNC_DEPARTMENT_TRIGGER]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	--生成任务ID
	declare @job_id nvarchar(36), @job_name nvarchar(100)
	
	
	set @job_id = newid()
	set @job_name = 'sync_department'
	--获取需要同步的数据起止时间戳，总行数
	declare 
	  @local_timestamp datetime,
	  @begin_timestamp datetime, 
	  @end_timestamp datetime, 
	  @data_rows numeric(18, 0)
	  
	select @local_timestamp = isnull(max(end_timestamp), cast('1970-01-01 00:00:00' as datetime)) from dbo.SYNCHRONOUS with(nolock) where job_name = @job_name 
	
	SELECT 
	  @data_rows = COUNT(*)
	, @end_timestamp = MAX(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	, @begin_timestamp = MIN(CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME))
	FROM [192.168.1.8].[Leader].[dbo].[CMSME]
	WITH(NOLOCK)
	where CAST (dbo.STRING_TO_DATE(CASE MODI_DATE WHEN '' THEN CREATE_DATE ELSE MODI_DATE END) AS DATETIME) >= @local_timestamp
	AND (ME001 between '3200' and '3900' or ME001 = '3002')
	--初始化任务
	INSERT INTO [SYNCHRONOUS]([job_id],[job_name],[begin_time],[end_time],[error_times],[error_limited],[begin_timestamp], [end_timestamp], [data_rows],[data_finished],[data_surplus],[execute_times],[finished])
	VALUES(
	  @job_id
	, @job_name
	, getdate()
	, getdate()
	, 0
	, 3
	, @begin_timestamp
	, @end_timestamp
	, @data_rows
	, 0
	, @data_rows
	, 0
	, 0)
	
	DECLARE @HAS_ERRORS BIT, @TRANSFERRED_ROWS NUMERIC(18, 0)
	
	while (SELECT data_surplus FROM dbo.SYNCHRONOUS where job_id = @job_id AND [error_times] < [error_limited] ) > 0
	begin
		EXECUTE SYNC_DEPARTMENT @job_id, @HAS_ERRORS output, @TRANSFERRED_ROWS output
		
		UPDATE [SYNCHRONOUS]
		   SET 
			   [end_time] = getdate()
			  ,[error_times] = [error_times] + isnull(@HAS_ERRORS, 0)
			  ,[data_finished] = [data_finished] + isnull(@TRANSFERRED_ROWS, 0)
			  ,[data_surplus] = [data_surplus] - isnull(@TRANSFERRED_ROWS, 0)
			  ,[execute_times] = [execute_times] + 1
			  ,[finished] = case [data_surplus] - isnull(@TRANSFERRED_ROWS, 0) when 0 then 1 else 0 end
		 WHERE [job_id] = @job_id
	end 
	
END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R01]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-14
-- Description:	经销商订单查询
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_R01]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(
		SELECT
		  ROW_NUMBER() OVER ( ORDER BY TC.TC001, TC.TC002 ) AS ROWNUMBER
		, TC.TC004 AS F001-- '经销商编号'
		, MA.MA002 AS F002--'经销商名称'
		, MR.MR003 AS F003--'所属区域'
		, ME.ME002 AS F004--'所属办事处'
		, TC.TC001 + '-' + TC.TC002	AS F005--'订单编号'
		, TC.TC003 AS F006--'订货日期'
		, TC.TC031 AS F007--'总数量'
		, TC.TC201 AS F008--'订单金额'
		, TC.TC029 + TC.TC030 AS F009--'下浮后金额'
		FROM [192.168.1.8].[Leader].[dbo].[COPTC] TC
		WITH(NOLOCK)
		LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TC.TC004 = MA.MA001
		LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
		LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
		WHERE TC.TC003 BETWEEN @FDTMBEGIN AND @FDTMEND 
		  AND TC.TC027 = 'Y'
		  AND TC.TC004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
		  AND RTRIM(TC.TC004) LIKE @FCHRDEALERSERIALNUMBER
		  AND TC.TC001 + '-' + rtrim(TC.TC002) LIKE @FCHRSERIALNUMBER
	)
	
	SELECT
	  F001-- '经销商编号'
	, F002--'经销商名称'
	, F003--'所属区域'
	, F004--'所属办事处'
	, F005--'订单编号'
	, F006--'订货日期'
	, F007--'总数量'
	, F008--'订单金额'
	, F009--'下浮后金额'
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F005

END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R05]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-14
-- Description:	货运查询
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R05]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY TG.TG001, TG.TG002 ) AS ROWNUMBER
	, MA.MA002 AS F001--'经销商名称'
	, MR.MR003 AS F002--'所属区域'
	, ME.ME002 AS F003--'所属办事处'
	--ERP系统中不存在	储运号
	--	货票号
	, TG.TG001 + '-' + TG.TG002 AS F004--'发货单号'
	, CASE TG.TG214
		WHEN '1' THEN '空运'
		WHEN '2' THEN '海运'
		WHEN '3' THEN '海空联运'
		WHEN '4' THEN '邮寄'
		WHEN '5' THEN '陆运'
		WHEN '6' THEN '自取'
		WHEN '7' THEN '自送'
		WHEN '8' THEN '快递'
		ELSE '未知'
	  END AS F005--运输方式
	, TG.TG216 AS F006 --单号
	, MA2.MA002 AS F007 --运输公司
	, CONVERT(CHAR(10),CAST(TG.TG003 AS DATETIME),23) AS F008--发货日期
	, TG.TG217 AS F009--备注

	
	FROM [192.168.1.8].[Leader].[dbo].[COPTG] TG
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TG.TG004 = MA.MA001    
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[PURMA] MA2 ON MA2.MA001 = TG.TG215
	WHERE 
	  TG.TG003 BETWEEN @FDTMBEGIN AND @FDTMEND 
	  AND TG.TG023= 'Y' 
	  AND TG.TG004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TG.TG004) LIKE @FCHRDEALERSERIALNUMBER
	  AND TG.TG001 + '-' + rtrim(TG.TG002) LIKE @FCHRSERIALNUMBER
	)
	
	SELECT
	  F001--'经销商名称'
	, F002--'所属区域'
	, F003--'所属办事处'
	--ERP系统中不存在	储运号
	--	货票号
	, F004--'发货单号'
	, F005--运输方式
	, F006 --单号
	, F007 --运输公司
	, F008--发货日期
	, F009--备注
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F004
END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R06]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2010-10-14
-- Description:	发票查询
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R06]
	-- Add the parameters for the stored procedure here
		  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY TA.TA015 ) AS ROWNUMBER
	, MA.MA002 AS F001--'经销商名称'
	, MR.MR003 AS F002--'所属区域'
	, ME.ME002 AS F003--'所属办事处'
	, TA.TA011 AS F004--'发票种类'
	, TA.TA015 AS F005--'发票号码'
	, TA.TA016 AS F006--'发票日期'
	, TA.TA017 + TA.TA018 AS F007--'发票金额'
	, TA.TA021 AS F008--'预计兑现日'
	, TA.TA027 AS F009--'结束码'
	FROM [192.168.1.8].[Leader].[dbo].[ACRTA] TA
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TA.TA004= MA.MA001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
	WHERE 
	  TA.TA003 BETWEEN @FDTMBEGIN AND @FDTMEND
	  AND TA.TA025= 'Y' 
	  AND TA.TA004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TA.TA004) LIKE @FCHRDEALERSERIALNUMBER
	  AND rtrim(TA.TA015) LIKE @FCHRSERIALNUMBER
	)
	
	SELECT
	  F001--'经销商名称'
	, F002--'所属区域'
	, F003--'所属办事处'
	, F004--'发票种类'
	, F005--'发票号码'
	, F006--'发票日期'
	, F007--'发票金额'
	, F008--'预计兑现日'
	, F009--'结束码'
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F005

END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R07]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-14
-- Description:	
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R07]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY TJ.TJ001, TJ.TJ002 ) AS ROWNUMBER
	, TI.TI004 AS F001--'经销商编号'
	, MA.MA002 AS F002--'经销商名称'
	, MR.MR003 AS F003--'所属区域'
	, ME.ME002 AS F004--'所属办事处'
	, TJ.TJ001 + '-' + TJ.TJ002 + '-' + TJ.TJ003 AS F005--'退货单编号'
	, TI.TI034 AS F006--'日期'
	--ERP系统中无法体现	是否处理
	, TJ.UDF03 AS F007--'处理方法'
	--在ERP中无法体现，但进入ERP系统的销退单都是公司确认好的单子	经销商意见办事处意见
	, TI.TI034 AS F008--'提货日期'
	, TJ.TJ007 AS F009--'提货件数'
	, TJ.UDF01 AS F010--'退货情况描述'
	, TJ.UDF02 AS F011--'检验完成'
	, TJ.TJ004 AS F012--'品号'
	, TJ.TJ005 AS F013--'品名'
	, TJ.TJ006 AS F014--'规格'
	, TJ.TJ015 + '-' + TJ.TJ016 + '-' + TJ.TJ017 AS F015--'销货单号'
	--ERP系统中无法体现	商务处理
	FROM [192.168.1.8].[Leader].[dbo].[COPTJ] TJ
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPTI] TI ON TI.TI001 = TJ.TJ001 AND TI.TI002 = TJ.TJ002
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TI.TI004 = MA.MA001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
	
	WHERE 
	  TI.TI003 BETWEEN @FDTMBEGIN AND @FDTMEND
	  AND TJ.TJ021 = 'Y' 
	  AND TI.TI004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TI.TI004) LIKE @FCHRDEALERSERIALNUMBER
	  AND TJ.TJ001 + '-' + rtrim(TJ.TJ002) LIKE @FCHRSERIALNUMBER
	)
	
	SELECT
	  F001--'经销商编号'
	, F002--'经销商名称'
	, F003--'所属区域'
	, F004--'所属办事处'
	, F005--'退货单编号'
	, F006--'日期'
	--ERP系统中无法体现	是否处理
	, F007--'处理方法'
	--在ERP中无法体现，但进入ERP系统的销退单都是公司确认好的单子	经销商意见办事处意见
	, F008--'提货日期'
	, F009--'提货件数'
	, F010--'退货情况描述'
	, F011--'检验完成'
	, F012--'品号'
	, F013--'品名'
	, F014--'规格'
	, F015--'销货单号'
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F005
END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R02]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-14
-- Description:	经销商订单明细查询
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_R02]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY TC.TC001, TC.TC002 ) AS ROWNUMBER
    , TC.TC004 AS F001--'经销商编号'
	, MA.MA002 AS F002--'经销商名称'
	, MR.MR003 AS F003--'所属区域'
	, ME.ME002 AS F004--'所属办事处'
	, TD.TD001 + '-' + TD.TD002 + '-'+ TD.TD003 AS F005--'订单编号'
	, TD.TD004 AS F006--'产品编号'
	, TD.TD005 AS F007--'产品名称'
	, TD.TD006 AS F008--'产品规格'
	, TD.TD010 AS F009--'单位'
	, TD.TD008 AS F010--'订单数量'
	, TD.TD013 AS F011--'预交货日'
	, TD.TD009 AS F012--'已发数'
	, TD.TD008 - TD.TD009 AS F013--'未发数'
	, TD.TD200 AS F014--'最终单价'
	, TD.TD201 AS F015--'订单金额'
	, TD.TD202 AS F016--'下浮点'
	, TD.TD012 AS F017--'下浮后金额'
    FROM [192.168.1.8].[Leader].[dbo].[COPTD] AS TD
    WITH(NOLOCK)
    LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPTC] AS TC ON TC.TC001 = TD.TD001 AND TC.TC002 = TD.TD002
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TC.TC004 = MA.MA001    
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
	WHERE 
	  TC.TC003 BETWEEN @FDTMBEGIN AND @FDTMEND
 	  AND TC.TC027 = 'Y'
 	  AND TC.TC004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TC.TC004) LIKE @FCHRDEALERSERIALNUMBER
	  AND TC.TC001 + '-' + rtrim(TC.TC002) LIKE @FCHRSERIALNUMBER
	)

	SELECT
      F001--'经销商编号'
	, F002--'经销商名称'
	, F003--'所属区域'
	, F004--'所属办事处'
	, F005--'订单编号'
	, F006--'产品编号'
	, F007--'产品名称'
	, F008--'产品规格'
	, F009--'单位'
	, F010--'订单数量'
	, F011--'预交货日'
	, F012--'已发数'
	, F013--'未发数'
	, F014--'最终单价'
	, F015--'订单金额'
	, F016--'下浮点'
	, F017--'下浮后金额'
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F005

END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R03]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-14
-- Description:	销货单查询
-- =============================================
CREATE PROCEDURE [dbo].[REPORT_R03]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(
    SELECT
      ROW_NUMBER() OVER ( ORDER BY TG.TG001, TG.TG002 ) AS ROWNUMBER
	, TG.TG004 AS F001--'经销商编号'
	, MA.MA002 AS F002--'经销商名称'
	, MR.MR003 AS F003--'所属区域'
	, ME.ME002 AS F004--'所属办事处'
	--, 只在单身中，需编写SQL语句抓出	原始订单号
	, TG.TG001 + '-' + TG.TG002 AS F005--'销货单号'
	, TG.TG003 AS F006--'发货单日期'
	--, ERP系统中不存在	仓库备货日期
	--,	货运日期
	--,	运输公司
	--,	运输方式
	, TG.TG033 AS F007--'总数量'
	, TG.TG013 - TG.TG025 AS F008--'销货金额'
	
	, CONVERT(CHAR(10),CAST(TG.TG003 AS DATETIME),23) AS F009--''发货日期''
	, CASE TG.TG214
		WHEN '1' THEN '空运'
		WHEN '2' THEN '海运'
		WHEN '3' THEN '海空联运'
		WHEN '4' THEN '邮寄'
		WHEN '5' THEN '陆运'
		WHEN '6' THEN '自取'
		WHEN '7' THEN '自送'
		WHEN '8' THEN '快递'
		ELSE '未知'
	  END AS F010--运输方式
	, TG.TG216 AS F011 --单号
	, MA2.MA002 AS F012 --运输公司
	, TG.TG217 AS F013--备注
	FROM [192.168.1.8].[Leader].[dbo].[COPTG] TG
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TG.TG004 = MA.MA001    
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[PURMA] MA2 ON MA2.MA001 = TG.TG215
	WHERE 
	  TG.TG003 BETWEEN @FDTMBEGIN AND @FDTMEND
	  AND TG.TG023 = 'Y' 
	  AND TG.TG004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TG.TG004) LIKE @FCHRDEALERSERIALNUMBER
	  AND TG.TG001 + '-' + rtrim(TG.TG002) LIKE @FCHRSERIALNUMBER
	)
	SELECT
	  F001--'经销商编号'
	, F002--'经销商名称'
	, F003--'所属区域'
	, F004--'所属办事处'
	, F005--'销货单号'
	, F006--'发货单日期'
	, F007--'总数量'
	, F008--'销货金额'
	, F009--''发货日期''
	, F010--运输方式
	, F011 --单号
	, F012 --运输公司
	, F013--备注
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F005
	
END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R04]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-10-14
-- Description:	销货单明细查询
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R04]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FCHRSERIALNUMBER NVARCHAR(32)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'
	  
	IF @FCHRSERIALNUMBER = ''
	  SET @FCHRSERIALNUMBER = '%'
	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY TH.TH001, TH.TH002 ) AS ROWNUMBER
	, TG.TG004 AS F001--'经销商编号'
	, MA.MA002 AS F002--'经销商名称'
	, MR.MR003 AS F003--'所属区域'
	, ME.ME002 AS F004--'所属办事处'
	, TH.TH014 + '-' + TH.TH015 + '-' + TH.TH016 AS F005--'订单编号'
	, TH.TH001 + '-' + TH.TH002 + '-' + TH.TH003 AS F006--'销货单号'
	, TH.TH004 AS F007--'产品编号'
	, TH.TH005 AS F008--'产品名称'
	, TH.TH006 AS F009--'产品规格'
	, TH.TH009 AS F010--'单位'
	, TH.TH008 AS F011--'数量'
	, TH.TH200 AS F012--'最终单价'
	, TH.TH202 AS F013--'下浮点'
	, TH.TH201 AS F014--'金额'
	, TH.TH013 AS F015--'下浮后金额'
	FROM [192.168.1.8].[Leader].[dbo].[COPTH] TH
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPTG] TG ON TG.TG001 = TH.TH001 AND TG.TG002 = TH.TH002
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON TG.TG004 = MA.MA001    
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSME] ME ON MA.MA015 = ME.ME001
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[CMSMR] MR ON MR.MR002 = MA.MA018 AND MR.MR001 = '3'
	WHERE 
	  TG.TG003 BETWEEN @FDTMBEGIN AND @FDTMEND
	  AND TG.TG023 = 'Y' 
	  AND  TG.TG004 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TG.TG004) LIKE @FCHRDEALERSERIALNUMBER
	  AND TH.TH001 + '-' + rtrim(TH.TH002) LIKE @FCHRSERIALNUMBER
	)

	SELECT
	  F001--'经销商编号'
	, F002--'经销商名称'
	, F003--'所属区域'
	, F004--'所属办事处'
	, F005--'订单编号'
	, F006--'销货单号'
	, F007--'产品编号'
	, F008--'产品名称'
	, F009--'产品规格'
	, F010--'单位'
	, F011--'数量'
	, F012--'最终单价'
	, F013--'下浮点'
	, F014--'金额'
	, F015--'下浮后金额'
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F006

END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R09]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-01-11
-- Description:	回款查询
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R09]
	-- Add the parameters for the stored procedure here
	  @FDTMBEGIN NVARCHAR(10)
	, @FDTMEND NVARCHAR(10)
	, @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FINTMAXROWS NUMERIC(19, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	SET @FDTMBEGIN = REPLACE(@FDTMBEGIN, '-', '')
	SET @FDTMEND = REPLACE(@FDTMEND, '-', '')
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'

	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	  
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY 
		CASE WHEN RTRIM(ISNULL(TB.TB009, '')) = '' AND (TB.TB005 = '112202' OR TB.TB005 = '112203') THEN '1700' ELSE TB.TB009 END
		, TA.TA003 
	  ) AS ROWNUMBER
	, CONVERT(CHAR(10),CAST(TA.TA003 AS DATETIME),23) AS F001
	, CASE WHEN RTRIM(ISNULL(TB.TB009, '')) = '' AND (TB.TB005 = '112202' OR TB.TB005 = '112203') THEN '1700' ELSE TB.TB009 END AS F002
	, TB.TB018 AS F003
	, TB.TB008 AS F004
	, TB.TB017 AS F005
	, TB.TB010 AS F006
	, CASE WHEN TB.TB004 < 0 THEN TB.TB007 ELSE NULL END AS F007
	, CASE WHEN TB.TB004 < 0 THEN TB.TB015 ELSE NULL END AS F008
	, TB.TB013 AS F009
	, TB.TB001 + '-' + TB.TB002 + '-' + TB.TB003 AS F010
	FROM  [192.168.1.8].[Leader].[dbo].[ACTTB] AS TB
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[ACTTA] TA ON TB.TB001 = TA.TA001 AND TB.TB002 = TA.TA002
	WHERE 
	  TA.TA003 BETWEEN @FDTMBEGIN AND @FDTMEND
	  AND TA.TA010 = 'Y'
	  AND TB.TB005 LIKE '1122%'
	  AND TB.TB010 NOT LIKE '%坏%'
	  AND TB.TB008 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(TB.TB008) LIKE @FCHRDEALERSERIALNUMBER
	)
  	
	--明细
	SELECT 
	  T1.F001 AS R001--凭证日期
	, T1.F002 AS R002--部门编号
	, C10.Name AS R003--部门名称
	, T1.F004 AS R004--客户编号
	, T1.F005 AS R005--客户名称
	, T1.F006 AS R006--摘要
	, T1.F007 AS R007--本币回款金额
	, T1.F008 AS R008--原币回款金额
	, T1.F009 AS R009--币种
	, T1.F010 AS R010--会计凭证单号
	FROM [192.168.1.99].[NaderBI].[dbo].[S_C010] AS C10
	WITH(NOLOCK)
	LEFT OUTER JOIN TMP AS T1 ON C10.Id = T1.F002 COLLATE Chinese_PRC_BIN
	WHERE 
	  T1.F007 <> 0 
	  AND T1.F007 IS NOT NULL 
	  AND C10.[Level] = 2
	  AND ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  T1.F002
	, T1.F001
END
GO
/****** Object:  StoredProcedure [dbo].[REPORT_R10]    Script Date: 01/14/2013 13:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		14181
-- Create date: 2011-11-02
-- Description:	返利查询
-- =============================================
CREATE  PROCEDURE [dbo].[REPORT_R10]
	-- Add the parameters for the stored procedure here
	  @FINTUSERID NUMERIC(19, 0)
	, @FCHRDEALERSERIALNUMBER NVARCHAR(20)
	, @FINTMAXROWS NUMERIC(19, 0)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @FCHRDEALERSERIALNUMBER = '-' 
	  SET @FCHRDEALERSERIALNUMBER = '%'

	IF @FINTMAXROWS > 2000
	  SET @FINTMAXROWS = 2000  
	;
	  
	WITH TMP AS(

    SELECT
      ROW_NUMBER() OVER ( ORDER BY XD.XD001, XD.XD002, XD.XD003) AS ROWNUMBER
	, XD.XD001 AS F001--客户编号
	, MA.MA002 AS F002--客户简称
	, XD.XD002 AS F003--年度
	, XD.XD003 AS F004--季度
	, XD.XD004 AS F005--返利额度
	, XD.XD005 AS F006--期初金额
	, XD.XD006 AS F007--本期已核销金额
	, XD.XD007 AS F008--余额
	, XD.XD008 AS F009--备注
	FROM [192.168.1.8].[Leader].[dbo].[COPXD] XD
	WITH(NOLOCK)
	LEFT OUTER JOIN [192.168.1.8].[Leader].[dbo].[COPMA] MA ON MA.MA001 = XD.XD001
	WHERE
	  XD.XD002 IN (YEAR(GETDATE()), YEAR(DATEADD(YEAR, -1 ,GETDATE())))
	  AND XD.XD001 collate Chinese_PRC_BIN IN (SELECT serial_number FROM DEALER_LIST(@FINTUSERID))
	  AND RTRIM(XD.XD001) LIKE @FCHRDEALERSERIALNUMBER
	)
	
	SELECT
	  F001--客户编号
	, F002--客户简称
	, F003--年度
	, F004--季度
	, F005--返利额度
	, F006--期初金额
	, F007--本期已核销金额
	, F008--余额
	, F009--备注
	FROM TMP
	WHERE ROWNUMBER BETWEEN 1 AND @FINTMAXROWS
	ORDER BY
	  F004

END
GO
/****** Object:  Default [DF_SYNCHRONOUS_job_id]    Script Date: 01/14/2013 13:56:27 ******/
ALTER TABLE [dbo].[SYNCHRONOUS] ADD  CONSTRAINT [DF_SYNCHRONOUS_job_id]  DEFAULT (newid()) FOR [job_id]
GO
/****** Object:  ForeignKey [FK5CE8679F473DF4CD]    Script Date: 01/14/2013 13:56:27 ******/
ALTER TABLE [dbo].[B2B_DEPARTMENT]  WITH CHECK ADD  CONSTRAINT [FK5CE8679F473DF4CD] FOREIGN KEY([parent_dept_id])
REFERENCES [dbo].[B2B_DEPARTMENT] ([id])
GO
ALTER TABLE [dbo].[B2B_DEPARTMENT] CHECK CONSTRAINT [FK5CE8679F473DF4CD]
GO
/****** Object:  ForeignKey [FK9BF4A72F14BE1335]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_WORKFLOW]  WITH CHECK ADD  CONSTRAINT [FK9BF4A72F14BE1335] FOREIGN KEY([department_id])
REFERENCES [dbo].[B2B_DEPARTMENT] ([id])
GO
ALTER TABLE [dbo].[WF_WORKFLOW] CHECK CONSTRAINT [FK9BF4A72F14BE1335]
GO
/****** Object:  ForeignKey [FK9BF4A72F3DFB2B5B]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_WORKFLOW]  WITH CHECK ADD  CONSTRAINT [FK9BF4A72F3DFB2B5B] FOREIGN KEY([record_type_id])
REFERENCES [dbo].[ADMIN_RECORDTYPE] ([id])
GO
ALTER TABLE [dbo].[WF_WORKFLOW] CHECK CONSTRAINT [FK9BF4A72F3DFB2B5B]
GO
/****** Object:  ForeignKey [FKCDCFD65314BE1335]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_STAFF]  WITH CHECK ADD  CONSTRAINT [FKCDCFD65314BE1335] FOREIGN KEY([department_id])
REFERENCES [dbo].[B2B_DEPARTMENT] ([id])
GO
ALTER TABLE [dbo].[B2B_STAFF] CHECK CONSTRAINT [FKCDCFD65314BE1335]
GO
/****** Object:  ForeignKey [FK435217914BE1335]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER]  WITH CHECK ADD  CONSTRAINT [FK435217914BE1335] FOREIGN KEY([department_id])
REFERENCES [dbo].[B2B_DEPARTMENT] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER] CHECK CONSTRAINT [FK435217914BE1335]
GO
/****** Object:  ForeignKey [FK4352179239900BC]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER]  WITH CHECK ADD  CONSTRAINT [FK4352179239900BC] FOREIGN KEY([group_id])
REFERENCES [dbo].[ADMIN_GROUP] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER] CHECK CONSTRAINT [FK4352179239900BC]
GO
/****** Object:  ForeignKey [FK4352179B3F078F6]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER]  WITH CHECK ADD  CONSTRAINT [FK4352179B3F078F6] FOREIGN KEY([role_id])
REFERENCES [dbo].[SHIRO_ROLE] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER] CHECK CONSTRAINT [FK4352179B3F078F6]
GO
/****** Object:  ForeignKey [FK4352179EF47E7FC]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER]  WITH CHECK ADD  CONSTRAINT [FK4352179EF47E7FC] FOREIGN KEY([profile_id])
REFERENCES [dbo].[ADMIN_PROFILE] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER] CHECK CONSTRAINT [FK4352179EF47E7FC]
GO
/****** Object:  ForeignKey [FKD1BEF8E614BE1335]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_DEALER]  WITH CHECK ADD  CONSTRAINT [FKD1BEF8E614BE1335] FOREIGN KEY([department_id])
REFERENCES [dbo].[B2B_DEPARTMENT] ([id])
GO
ALTER TABLE [dbo].[B2B_DEALER] CHECK CONSTRAINT [FKD1BEF8E614BE1335]
GO
/****** Object:  ForeignKey [FKD1BEF8E6B929C3F8]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_DEALER]  WITH CHECK ADD  CONSTRAINT [FKD1BEF8E6B929C3F8] FOREIGN KEY([sales_man_id])
REFERENCES [dbo].[B2B_STAFF] ([id])
GO
ALTER TABLE [dbo].[B2B_DEALER] CHECK CONSTRAINT [FKD1BEF8E6B929C3F8]
GO
/****** Object:  ForeignKey [FKD1BEF8E6C501ECEE]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_DEALER]  WITH CHECK ADD  CONSTRAINT [FKD1BEF8E6C501ECEE] FOREIGN KEY([owner_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_DEALER] CHECK CONSTRAINT [FKD1BEF8E6C501ECEE]
GO
/****** Object:  ForeignKey [FK1DA6E89F3DFB2B5B]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACT]  WITH CHECK ADD  CONSTRAINT [FK1DA6E89F3DFB2B5B] FOREIGN KEY([record_type_id])
REFERENCES [dbo].[ADMIN_RECORDTYPE] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACT] CHECK CONSTRAINT [FK1DA6E89F3DFB2B5B]
GO
/****** Object:  ForeignKey [FK1DA6E89F558A6A75]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACT]  WITH CHECK ADD  CONSTRAINT [FK1DA6E89F558A6A75] FOREIGN KEY([industry_id])
REFERENCES [dbo].[B2B_INDUSTRY] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACT] CHECK CONSTRAINT [FK1DA6E89F558A6A75]
GO
/****** Object:  ForeignKey [FK1DA6E89F67CADF55]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACT]  WITH CHECK ADD  CONSTRAINT [FK1DA6E89F67CADF55] FOREIGN KEY([dealer_id])
REFERENCES [dbo].[B2B_DEALER] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACT] CHECK CONSTRAINT [FK1DA6E89F67CADF55]
GO
/****** Object:  ForeignKey [FK1DA6E89F8820C89D]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACT]  WITH CHECK ADD  CONSTRAINT [FK1DA6E89F8820C89D] FOREIGN KEY([last_modified_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACT] CHECK CONSTRAINT [FK1DA6E89F8820C89D]
GO
/****** Object:  ForeignKey [FK1DA6E89FC501ECEE]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACT]  WITH CHECK ADD  CONSTRAINT [FK1DA6E89FC501ECEE] FOREIGN KEY([owner_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACT] CHECK CONSTRAINT [FK1DA6E89FC501ECEE]
GO
/****** Object:  ForeignKey [FK1DA6E89FD637D4B3]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACT]  WITH CHECK ADD  CONSTRAINT [FK1DA6E89FD637D4B3] FOREIGN KEY([created_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACT] CHECK CONSTRAINT [FK1DA6E89FD637D4B3]
GO
/****** Object:  ForeignKey [FK91A92A0F3DFB2B5B]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0F3DFB2B5B] FOREIGN KEY([record_type_id])
REFERENCES [dbo].[ADMIN_RECORDTYPE] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0F3DFB2B5B]
GO
/****** Object:  ForeignKey [FK91A92A0F558A6A75]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0F558A6A75] FOREIGN KEY([industry_id])
REFERENCES [dbo].[B2B_INDUSTRY] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0F558A6A75]
GO
/****** Object:  ForeignKey [FK91A92A0F67CADF55]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0F67CADF55] FOREIGN KEY([dealer_id])
REFERENCES [dbo].[B2B_DEALER] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0F67CADF55]
GO
/****** Object:  ForeignKey [FK91A92A0F8820C89D]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0F8820C89D] FOREIGN KEY([last_modified_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0F8820C89D]
GO
/****** Object:  ForeignKey [FK91A92A0FB929C3F8]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0FB929C3F8] FOREIGN KEY([sales_man_id])
REFERENCES [dbo].[B2B_STAFF] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0FB929C3F8]
GO
/****** Object:  ForeignKey [FK91A92A0FC501ECEE]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0FC501ECEE] FOREIGN KEY([owner_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0FC501ECEE]
GO
/****** Object:  ForeignKey [FK91A92A0FD637D4B3]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER]  WITH CHECK ADD  CONSTRAINT [FK91A92A0FD637D4B3] FOREIGN KEY([created_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER] CHECK CONSTRAINT [FK91A92A0FD637D4B3]
GO
/****** Object:  ForeignKey [FKF3240813FD9CE7F]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FKF3240813FD9CE7F] FOREIGN KEY([product_id])
REFERENCES [dbo].[B2B_PRODUCT] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL] CHECK CONSTRAINT [FKF3240813FD9CE7F]
GO
/****** Object:  ForeignKey [FKF324081EDD6A5DC]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FKF324081EDD6A5DC] FOREIGN KEY([sales_order_id])
REFERENCES [dbo].[B2B_SALESORDER] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL] CHECK CONSTRAINT [FKF324081EDD6A5DC]
GO
/****** Object:  ForeignKey [FKF324081FB726E1A]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FKF324081FB726E1A] FOREIGN KEY([contract_detail_id])
REFERENCES [dbo].[B2B_CONTRACTDETAIL] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL] CHECK CONSTRAINT [FKF324081FB726E1A]
GO
/****** Object:  ForeignKey [FK91AA65CF3FD9CE7F]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK91AA65CF3FD9CE7F] FOREIGN KEY([product_id])
REFERENCES [dbo].[B2B_PRODUCT] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL] CHECK CONSTRAINT [FK91AA65CF3FD9CE7F]
GO
/****** Object:  ForeignKey [FK91AA65CF967645F3]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK91AA65CF967645F3] FOREIGN KEY([sales_order_detail_id])
REFERENCES [dbo].[B2B_SALESORDER_DETAIL] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL] CHECK CONSTRAINT [FK91AA65CF967645F3]
GO
/****** Object:  ForeignKey [FK91AA65CFFB726E1A]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK91AA65CFFB726E1A] FOREIGN KEY([contract_detail_id])
REFERENCES [dbo].[B2B_CONTRACTDETAIL] ([id])
GO
ALTER TABLE [dbo].[B2B_SALESORDER_DETAIL_DETAIL] CHECK CONSTRAINT [FK91AA65CFFB726E1A]
GO
/****** Object:  ForeignKey [FKFC7BD5F33FD9CE7F]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_BOM]  WITH CHECK ADD  CONSTRAINT [FKFC7BD5F33FD9CE7F] FOREIGN KEY([product_id])
REFERENCES [dbo].[B2B_PRODUCT] ([id])
GO
ALTER TABLE [dbo].[B2B_BOM] CHECK CONSTRAINT [FKFC7BD5F33FD9CE7F]
GO
/****** Object:  ForeignKey [FK35D7B6A03FD9CE7F]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_PRODUCTCATEGORY]  WITH CHECK ADD  CONSTRAINT [FK35D7B6A03FD9CE7F] FOREIGN KEY([product_id])
REFERENCES [dbo].[B2B_PRODUCT] ([id])
GO
ALTER TABLE [dbo].[B2B_PRODUCTCATEGORY] CHECK CONSTRAINT [FK35D7B6A03FD9CE7F]
GO
/****** Object:  ForeignKey [FK35D7B6A0AEC31675]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_PRODUCTCATEGORY]  WITH CHECK ADD  CONSTRAINT [FK35D7B6A0AEC31675] FOREIGN KEY([category_id])
REFERENCES [dbo].[B2B_CATEGORY] ([id])
GO
ALTER TABLE [dbo].[B2B_PRODUCTCATEGORY] CHECK CONSTRAINT [FK35D7B6A0AEC31675]
GO
/****** Object:  ForeignKey [FKB20F60043FD9CE7F]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_BOMDETAIL]  WITH CHECK ADD  CONSTRAINT [FKB20F60043FD9CE7F] FOREIGN KEY([product_id])
REFERENCES [dbo].[B2B_PRODUCT] ([id])
GO
ALTER TABLE [dbo].[B2B_BOMDETAIL] CHECK CONSTRAINT [FKB20F60043FD9CE7F]
GO
/****** Object:  ForeignKey [FKB20F6004D7F62B5F]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_BOMDETAIL]  WITH CHECK ADD  CONSTRAINT [FKB20F6004D7F62B5F] FOREIGN KEY([bom_id])
REFERENCES [dbo].[B2B_BOM] ([id])
GO
ALTER TABLE [dbo].[B2B_BOMDETAIL] CHECK CONSTRAINT [FKB20F6004D7F62B5F]
GO
/****** Object:  ForeignKey [FK6AC555FAC37A900]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[BIRT_REPORTPARAMETER]  WITH CHECK ADD  CONSTRAINT [FK6AC555FAC37A900] FOREIGN KEY([report_id])
REFERENCES [dbo].[BIRT_REPORT] ([id])
GO
ALTER TABLE [dbo].[BIRT_REPORTPARAMETER] CHECK CONSTRAINT [FK6AC555FAC37A900]
GO
/****** Object:  ForeignKey [FK1F3EF2E9B3F078F6]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_ROLE_permissions]  WITH CHECK ADD  CONSTRAINT [FK1F3EF2E9B3F078F6] FOREIGN KEY([role_id])
REFERENCES [dbo].[SHIRO_ROLE] ([id])
GO
ALTER TABLE [dbo].[SHIRO_ROLE_permissions] CHECK CONSTRAINT [FK1F3EF2E9B3F078F6]
GO
/****** Object:  ForeignKey [FK9F815477591B3CD6]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER_roles]  WITH CHECK ADD  CONSTRAINT [FK9F815477591B3CD6] FOREIGN KEY([user_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER_roles] CHECK CONSTRAINT [FK9F815477591B3CD6]
GO
/****** Object:  ForeignKey [FK9F815477B3F078F6]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER_roles]  WITH CHECK ADD  CONSTRAINT [FK9F815477B3F078F6] FOREIGN KEY([role_id])
REFERENCES [dbo].[SHIRO_ROLE] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER_roles] CHECK CONSTRAINT [FK9F815477B3F078F6]
GO
/****** Object:  ForeignKey [FKB79EFA5239900BC]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[ADMIN_SHAREROLE]  WITH CHECK ADD  CONSTRAINT [FKB79EFA5239900BC] FOREIGN KEY([group_id])
REFERENCES [dbo].[ADMIN_GROUP] ([id])
GO
ALTER TABLE [dbo].[ADMIN_SHAREROLE] CHECK CONSTRAINT [FKB79EFA5239900BC]
GO
/****** Object:  ForeignKey [FKB79EFA5591B3CD6]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[ADMIN_SHAREROLE]  WITH CHECK ADD  CONSTRAINT [FKB79EFA5591B3CD6] FOREIGN KEY([user_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[ADMIN_SHAREROLE] CHECK CONSTRAINT [FKB79EFA5591B3CD6]
GO
/****** Object:  ForeignKey [FK7713163C6D3EE76C]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_STEP]  WITH CHECK ADD  CONSTRAINT [FK7713163C6D3EE76C] FOREIGN KEY([assignee_id])
REFERENCES [dbo].[ADMIN_GROUP] ([id])
GO
ALTER TABLE [dbo].[WF_STEP] CHECK CONSTRAINT [FK7713163C6D3EE76C]
GO
/****** Object:  ForeignKey [FK7713163CFFF6F09A]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_STEP]  WITH CHECK ADD  CONSTRAINT [FK7713163CFFF6F09A] FOREIGN KEY([workflow_id])
REFERENCES [dbo].[WF_WORKFLOW] ([id])
GO
ALTER TABLE [dbo].[WF_STEP] CHECK CONSTRAINT [FK7713163CFFF6F09A]
GO
/****** Object:  ForeignKey [FK86F068E967CADF55]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL]  WITH CHECK ADD  CONSTRAINT [FK86F068E967CADF55] FOREIGN KEY([dealer_id])
REFERENCES [dbo].[B2B_DEALER] ([id])
GO
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL] CHECK CONSTRAINT [FK86F068E967CADF55]
GO
/****** Object:  ForeignKey [FK86F068E98820C89D]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL]  WITH CHECK ADD  CONSTRAINT [FK86F068E98820C89D] FOREIGN KEY([last_modified_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL] CHECK CONSTRAINT [FK86F068E98820C89D]
GO
/****** Object:  ForeignKey [FK86F068E9C501ECEE]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL]  WITH CHECK ADD  CONSTRAINT [FK86F068E9C501ECEE] FOREIGN KEY([owner_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL] CHECK CONSTRAINT [FK86F068E9C501ECEE]
GO
/****** Object:  ForeignKey [FK86F068E9D637D4B3]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL]  WITH CHECK ADD  CONSTRAINT [FK86F068E9D637D4B3] FOREIGN KEY([created_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[SNAPSHOT_CREDITCONTROL] CHECK CONSTRAINT [FK86F068E9D637D4B3]
GO
/****** Object:  ForeignKey [FKB842388E8820C89D]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WEBSERVICE_OUTBOUND]  WITH CHECK ADD  CONSTRAINT [FKB842388E8820C89D] FOREIGN KEY([last_modified_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[WEBSERVICE_OUTBOUND] CHECK CONSTRAINT [FKB842388E8820C89D]
GO
/****** Object:  ForeignKey [FKB842388EC501ECEE]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WEBSERVICE_OUTBOUND]  WITH CHECK ADD  CONSTRAINT [FKB842388EC501ECEE] FOREIGN KEY([owner_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[WEBSERVICE_OUTBOUND] CHECK CONSTRAINT [FKB842388EC501ECEE]
GO
/****** Object:  ForeignKey [FKB842388ED637D4B3]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WEBSERVICE_OUTBOUND]  WITH CHECK ADD  CONSTRAINT [FKB842388ED637D4B3] FOREIGN KEY([created_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[WEBSERVICE_OUTBOUND] CHECK CONSTRAINT [FKB842388ED637D4B3]
GO
/****** Object:  ForeignKey [FK7E46E30471702DD9]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK7E46E30471702DD9] FOREIGN KEY([step_id])
REFERENCES [dbo].[WF_STEP] ([id])
GO
ALTER TABLE [dbo].[WF_HISTORY] CHECK CONSTRAINT [FK7E46E30471702DD9]
GO
/****** Object:  ForeignKey [FK7E46E3048820C89D]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK7E46E3048820C89D] FOREIGN KEY([last_modified_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[WF_HISTORY] CHECK CONSTRAINT [FK7E46E3048820C89D]
GO
/****** Object:  ForeignKey [FK7E46E304D637D4B3]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK7E46E304D637D4B3] FOREIGN KEY([created_by_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[WF_HISTORY] CHECK CONSTRAINT [FK7E46E304D637D4B3]
GO
/****** Object:  ForeignKey [FK1AF906BE591B3CD6]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[SHIRO_USER_permissions]  WITH CHECK ADD  CONSTRAINT [FK1AF906BE591B3CD6] FOREIGN KEY([user_id])
REFERENCES [dbo].[SHIRO_USER] ([id])
GO
ALTER TABLE [dbo].[SHIRO_USER_permissions] CHECK CONSTRAINT [FK1AF906BE591B3CD6]
GO
/****** Object:  ForeignKey [FKC1D4C1B0AEC31675]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACTDETAIL]  WITH CHECK ADD  CONSTRAINT [FKC1D4C1B0AEC31675] FOREIGN KEY([category_id])
REFERENCES [dbo].[B2B_CATEGORY] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACTDETAIL] CHECK CONSTRAINT [FKC1D4C1B0AEC31675]
GO
/****** Object:  ForeignKey [FKC1D4C1B0AFBBADF5]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CONTRACTDETAIL]  WITH CHECK ADD  CONSTRAINT [FKC1D4C1B0AFBBADF5] FOREIGN KEY([contract_id])
REFERENCES [dbo].[B2B_CONTRACT] ([id])
GO
ALTER TABLE [dbo].[B2B_CONTRACTDETAIL] CHECK CONSTRAINT [FKC1D4C1B0AFBBADF5]
GO
/****** Object:  ForeignKey [FKDF066DA63DB1944E]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_ACTION]  WITH CHECK ADD  CONSTRAINT [FKDF066DA63DB1944E] FOREIGN KEY([belogns_to_step_id])
REFERENCES [dbo].[WF_STEP] ([id])
GO
ALTER TABLE [dbo].[WF_ACTION] CHECK CONSTRAINT [FKDF066DA63DB1944E]
GO
/****** Object:  ForeignKey [FKDF066DA6BBFEBC8D]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[WF_ACTION]  WITH CHECK ADD  CONSTRAINT [FKDF066DA6BBFEBC8D] FOREIGN KEY([next_step_id])
REFERENCES [dbo].[WF_STEP] ([id])
GO
ALTER TABLE [dbo].[WF_ACTION] CHECK CONSTRAINT [FKDF066DA6BBFEBC8D]
GO
/****** Object:  ForeignKey [FK4274948B3DFB2B5B]    Script Date: 01/14/2013 13:56:29 ******/
ALTER TABLE [dbo].[B2B_CATEGORY]  WITH CHECK ADD  CONSTRAINT [FK4274948B3DFB2B5B] FOREIGN KEY([record_type_id])
REFERENCES [dbo].[ADMIN_RECORDTYPE] ([id])
GO
ALTER TABLE [dbo].[B2B_CATEGORY] CHECK CONSTRAINT [FK4274948B3DFB2B5B]
GO
