CREATE TABLE [Anodot_processes]

(
[RowId] [int] NOT NULL IDENTITY(1, 1),
[ProcessID] [int] NOT NULL,
[ProcessName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastSendTime] [datetime] NULL,
[TransferToZero] [int] NULL,
[ProcessDimensionHeaders] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataSendingType] [int] NULL,
[IntervalInMinutes] [int] NULL,
[CreateDate] [datetime] NULL CONSTRAINT [Anodot_processes_CreateDate] DEFAULT (getdate()),
[UpdateDate] [datetime] NULL CONSTRAINT [Anodot_processes_UpdateDate] DEFAULT (getdate()),
[IsEnabled] [bit] NULL,
[ProcessVersion] [int] NULL,
[ProcessCollector] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StoredProcedure] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnvironmentId] [int] NOT NULL CONSTRAINT [DF__Anodot_pr__Envir__33D580EF] DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Anodot_processes] ADD CONSTRAINT [PK_Anodot_processes] PRIMARY KEY CLUSTERED ([ProcessID]) ON [PRIMARY]
GO


CREATE TABLE [Anodot_DimensionCollection]
(
[ProcessId] [int] NOT NULL,
[ProcessDimensionValues] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Value] [decimal] (19, 10) NULL,
[LastRunDate] [datetime] NULL,
[DateRangeStart] [datetime] NULL,
[DateRangeEnd] [datetime] NULL,
[RowId] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [Anodot_DimensionCollection] ADD CONSTRAINT [PK_Anodot_DimensionCollection] PRIMARY KEY CLUSTERED ([ProcessId], [ProcessDimensionValues]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Anodot_DimensionCollection_ProcessId] ON [Anodot_DimensionCollection] ([ProcessId]) ON [PRIMARY]
GO




CREATE TABLE [Anodot_parameters]
(
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




CREATE TABLE [Anodot_DataSendingType]
(
[DataSendingType] [int] NULL,
[DataSendingTypeDesc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[APIValueName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO



CREATE TABLE [Anodot_Environments]
(
[EnvironmentId] [int] NOT NULL,
[EnvironmentName] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Anodot_Environments] ADD CONSTRAINT [PK_Anodot_Environments] PRIMARY KEY CLUSTERED ([EnvironmentId]) ON [PRIMARY]
GO


