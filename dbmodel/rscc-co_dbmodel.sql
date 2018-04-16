
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/16/2018 12:44 v0.2
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [rscc-co];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[rscc_log]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_log];
GO
IF OBJECT_ID(N'[dbo].[rscc_om_cid]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_om_cid];
GO
IF OBJECT_ID(N'[dbo].[rscc_sitespecific]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_sitespecific;
GO
IF OBJECT_ID(N'[dbo].[rscc_nonsitespecific]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_nonsitespecific;
GO
IF OBJECT_ID(N'[dbo].[rscc_sitetype]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_sitetype;
GO
IF OBJECT_ID(N'[dbo].[rscc_cidtype]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_cidtype];
GO
IF OBJECT_ID(N'[dbo].[rscc_requirementtype]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_requirementtype];
GO
-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'rscc_cidtype'
CREATE TABLE [dbo].[rscc_cidtype] (
  [cidtype_id] int IDENTITY(1,1) NOT NULL,
  [cid_type] nchar(20) NOT NULL
);
GO

-- Creating table 'rscc_requirementtype'
CREATE TABLE [dbo].[rscc_requirementtype] (
  [requirementtype_id] int IDENTITY(1,1) NOT NULL,
  [requirement_type] nchar(20) NOT NULL
);
GO

-- Creating table 'rscc_sitetype'
CREATE TABLE [dbo].[rscc_sitetype] (
  [sitetype_id] int IDENTITY(1,1) NOT NULL,
  [site_type] nchar(20) NOT NULL
);
GO

-- Creating table 'rscc_sitespecific'
CREATE TABLE [dbo].[rscc_sitespecific] (
  [sitespecific_id] int NOT NULL,
  [ship_to_address] nchar(250) NULL
);
GO

-- Creating table 'rscc_nonsitespecific'
CREATE TABLE [dbo].[rscc_nonsitespecific] (
  [nonsitespecific_id] int NOT NULL
);
GO
-- Creating table 'rscc_om_cid'
CREATE TABLE [dbo].[rscc_om_cid] (
  [om_id] int IDENTITY(1,1) NOT NULL,
  [new_cid] nchar(100)  NULL,
  [old_cid] nchar(100)  NULL,
  [soa_instance_id] nchar(100) NULL,
  [order_number] nchar(100)  NULL,
  [order_line_number] nchar(100)  NULL,
  [solution] nvarchar(max) NULL,
  [field_config] nchar(100) NULL,
  [expiration_date] datetime NULL,
  [expiration_reason] nvarchar(max) NULL,
  [created_date] datetime NULL,
  [updated_date] datetime NULL,
  [sitetype_id] int NOT NULL,
  [cid_id] int NOT NULL,
  [requirement_id] int NOT NULL,
  [order_comments] nvarchar(max) NULL,
  [priority] nchar(10) NOT NULL,
  [expected_completion_date] datetime NULL,
  [iface_status] nchar(100) NULL,
  [iface_message] nchar(100) NULL
);
GO

-- Creating table 'rscc_log'
CREATE TABLE [dbo].[rscc_log] (
  [log_id] int IDENTITY(1,1) NOT NULL,
  [om_id] int NOT NULL,
  [code] nchar(100)  NULL,
  [message] nchar(200)  NULL,
  [payload] nvarchar(max)  NOT NULL,
  [created_at] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [cidtype_cid] in table 'rscc_cidtype'
ALTER TABLE [dbo].[rscc_cidtype]
  ADD CONSTRAINT [PK_rscc_cidtype]
PRIMARY KEY CLUSTERED ([cidtype_id] ASC);
GO

-- Creating primary key on [requirementtype_cid] in table 'rscc_requirementtype'
ALTER TABLE [dbo].[rscc_requirementtype]
  ADD CONSTRAINT [PK_rscc_requirementtype]
  PRIMARY KEY CLUSTERED ([requirementtype_id] ASC);
GO

-- Creating primary key on [sitespecific_id] in table 'rscc_sitespecific'
ALTER TABLE [dbo].rscc_sitespecific
  ADD CONSTRAINT [PK_rscc_sitespecific]
  PRIMARY KEY CLUSTERED ([sitespecific_id] ASC);
GO

-- Creating primary key on [nonsitespecific_id] in table 'rscc_nonsitespecific'
ALTER TABLE [dbo].rscc_nonsitespecific
  ADD CONSTRAINT [PK_rscc_nonsitespecific]
PRIMARY KEY CLUSTERED ([nonsitespecific_id] ASC);
GO

-- Creating primary key on [sitetype_id] in table 'rscc_sitetype'
ALTER TABLE [dbo].rscc_sitetype
  ADD CONSTRAINT [PK_rscc_sitetype]
  PRIMARY KEY CLUSTERED ([sitetype_id] ASC);
GO

-- Creating primary key on [om_cid] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [PK_rscc_om_cid]
PRIMARY KEY CLUSTERED ([om_id] ASC);
GO

-- Creating primary key on [log_id] in table 'rscc_log'
ALTER TABLE [dbo].[rscc_log]
  ADD CONSTRAINT [PK_rscc_log]
PRIMARY KEY CLUSTERED ([log_id] ASC);
GO

-- --------------------------------------------------
-- Creating all JSON constraints
-- --------------------------------------------------

-- Creating JSON constraint on [payload] in table 'rscc_log'
ALTER TABLE [dbo].[rscc_log]
  ADD CONSTRAINT [payload record should be formatted as JSON]
CHECK (ISJSON(payload)=1);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key constraint [om_id] in table 'rscc_log'
ALTER TABLE [dbo].[rscc_log]
  ADD CONSTRAINT [FK_LogOm]
FOREIGN KEY ([om_id]) REFERENCES [dbo].[rscc_om_cid](om_id);
GO

-- Creating foreign key constraint [site_id] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [FK_CidSite]
FOREIGN KEY ([sitetype_id]) REFERENCES [dbo].rscc_sitetype(sitetype_id);
GO

-- Creating foreign key constraint [cid_id] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [FK_CidType]
FOREIGN KEY ([cid_id]) REFERENCES [dbo].[rscc_cidtype](cidtype_id);
GO

-- Creating foreign key constraint [requirement_id] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [FK_RequirementType]
FOREIGN KEY ([requirement_id]) REFERENCES [dbo].[rscc_requirementtype](requirementtype_id);
GO

-- Creating foreign key constraint [sitespecific_id] in table 'rscc_sitespecific'
ALTER TABLE [dbo].rscc_sitespecific
  ADD CONSTRAINT [FK_SitespecificSitetype]
  FOREIGN KEY ([sitespecific_id]) REFERENCES [dbo].rscc_sitetype(sitetype_id);
GO

-- Creating foreign key constraint [nonsitespecific_id] in table 'rscc_nonsitespecific'
ALTER TABLE [dbo].rscc_nonsitespecific
  ADD CONSTRAINT [FK_NonsitespecificSitetype]
FOREIGN KEY ([nonsitespecific_id]) REFERENCES [dbo].rscc_sitetype(sitetype_id);
GO

-- --------------------------------------------------
-- Creating all other column constraints
-- --------------------------------------------------

-- Creating check constraint [priority] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [CHK_priority]
CHECK ([priority] in ('high','medium','low'));
GO

-- Creating check constraint [site_type] in table 'rscc_sitetype'
ALTER TABLE [dbo].[rscc_sitetype]
  ADD CONSTRAINT [CHK_sitetype]
CHECK ([site_type] in ('site specific','non site specific'));
GO

-- Creating check constraint [cid_type] in table 'rscc_cidtype'
ALTER TABLE [dbo].[rscc_cidtype]
  ADD CONSTRAINT [CHK_cidtype]
CHECK ([cid_type] in ('hardware','software'));
GO

-- Creating check constraint [requirement_type] in table 'rscc_requirementtype'
ALTER TABLE [dbo].[rscc_requirementtype]
  ADD CONSTRAINT [CHK_requirementtype]
CHECK ([requirement_type] in ('new requirement','revised requirement'));
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
