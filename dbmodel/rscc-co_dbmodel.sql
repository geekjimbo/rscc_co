
-- ---------------------------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- ---------------------------------------------------------------------
-- Date Created: 04/16/2018 22:450 v0.7
-- ---------------------------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [rscc-co];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing STORED PROCEDURES
-- --------------------------------------------------
DROP FUNCTION [dbo].[str_to_datetime];
DROP PROCEDURE [dbo].[setFullCid];
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

-- Droping foreign key constraint [om_id] in table 'rscc_log'
IF OBJECT_ID(N'[dbo].[FK_LogOm]', 'U') IS NOT NULL
  ALTER TABLE [dbo].[rscc_log]
    DROP CONSTRAINT [FK_LogOm];
GO

-- Droping foreign key constraint [site_id] in table 'rscc_om_cid'
IF OBJECT_ID(N'[dbo].[FK_CidSite]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_om_cid]
  DROP CONSTRAINT [FK_CidSite];
GO

-- Droping foreign key constraint [model_id] in table 'rscc_om_cid'
IF OBJECT_ID(N'[dbo].[FK_CidModel]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_om_cid]
  DROP CONSTRAINT [FK_CidModel];
GO

-- Droping foreign key constraint [cid_id] in table 'rscc_om_cid'
IF OBJECT_ID(N'[dbo].[FK_CidType]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_om_cid]
  DROP CONSTRAINT [FK_CidType];
GO

-- Droping foreign key constraint [requirement_id] in table 'rscc_om_cid'
IF OBJECT_ID(N'[dbo].[FK_RequirementType]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_om_cid]
  DROP CONSTRAINT [FK_RequirementType];
GO

-- Droping foreign key constraint [customer_account_number] in table 'rscc_om_cid'
IF OBJECT_ID(N'[dbo].[FK_CidCustomerNumber]', 'U') IS NOT NULL
  ALTER TABLE [dbo].[rscc_om_cid]
    DROP CONSTRAINT [FK_CidCustomerNumber];
GO

-- Droping foreign key constraint [sitespecific_id] in table 'rscc_sitespecific'
IF OBJECT_ID(N'[dbo].[FK_SitespecificSitetype]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_sitespecific]
  DROP CONSTRAINT [FK_SitespecificSitetype];
GO

-- Droping foreign key constraint [nonsitespecific_id] in table 'rscc_nonsitespecific'
IF OBJECT_ID(N'[dbo].[FK_NonsitespecificSitetype]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_nonsitespecific]
  DROP CONSTRAINT [FK_NonsitespecificSitetype];
GO

-- Droping foreign key constraint [new_requirement_id] in table 'rscc_new_requirement'
IF OBJECT_ID(N'[dbo].[FK_NewRequirementype]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_new_requirement]
  DROP CONSTRAINT [FK_NewRequirementype];
GO

-- Droping foreign key constraint [revised_requirement_id] in table 'rscc_revised_requirement'
IF OBJECT_ID(N'[dbo].[FK_RevisedRequirementype]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_revised_requirement]
  DROP CONSTRAINT [FK_RevisedRequirementype];
GO

-- Droping foreign key constraint [hardwarecid_id] in table 'rscc_hardwarecid'
IF OBJECT_ID(N'[dbo].[FK_HardwareCidtype]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_hardwarecid]
  DROP CONSTRAINT [FK_HardwareCidtype];
GO

-- Droping foreign key constraint [software_id] in table 'rscc_softwarecid'
IF OBJECT_ID(N'[dbo].[FK_SoftwareCidtype]', 'U') IS NOT NULL
ALTER TABLE [dbo].[rscc_softwarecid]
  DROP CONSTRAINT [FK_SoftwareCidtype];
GO


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------
IF OBJECT_ID(N'[dbo].[rscc_log]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_log];
GO
IF OBJECT_ID(N'[dbo].[rscc_om_cid]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_om_cid];
GO
IF OBJECT_ID(N'[dbo].[rscc_model]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_model];
GO
IF OBJECT_ID(N'[dbo].[rscc_sitespecific]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_sitespecific;
GO
IF OBJECT_ID(N'[dbo].[rscc_nonsitespecific]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_nonsitespecific;
GO
IF OBJECT_ID(N'[dbo].[rscc_hardwarecid]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_hardwarecid;
GO
IF OBJECT_ID(N'[dbo].[rscc_softwarecid]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_softwarecid;
GO
IF OBJECT_ID(N'[dbo].[rscc_sitetype]', 'U') IS NOT NULL
  DROP TABLE [dbo].rscc_sitetype;
GO
IF OBJECT_ID(N'[dbo].[rscc_cidtype]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_cidtype];
GO
IF OBJECT_ID(N'[dbo].[rscc_new_requirement]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_new_requirement];
GO
IF OBJECT_ID(N'[dbo].[rscc_revised_requirement]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_revised_requirement];
GO
IF OBJECT_ID(N'[dbo].[rscc_requirementtype]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_requirementtype];
GO
IF OBJECT_ID(N'[dbo].[rscc_customer]', 'U') IS NOT NULL
  DROP TABLE [dbo].[rscc_customer];
GO
-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'rscc_customer'
CREATE TABLE [dbo].[rscc_customer] (
  [customer_account_number] int NOT NULL,
  [customer_name] nchar(200)
);
GO

-- Creating table 'rscc_model'
CREATE TABLE [dbo].[rscc_model] (
  [model_id] int IDENTITY(1,1) NOT NULL,
  [model] nchar(200) NOT NULL
);
GO

-- Creating table 'rscc_cidtype'
CREATE TABLE [dbo].[rscc_cidtype] (
  [cidtype_id] int IDENTITY(1,1) NOT NULL,
  [cid_type] nchar(20) NOT NULL
);
GO

-- Creating table 'rscc_hardware_cid'
CREATE TABLE [dbo].[rscc_hardwarecid] (
  [hardwarecid_id] int NOT NULL
);
GO

-- Creating table 'rscc_softwarecid'
CREATE TABLE [dbo].[rscc_softwarecid] (
  [softwarecid_id] int NOT NULL
);
GO

-- Creating table 'rscc_requirementtype'
CREATE TABLE [dbo].[rscc_requirementtype] (
  [requirementtype_id] int IDENTITY(1,1) NOT NULL,
  [requirement_type] nchar(20) NOT NULL
);
GO

-- Creating table 'rscc_new_requirement'
CREATE TABLE [dbo].[rscc_new_requirement] (
  [new_requirement_id] int NOT NULL
);
GO

-- Creating table 'rscc_revised_requirement'
CREATE TABLE [dbo].[rscc_revised_requirement] (
  [revised_requirement_id] int NOT NULL
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
  [model_id] int NOT NULL,
  [customer_account_number] int NOT NULL,
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

-- Creating primary key on [customer_account_number] in table 'rscc_customer'
ALTER TABLE [dbo].[rscc_customer]
  ADD CONSTRAINT [PK_rscc_customer]
PRIMARY KEY CLUSTERED ([customer_account_number] ASC);
GO

-- Creating primary key on [model_id] in table 'rscc_model'
ALTER TABLE [dbo].[rscc_model]
  ADD CONSTRAINT [PK_rscc_model]
PRIMARY KEY CLUSTERED ([model_id] ASC);
GO

-- Creating primary key on [cidtype_cid] in table 'rscc_cidtype'
ALTER TABLE [dbo].[rscc_cidtype]
  ADD CONSTRAINT [PK_rscc_cidtype]
PRIMARY KEY CLUSTERED ([cidtype_id] ASC);
GO

-- Creating primary key on [new_requirement_id] in table 'rscc_new_requirement'
ALTER TABLE [dbo].rscc_new_requirement
  ADD CONSTRAINT [PK_rscc_new_requirement]
PRIMARY KEY CLUSTERED ([new_requirement_id] ASC);
GO

-- Creating primary key on [revised_requirement_id] in table 'rscc_revised_requirement'
ALTER TABLE [dbo].rscc_revised_requirement
  ADD CONSTRAINT [PK_rscc_revised_requirement]
PRIMARY KEY CLUSTERED ([revised_requirement_id] ASC);
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

-- Creating primary key on [hardwarecid_id] in table 'rscc_hardwarecid'
ALTER TABLE [dbo].rscc_hardwarecid
  ADD CONSTRAINT [PK_rscc_hardwarecid]
PRIMARY KEY CLUSTERED ([hardwarecid_id] ASC);
GO

-- Creating primary key on [rscc_softwarecid_id] in table 'rscc_softwarecid'
ALTER TABLE [dbo].rscc_softwarecid
  ADD CONSTRAINT [PK_rscc_softwarecid]
PRIMARY KEY CLUSTERED ([softwarecid_id] ASC);
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

-- Creating foreign key constraint [customer_account_number] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [FK_CidCustomerNumber]
FOREIGN KEY ([customer_account_number]) REFERENCES [dbo].[rscc_customer](customer_account_number);
GO

-- Creating foreign key constraint [model_id] in table 'rscc_om_cid'
ALTER TABLE [dbo].[rscc_om_cid]
  ADD CONSTRAINT [FK_CidModel]
FOREIGN KEY ([model_id]) REFERENCES [dbo].[rscc_model](model_id);
GO

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

-- Creating foreign key constraint [new_requirement_id] in table 'rscc_new_requirement'
ALTER TABLE [dbo].rscc_new_requirement
  ADD CONSTRAINT [FK_NewRequirementype]
FOREIGN KEY ([new_requirement_id]) REFERENCES [dbo].rscc_requirementtype(requirementtype_id);
GO

-- Creating foreign key constraint [revised_requirement_id] in table 'rscc_revised_requirement'
ALTER TABLE [dbo].rscc_revised_requirement
  ADD CONSTRAINT [FK_RevisedRequirementype]
FOREIGN KEY ([revised_requirement_id]) REFERENCES [dbo].rscc_requirementtype(requirementtype_id);
GO

-- Creating foreign key constraint [hardwarecid_id] in table 'rscc_hardwarecid'
ALTER TABLE [dbo].rscc_hardwarecid
  ADD CONSTRAINT [FK_HardwareCidtype]
FOREIGN KEY ([hardwarecid_id]) REFERENCES [dbo].rscc_cidtype(cidtype_id);
GO

-- Creating foreign key constraint [software_id] in table 'rscc_softwarecid'
ALTER TABLE [dbo].rscc_softwarecid
  ADD CONSTRAINT [FK_SoftwareCidtype]
FOREIGN KEY ([softwarecid_id]) REFERENCES [dbo].rscc_cidtype(cidtype_id);
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
CHECK ([site_type] in ('site specific','non site specific', 'site_specific','non_site_specific'));
GO

-- Creating check constraint [cid_type] in table 'rscc_cidtype'
ALTER TABLE [dbo].[rscc_cidtype]
  ADD CONSTRAINT [CHK_cidtype]
CHECK ([cid_type] in ('hardware','software'));
GO

-- Creating check constraint [requirement_type] in table 'rscc_requirementtype'
ALTER TABLE [dbo].[rscc_requirementtype]
  ADD CONSTRAINT [CHK_requirementtype]
CHECK ([requirement_type] in ('new requirement','revised requirement','new_requirement','revised_requirement'));
GO

-- --------------------------------------------------
-- Create stored procedures and functions
-- --------------------------------------------------
-- DROP PROCEDURE [dbo].[setFullCid];
-- GO

-- Function to convert string ("Fri Apr 10 1992 02:55:34 GMT+0000 (UTC)") to datetime
CREATE FUNCTION [dbo].[str_to_datetime] (@strdate nchar(50))
RETURNS datetime
WITH EXECUTE AS CALLER
AS
BEGIN

  RETURN(SYSDATETIME());
END
GO

-- Procedure to fill tables with data dump
CREATE PROCEDURE [dbo].[setFullCid]

  @customer_account_number int,
  @customer_name nchar(200),
  @ship_to_address nchar(250),
  @model nchar(200),
  @old_cid nchar(100),
  @new_cid nchar(100),
  @soa_instance_id nchar(200),
  @order_number nchar(100),
  @order_line_number nchar(100),
  @solution nvarchar(max),
  @field_config nchar(100),
  @expiration_date varchar(100),
  @expiration_reason nvarchar(max),
  @created_date varchar(100),
  @updated_date varchar(100),
  @site_type nchar(20),
  @site_id int,
  @cid_type nchar(20),
  @cid_id int,
  @requirement_type nchar(20),
  @requirement_id int,
  @order_comments nvarchar(max),
  @priority nchar(10),
  @expected_completion_date varchar(100)
AS
  DECLARE
    @model_id int
BEGIN
  -- Insert customer info
  INSERT INTO [dbo].[rscc_customer]
    (customer_account_number, customer_name)
    VALUES ( @customer_account_number, @customer_name );

  -- insert model info
  INSERT INTO [dbo].[rscc_model]
    (model)
    VALUES ( @model );
  SET @model_id = SCOPE_IDENTITY();

  -- insert site info
  INSERT INTO [dbo].[rscc_sitetype]
    (site_type)
    VALUES (@site_type);
  SET @site_id = SCOPE_IDENTITY();
  IF ((@site_type = 'site_specific') OR (@site_type = 'site specific'))
    BEGIN
      INSERT INTO [dbo].[rscc_sitespecific] (sitespecific_id, ship_to_address)
      VALUES (@site_id, @ship_to_address);
    END
  ELSE
    BEGIN
      INSERT INTO [dbo].[rscc_nonsitespecific] (nonsitespecific_id)
      VALUES (@site_id);
    END

  -- insert cid_type info
  INSERT INTO [dbo].[rscc_cidtype]
  (cid_type)
  VALUES (@cid_type);
  SET @cid_id = SCOPE_IDENTITY();
  IF (@cid_type = 'hardware')
    BEGIN
      INSERT INTO [dbo].[rscc_hardwarecid] (hardwarecid_id)
      VALUES (@cid_id);
    END
  ELSE
    BEGIN
      INSERT INTO [dbo].[rscc_softwarecid] (softwarecid_id)
      VALUES (@cid_id);
    END

  -- insert requirementtype info
  INSERT INTO [dbo].[rscc_requirementtype]
  (requirement_type)
  VALUES (@requirement_type);
  SET @requirement_id = SCOPE_IDENTITY();
  IF ((@requirement_type = 'new_requirement') OR (@requirement_type = 'new requirement'))
    BEGIN
      INSERT INTO [dbo].[rscc_new_requirement] (new_requirement_id)
      VALUES (@requirement_id);
    END
  ELSE
    BEGIN
      INSERT INTO [dbo].[rscc_revised_requirement] (revised_requirement_id)
      VALUES (@requirement_id);
    END

  -- insert om_cid info
  INSERT INTO [dbo].[rscc_om_cid]
  ([new_cid], [old_cid], [model_id], [customer_account_number],
   [soa_instance_id], [order_number], [order_line_number],
   [solution], [field_config], [expiration_date], [expiration_reason],
   [created_date], [updated_date], [sitetype_id], [cid_id],
   [requirement_id], [order_comments], [priority],
   [expected_completion_date], [iface_status], [iface_message])
  VALUES (@new_cid, @old_cid, @model_id, @customer_account_number,
   @soa_instance_id, @order_number, @order_line_number,
   @solution, @field_config, [dbo].[str_to_datetime](@expiration_date), @expiration_reason,
    [dbo].[str_to_datetime](@created_date), [dbo].[str_to_datetime](@updated_date), @site_id, @cid_id,
   @requirement_id, @order_comments, @priority,
    [dbo].[str_to_datetime](@expected_completion_date), '', '');
END
GO

-- --------------------------------------------------
-- Script to insert values to test
-- --------------------------------------------------
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  395554,
    @customer_name =  "VIRVA",
    @ship_to_address = "619 Verona Street, Rodanthe, Connecticut, 4635",
    @model = "MP 3253TE",
    @old_cid = "5ad0f02112c9aeedfbd2014a",
    @new_cid = "5ad0f02110991260a7c0d0bc",
    @soa_instance_id = 1,
    @order_number = 917467,
    @order_line_number = 1,
    @solution = "Irure in nulla incididunt non culpa ex adipisicing amet cillum. Non ullamco duis sint nulla tempor occaecat. Est nostrud ex sunt qui ipsum. Commodo mollit officia ipsum dolore mollit et ipsum aliquip deserunt dolore qui occaecat incididunt.",
    @field_config = "Fugiat enim ad sint est. Incididunt dolore id minim in laborum eiusmod elit magna eu do. Aliquip pariatur ad enim sit ipsum qui sunt velit ad amet ea deserunt. Est elit minim aliqua ut sint reprehenderit pariatur eiusmod nisi mollit ad velit ad esse. Qui Lorem incididunt ea commodo nisi reprehenderit laboris sit. Proident anim adipisicing elit nostrud sint nisi quis in labore veniam esse.",
    @expiration_date = "Fri Dec 28 2007 15:46:42 GMT+0000 (UTC)",
    @expiration_reason = "Deserunt velit et tempor in sit aliqua mollit consectetur aliqua fugiat. Velit velit in adipisicing nisi ad fugiat irure veniam tempor. Commodo consectetur qui ipsum ullamco aute velit sunt excepteur sint aliquip pariatur sunt. Ipsum enim exercitation veniam tempor officia exercitation cillum amet. Dolore aliqua Lorem irure minim. Et cupidatat aute adipisicing sit. Tempor nostrud ea ex pariatur.",
    @created_date = "Tue Apr 04 2000 14:39:21 GMT+0000 (UTC)",
    @updated_date = "Mon Feb 08 1982 10:09:52 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 1,
    @cid_type = "hardware",
    @cid_id = 1,
    @requirement_type = "revised_requirement",
    @requirement_id = 1,
    @order_comments = "Nulla nostrud minim laborum cillum aliqua consequat. Nulla officia elit enim laborum amet officia aute et. Commodo laboris Lorem sint magna dolor Lorem elit elit cillum commodo. Et aliqua aute nisi enim amet voluptate esse consequat ullamco eiusmod reprehenderit irure. Esse ipsum tempor non irure cupidatat enim nulla consequat laborum elit sint deserunt velit mollit. Consectetur minim ut elit ea sit ipsum voluptate ut et ad.",
    @priority = "medium",
    @expected_completion_date = "Fri Jun 15 2018 05:53:17 GMT+0000 (UTC)";
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  203385,
    @customer_name =  "TWIIST",
    @ship_to_address = "984 Georgia Avenue, Barrelville, Arizona, 1582",
    @model = "MP 3900SP",
    @old_cid =  "5ad0f021cc07b14f22acefc0",
    @new_cid = "5ad0f021b39570f9ca769aa1",
    @soa_instance_id = 2,
    @order_number = 439463,
    @order_line_number = 2,
    @solution = "Tempor ipsum tempor deserunt officia do voluptate eiusmod ad. Lorem ipsum tempor aliquip commodo anim dolor elit fugiat pariatur eu laboris qui. Dolore tempor labore ad ad reprehenderit fugiat deserunt dolor minim qui qui. Officia sit eu deserunt mollit consectetur consequat ullamco deserunt adipisicing ipsum fugiat. Exercitation aliqua et laboris culpa deserunt labore id aute nulla est qui et mollit eu. Ad nostrud cupidatat voluptate amet do consequat reprehenderit consectetur reprehenderit. Ullamco ex in ea officia ut aliquip excepteur eiusmod qui non aliquip ipsum.",
    @field_config = "Tempor do Lorem elit voluptate minim ex aliqua sint. Excepteur cupidatat exercitation magna mollit incididunt ex commodo aliqua do cillum aute pariatur consectetur. Do dolor quis magna Lorem ut cupidatat esse eu sunt ipsum. Eiusmod tempor est veniam ullamco sint fugiat irure incididunt esse. Laborum amet reprehenderit officia sit est est do non. Ut velit culpa qui adipisicing magna duis nulla laboris Lorem nisi ipsum eiusmod consequat laborum. Duis aliquip nisi mollit velit nostrud nulla aliquip deserunt.",
    @expiration_date = "Tue Oct 07 1975 11:34:48 GMT+0000 (UTC)",
    @expiration_reason = "Consequat esse duis dolor ullamco irure cupidatat ad fugiat pariatur reprehenderit ut sunt. Esse deserunt magna in commodo commodo culpa sit Lorem amet nisi quis voluptate. Esse deserunt ea ullamco proident quis nostrud proident sit consectetur elit.",
    @created_date = "Fri Jan 21 1977 22:24:58 GMT+0000 (UTC)",
    @updated_date = "Thu Oct 04 2012 00:29:55 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 2,
    @cid_type = "hardware",
    @cid_id = 2,
    @requirement_type = "revised_requirement",
    @requirement_id = 2,
    @order_comments = "Id dolor ea ut consectetur quis ipsum consequat. Excepteur Lorem incididunt exercitation ad laboris amet proident sint enim. Aliqua pariatur veniam adipisicing duis eiusmod ipsum pariatur.",
    @priority = "high",
    @expected_completion_date = "Sat Apr 21 2018 14:58:02 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  376866,
    @customer_name =  "INSOURCE",
    @ship_to_address = "515 Drew Street, Clara, Maine, 497",
    @model = "MP 4047SP",
    @old_cid =  "5ad0f02111557e63199222e1",
    @new_cid = "5ad0f0216518fe055bfa349e",
    @soa_instance_id = 3,
    @order_number = 387766,
    @order_line_number = 3,
    @solution = "Sunt occaecat excepteur reprehenderit aliquip duis proident incididunt consectetur velit esse pariatur officia. Tempor officia officia in id irure amet veniam ex culpa. Eiusmod irure voluptate aute sit eiusmod elit duis aliqua occaecat nulla. Amet elit tempor quis irure voluptate. Minim velit elit sunt ea. Mollit irure sint anim eu ut cillum ut labore excepteur quis dolor sunt nisi.",
    @field_config = "Elit nisi elit sint ad voluptate enim. Irure est tempor id duis cupidatat cillum. Culpa ad exercitation pariatur eiusmod veniam laborum cupidatat laborum do commodo.",
    @expiration_date = "Mon May 27 1991 04:16:33 GMT+0000 (UTC)",
    @expiration_reason = "Magna ea ex amet ipsum proident qui exercitation officia est ipsum fugiat et. Laborum velit aute minim culpa dolore non proident reprehenderit qui. Ullamco minim aute eiusmod nisi in aliquip deserunt ex veniam velit. Veniam magna sunt minim aliquip sit dolor quis proident ex mollit ut fugiat.",
    @created_date = "Sun Jun 05 2016 03:01:39 GMT+0000 (UTC)",
    @updated_date = "Wed Apr 28 2010 15:36:26 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 3,
    @cid_type = "hardware",
    @cid_id = 3,
    @requirement_type = "new_requirement",
    @requirement_id = 3,
    @order_comments = "Id esse consequat et ut mollit. Consequat voluptate do cupidatat enim exercitation pariatur mollit consequat commodo tempor. Culpa sunt ex qui incididunt pariatur et. Sunt pariatur excepteur duis magna velit minim aliqua. Nisi pariatur nostrud culpa non id esse sit ipsum ut eiusmod deserunt adipisicing in. Nulla sit quis et esse voluptate tempor.",
    @priority = "medium",
    @expected_completion_date = "Sun Jun 03 2018 23:15:47 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  14129,
    @customer_name =  "NETPLAX",
    @ship_to_address = "356 Bartlett Street, Mansfield, Northern Mariana Islands, 7858",
    @model = "MP 3750SP",
    @old_cid =  "5ad0f021fcbd4549a573b07f",
    @new_cid = "5ad0f021d9468c0629b54454",
    @soa_instance_id = 4,
    @order_number = 846678,
    @order_line_number = 4,
    @solution = "Fugiat id anim veniam duis in dolor consectetur nostrud tempor consectetur esse cupidatat officia elit. Ullamco exercitation enim deserunt minim mollit incididunt consectetur id cupidatat. Et eiusmod Lorem culpa eu incididunt sint elit aliquip aliqua nulla aliquip labore tempor. Culpa deserunt fugiat sint eu pariatur ex magna id Lorem. Nulla consequat labore esse aliquip ipsum. Magna dolor dolore culpa quis voluptate exercitation. Ex velit nulla consequat magna mollit est proident.",
    @field_config = "Nisi ipsum sunt ea dolor occaecat do nulla eu ipsum minim. Ut elit laborum exercitation et officia. Duis velit non voluptate voluptate dolor ut. Ad incididunt magna enim et Lorem do anim nulla ea magna aliqua. Voluptate aute exercitation duis sunt proident officia. Velit magna consequat dolor id minim incididunt eu dolor duis officia commodo.",
    @expiration_date = "Wed Jul 13 2016 23:36:19 GMT+0000 (UTC)",
    @expiration_reason = "Amet nostrud nostrud culpa occaecat non Lorem consequat. Ipsum est in anim tempor non aliqua mollit aute. Nisi culpa dolor aute nulla cillum nisi proident tempor.",
    @created_date = "Fri Apr 10 1992 02:55:34 GMT+0000 (UTC)",
    @updated_date = "Wed Jan 20 2010 04:12:47 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 4,
    @cid_type = "hardware",
    @cid_id = 4,
    @requirement_type = "new_requirement",
    @requirement_id = 4,
    @order_comments = "Culpa occaecat ea fugiat duis. Quis proident excepteur cillum id tempor. Est adipisicing laboris id sit esse aliquip aute dolore adipisicing cupidatat. Consectetur mollit culpa ullamco dolor ad.",
    @priority = "medium",
    @expected_completion_date = "Thu Jun 28 2018 18:15:43 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  400995,
    @customer_name =  "XIIX",
    @ship_to_address = "180 Hillel Place, Villarreal, Nebraska, 4793",
    @model = "MP 4046 TE for Education",
    @old_cid =  "5ad0f0212ef00f1de8460129",
    @new_cid = "5ad0f0215d14655e4127f406",
    @soa_instance_id = 5,
    @order_number = 146515,
    @order_line_number = 5,
    @solution = "Voluptate minim officia dolore nulla occaecat ullamco sit aliqua aute cupidatat eiusmod mollit commodo occaecat. Adipisicing duis ad incididunt tempor est et dolor aliquip et elit consectetur. Adipisicing incididunt ex nostrud aliqua nisi. Aute irure dolor fugiat ullamco duis ipsum velit do velit aliquip in nisi voluptate in.",
    @field_config = "Non consequat pariatur ut velit exercitation sit duis culpa et veniam. Eu elit eu culpa voluptate eu dolore commodo excepteur elit. Veniam veniam velit proident ex qui est dolore quis qui duis laborum. Officia proident cupidatat eu consectetur nostrud aute exercitation in mollit adipisicing aliquip magna. Non cillum ex et consectetur. Culpa voluptate et eiusmod enim labore laboris ex enim.",
    @expiration_date = "Tue Aug 06 1991 15:35:22 GMT+0000 (UTC)",
    @expiration_reason = "Cillum aliqua nisi consequat reprehenderit. Qui est nisi enim quis minim sunt enim et elit ea. Ut voluptate ea consectetur do do incididunt sit ullamco dolor eiusmod. Ea aute do ullamco fugiat. Veniam quis ex officia occaecat voluptate qui laboris quis ex amet aliqua laborum irure. In do adipisicing cupidatat est do cillum voluptate nulla veniam.",
    @created_date = "Wed Jan 06 1988 01:28:02 GMT+0000 (UTC)",
    @updated_date = "Sat Mar 19 1983 15:30:09 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 5,
    @cid_type = "hardware",
    @cid_id = 5,
    @requirement_type = "new_requirement",
    @requirement_id = 5,
    @order_comments = "Ad dolor irure magna cillum laborum qui commodo pariatur. Nulla cupidatat in laborum cillum enim dolor quis sunt qui consequat Lorem. Veniam velit sunt elit eu ut non est ut consectetur in qui id minim.",
    @priority = "high",
    @expected_completion_date = "Mon Apr 23 2018 10:19:47 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  38730,
    @customer_name =  "INQUALA",
    @ship_to_address = "903 Bowne Street, Kidder, Ohio, 3700",
    @model = "MP 2823SP",
    @old_cid =  "5ad0f021255418ab62cf2214",
    @new_cid = "5ad0f0219af50a2159fbec1a",
    @soa_instance_id = 6,
    @order_number = 476002,
    @order_line_number = 6,
    @solution = "Proident magna adipisicing magna Lorem qui officia irure velit proident laborum enim ex commodo duis. Non nostrud elit cupidatat reprehenderit. Proident mollit amet incididunt dolore sit. Excepteur culpa ex sunt dolore cupidatat do quis non velit consequat sint in ex ex. Consectetur nostrud velit et qui eiusmod ad ex tempor mollit in velit labore incididunt velit. Magna excepteur enim veniam deserunt et enim. Ullamco enim sint dolore esse.",
    @field_config = "Sint velit duis voluptate minim veniam occaecat adipisicing nisi ullamco est reprehenderit excepteur dolore eiusmod. Magna veniam esse pariatur aliqua eu consectetur. Adipisicing reprehenderit sit ex occaecat esse sunt aliqua.",
    @expiration_date = "Sat Dec 12 1998 19:20:55 GMT+0000 (UTC)",
    @expiration_reason = "Magna ex elit adipisicing duis cillum. Culpa nisi et cillum minim aute anim incididunt quis ea excepteur laborum consectetur. Amet velit reprehenderit aliqua ullamco dolore velit officia dolor mollit. Eu nisi et anim sit.",
    @created_date = "Sat Jul 21 2007 13:31:49 GMT+0000 (UTC)",
    @updated_date = "Fri Apr 27 2012 15:16:21 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 6,
    @cid_type = "hardware",
    @cid_id = 6,
    @requirement_type = "revised_requirement",
    @requirement_id = 6,
    @order_comments = "Laboris ex consectetur tempor ut cillum voluptate nulla Lorem mollit ullamco laboris nulla esse. Aute irure adipisicing anim minim cillum irure Lorem eu consequat duis veniam incididunt. Commodo aliquip nulla anim pariatur do excepteur sunt ut Lorem do enim fugiat.",
    @priority = "low",
    @expected_completion_date = "Sat May 19 2018 03:23:00 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  25060,
    @customer_name =  "COMTEXT",
    @ship_to_address = "128 Rockaway Avenue, Albrightsville, Alabama, 3481",
    @model = "MP 3851TE",
    @old_cid =  "5ad0f021ed1279f63b2f5884",
    @new_cid = "5ad0f0219aaa99dbf4772889",
    @soa_instance_id = 7,
    @order_number = 417888,
    @order_line_number = 7,
    @solution = "Adipisicing mollit dolor reprehenderit minim reprehenderit anim velit quis adipisicing occaecat irure qui. Sit do minim adipisicing elit veniam irure est ex elit officia sit. Labore quis voluptate ex veniam ut aute magna elit proident. Reprehenderit aliquip voluptate esse cillum quis eu ullamco minim laborum consequat ipsum duis. Mollit cupidatat pariatur labore mollit. Culpa proident occaecat velit ad enim. Consequat do anim veniam laboris pariatur ea et ea.",
    @field_config = "Aliquip duis anim excepteur ad occaecat nulla. Ipsum duis qui magna et et irure enim. Ad est quis reprehenderit est anim est id in.",
    @expiration_date = "Mon Jul 22 1991 19:54:05 GMT+0000 (UTC)",
    @expiration_reason = "Elit quis dolor ut fugiat aliqua in elit mollit laboris. Excepteur exercitation ipsum labore proident laborum dolore qui Lorem. Enim et in excepteur culpa. Consequat aute occaecat qui velit ex ut adipisicing eu.",
    @created_date = "Tue Jul 01 2003 00:53:48 GMT+0000 (UTC)",
    @updated_date = "Fri Jul 31 1987 21:18:50 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 7,
    @cid_type = "hardware",
    @cid_id = 7,
    @requirement_type = "new_requirement",
    @requirement_id = 7,
    @order_comments = "Veniam enim velit nostrud Lorem. Lorem sunt eu est ea deserunt eu dolore magna voluptate. Velit nisi nostrud sunt eiusmod.",
    @priority = "high",
    @expected_completion_date = "Fri Jun 29 2018 05:31:47 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  130433,
    @customer_name =  "QUAILCOM",
    @ship_to_address = "740 Norwood Avenue, Dale, Massachusetts, 744",
    @model = "MP 3744 TE for Education",
    @old_cid =  "5ad0f021263bfb9123d1fe3b",
    @new_cid = "5ad0f021c04e3cf71145d65d",
    @soa_instance_id = 8,
    @order_number = 61079,
    @order_line_number = 8,
    @solution = "Magna ea voluptate cillum est. Esse ea aute pariatur esse in nostrud aute Lorem duis et cupidatat consectetur. Ad ipsum minim labore non commodo aliqua qui proident eiusmod aute enim. Non consequat consectetur velit do sunt dolor eiusmod duis. Excepteur non anim culpa laboris voluptate exercitation.",
    @field_config = "Adipisicing irure veniam fugiat nulla et et aliqua. Est laboris adipisicing dolore incididunt aliqua officia elit laboris sit laboris anim ad in. Consequat dolore mollit aliquip est veniam. Cillum sint sit elit laboris laboris esse dolor occaecat quis incididunt ea.",
    @expiration_date = "Wed Sep 03 2014 23:52:58 GMT+0000 (UTC)",
    @expiration_reason = "Veniam incididunt id sit quis ut ullamco ullamco. Id id sint tempor voluptate pariatur ullamco consectetur dolore amet ex exercitation aliquip. Consectetur esse adipisicing occaecat esse nisi commodo do cupidatat deserunt pariatur cupidatat exercitation ipsum. Minim irure duis exercitation laborum in ea ea et dolor elit laborum reprehenderit ea. Velit esse laborum eu elit irure adipisicing laboris.",
    @created_date = "Thu May 18 2017 05:32:06 GMT+0000 (UTC)",
    @updated_date = "Sat Jul 16 2005 21:45:28 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 8,
    @cid_type = "hardware",
    @cid_id = 8,
    @requirement_type = "revised_requirement",
    @requirement_id = 8,
    @order_comments = "Tempor quis ullamco sit reprehenderit excepteur cillum do consequat exercitation veniam anim. Quis exercitation nostrud sunt commodo consequat eu ad nulla ut. Excepteur labore reprehenderit quis adipisicing aliquip consectetur sint adipisicing sint quis proident. Veniam duis officia proident minim aliquip excepteur amet anim eiusmod consectetur. In occaecat nostrud labore quis pariatur. Quis irure quis nisi amet velit tempor ullamco eu dolor dolore.",
    @priority = "low",
    @expected_completion_date = "Tue May 01 2018 00:25:24 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  211776,
    @customer_name =  "ZILLAR",
    @ship_to_address = "160 Hawthorne Street, Joppa, Virginia, 1507",
    @model = "MP 3859TE",
    @old_cid =  "5ad0f0214ec6ef03f31ee6f4",
    @new_cid = "5ad0f021da42fa023916d1db",
    @soa_instance_id = 9,
    @order_number = 628983,
    @order_line_number = 9,
    @solution = "Laboris consequat non enim cupidatat cillum voluptate. Mollit fugiat amet ea ullamco cupidatat occaecat cillum in quis incididunt ullamco sit proident pariatur. Commodo irure eiusmod ea sunt esse sit in sunt amet dolore cillum id. Velit consequat aliquip duis amet dolor veniam culpa pariatur et dolore anim voluptate magna laboris. Ipsum in quis cillum et sit adipisicing do incididunt elit quis sit irure.",
    @field_config = "Ex occaecat voluptate cupidatat duis pariatur qui aliqua ex non nostrud mollit. Qui proident do ad nostrud amet. Sit veniam id dolor do ad consequat aute.",
    @expiration_date = "Sat Oct 24 2015 19:27:44 GMT+0000 (UTC)",
    @expiration_reason = "Qui quis mollit commodo laborum proident Lorem mollit qui dolor. Laborum aute sit elit tempor deserunt irure velit do nostrud amet ea excepteur nostrud velit. Veniam exercitation Lorem nostrud Lorem labore ex labore laboris. Nostrud ea proident nulla sunt. Nostrud est in sit occaecat eu et. Id qui cupidatat aute ea reprehenderit amet officia minim esse id sit ex.",
    @created_date = "Sun Feb 01 1970 13:01:47 GMT+0000 (UTC)",
    @updated_date = "Tue Jul 12 1994 22:35:13 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 9,
    @cid_type = "software",
    @cid_id = 9,
    @requirement_type = "revised_requirement",
    @requirement_id = 9,
    @order_comments = "Excepteur labore adipisicing est aute ad deserunt. Duis nisi do laboris eu dolore nisi voluptate laboris et fugiat et adipisicing irure. Ipsum consequat velit aliqua do nulla sunt nulla ullamco ullamco non et labore do. Veniam sint ea dolore ad amet ipsum anim in reprehenderit anim. Proident et quis nisi labore. Dolor consectetur pariatur voluptate cupidatat id tempor. Officia amet elit consectetur dolor labore aute deserunt.",
    @priority = "low",
    @expected_completion_date = "Sat Apr 28 2018 05:53:08 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  277135,
    @customer_name =  "XERONK",
    @ship_to_address = "846 Taylor Street, Allamuchy, Nevada, 6588",
    @model = "MP 3546 TE for Education",
    @old_cid =  "5ad0f02187718ae8380586a9",
    @new_cid = "5ad0f0211965f0557917e4d7",
    @soa_instance_id = 10,
    @order_number = 93986,
    @order_line_number = 10,
    @solution = "In anim minim ea sit deserunt dolore aliquip ex. Nulla irure ut quis anim labore et labore anim commodo reprehenderit. Veniam culpa labore nostrud aliqua nulla est adipisicing nulla adipisicing. Officia deserunt elit occaecat ad eiusmod occaecat do esse irure ullamco id. Exercitation do sint consequat labore aliqua ad ut laborum enim in adipisicing veniam ut reprehenderit. Labore magna reprehenderit aliquip veniam labore mollit duis elit amet amet deserunt.",
    @field_config = "Pariatur elit esse amet enim sit enim irure sunt deserunt laboris in exercitation qui. Incididunt tempor est culpa amet reprehenderit. Ipsum occaecat exercitation voluptate magna culpa veniam eu ipsum id nostrud labore. Irure consequat veniam nisi aliqua et. Eu dolore ad esse nostrud et esse occaecat mollit et. Minim occaecat tempor quis est. Dolor cillum anim reprehenderit nulla qui aliquip ut occaecat sit dolor ex et sunt.",
    @expiration_date = "Fri Aug 17 1973 23:12:01 GMT+0000 (UTC)",
    @expiration_reason = "Proident culpa laboris irure tempor quis voluptate. Commodo tempor laborum consequat consectetur non. Excepteur culpa sit veniam id nulla excepteur ipsum. Do elit fugiat laboris voluptate est nostrud. Exercitation eiusmod do voluptate excepteur aliqua occaecat duis. Cupidatat nisi dolore sint ut fugiat incididunt.",
    @created_date = "Sat Oct 04 1975 22:43:37 GMT+0000 (UTC)",
    @updated_date = "Mon Mar 21 2005 00:21:07 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 10,
    @cid_type = "hardware",
    @cid_id = 10,
    @requirement_type = "revised_requirement",
    @requirement_id = 10,
    @order_comments = "Laboris deserunt magna voluptate pariatur consequat duis. Amet in id exercitation ex cupidatat labore ullamco. Ad veniam aliquip laboris amet nisi laborum Lorem ipsum pariatur minim ut elit esse.",
    @priority = "low",
    @expected_completion_date = "Thu May 03 2018 23:52:26 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  254069,
    @customer_name =  "SNACKTION",
    @ship_to_address = "189 Conklin Avenue, Trexlertown, Oklahoma, 1669",
    @model = "MP 3777SP",
    @old_cid =  "5ad0f0210c1336856862fa65",
    @new_cid = "5ad0f021334b6ffdc6649c50",
    @soa_instance_id = 11,
    @order_number = 507418,
    @order_line_number = 11,
    @solution = "Non ad nisi magna cupidatat sit elit ullamco. Eu voluptate nisi elit incididunt consequat est ea nulla id. Eiusmod ad ut anim enim nisi deserunt nulla dolor tempor ipsum aliquip ad mollit proident.",
    @field_config = "Officia exercitation eu velit anim irure sit excepteur. Aute nisi tempor esse duis proident laboris minim dolor ut proident qui. Voluptate aliquip cupidatat ex tempor ipsum culpa ut adipisicing minim occaecat minim labore eu. Enim cillum elit pariatur labore laborum quis non consequat esse in ex. Do magna exercitation esse minim proident dolore ex consectetur in aliquip cupidatat mollit. Exercitation fugiat dolor nisi veniam fugiat aliqua dolore ea.",
    @expiration_date = "Mon Jul 15 2013 09:20:33 GMT+0000 (UTC)",
    @expiration_reason = "Nulla aute est pariatur ullamco enim dolor consectetur proident laborum nisi laborum. Velit voluptate incididunt incididunt consequat magna nulla voluptate ullamco anim. Anim aute exercitation qui ea ullamco quis excepteur est quis nulla in et proident. Do est enim labore tempor id sit. Dolor sint aliquip proident laboris id in duis adipisicing.",
    @created_date = "Tue Jan 19 1988 14:07:19 GMT+0000 (UTC)",
    @updated_date = "Tue Mar 10 2015 23:56:01 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 11,
    @cid_type = "software",
    @cid_id = 11,
    @requirement_type = "revised_requirement",
    @requirement_id = 11,
    @order_comments = "Culpa voluptate cupidatat sunt consequat enim velit excepteur. Exercitation ullamco magna cillum tempor pariatur. Ea eiusmod magna mollit aute ex voluptate aute in sint nisi occaecat officia ad nulla. Lorem laborum eu quis nulla velit cillum voluptate duis ullamco ex aliqua duis mollit adipisicing. Culpa non quis adipisicing do elit aliqua enim est dolor ea deserunt voluptate.",
    @priority = "high",
    @expected_completion_date = "Tue Jun 05 2018 08:26:08 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  291733,
    @customer_name =  "JASPER",
    @ship_to_address = "138 Frost Street, Veguita, Montana, 6518",
    @model = "MP 2355SP",
    @old_cid =  "5ad0f02162fc66b720d8100c",
    @new_cid = "5ad0f021b79de54dcc4771f5",
    @soa_instance_id = 12,
    @order_number = 473002,
    @order_line_number = 12,
    @solution = "In ullamco aute fugiat id eiusmod culpa id. Veniam eu sit exercitation aliquip do consectetur et cupidatat sint. Mollit excepteur id do consectetur.",
    @field_config = "Reprehenderit nisi minim magna reprehenderit enim commodo. Exercitation voluptate duis nisi ea sint excepteur ut laborum veniam cillum laboris consectetur ipsum. Ad irure officia non officia culpa nisi irure Lorem fugiat non culpa. Et elit occaecat pariatur labore dolore culpa sint excepteur deserunt consectetur sit cupidatat aliqua.",
    @expiration_date = "Mon Mar 18 1985 12:31:57 GMT+0000 (UTC)",
    @expiration_reason = "Ea non in proident eiusmod occaecat aute officia minim reprehenderit minim adipisicing dolore deserunt. Ullamco amet fugiat dolore quis labore. Voluptate minim dolore est in nisi nisi eu sunt eu. Exercitation sit labore duis qui voluptate eiusmod. Id ex ad labore irure cupidatat. Nostrud duis aliquip adipisicing adipisicing do exercitation excepteur tempor magna.",
    @created_date = "Thu Apr 28 1983 14:11:03 GMT+0000 (UTC)",
    @updated_date = "Wed Feb 03 1971 01:17:07 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 12,
    @cid_type = "hardware",
    @cid_id = 12,
    @requirement_type = "new_requirement",
    @requirement_id = 12,
    @order_comments = "Minim aliquip in reprehenderit ut nisi dolore do. Velit id dolore et cillum velit magna deserunt adipisicing id enim Lorem officia incididunt. Laborum proident officia ad Lorem occaecat consequat ipsum ea culpa ut eiusmod sit.",
    @priority = "medium",
    @expected_completion_date = "Sun May 27 2018 02:13:26 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  417939,
    @customer_name =  "INJOY",
    @ship_to_address = "316 Lefferts Avenue, Deercroft, South Dakota, 1732",
    @model = "MP 3604SP",
    @old_cid =  "5ad0f0219c233bed13322366",
    @new_cid = "5ad0f02186662bc4a02c23cd",
    @soa_instance_id = 13,
    @order_number = 646428,
    @order_line_number = 13,
    @solution = "Quis ullamco ad cupidatat officia nostrud ipsum sunt officia in eiusmod. Sit laborum dolor commodo veniam amet. Est deserunt qui consequat nulla culpa sunt esse officia.",
    @field_config = "Culpa consectetur velit deserunt et reprehenderit ad Lorem ipsum officia eiusmod reprehenderit ullamco. Eu cupidatat culpa amet consectetur. Fugiat sit culpa incididunt proident ad.",
    @expiration_date = "Sun Jan 04 1981 19:18:13 GMT+0000 (UTC)",
    @expiration_reason = "Pariatur dolor voluptate consequat dolor irure duis incididunt anim. Aliqua ullamco qui minim ipsum irure exercitation aliqua. Enim duis excepteur elit labore et dolor duis non adipisicing dolor labore nulla pariatur amet. Sit dolore excepteur esse culpa tempor. Aliqua ipsum minim veniam in culpa.",
    @created_date = "Tue Aug 06 2013 21:06:24 GMT+0000 (UTC)",
    @updated_date = "Mon Apr 25 1983 20:41:37 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 13,
    @cid_type = "software",
    @cid_id = 13,
    @requirement_type = "new_requirement",
    @requirement_id = 13,
    @order_comments = "Et aliquip aliquip velit culpa tempor veniam fugiat proident consequat. Ut qui veniam ad dolore excepteur consectetur qui. Ea cupidatat enim ipsum aliquip reprehenderit nulla pariatur ut in sint ullamco exercitation laboris ea. Velit deserunt ea exercitation velit ea incididunt enim ad aute adipisicing officia. Id anim Lorem aliqua laborum non. Id ex dolore veniam incididunt enim sit officia eu ad.",
    @priority = "low",
    @expected_completion_date = "Fri May 18 2018 00:54:59 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  338015,
    @customer_name =  "ISOSWITCH",
    @ship_to_address = "566 Coleridge Street, Wells, Wyoming, 4636",
    @model = "MP 3001SP",
    @old_cid =  "5ad0f0213cacf3b05c6a832d",
    @new_cid = "5ad0f021998dffccce2d7f02",
    @soa_instance_id = 14,
    @order_number = 700412,
    @order_line_number = 14,
    @solution = "Nulla proident eu aute proident dolor irure consequat amet. Velit ut eiusmod et anim ad tempor cupidatat anim ut. Ullamco eiusmod aute magna irure adipisicing incididunt in ullamco.",
    @field_config = "Dolore commodo quis voluptate commodo ea reprehenderit dolore qui consequat irure enim enim. Mollit Lorem enim in aliquip labore quis adipisicing deserunt laborum esse dolor. Consequat sit officia duis ullamco fugiat non aliquip officia non deserunt non aliqua esse. Non nostrud exercitation nisi ipsum.",
    @expiration_date = "Thu Jun 23 2011 20:04:10 GMT+0000 (UTC)",
    @expiration_reason = "Laborum sunt voluptate irure aliqua velit pariatur commodo enim cillum voluptate mollit occaecat magna ex. Anim incididunt qui occaecat duis consectetur. Dolore veniam anim elit in.",
    @created_date = "Sun Sep 12 1993 18:01:32 GMT+0000 (UTC)",
    @updated_date = "Fri Jan 23 1970 07:06:39 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 14,
    @cid_type = "hardware",
    @cid_id = 14,
    @requirement_type = "revised_requirement",
    @requirement_id = 14,
    @order_comments = "Nulla incididunt tempor fugiat aute commodo labore sit nisi nostrud ea voluptate magna magna. Sunt mollit anim nostrud cupidatat amet in in laborum. Irure pariatur fugiat sint laboris. Aliquip nulla mollit est ex magna adipisicing cupidatat elit id Lorem nulla laborum. Aute enim mollit non ad.",
    @priority = "high",
    @expected_completion_date = "Thu Jun 07 2018 01:51:09 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  378272,
    @customer_name =  "DAIDO",
    @ship_to_address = "251 Arion Place, Barstow, Wisconsin, 6717",
    @model = "MP 2899TE",
    @old_cid =  "5ad0f0218558c96e30c1566c",
    @new_cid = "5ad0f0213c6ae4b449470be3",
    @soa_instance_id = 15,
    @order_number = 367426,
    @order_line_number = 15,
    @solution = "Ea irure cupidatat duis officia non culpa sunt aute mollit elit. Id laboris dolore amet enim id laboris laborum. Qui velit enim enim sit sunt aliqua velit quis laboris. Sint consectetur aliqua et dolor cillum reprehenderit. Ex et amet tempor in dolore. Exercitation quis aute ex excepteur amet ut mollit exercitation veniam aliqua commodo adipisicing. Lorem et et quis deserunt nulla veniam proident anim sit adipisicing.",
    @field_config = "Veniam irure qui consectetur voluptate incididunt nostrud. Et mollit non dolore duis labore laboris amet et. Incididunt ea ut magna id aute amet. Ad irure mollit dolor mollit incididunt magna sunt commodo aliqua et consequat ullamco occaecat aliquip. Fugiat veniam incididunt incididunt sit incididunt enim tempor. Ipsum nostrud ad voluptate amet est Lorem magna.",
    @expiration_date = "Tue Nov 03 1970 01:03:28 GMT+0000 (UTC)",
    @expiration_reason = "Non ut laborum proident mollit exercitation amet amet excepteur duis sit eu eu incididunt. Nulla incididunt eiusmod incididunt ea sint anim anim consectetur labore dolore exercitation ullamco sint. Pariatur ullamco sit eiusmod est eiusmod velit qui do excepteur non excepteur nostrud quis. Nostrud quis irure aliqua amet elit.",
    @created_date = "Thu Dec 19 1991 04:43:33 GMT+0000 (UTC)",
    @updated_date = "Sat Mar 11 2017 03:56:09 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 15,
    @cid_type = "software",
    @cid_id = 15,
    @requirement_type = "new_requirement",
    @requirement_id = 15,
    @order_comments = "Duis eu reprehenderit pariatur culpa. Duis magna officia culpa quis labore ea ullamco sunt pariatur nisi duis tempor nostrud. Voluptate cupidatat culpa in do. Ipsum id velit exercitation esse nostrud aliqua dolor laboris elit fugiat nostrud enim ipsum culpa.",
    @priority = "medium",
    @expected_completion_date = "Thu Apr 19 2018 00:16:22 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  334003,
    @customer_name =  "PERMADYNE",
    @ship_to_address = "516 Gatling Place, Edneyville, Arkansas, 6771",
    @model = "MP 3115TE",
    @old_cid =  "5ad0f02169f966ea3b4bdecc",
    @new_cid = "5ad0f0212be2a751f770f0e0",
    @soa_instance_id = 16,
    @order_number = 487756,
    @order_line_number = 16,
    @solution = "Minim veniam dolor adipisicing enim culpa duis ipsum cupidatat aute nostrud. Voluptate aliquip tempor tempor pariatur mollit. Labore ad Lorem amet id tempor. Id nisi proident aliquip aliquip aute. Consequat deserunt eu minim et qui dolore aliqua laboris dolor deserunt laboris adipisicing quis.",
    @field_config = "Quis cillum labore enim mollit occaecat adipisicing eu tempor. Exercitation eiusmod eiusmod ex culpa ipsum aliqua in velit nostrud. Quis non amet minim voluptate. Et nulla cupidatat tempor non reprehenderit nulla ad. Ea exercitation velit anim dolore sunt. Sit ea nulla elit commodo ad irure esse qui veniam excepteur ut nisi nisi. Adipisicing aute dolore amet quis velit in est nisi officia.",
    @expiration_date = "Tue Nov 01 1983 05:28:04 GMT+0000 (UTC)",
    @expiration_reason = "Dolore adipisicing occaecat eiusmod minim ea pariatur ut id nisi tempor aliqua. Excepteur velit labore reprehenderit laboris. Nulla velit est aute adipisicing dolore commodo culpa.",
    @created_date = "Fri Dec 04 1970 06:50:56 GMT+0000 (UTC)",
    @updated_date = "Fri Jun 27 2008 05:43:23 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 16,
    @cid_type = "software",
    @cid_id = 16,
    @requirement_type = "revised_requirement",
    @requirement_id = 16,
    @order_comments = "Adipisicing cillum voluptate sint ea eiusmod ea proident dolor mollit irure consequat ex sint aliquip. Dolore consequat ipsum occaecat irure veniam laborum pariatur deserunt cillum cillum eiusmod anim eu. Pariatur magna quis elit proident enim veniam aliquip veniam dolor mollit elit nulla ea deserunt. Consequat minim nulla laborum occaecat laboris amet. Proident ex nisi tempor exercitation pariatur cillum dolor qui. Non dolore qui ad cupidatat aliquip exercitation officia in et laboris irure enim. Aute qui occaecat cillum ea ullamco nisi laborum.",
    @priority = "low",
    @expected_completion_date = "Thu Jun 28 2018 07:06:47 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  280758,
    @customer_name =  "VORTEXACO",
    @ship_to_address = "523 Degraw Street, Wattsville, Palau, 9049",
    @model = "MP 3252SP",
    @old_cid =  "5ad0f021ae0df97f06e213a7",
    @new_cid = "5ad0f02148e588d60b71e7b7",
    @soa_instance_id = 17,
    @order_number = 83182,
    @order_line_number = 17,
    @solution = "Exercitation ex reprehenderit dolore qui exercitation sit quis laborum excepteur. Sunt magna deserunt cillum ad excepteur quis laboris cupidatat consectetur enim nisi sint. Eiusmod nisi sint nulla quis. Ea id duis cupidatat amet consectetur occaecat officia mollit ullamco minim amet.",
    @field_config = "Quis laboris ad do irure consectetur nisi occaecat sit dolor magna consectetur incididunt veniam minim. Deserunt laborum ipsum eiusmod ipsum nisi do duis minim. Et dolor ullamco velit aliqua aliqua sunt officia enim non aute duis est pariatur Lorem. Et deserunt enim ipsum aliqua minim qui pariatur dolor voluptate esse ad. Adipisicing enim voluptate ipsum culpa magna dolore minim magna mollit dolore ex adipisicing. Commodo laboris commodo minim cillum amet dolore aliqua et qui et. Ea ea dolore esse enim voluptate adipisicing ex fugiat eu Lorem id amet ut.",
    @expiration_date = "Thu Apr 04 1985 03:44:32 GMT+0000 (UTC)",
    @expiration_reason = "Est duis qui in ex elit veniam sit excepteur. Mollit sit laboris tempor reprehenderit. Et nostrud dolore cupidatat tempor ipsum.",
    @created_date = "Tue Jan 29 1980 02:34:31 GMT+0000 (UTC)",
    @updated_date = "Thu Mar 25 1999 22:28:39 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 17,
    @cid_type = "hardware",
    @cid_id = 17,
    @requirement_type = "revised_requirement",
    @requirement_id = 17,
    @order_comments = "Consequat dolore mollit voluptate nisi in fugiat. Consequat sunt tempor ullamco proident consectetur do deserunt. Aute deserunt ullamco eu nostrud aute adipisicing. Aute nulla adipisicing eu laborum eu Lorem reprehenderit sunt sint voluptate nisi. Quis non ex commodo duis aliquip. Ipsum sit Lorem ut et officia ullamco.",
    @priority = "medium",
    @expected_completion_date = "Mon Jun 11 2018 21:28:18 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  22857,
    @customer_name =  "EDECINE",
    @ship_to_address = "533 Gilmore Court, Welch, Colorado, 1929",
    @model = "MP 3089 TE for Education",
    @old_cid =  "5ad0f021c7ab62cd75439a2f",
    @new_cid = "5ad0f021921233d43aca5fa1",
    @soa_instance_id = 18,
    @order_number = 975344,
    @order_line_number = 18,
    @solution = "Ea non aliquip laboris consequat proident sint ea occaecat elit Lorem reprehenderit ipsum anim aute. Ea est magna esse commodo laboris id amet eu non pariatur laboris ea reprehenderit irure. Amet cillum consectetur sint aliquip cupidatat dolore pariatur anim. Esse cupidatat ullamco dolore deserunt.",
    @field_config = "Deserunt ad cupidatat occaecat enim duis ipsum duis excepteur ad officia magna. Exercitation occaecat non quis officia ut. Duis aliquip elit exercitation in culpa culpa pariatur do laboris.",
    @expiration_date = "Wed Nov 24 1993 21:22:20 GMT+0000 (UTC)",
    @expiration_reason = "Veniam dolore duis in eiusmod aliqua mollit id veniam laboris mollit velit duis laborum. Est cillum dolore voluptate incididunt irure in aute eu commodo tempor ullamco deserunt. Cupidatat proident nostrud mollit laborum commodo commodo excepteur mollit cillum minim est. Commodo nisi do nostrud voluptate esse laborum adipisicing eu deserunt non.",
    @created_date = "Sat Nov 13 1993 11:06:02 GMT+0000 (UTC)",
    @updated_date = "Sun Jan 07 1973 20:02:40 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 18,
    @cid_type = "hardware",
    @cid_id = 18,
    @requirement_type = "new_requirement",
    @requirement_id = 18,
    @order_comments = "Labore nisi culpa exercitation minim aute qui labore labore duis Lorem aliqua duis quis. Duis sit labore sit laborum exercitation. Magna veniam deserunt voluptate aute minim veniam excepteur laborum incididunt. Laboris et commodo nisi ullamco.",
    @priority = "high",
    @expected_completion_date = "Tue May 22 2018 10:02:08 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  90847,
    @customer_name =  "ROOFORIA",
    @ship_to_address = "188 Jaffray Street, Fairacres, Vermont, 7193",
    @model = "MP 2950SP",
    @old_cid =  "5ad0f021e4a00db82a1275f8",
    @new_cid = "5ad0f02199eb48c7d394c664",
    @soa_instance_id = 19,
    @order_number = 200556,
    @order_line_number = 19,
    @solution = "Est dolor non dolore voluptate consequat et cillum reprehenderit ad pariatur cupidatat. Dolor labore ut nostrud quis magna dolor tempor eiusmod deserunt non veniam. Excepteur eiusmod dolor cillum esse aliquip reprehenderit consequat. Aliquip exercitation duis exercitation in ipsum. Sint exercitation cupidatat exercitation non nostrud qui aliqua et aliquip ea excepteur labore quis.",
    @field_config = "Eu in labore proident et. Sint aute non eu mollit amet anim anim ad magna. Velit anim nulla dolor aute id velit qui mollit proident pariatur irure velit. Incididunt in nulla id est esse velit do quis. Dolore incididunt Lorem sint dolore reprehenderit deserunt nulla irure. Minim in et et veniam elit tempor anim nulla commodo adipisicing dolore qui.",
    @expiration_date = "Thu Nov 21 1991 16:53:26 GMT+0000 (UTC)",
    @expiration_reason = "Esse quis minim officia occaecat do ad sint ad. Dolor ex commodo mollit officia cillum veniam. Ea ea excepteur dolor quis.",
    @created_date = "Sun Dec 25 1983 22:37:18 GMT+0000 (UTC)",
    @updated_date = "Sat Mar 14 1987 02:54:32 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 19,
    @cid_type = "software",
    @cid_id = 19,
    @requirement_type = "new_requirement",
    @requirement_id = 19,
    @order_comments = "Ea elit ea est voluptate enim ipsum esse ad velit Lorem proident non dolor. Nostrud mollit tempor eu proident quis ipsum aliqua velit duis officia. Et irure ullamco ipsum enim anim incididunt Lorem adipisicing culpa laborum dolor ut.",
    @priority = "medium",
    @expected_completion_date = "Fri May 04 2018 11:48:36 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  108766,
    @customer_name =  "ZEAM",
    @ship_to_address = "822 Dennett Place, Guilford, Guam, 683",
    @model = "MP 3896SP",
    @old_cid =  "5ad0f021d652ad5a499fb02c",
    @new_cid = "5ad0f021ab86ebfa53ff1687",
    @soa_instance_id = 20,
    @order_number = 198352,
    @order_line_number = 20,
    @solution = "Pariatur eu ex aute ullamco do ipsum. Enim et cillum ad sunt ea laborum commodo ad excepteur et amet dolor. Ad ipsum id nulla incididunt excepteur nostrud laboris adipisicing ea. Laborum sint culpa excepteur exercitation culpa ut reprehenderit incididunt cupidatat dolore sint ullamco. Amet aliqua magna quis laborum quis consectetur voluptate veniam commodo culpa. Ipsum deserunt ipsum duis anim.",
    @field_config = "Pariatur eiusmod reprehenderit minim in in occaecat pariatur in ad qui id dolor magna. Cupidatat ad anim deserunt ad sit. Ullamco minim do cillum adipisicing consequat Lorem reprehenderit. Ullamco sit occaecat in aute do esse. Ullamco duis reprehenderit esse anim excepteur enim aliquip Lorem. Anim occaecat anim eu veniam consectetur occaecat deserunt dolor consequat. Amet dolor culpa culpa voluptate ut aliquip amet enim quis ad ut veniam do laboris.",
    @expiration_date = "Tue Dec 14 1993 08:57:00 GMT+0000 (UTC)",
    @expiration_reason = "Reprehenderit tempor ut reprehenderit pariatur duis in tempor consectetur eiusmod deserunt elit. Occaecat qui esse proident tempor sit consectetur consequat. Cupidatat irure est enim tempor. Quis magna consectetur magna do. Anim do dolor mollit adipisicing exercitation ex sit sunt consectetur magna. Enim eiusmod deserunt nulla anim ipsum nostrud aliquip fugiat eu.",
    @created_date = "Mon May 03 2010 08:16:54 GMT+0000 (UTC)",
    @updated_date = "Sat Mar 28 1981 13:36:50 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 20,
    @cid_type = "hardware",
    @cid_id = 20,
    @requirement_type = "revised_requirement",
    @requirement_id = 20,
    @order_comments = "Laboris occaecat sint sint dolore dolore laboris nulla laborum. Aliqua aute nulla in esse sint anim. Quis voluptate aute mollit adipisicing consectetur adipisicing ullamco ipsum est velit anim aliqua consectetur irure.",
    @priority = "high",
    @expected_completion_date = "Fri Jun 08 2018 12:40:18 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  305084,
    @customer_name =  "ZOSIS",
    @ship_to_address = "793 Rock Street, Stevens, Georgia, 5542",
    @model = "MP 2395 TE for Education",
    @old_cid =  "5ad0f021708221932f7de68e",
    @new_cid = "5ad0f021dd842d2c1e450c5e",
    @soa_instance_id = 21,
    @order_number = 520527,
    @order_line_number = 21,
    @solution = "Pariatur laborum est exercitation labore proident ipsum irure amet mollit in incididunt consectetur laborum. Anim et veniam excepteur laboris. Excepteur deserunt nulla eiusmod ipsum mollit ut consequat est. Incididunt velit consequat duis cillum irure fugiat nisi nostrud veniam. Veniam ullamco ad do amet aliquip deserunt officia exercitation pariatur veniam ut.",
    @field_config = "Sint laborum nulla nisi sit occaecat dolore culpa proident deserunt exercitation non qui reprehenderit magna. Consequat sunt officia cupidatat excepteur cupidatat dolore incididunt. Tempor quis irure veniam veniam id ad ut et ea eu aliquip quis. Labore proident in voluptate ad. Ex qui sunt aliquip ipsum veniam excepteur officia est ipsum tempor sint.",
    @expiration_date = "Fri Sep 13 2002 11:11:57 GMT+0000 (UTC)",
    @expiration_reason = "Ipsum reprehenderit in magna nulla eu cillum. Commodo eiusmod esse et dolor sunt quis commodo. Proident dolore nostrud cupidatat ut nisi aliqua eu Lorem enim tempor deserunt cupidatat cillum nisi. Duis anim aliquip aute aliquip consectetur ad fugiat adipisicing reprehenderit. Exercitation culpa laboris dolor excepteur labore nisi ullamco sit.",
    @created_date = "Mon Dec 07 2009 10:29:42 GMT+0000 (UTC)",
    @updated_date = "Thu Jun 15 1989 23:53:37 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 21,
    @cid_type = "software",
    @cid_id = 21,
    @requirement_type = "new_requirement",
    @requirement_id = 21,
    @order_comments = "Ea aliqua irure nostrud in tempor veniam deserunt. Deserunt ipsum et exercitation excepteur commodo labore et consequat cupidatat ut magna aute culpa elit. Tempor irure Lorem laborum do in aliqua nisi. In ullamco in quis ad. Do esse sunt veniam excepteur sint. Dolor cillum proident culpa sint id culpa veniam dolor esse exercitation labore irure officia. Duis ex velit dolore enim cillum laboris eu.",
    @priority = "low",
    @expected_completion_date = "Tue Jun 26 2018 08:26:07 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  21584,
    @customer_name =  "GENESYNK",
    @ship_to_address = "192 Box Street, Westwood, Tennessee, 9112",
    @model = "MP 3072 TE for Education",
    @old_cid =  "5ad0f0217f8926bf48295e81",
    @new_cid = "5ad0f0218d4e69038f88863b",
    @soa_instance_id = 22,
    @order_number = 925208,
    @order_line_number = 22,
    @solution = "Ad tempor ullamco dolore exercitation fugiat culpa mollit sunt officia anim. Excepteur ea ut ea deserunt in sint. Sunt occaecat reprehenderit ipsum laborum exercitation nulla Lorem elit velit veniam incididunt aliqua sunt. Deserunt sit excepteur laboris ad est tempor quis voluptate dolore aliquip proident commodo est irure. Incididunt aute tempor fugiat ad in velit ipsum sit occaecat elit.",
    @field_config = "Velit est mollit dolor est ut in nisi consectetur. Eu laboris minim laboris velit occaecat quis ex occaecat sunt. Proident veniam dolore cupidatat reprehenderit cillum.",
    @expiration_date = "Sun Sep 30 1979 04:04:20 GMT+0000 (UTC)",
    @expiration_reason = "Eu et aliqua dolore amet do Lorem irure anim eiusmod consectetur velit dolore sunt esse. Officia commodo officia in nulla occaecat laborum ullamco velit aute. Culpa ex mollit elit in cillum reprehenderit nulla eu in. In in esse laborum excepteur. Officia ullamco laboris consequat tempor minim cillum sint duis et consectetur aute Lorem laboris ex. Officia occaecat pariatur esse culpa nulla quis Lorem dolor minim.",
    @created_date = "Thu Oct 28 2004 06:39:52 GMT+0000 (UTC)",
    @updated_date = "Sat Apr 12 1975 00:20:04 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 22,
    @cid_type = "software",
    @cid_id = 22,
    @requirement_type = "revised_requirement",
    @requirement_id = 22,
    @order_comments = "Eu ipsum eu anim eiusmod irure laboris sunt minim incididunt ad proident. Nisi culpa magna sit ex amet irure commodo dolore excepteur esse commodo labore sit Lorem. Minim consequat occaecat exercitation ad mollit sit elit. Eu esse cillum proident mollit enim tempor elit in enim irure fugiat.",
    @priority = "low",
    @expected_completion_date = "Thu May 17 2018 01:16:56 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  127201,
    @customer_name =  "ZILLIDIUM",
    @ship_to_address = "234 Oriental Court, Glendale, Marshall Islands, 4311",
    @model = "MP 3357TE",
    @old_cid =  "5ad0f0214f7fba2cbef75934",
    @new_cid = "5ad0f021ee76c3e6e9297196",
    @soa_instance_id = 23,
    @order_number = 765175,
    @order_line_number = 23,
    @solution = "Id id ullamco elit id proident in dolor ut id esse esse minim dolor. Laborum proident veniam fugiat aliqua elit occaecat veniam occaecat. Consequat sint tempor elit voluptate consequat.",
    @field_config = "Ad culpa officia aliquip cupidatat aute quis esse ea aliquip ex dolore dolor. Ad pariatur id amet culpa laboris tempor amet amet excepteur officia minim aute deserunt. Nulla sint reprehenderit elit laborum non amet eu consectetur nisi pariatur nulla est. Nostrud elit ullamco nostrud ullamco et adipisicing velit deserunt proident proident.",
    @expiration_date = "Mon Nov 29 1982 09:00:42 GMT+0000 (UTC)",
    @expiration_reason = "Aute duis commodo culpa commodo. Veniam adipisicing ad excepteur pariatur. Culpa eu ex sit pariatur veniam id velit irure voluptate esse excepteur consequat magna enim. Reprehenderit consequat officia culpa ad ipsum aliqua laborum. Cupidatat ipsum laborum cillum fugiat voluptate nostrud Lorem.",
    @created_date = "Wed Feb 02 1983 14:02:45 GMT+0000 (UTC)",
    @updated_date = "Mon Apr 08 2013 00:33:35 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 23,
    @cid_type = "software",
    @cid_id = 23,
    @requirement_type = "new_requirement",
    @requirement_id = 23,
    @order_comments = "Est voluptate consequat aliquip laborum irure dolor non sunt reprehenderit sunt nulla duis. Eiusmod consequat tempor pariatur pariatur proident dolore ipsum esse esse. Incididunt laboris aliquip irure ad sint pariatur ex consequat nostrud nostrud.",
    @priority = "low",
    @expected_completion_date = "Mon May 28 2018 04:35:53 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  224281,
    @customer_name =  "LIMOZEN",
    @ship_to_address = "418 Lake Place, Topanga, New Mexico, 651",
    @model = "MP 2777 TE for Education",
    @old_cid =  "5ad0f021c6f5962852f2c4c2",
    @new_cid = "5ad0f021e2ca5d93d7237c7d",
    @soa_instance_id = 24,
    @order_number = 421103,
    @order_line_number = 24,
    @solution = "Ipsum magna veniam voluptate commodo officia proident qui labore do est exercitation. Ipsum culpa voluptate sint incididunt duis laborum veniam. Cupidatat irure sunt ut sunt dolore elit. Nulla velit non quis dolor aute mollit ut laborum dolore ad anim est minim reprehenderit. Occaecat culpa ad amet ad tempor.",
    @field_config = "Quis officia eiusmod cillum aliquip eu reprehenderit. Lorem Lorem anim labore eu consequat veniam est ad labore. Sit adipisicing ad aliqua laboris duis aliquip labore qui velit sint et reprehenderit commodo. Anim commodo nisi aute ut deserunt deserunt labore nostrud excepteur officia proident nostrud dolore pariatur. Consequat aute exercitation sit tempor cupidatat ullamco.",
    @expiration_date = "Wed Nov 01 2000 12:20:18 GMT+0000 (UTC)",
    @expiration_reason = "Duis velit eu ut officia cupidatat ad ut non officia irure. Minim voluptate nostrud laborum sint ea est. Aliqua nulla ex excepteur ipsum reprehenderit eu duis.",
    @created_date = "Tue Mar 15 2016 11:02:04 GMT+0000 (UTC)",
    @updated_date = "Wed Sep 20 2006 17:38:22 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 24,
    @cid_type = "software",
    @cid_id = 24,
    @requirement_type = "revised_requirement",
    @requirement_id = 24,
    @order_comments = "Id laborum nostrud proident duis voluptate labore dolor incididunt voluptate est. Veniam ullamco labore deserunt fugiat consectetur dolor elit non irure quis velit. Ipsum et cupidatat culpa minim nulla do labore minim consequat tempor id eu ullamco. Aliquip deserunt consectetur Lorem dolore officia proident eiusmod esse ex ipsum irure non. Incididunt mollit aliquip mollit et culpa non laboris id. Aute qui nulla dolor aliquip labore. Tempor in est pariatur et fugiat veniam adipisicing.",
    @priority = "medium",
    @expected_completion_date = "Sat Apr 28 2018 15:38:56 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  187683,
    @customer_name =  "QUALITERN",
    @ship_to_address = "242 Colonial Road, Como, Puerto Rico, 1664",
    @model = "MP 3899TE",
    @old_cid =  "5ad0f0216a3492453a665e58",
    @new_cid = "5ad0f02152e2681b97785638",
    @soa_instance_id = 25,
    @order_number = 545256,
    @order_line_number = 25,
    @solution = "Anim velit occaecat cupidatat officia aliquip officia magna irure minim dolore magna ullamco ea. Exercitation id est cupidatat sint culpa amet cillum cupidatat cillum anim elit. Veniam id magna qui ullamco adipisicing incididunt do incididunt laborum exercitation. Eiusmod Lorem culpa veniam labore deserunt aliqua non labore pariatur deserunt do anim. Incididunt ad labore est ipsum nostrud do excepteur labore occaecat excepteur consequat exercitation Lorem laboris.",
    @field_config = "Tempor irure ut amet velit labore veniam elit do. Voluptate cupidatat proident voluptate nisi incididunt consequat deserunt do eiusmod aliquip labore. Nostrud aute reprehenderit cillum enim pariatur pariatur cillum qui. Lorem Lorem mollit irure sunt Lorem excepteur dolore ut pariatur reprehenderit eu sit sit. Ullamco dolore et velit et aute tempor irure velit Lorem. Voluptate nulla qui nisi fugiat excepteur occaecat minim excepteur dolor commodo id. Adipisicing tempor est elit ex cillum dolore officia dolore.",
    @expiration_date = "Wed Jun 17 1981 08:52:14 GMT+0000 (UTC)",
    @expiration_reason = "Cillum deserunt Lorem quis ut ut et velit. Nostrud id adipisicing ullamco aute eu ad nulla aliquip. Id minim aliqua do minim adipisicing cupidatat quis ad duis duis.",
    @created_date = "Fri Jun 04 1993 20:02:34 GMT+0000 (UTC)",
    @updated_date = "Wed Aug 19 1987 13:56:49 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 25,
    @cid_type = "hardware",
    @cid_id = 25,
    @requirement_type = "revised_requirement",
    @requirement_id = 25,
    @order_comments = "Dolor sunt labore quis officia est culpa cupidatat culpa veniam aliquip. Esse enim est magna aliquip sit elit sint aute amet magna. Dolor Lorem consectetur in dolor culpa ullamco anim do voluptate occaecat.",
    @priority = "low",
    @expected_completion_date = "Tue May 29 2018 13:49:33 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  163363,
    @customer_name =  "CAPSCREEN",
    @ship_to_address = "902 Nolans Lane, Hatteras, District Of Columbia, 2306",
    @model = "MP 4010SP",
    @old_cid =  "5ad0f0213ca7e7a30a15d9af",
    @new_cid = "5ad0f0211239cc431fc44023",
    @soa_instance_id = 26,
    @order_number = 169862,
    @order_line_number = 26,
    @solution = "Aliquip laboris cillum nulla pariatur tempor aute qui do velit aliqua adipisicing cupidatat amet ipsum. Velit ullamco excepteur dolor in enim minim cillum do elit. Dolor excepteur id nulla occaecat officia incididunt.",
    @field_config = "Voluptate sunt aute est pariatur ea fugiat nostrud nostrud duis elit cupidatat ullamco sunt. Commodo aliqua cillum eiusmod eu est incididunt est commodo cupidatat ea id. Consequat mollit minim cupidatat ea ut. Laboris est do minim adipisicing nostrud sint ex.",
    @expiration_date = "Thu Jul 03 2014 09:09:15 GMT+0000 (UTC)",
    @expiration_reason = "Id nostrud eiusmod ea elit tempor consequat commodo et sint cillum ea pariatur. Sunt adipisicing deserunt eiusmod aliqua ad nisi ut irure eu quis. Adipisicing do sint culpa exercitation nostrud eu dolor tempor. Et pariatur consectetur veniam voluptate eiusmod ut enim enim exercitation mollit dolore. Minim proident est qui amet est aute velit eu aute.",
    @created_date = "Mon Mar 16 1998 16:45:54 GMT+0000 (UTC)",
    @updated_date = "Thu Nov 02 2017 16:37:20 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 26,
    @cid_type = "software",
    @cid_id = 26,
    @requirement_type = "new_requirement",
    @requirement_id = 26,
    @order_comments = "Et eiusmod mollit laboris fugiat. Elit Lorem dolor cillum do occaecat ad in adipisicing est occaecat dolor. Deserunt elit nulla reprehenderit in non veniam. Aute sint nisi officia fugiat id non. Cupidatat duis velit culpa est consectetur nulla irure esse aliqua Lorem quis sit. Officia ex incididunt ex et proident ex in pariatur elit id.",
    @priority = "high",
    @expected_completion_date = "Sat Jun 09 2018 23:24:20 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  358614,
    @customer_name =  "AQUACINE",
    @ship_to_address = "695 Huntington Street, Deltaville, Rhode Island, 6179",
    @model = "MP 3873SP",
    @old_cid =  "5ad0f0210637ea639736ff19",
    @new_cid = "5ad0f021e88d5632d037bd47",
    @soa_instance_id = 27,
    @order_number = 247177,
    @order_line_number = 27,
    @solution = "Excepteur consectetur sint non in culpa. Est mollit anim eiusmod Lorem et laboris irure mollit non reprehenderit duis. Deserunt tempor ipsum culpa ad enim in velit. Enim ea incididunt fugiat enim sunt aliquip reprehenderit voluptate aliquip cupidatat exercitation ut ipsum sit.",
    @field_config = "Nostrud esse tempor do fugiat dolore nisi officia aute sunt aliquip elit enim enim. Magna ipsum Lorem aliquip culpa aliquip commodo ad mollit. Exercitation quis mollit nulla aliqua dolor enim. Magna ad commodo officia consequat officia non dolor deserunt in tempor ad nisi aliqua.",
    @expiration_date = "Wed Feb 21 1996 04:27:09 GMT+0000 (UTC)",
    @expiration_reason = "Duis aliqua sint adipisicing tempor labore ipsum aliqua nisi exercitation laboris ex excepteur exercitation. In sunt anim cillum occaecat fugiat aliquip anim laborum occaecat. Reprehenderit elit excepteur commodo qui in ea minim nulla ad. Culpa tempor do magna aliqua id non adipisicing exercitation sunt exercitation consectetur ea occaecat. Anim eiusmod excepteur minim in Lorem velit eu mollit velit minim in. Labore amet elit culpa aute cupidatat exercitation occaecat.",
    @created_date = "Mon Jan 21 2008 08:38:51 GMT+0000 (UTC)",
    @updated_date = "Sun Nov 16 1980 02:08:50 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 27,
    @cid_type = "software",
    @cid_id = 27,
    @requirement_type = "revised_requirement",
    @requirement_id = 27,
    @order_comments = "Quis ex et in anim sunt sint culpa ullamco commodo occaecat nostrud. Ex esse laborum fugiat exercitation amet excepteur. Reprehenderit nostrud ut aliqua do nisi duis officia irure.",
    @priority = "high",
    @expected_completion_date = "Thu Jun 28 2018 04:03:32 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  408827,
    @customer_name =  "MOTOVATE",
    @ship_to_address = "819 Lynch Street, Eden, Iowa, 9092",
    @model = "MP 4143 TE for Education",
    @old_cid =  "5ad0f02153a0d3323a477e57",
    @new_cid = "5ad0f021f76fa2473bb693c4",
    @soa_instance_id = 28,
    @order_number = 902896,
    @order_line_number = 28,
    @solution = "Tempor ipsum consequat proident nisi minim mollit est ullamco proident cillum minim voluptate ipsum cillum. In sit incididunt dolore commodo deserunt officia non velit. Aliquip dolore sit excepteur deserunt deserunt.",
    @field_config = "Laborum occaecat officia sit est mollit aliqua elit ipsum non aliqua cupidatat sunt occaecat. Incididunt exercitation velit cillum consequat. Quis cillum ex qui Lorem culpa sunt excepteur ullamco id nulla aute laboris cupidatat elit.",
    @expiration_date = "Thu Sep 19 1974 19:59:37 GMT+0000 (UTC)",
    @expiration_reason = "Labore aliquip ullamco enim ea cillum occaecat mollit magna amet. Duis magna reprehenderit sit excepteur ad do labore officia est commodo minim nisi sint. Ipsum enim occaecat anim proident culpa quis velit sunt consectetur officia cupidatat ut dolor. Dolore ea id anim fugiat magna dolor. Ea esse non nisi deserunt magna nisi nisi aliqua fugiat consectetur excepteur magna eu dolor.",
    @created_date = "Wed Jul 18 1990 20:30:38 GMT+0000 (UTC)",
    @updated_date = "Tue Feb 08 1994 18:37:21 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 28,
    @cid_type = "hardware",
    @cid_id = 28,
    @requirement_type = "new_requirement",
    @requirement_id = 28,
    @order_comments = "Est sint cillum exercitation consectetur. Dolore nulla proident sit veniam commodo. Nisi dolore exercitation esse minim non aliqua sint laboris fugiat fugiat do sit ut elit.",
    @priority = "low",
    @expected_completion_date = "Wed Apr 18 2018 12:23:33 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  281255,
    @customer_name =  "KEGULAR",
    @ship_to_address = "636 Billings Place, Oberlin, Kansas, 8169",
    @model = "MP 2785TE",
    @old_cid =  "5ad0f021d1f01cc4f39c6110",
    @new_cid = "5ad0f0213d86f1b6ef55b4fb",
    @soa_instance_id = 29,
    @order_number = 968235,
    @order_line_number = 29,
    @solution = "Nostrud cillum nisi ullamco aliquip pariatur dolor ex cillum consequat nisi anim. Aute ad mollit deserunt mollit magna commodo velit laboris reprehenderit commodo et qui. Minim ullamco irure velit pariatur aliqua labore non elit. Cupidatat consectetur sint officia Lorem ea ad aliquip ea ex dolor veniam ad proident quis. Aliqua cillum amet reprehenderit in ex velit nulla fugiat.",
    @field_config = "Deserunt consequat excepteur non mollit laboris incididunt laboris exercitation enim incididunt. Nisi voluptate amet occaecat sint sint ea duis mollit cupidatat commodo minim fugiat nisi duis. Incididunt in tempor enim sit incididunt adipisicing qui. In excepteur duis aute cupidatat est consectetur laboris sit elit proident. Nulla ex sunt in qui deserunt aliquip nulla ex consequat aliqua veniam minim Lorem. Excepteur labore ex cillum id qui incididunt. Fugiat ad ipsum in ullamco irure duis id ex Lorem dolore tempor labore.",
    @expiration_date = "Mon Oct 21 1996 23:38:14 GMT+0000 (UTC)",
    @expiration_reason = "Labore ex eiusmod ea elit duis. Anim adipisicing duis consequat fugiat tempor ipsum mollit. Id laborum ullamco est est irure deserunt ad.",
    @created_date = "Sat Jul 16 1994 10:30:17 GMT+0000 (UTC)",
    @updated_date = "Mon Aug 04 2014 03:02:45 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 29,
    @cid_type = "hardware",
    @cid_id = 29,
    @requirement_type = "new_requirement",
    @requirement_id = 29,
    @order_comments = "Ut deserunt excepteur do aute velit ex aliqua ea sunt eu velit esse ipsum pariatur. In voluptate qui ut do adipisicing. Amet amet anim fugiat ut nulla consectetur incididunt. Ea velit sit aute voluptate sit velit ullamco exercitation cillum ullamco dolore enim ex ullamco. Eu laborum nostrud do id amet ad culpa enim dolore minim excepteur qui consequat. Culpa pariatur velit duis enim occaecat voluptate.",
    @priority = "medium",
    @expected_completion_date = "Tue Jun 26 2018 15:54:38 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  168501,
    @customer_name =  "ZOLAVO",
    @ship_to_address = "820 Hampton Place, Marne, North Dakota, 5264",
    @model = "MP 2689TE",
    @old_cid =  "5ad0f0215bad3f71ffdeb4f4",
    @new_cid = "5ad0f021397266ef060f2fb9",
    @soa_instance_id = 30,
    @order_number = 581327,
    @order_line_number = 30,
    @solution = "Adipisicing labore reprehenderit ipsum laborum laboris cillum eiusmod. Minim enim in exercitation aute officia ea adipisicing qui dolore eu eiusmod qui esse anim. Minim Lorem Lorem laborum sit duis anim ullamco officia. Voluptate ea labore laboris Lorem occaecat.",
    @field_config = "Irure est incididunt Lorem excepteur labore qui reprehenderit non incididunt. Ex velit in proident non laboris cupidatat aute ad culpa exercitation deserunt quis consequat cupidatat. Lorem sint nostrud Lorem velit culpa amet ea sint. Sint aute est duis ut amet irure. Dolore ipsum cupidatat enim culpa sit cupidatat ex quis labore. Id ad nisi ullamco pariatur enim nostrud commodo.",
    @expiration_date = "Tue Aug 07 2007 19:40:11 GMT+0000 (UTC)",
    @expiration_reason = "Voluptate excepteur deserunt occaecat non elit aliquip irure velit exercitation. Ad nostrud dolore dolor elit do adipisicing occaecat. Deserunt aliquip deserunt elit duis enim excepteur consectetur veniam adipisicing. Labore veniam nisi est ullamco elit eiusmod eiusmod ea ad sunt in deserunt excepteur.",
    @created_date = "Fri Oct 03 1997 07:28:33 GMT+0000 (UTC)",
    @updated_date = "Thu Oct 16 2003 22:16:52 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 30,
    @cid_type = "hardware",
    @cid_id = 30,
    @requirement_type = "new_requirement",
    @requirement_id = 30,
    @order_comments = "Excepteur proident et excepteur aute ut eu. Nulla nostrud ad exercitation incididunt. Ipsum nostrud incididunt nisi officia ex laboris consequat magna laboris ex. Nisi proident nostrud esse dolor culpa laboris nulla veniam in enim quis Lorem.",
    @priority = "high",
    @expected_completion_date = "Tue Apr 24 2018 17:07:49 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  165310,
    @customer_name =  "BICOL",
    @ship_to_address = "829 Seagate Avenue, Goodville, New Hampshire, 8409",
    @model = "MP 3413 TE for Education",
    @old_cid =  "5ad0f021f99c3f386ad17cfd",
    @new_cid = "5ad0f021bd8e1a4e0d3e3579",
    @soa_instance_id = 31,
    @order_number = 516940,
    @order_line_number = 31,
    @solution = "Consectetur eiusmod irure ad aute. Et adipisicing dolore magna anim tempor dolor cillum anim ut incididunt in ea nostrud. Duis Lorem aliquip ad Lorem eiusmod laboris veniam culpa ad ea eu proident mollit. Dolor ea ea proident ut ad quis velit cupidatat adipisicing anim. Sunt eu exercitation culpa Lorem nulla ipsum pariatur et officia reprehenderit dolor commodo. Adipisicing elit dolore commodo aute.",
    @field_config = "In minim ex quis nulla culpa aliquip qui adipisicing pariatur culpa incididunt anim. Eiusmod sint occaecat qui aliqua cupidatat velit ut ullamco excepteur. Sit irure deserunt eu eu aute cillum Lorem ex laboris nisi ea veniam. Qui aute consequat amet sint non elit voluptate nulla esse ad eiusmod ad eiusmod Lorem. Do sunt officia ipsum est tempor culpa officia veniam exercitation. Quis aliqua id duis sint ullamco duis voluptate officia amet dolor aliqua mollit sunt aliquip. Do incididunt est ad eu ad enim dolor sunt.",
    @expiration_date = "Thu Nov 22 1990 23:34:29 GMT+0000 (UTC)",
    @expiration_reason = "Sunt fugiat quis et et aliquip nostrud non officia. Exercitation aliquip veniam sunt enim nostrud consequat. Aute incididunt aute cillum veniam exercitation est adipisicing labore laboris ad culpa dolore velit laboris. Aute ex dolore est fugiat est in duis pariatur.",
    @created_date = "Thu Oct 10 2002 03:45:47 GMT+0000 (UTC)",
    @updated_date = "Sat Sep 07 1974 10:00:31 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 31,
    @cid_type = "software",
    @cid_id = 31,
    @requirement_type = "revised_requirement",
    @requirement_id = 31,
    @order_comments = "Dolore ex non velit ullamco dolor proident sint amet nisi amet. Ipsum occaecat sit officia cupidatat qui tempor pariatur proident qui. Enim consectetur pariatur deserunt magna fugiat ullamco mollit ipsum. Aute est nulla fugiat enim. Cillum veniam quis laboris ad ex nostrud nisi veniam.",
    @priority = "high",
    @expected_completion_date = "Wed Jun 13 2018 06:00:54 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  161708,
    @customer_name =  "JAMNATION",
    @ship_to_address = "132 Lacon Court, Wildwood, Idaho, 4959",
    @model = "MP 3544SP",
    @old_cid =  "5ad0f0219753432f29b1082f",
    @new_cid = "5ad0f0216cb6945bc5c09309",
    @soa_instance_id = 32,
    @order_number = 471987,
    @order_line_number = 32,
    @solution = "Eiusmod ut non magna aliqua magna elit. Consectetur adipisicing qui aute qui enim laborum anim deserunt magna mollit ex. Commodo duis ea reprehenderit commodo dolor veniam id magna minim cupidatat. Tempor dolore voluptate do et laboris ullamco. Aute sunt ut do veniam do Lorem laboris laborum.",
    @field_config = "Elit minim sit qui do culpa pariatur aute occaecat voluptate. Duis tempor adipisicing nostrud est aliqua id magna eiusmod incididunt sunt aliqua. In dolore duis do laborum commodo sit ipsum velit sint eiusmod.",
    @expiration_date = "Sat Jul 18 2009 05:41:55 GMT+0000 (UTC)",
    @expiration_reason = "Et nostrud sunt magna esse. Qui irure est labore commodo magna ipsum. Exercitation irure excepteur in incididunt ullamco ad officia elit aute proident commodo. Cillum eiusmod deserunt velit eiusmod cillum labore est. Pariatur sit minim nostrud occaecat in. Qui ullamco nostrud exercitation proident. Occaecat id elit sint ut laboris irure incididunt in.",
    @created_date = "Sat Apr 10 1993 19:17:43 GMT+0000 (UTC)",
    @updated_date = "Mon Dec 18 1989 02:04:36 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 32,
    @cid_type = "hardware",
    @cid_id = 32,
    @requirement_type = "new_requirement",
    @requirement_id = 32,
    @order_comments = "Esse ex fugiat exercitation sunt id consectetur. Velit anim fugiat duis amet proident aute eiusmod. Occaecat aute do exercitation duis dolor laboris. Reprehenderit anim veniam fugiat sint.",
    @priority = "high",
    @expected_completion_date = "Tue Jun 12 2018 19:13:24 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  212994,
    @customer_name =  "OLYMPIX",
    @ship_to_address = "603 Harman Street, Norvelt, Texas, 4753",
    @model = "MP 3444SP",
    @old_cid =  "5ad0f021b304a77629e8227c",
    @new_cid = "5ad0f0215f6999e7eda596d4",
    @soa_instance_id = 33,
    @order_number = 933588,
    @order_line_number = 33,
    @solution = "Mollit eu do eiusmod ipsum laboris qui consequat occaecat consectetur cupidatat irure. Minim minim ex dolore laborum ea sit adipisicing ullamco eu do Lorem eiusmod. Pariatur ipsum sint ex dolore quis tempor proident. In ea aliquip exercitation veniam. Quis Lorem proident nostrud quis est velit esse et consectetur culpa. Aliquip cillum dolore irure officia officia cupidatat quis non cillum.",
    @field_config = "Laborum occaecat aute qui est dolore id adipisicing. Ipsum ut cillum ad laboris ex aute eu in. Velit proident ad cupidatat nisi aute qui laborum cupidatat eu. Sint duis labore deserunt cillum adipisicing nisi magna occaecat nulla ad. Aute occaecat ut reprehenderit laboris esse veniam enim enim. Velit amet sunt exercitation irure anim non commodo irure cupidatat do sit sit ullamco.",
    @expiration_date = "Sat Oct 06 2012 01:59:29 GMT+0000 (UTC)",
    @expiration_reason = "Est ad reprehenderit non consequat commodo adipisicing nulla in aliquip adipisicing veniam ipsum. Commodo quis amet voluptate ipsum eiusmod. Exercitation consectetur quis consequat duis reprehenderit nostrud anim. Sint ex consectetur incididunt do esse cupidatat labore aliquip labore quis dolore. Proident dolor excepteur ex consectetur veniam do incididunt eiusmod commodo anim proident ea laborum cupidatat. Mollit nulla ad ad est duis veniam consectetur excepteur culpa elit dolor. Esse minim non sit deserunt laborum laborum.",
    @created_date = "Sun Nov 22 2009 09:20:19 GMT+0000 (UTC)",
    @updated_date = "Sun Jan 24 1982 12:23:53 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 33,
    @cid_type = "hardware",
    @cid_id = 33,
    @requirement_type = "new_requirement",
    @requirement_id = 33,
    @order_comments = "Officia consectetur qui aliqua incididunt magna sit cupidatat aute ipsum eu. Duis voluptate laborum mollit ut aliquip dolore ut. Minim dolore commodo consectetur cupidatat tempor ex officia laborum mollit culpa aliqua ut. Voluptate reprehenderit veniam sunt ullamco aliqua sint cillum consequat aliquip culpa exercitation dolor. Ex deserunt ut pariatur ea. Elit voluptate velit consequat aliqua Lorem magna. Minim labore nisi consequat aute sint ea ipsum ullamco incididunt quis ex ex commodo proident.",
    @priority = "high",
    @expected_completion_date = "Mon Apr 23 2018 15:55:01 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  117130,
    @customer_name =  "PHOLIO",
    @ship_to_address = "978 Jewel Street, Worton, Indiana, 1383",
    @model = "MP 2544TE",
    @old_cid =  "5ad0f021dced0c588ea5af80",
    @new_cid = "5ad0f0216e4fd04ad2c3e37e",
    @soa_instance_id = 34,
    @order_number = 794574,
    @order_line_number = 34,
    @solution = "Amet sunt proident officia cillum sit fugiat dolore consectetur et elit. Ex elit ipsum proident enim. Non excepteur nulla nostrud nulla Lorem velit labore magna adipisicing. Irure amet labore reprehenderit sunt. Sint deserunt mollit deserunt anim excepteur sit ex minim ex ex nostrud. Aliqua minim consequat nostrud fugiat non sunt aliquip laborum esse.",
    @field_config = "Elit et ipsum aute duis cupidatat velit labore dolor commodo ullamco. Elit cillum qui irure incididunt ipsum cupidatat officia duis irure mollit excepteur. Laborum excepteur commodo sit minim ex. Est irure cillum aliqua cupidatat culpa do Lorem est. Ipsum minim proident consectetur magna id occaecat et nulla reprehenderit voluptate tempor nostrud. Consectetur qui ea aliquip laboris. Occaecat laborum ut in officia deserunt non.",
    @expiration_date = "Wed Jan 29 1992 08:28:01 GMT+0000 (UTC)",
    @expiration_reason = "Do adipisicing aliqua ut eu incididunt veniam labore. Elit dolor eu exercitation ea. Laboris occaecat cupidatat tempor labore sit in aliquip cupidatat mollit. Elit minim aliqua amet laborum esse qui cillum. Ut minim nulla sunt mollit Lorem excepteur reprehenderit. Commodo elit est est adipisicing velit.",
    @created_date = "Thu Mar 26 1992 11:45:39 GMT+0000 (UTC)",
    @updated_date = "Mon Nov 15 2010 22:28:05 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 34,
    @cid_type = "hardware",
    @cid_id = 34,
    @requirement_type = "new_requirement",
    @requirement_id = 34,
    @order_comments = "Duis ut amet veniam ad nulla sint. Et dolore reprehenderit mollit est fugiat. Tempor aute et nostrud reprehenderit fugiat do eiusmod pariatur enim nisi. Exercitation proident mollit enim voluptate aliquip duis nisi minim minim in commodo. Velit et excepteur ad dolore Lorem laborum et ad quis aute in est minim.",
    @priority = "medium",
    @expected_completion_date = "Thu May 31 2018 05:07:22 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  319028,
    @customer_name =  "GEEKETRON",
    @ship_to_address = "418 Dorchester Road, Kenvil, Illinois, 9136",
    @model = "MP 4171 TE for Education",
    @old_cid =  "5ad0f021615fa46b06ffaae5",
    @new_cid = "5ad0f021e001953253ae4650",
    @soa_instance_id = 35,
    @order_number = 92079,
    @order_line_number = 35,
    @solution = "Ut cupidatat quis consequat tempor laborum. Proident exercitation non voluptate reprehenderit occaecat commodo pariatur. Duis do veniam ullamco sit sint quis in consequat reprehenderit ullamco duis commodo exercitation. Magna eiusmod anim qui do anim ex non officia. Elit Lorem amet voluptate eiusmod officia ut cillum commodo elit duis aliquip dolor. Ea nisi ut aliqua veniam pariatur deserunt adipisicing consectetur quis adipisicing dolor esse. Labore nulla non eiusmod exercitation sit labore quis Lorem eu anim sit.",
    @field_config = "Lorem non adipisicing fugiat ut id consequat est voluptate culpa ad sit duis enim excepteur. Amet laborum incididunt culpa ullamco ea dolore ea pariatur ut cillum ex dolore anim officia. Aliquip tempor aute irure et consectetur culpa. Sint adipisicing eu adipisicing fugiat velit consectetur et ea elit proident cupidatat fugiat aliquip exercitation.",
    @expiration_date = "Sun Aug 17 1975 02:52:51 GMT+0000 (UTC)",
    @expiration_reason = "Ex eu consectetur cupidatat ea esse nostrud id deserunt. Ad consequat exercitation et esse pariatur labore minim incididunt laboris veniam labore ipsum elit. Consequat ea quis cupidatat do anim ad. Qui quis fugiat culpa deserunt enim et est amet proident eiusmod dolor quis.",
    @created_date = "Fri May 01 1970 10:51:03 GMT+0000 (UTC)",
    @updated_date = "Sat Apr 29 1995 02:08:46 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 35,
    @cid_type = "hardware",
    @cid_id = 35,
    @requirement_type = "revised_requirement",
    @requirement_id = 35,
    @order_comments = "Ad veniam ipsum tempor officia anim voluptate reprehenderit pariatur. Aliquip dolore exercitation magna quis ad exercitation in ex exercitation sit nulla. Sint laboris et dolore elit.",
    @priority = "medium",
    @expected_completion_date = "Mon Jun 25 2018 01:55:40 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  200207,
    @customer_name =  "ECRAZE",
    @ship_to_address = "481 Devon Avenue, Wadsworth, New Jersey, 2672",
    @model = "MP 2907TE",
    @old_cid =  "5ad0f021af6bec4f2e81027e",
    @new_cid = "5ad0f021c4c4e4550b6a4277",
    @soa_instance_id = 36,
    @order_number = 499843,
    @order_line_number = 36,
    @solution = "Aliquip cillum laboris et eu. Deserunt labore qui occaecat veniam incididunt enim mollit anim dolore minim. Consequat quis incididunt commodo aute ullamco nostrud adipisicing esse minim nisi. Pariatur amet veniam dolor in aliquip deserunt anim qui eu cillum amet. Ex aliquip id laborum Lorem amet amet excepteur enim aute enim.",
    @field_config = "Enim exercitation laborum incididunt sunt mollit pariatur pariatur elit et nostrud eu non ea incididunt. Eu excepteur commodo laboris tempor dolore adipisicing. Irure enim incididunt nostrud laborum enim do tempor et. Elit culpa proident deserunt do fugiat do et et. Culpa dolor laboris ea aute fugiat est amet mollit duis quis.",
    @expiration_date = "Wed May 14 1986 05:12:20 GMT+0000 (UTC)",
    @expiration_reason = "Amet est labore nostrud consectetur aliqua proident irure velit aliqua laboris. Esse proident velit nulla Lorem nulla irure aute. Qui in tempor exercitation id eu consectetur est non consectetur sit dolore aliquip Lorem tempor. Lorem fugiat non esse mollit consectetur ipsum occaecat.",
    @created_date = "Tue Sep 23 1986 23:55:14 GMT+0000 (UTC)",
    @updated_date = "Thu Nov 23 1995 13:16:56 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 36,
    @cid_type = "hardware",
    @cid_id = 36,
    @requirement_type = "new_requirement",
    @requirement_id = 36,
    @order_comments = "Sunt in Lorem aliqua officia labore proident. Enim sint laboris cupidatat labore dolore do sit nulla id sint veniam. Nostrud dolore labore sint duis. Sunt dolore sit proident Lorem ea et sit enim dolore. Laboris minim incididunt Lorem dolor pariatur elit id nostrud do sint est. Do fugiat fugiat voluptate nulla laboris proident laborum quis deserunt sint mollit. Tempor aute adipisicing sunt est deserunt.",
    @priority = "low",
    @expected_completion_date = "Mon Jun 25 2018 20:48:44 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  38136,
    @customer_name =  "NORALI",
    @ship_to_address = "123 Bayard Street, Brethren, Virgin Islands, 7317",
    @model = "MP 2825TE",
    @old_cid =  "5ad0f021dfe57d9743fcf3bf",
    @new_cid = "5ad0f0216cf772c1f686d25b",
    @soa_instance_id = 37,
    @order_number = 951362,
    @order_line_number = 37,
    @solution = "Do pariatur ex velit ullamco pariatur ullamco ipsum cillum aliqua sit deserunt nisi veniam ipsum. Incididunt laboris Lorem id commodo irure laboris. Culpa ut tempor do consectetur. Laborum reprehenderit dolore aute eiusmod in consequat exercitation. Pariatur ut velit ad mollit proident minim nostrud non ea tempor aliqua.",
    @field_config = "Duis cillum pariatur anim deserunt cupidatat ipsum nulla in sint. Tempor excepteur sunt aliquip deserunt ullamco aliquip in enim est id sit aute. Voluptate culpa sint labore ut aliquip nostrud consequat ex. Fugiat velit amet tempor qui cillum exercitation velit minim dolore incididunt fugiat sunt. Velit do labore irure ipsum mollit. Proident aliqua sit nulla nisi nulla duis culpa officia excepteur est exercitation reprehenderit nisi labore.",
    @expiration_date = "Sun Feb 04 1996 03:20:46 GMT+0000 (UTC)",
    @expiration_reason = "Aliquip incididunt nulla dolore eiusmod dolore proident pariatur anim cupidatat. Consequat ut veniam eu laboris aliquip esse cupidatat labore do ullamco consequat anim consectetur. Aute qui laboris non anim magna. Laborum ex eiusmod commodo in eu anim esse laboris cillum dolore occaecat. Commodo cillum id non pariatur consequat elit anim culpa est ullamco. Nisi qui in quis ipsum non non incididunt ea commodo officia laborum magna.",
    @created_date = "Mon Jul 06 2015 18:59:19 GMT+0000 (UTC)",
    @updated_date = "Fri Jul 08 1983 07:05:59 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 37,
    @cid_type = "software",
    @cid_id = 37,
    @requirement_type = "new_requirement",
    @requirement_id = 37,
    @order_comments = "Dolor amet consectetur pariatur voluptate eu labore veniam cillum anim laborum ad irure incididunt et. Velit nulla sit exercitation anim minim duis. Nulla consectetur proident labore aliqua quis sunt occaecat irure dolore reprehenderit incididunt. Incididunt est labore consequat cillum consequat. Dolore exercitation mollit Lorem voluptate culpa quis excepteur incididunt aute laborum excepteur.",
    @priority = "low",
    @expected_completion_date = "Tue Apr 17 2018 19:25:08 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  342397,
    @customer_name =  "QUADEEBO",
    @ship_to_address = "845 Newport Street, Forestburg, Michigan, 5018",
    @model = "MP 3029 TE for Education",
    @old_cid =  "5ad0f021fc033a43d85e40fe",
    @new_cid = "5ad0f021364b4853108c71f1",
    @soa_instance_id = 38,
    @order_number = 753647,
    @order_line_number = 38,
    @solution = "Voluptate excepteur nostrud qui nulla labore esse adipisicing sunt non proident tempor. Adipisicing et aute do non et ad. Laborum mollit voluptate enim ad minim et sunt cupidatat elit id occaecat ex tempor. Dolor aliquip reprehenderit ea commodo.",
    @field_config = "Cillum ullamco ea veniam occaecat Lorem aliqua ex esse pariatur voluptate et voluptate et. Culpa duis sunt ullamco Lorem velit eiusmod. Officia cillum elit mollit ipsum ex reprehenderit non est id aliquip quis ex minim cillum. Labore eu sint labore veniam dolor sunt laborum laborum.",
    @expiration_date = "Wed Apr 23 1975 23:58:22 GMT+0000 (UTC)",
    @expiration_reason = "Elit pariatur sit ad non sunt do minim fugiat eu ex magna id laboris. Pariatur labore ullamco aute quis veniam nisi irure sunt laborum ea culpa mollit anim laborum. Labore labore labore voluptate deserunt. Incididunt veniam irure amet mollit ex nostrud consequat mollit Lorem aute. Adipisicing duis elit eu duis eu qui elit et do ad aute exercitation. Laborum Lorem labore labore consequat amet minim ut proident enim culpa pariatur do reprehenderit et.",
    @created_date = "Sat Dec 09 1972 06:15:49 GMT+0000 (UTC)",
    @updated_date = "Sun Mar 09 2003 12:57:10 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 38,
    @cid_type = "hardware",
    @cid_id = 38,
    @requirement_type = "revised_requirement",
    @requirement_id = 38,
    @order_comments = "Aliquip dolore nostrud dolor irure sunt est. Esse et mollit ad laboris veniam magna et sunt. Labore reprehenderit ad Lorem commodo in labore velit cupidatat fugiat est. Dolore ea eu consequat exercitation in. Dolore quis exercitation non eu duis reprehenderit proident eu ipsum et magna dolore elit. Aute laborum incididunt eu consequat ad. Culpa dolore nulla occaecat eu.",
    @priority = "high",
    @expected_completion_date = "Sun Apr 29 2018 08:25:05 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  362286,
    @customer_name =  "CUJO",
    @ship_to_address = "250 Vandervoort Avenue, Camptown, Federated States Of Micronesia, 6495",
    @model = "MP 3126SP",
    @old_cid =  "5ad0f021f2844a895a9e32a8",
    @new_cid = "5ad0f02171400540dc81472a",
    @soa_instance_id = 39,
    @order_number = 173727,
    @order_line_number = 39,
    @solution = "Sit nisi occaecat exercitation quis mollit esse aliqua mollit aute est quis mollit. Fugiat sunt consectetur sunt sint incididunt qui irure cupidatat esse est laborum. Cillum elit aute pariatur et velit pariatur duis ex aute tempor adipisicing aliqua veniam ipsum. Ad qui amet eu excepteur ad occaecat sit. Nostrud veniam culpa sunt esse do aliqua excepteur magna.",
    @field_config = "Veniam quis enim dolore eu nostrud enim nisi. Ex qui magna cupidatat proident. Labore ullamco occaecat minim est id est duis voluptate eu quis elit quis consequat.",
    @expiration_date = "Thu Feb 12 1987 09:45:27 GMT+0000 (UTC)",
    @expiration_reason = "Ullamco quis laborum ea aliqua voluptate irure duis. Lorem culpa in occaecat ipsum proident pariatur cupidatat officia consequat aliqua sit. Voluptate non minim incididunt adipisicing veniam est dolor officia amet non esse tempor. Fugiat duis mollit proident amet quis incididunt. Do pariatur ex consectetur aliquip aliqua elit elit do. Quis consequat enim amet cupidatat et in. Tempor ea proident anim et aliqua fugiat nisi exercitation adipisicing sunt aliqua mollit nulla pariatur.",
    @created_date = "Wed Jul 31 1996 10:00:53 GMT+0000 (UTC)",
    @updated_date = "Thu May 15 2014 12:01:37 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 39,
    @cid_type = "software",
    @cid_id = 39,
    @requirement_type = "new_requirement",
    @requirement_id = 39,
    @order_comments = "Ex officia est excepteur dolor in eu mollit irure eu mollit in ad. Deserunt veniam veniam aute commodo veniam aliqua ad. Nisi sunt nostrud aliquip magna aute ut eu ad aliquip. Nisi irure aliquip adipisicing amet nostrud labore aute deserunt.",
    @priority = "medium",
    @expected_completion_date = "Tue Apr 24 2018 15:19:14 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  43673,
    @customer_name =  "INRT",
    @ship_to_address = "284 Jardine Place, Neahkahnie, California, 9988",
    @model = "MP 3978TE",
    @old_cid =  "5ad0f021fc9c7abab988bc45",
    @new_cid = "5ad0f02185d5f789ac740d44",
    @soa_instance_id = 40,
    @order_number = 887382,
    @order_line_number = 40,
    @solution = "Excepteur pariatur non et aliquip labore eu ullamco. Pariatur dolore non fugiat sunt culpa. Ea quis anim velit dolor do voluptate cillum aute. Est dolore aliqua exercitation cupidatat pariatur.",
    @field_config = "Consequat sunt officia pariatur exercitation excepteur est. Do et exercitation sunt ipsum deserunt ipsum irure velit labore. Qui id quis sit non nisi magna minim labore labore.",
    @expiration_date = "Tue Feb 22 1994 01:28:25 GMT+0000 (UTC)",
    @expiration_reason = "Aliqua dolor quis enim incididunt anim est laborum irure adipisicing anim irure sint. Amet eu eu veniam quis ad eu velit laborum. Ea aliqua Lorem ea aliquip consectetur culpa pariatur duis ex ex. Excepteur aliquip voluptate exercitation ex exercitation adipisicing excepteur eu ex ad. Tempor et nisi exercitation adipisicing. Pariatur irure amet excepteur dolor mollit ullamco est eiusmod quis voluptate.",
    @created_date = "Wed Mar 14 2007 05:21:06 GMT+0000 (UTC)",
    @updated_date = "Sat Jul 21 2001 05:02:17 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 40,
    @cid_type = "hardware",
    @cid_id = 40,
    @requirement_type = "new_requirement",
    @requirement_id = 40,
    @order_comments = "Non cupidatat amet cillum enim nisi. Anim aute dolore est eiusmod ullamco incididunt laborum dolor sit nostrud quis. Dolore deserunt ut mollit aliquip nostrud exercitation sit. Anim aliquip ullamco tempor nisi mollit officia duis. Velit cillum mollit commodo voluptate sunt exercitation. Duis dolore cillum irure do ex qui.",
    @priority = "high",
    @expected_completion_date = "Sun Jun 17 2018 10:39:35 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  382890,
    @customer_name =  "ECLIPSENT",
    @ship_to_address = "852 Lafayette Avenue, Grahamtown, South Carolina, 5642",
    @model = "MP 2535 TE for Education",
    @old_cid =  "5ad0f021bc9bab69ea32c4d8",
    @new_cid = "5ad0f021f57662daad80a066",
    @soa_instance_id = 41,
    @order_number = 411848,
    @order_line_number = 41,
    @solution = "Anim sit id Lorem cillum consectetur minim velit ullamco exercitation duis laborum incididunt occaecat. Tempor adipisicing eu voluptate dolore reprehenderit do tempor excepteur sint adipisicing nulla Lorem incididunt. Minim sit in laborum velit sunt do enim sit. Occaecat nostrud velit enim est in adipisicing tempor elit. Ea commodo ex velit reprehenderit id quis aute enim adipisicing. Pariatur excepteur commodo cupidatat veniam reprehenderit. Et est aliquip enim consequat pariatur laboris dolor ea voluptate mollit veniam do.",
    @field_config = "Exercitation dolor dolor in est sit culpa deserunt laborum duis deserunt enim occaecat. Consequat est commodo dolore sit proident aliqua tempor consequat magna. Laborum fugiat consequat nisi excepteur esse ea proident magna fugiat pariatur esse sit elit consectetur. Sint ullamco ex commodo reprehenderit qui.",
    @expiration_date = "Wed Sep 11 1985 03:15:54 GMT+0000 (UTC)",
    @expiration_reason = "Eiusmod excepteur enim ex adipisicing eu pariatur elit ullamco commodo dolore minim occaecat. Dolor qui dolor aute et reprehenderit elit excepteur anim commodo tempor. Deserunt non proident aute elit non laborum Lorem.",
    @created_date = "Mon Apr 02 2018 22:12:59 GMT+0000 (UTC)",
    @updated_date = "Sat Jan 01 2000 21:07:04 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 41,
    @cid_type = "software",
    @cid_id = 41,
    @requirement_type = "new_requirement",
    @requirement_id = 41,
    @order_comments = "Et reprehenderit adipisicing eu laboris reprehenderit minim do nisi proident sit velit eu sit. Occaecat non fugiat aute Lorem nulla eiusmod voluptate anim consectetur ut consectetur veniam mollit. Dolore dolore voluptate duis in labore ex sunt est cillum irure eiusmod. Minim ad labore fugiat consectetur ea enim deserunt sit aliquip. Tempor quis et sit adipisicing do non. Enim duis aliqua voluptate eu tempor voluptate in qui Lorem duis ex incididunt enim laborum. Do laboris labore ipsum minim laborum laborum sint laboris.",
    @priority = "medium",
    @expected_completion_date = "Wed May 02 2018 00:35:33 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  416371,
    @customer_name =  "GRAINSPOT",
    @ship_to_address = "965 Kings Hwy, Manchester, Maryland, 8925",
    @model = "MP 2396SP",
    @old_cid =  "5ad0f0212c25b522b6b8a1d9",
    @new_cid = "5ad0f02139c79dbfedba5ac6",
    @soa_instance_id = 42,
    @order_number = 385974,
    @order_line_number = 42,
    @solution = "Voluptate laborum excepteur fugiat id eu reprehenderit minim reprehenderit cupidatat eiusmod. Nostrud anim elit commodo aliquip exercitation eiusmod ullamco proident voluptate. Mollit ut aute elit consectetur Lorem ut dolor consectetur fugiat irure. Quis sint non officia incididunt non. Reprehenderit et nisi eiusmod ea mollit nisi consectetur mollit qui est nisi sunt.",
    @field_config = "Laboris enim officia cupidatat sint proident amet irure eiusmod excepteur et magna. Minim excepteur est anim consequat elit laborum reprehenderit eiusmod qui duis irure id aliqua. Nostrud ullamco in dolor eiusmod ex do laboris. Proident in aliqua commodo ipsum consectetur exercitation.",
    @expiration_date = "Fri Feb 18 1972 10:51:57 GMT+0000 (UTC)",
    @expiration_reason = "Lorem veniam sunt nisi labore amet ad consequat cupidatat tempor laborum dolor voluptate. Laboris est quis duis esse nisi fugiat minim duis quis id laboris. Est commodo ad voluptate occaecat consequat culpa consequat. Sit irure dolore enim qui amet mollit sit nisi dolore incididunt est. Eu eiusmod non aliqua ea.",
    @created_date = "Fri Feb 03 1984 15:25:12 GMT+0000 (UTC)",
    @updated_date = "Thu Sep 25 1975 05:31:41 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 42,
    @cid_type = "software",
    @cid_id = 42,
    @requirement_type = "revised_requirement",
    @requirement_id = 42,
    @order_comments = "Labore officia cupidatat qui exercitation elit reprehenderit. Sint aliqua laboris excepteur qui minim veniam. Nostrud sunt quis elit do tempor fugiat in exercitation labore aliquip tempor ea fugiat. Culpa dolor deserunt sunt aute irure duis fugiat anim officia nisi. Eiusmod aliquip sint ea esse quis ea enim pariatur id et Lorem quis nisi consequat. Veniam pariatur officia voluptate anim eu.",
    @priority = "high",
    @expected_completion_date = "Thu Jun 07 2018 18:45:56 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  394446,
    @customer_name =  "DANCERITY",
    @ship_to_address = "672 Indiana Place, Choctaw, Mississippi, 4281",
    @model = "MP 3078TE",
    @old_cid =  "5ad0f0214d2a36f92981998f",
    @new_cid = "5ad0f02182d85064990a17aa",
    @soa_instance_id = 43,
    @order_number = 600566,
    @order_line_number = 43,
    @solution = "Consectetur officia ut ad consequat nisi pariatur est. Culpa Lorem magna eu Lorem sunt voluptate. Incididunt commodo voluptate sit elit voluptate laboris sit veniam nisi occaecat cupidatat dolore. Veniam anim occaecat sint dolor duis nostrud nulla.",
    @field_config = "Est dolor amet excepteur deserunt in. Sint esse eu tempor eiusmod eiusmod Lorem. Ad ad eiusmod sunt dolor id velit nostrud. Ex fugiat ex nulla ipsum eu laborum consectetur. Nisi irure dolore Lorem anim consequat ad. Minim consectetur qui esse non sunt sit excepteur.",
    @expiration_date = "Wed Jun 25 2008 15:31:00 GMT+0000 (UTC)",
    @expiration_reason = "Dolore in sunt consectetur proident occaecat eiusmod mollit aliquip veniam. Tempor reprehenderit in aliqua aliqua occaecat est cillum eiusmod ipsum nostrud nostrud. Irure pariatur in enim mollit enim sit amet sunt proident veniam quis ut. Amet occaecat nulla commodo cillum labore adipisicing nisi sit magna.",
    @created_date = "Tue Mar 20 2001 05:38:16 GMT+0000 (UTC)",
    @updated_date = "Sun Dec 22 2013 17:49:01 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 43,
    @cid_type = "software",
    @cid_id = 43,
    @requirement_type = "revised_requirement",
    @requirement_id = 43,
    @order_comments = "Laborum quis exercitation eu ut ad veniam sint. Veniam elit nisi laborum id et dolore in minim culpa elit velit cupidatat. Ut enim veniam reprehenderit exercitation sunt cupidatat quis incididunt amet nostrud pariatur non nostrud magna. Adipisicing dolor duis aliqua veniam ipsum nostrud. Eu dolore aliqua veniam magna fugiat adipisicing tempor.",
    @priority = "medium",
    @expected_completion_date = "Sat Jun 09 2018 11:50:07 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  184868,
    @customer_name =  "ISOPOP",
    @ship_to_address = "219 Hopkins Street, Chamizal, Hawaii, 1911",
    @model = "MP 3139TE",
    @old_cid =  "5ad0f021666010ecb95d9008",
    @new_cid = "5ad0f021180535fbd2e7e87a",
    @soa_instance_id = 44,
    @order_number = 753377,
    @order_line_number = 44,
    @solution = "Excepteur ipsum esse officia non. Reprehenderit reprehenderit sunt do non. Elit id ullamco est consectetur reprehenderit minim quis exercitation anim fugiat tempor labore. Sunt eu cupidatat minim eu reprehenderit nostrud Lorem officia esse dolor elit mollit quis officia. Ex magna dolor esse culpa in sunt aliquip.",
    @field_config = "Laborum veniam sit occaecat non dolor dolore incididunt fugiat pariatur occaecat Lorem dolor pariatur duis. Deserunt laborum deserunt qui fugiat in nostrud quis. Nulla eiusmod sint deserunt veniam non esse. Sit id id officia nisi adipisicing in consequat. Et irure id duis qui consequat non pariatur officia et in reprehenderit excepteur. Et laboris sint fugiat ullamco enim pariatur eu id adipisicing laboris officia anim.",
    @expiration_date = "Sat Jan 24 1976 12:50:44 GMT+0000 (UTC)",
    @expiration_reason = "Nostrud reprehenderit aliquip do pariatur reprehenderit eiusmod nisi eu nisi ea consequat ipsum. Magna cillum esse consequat veniam duis id qui id. Voluptate nostrud veniam sit adipisicing occaecat id ullamco enim ullamco ut excepteur ut qui veniam. Ad proident deserunt ipsum pariatur est amet ullamco sunt anim ad sint ut. Nostrud aute ad fugiat et. Amet proident ea qui ipsum quis nostrud cillum Lorem laboris laborum id cillum. Quis aute adipisicing anim occaecat laborum anim.",
    @created_date = "Wed Jul 16 2014 11:22:28 GMT+0000 (UTC)",
    @updated_date = "Fri Aug 17 2012 10:47:36 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 44,
    @cid_type = "software",
    @cid_id = 44,
    @requirement_type = "new_requirement",
    @requirement_id = 44,
    @order_comments = "Dolore ullamco quis eu nulla cillum nostrud ut magna culpa excepteur. Nisi proident sunt eiusmod magna aliqua aliquip ut in eiusmod Lorem sint ullamco do. Ex officia cupidatat nisi esse aliquip. Tempor voluptate quis mollit cupidatat enim magna. Ea eiusmod nulla aliquip aliquip dolor excepteur occaecat proident id occaecat veniam cupidatat pariatur amet. Duis pariatur ipsum exercitation dolor quis in esse id excepteur deserunt. Nostrud ea mollit velit velit nostrud.",
    @priority = "low",
    @expected_completion_date = "Fri May 04 2018 16:07:09 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  399338,
    @customer_name =  "SIGNITY",
    @ship_to_address = "949 Rutherford Place, Lookingglass, Utah, 2933",
    @model = "MP 2993SP",
    @old_cid =  "5ad0f021c96b7101fdaddd6a",
    @new_cid = "5ad0f02178e7f631f3d985c7",
    @soa_instance_id = 45,
    @order_number = 878861,
    @order_line_number = 45,
    @solution = "Occaecat amet occaecat nostrud dolor id cillum nisi magna velit. Occaecat mollit tempor occaecat ex. Cillum consequat dolor laboris culpa esse aute mollit sit nisi mollit et do laborum. Do laborum culpa occaecat sunt nostrud excepteur ex esse dolor sint mollit. Labore est nulla laboris do ea ad ut consectetur enim ullamco irure aliqua. Labore tempor ea dolore pariatur amet cupidatat sit labore ullamco in.",
    @field_config = "In ut consectetur commodo cillum et. Deserunt reprehenderit id est mollit minim culpa dolore cillum ea qui. Exercitation tempor culpa do duis ea eu qui do incididunt do quis eiusmod magna pariatur. Incididunt ut sunt est irure esse et in labore veniam ullamco anim. Culpa nulla labore mollit et deserunt Lorem Lorem velit excepteur voluptate pariatur consectetur. Minim nisi amet eu laboris tempor sunt consectetur ipsum aute anim. Exercitation sint exercitation esse consectetur ut ipsum aute veniam Lorem duis aliqua et.",
    @expiration_date = "Fri Dec 28 1990 03:16:18 GMT+0000 (UTC)",
    @expiration_reason = "Sunt ut nulla dolore nisi labore qui nostrud incididunt do. Do duis duis ut velit irure officia anim enim qui consequat laboris consectetur. Duis mollit ea ea culpa mollit reprehenderit labore. Do velit adipisicing commodo reprehenderit velit ipsum duis. Eu est eu consectetur ad aliqua est do. Magna nisi magna cupidatat sit enim in. Magna eiusmod labore ut fugiat aute consequat do est non eiusmod proident.",
    @created_date = "Wed May 21 1980 08:46:13 GMT+0000 (UTC)",
    @updated_date = "Thu Jan 06 1977 16:49:53 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 45,
    @cid_type = "software",
    @cid_id = 45,
    @requirement_type = "new_requirement",
    @requirement_id = 45,
    @order_comments = "Dolore reprehenderit dolore veniam velit quis in sunt occaecat. Veniam occaecat elit incididunt ipsum nostrud cillum cillum ullamco. Elit sunt excepteur tempor laborum cupidatat mollit enim consequat nulla. Qui non eu tempor excepteur irure. Nulla magna laboris aliquip labore incididunt esse mollit adipisicing enim consequat occaecat mollit. Sint ipsum in magna cupidatat fugiat consectetur labore fugiat irure.",
    @priority = "high",
    @expected_completion_date = "Fri May 04 2018 02:29:07 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  336365,
    @customer_name =  "DANCITY",
    @ship_to_address = "871 Dwight Street, Robinette, Kentucky, 8124",
    @model = "MP 2387TE",
    @old_cid =  "5ad0f0215b1efdb781c301f2",
    @new_cid = "5ad0f021ccf3b1fe9ef8d88b",
    @soa_instance_id = 46,
    @order_number = 891753,
    @order_line_number = 46,
    @solution = "Culpa nulla irure sunt laboris reprehenderit officia. Minim irure anim amet ea nulla sint reprehenderit enim incididunt fugiat laborum incididunt magna. Occaecat laborum exercitation nisi excepteur ullamco ut. Cupidatat culpa occaecat quis incididunt anim. Duis irure eu laboris aliqua amet. Nisi veniam sint nostrud nisi anim nisi elit in occaecat ex.",
    @field_config = "Excepteur aliqua quis laborum excepteur commodo laborum esse laborum mollit ullamco laboris non laborum commodo. Pariatur ullamco do sunt deserunt nisi. Adipisicing culpa commodo id sint labore est. Excepteur amet proident qui reprehenderit velit. Voluptate tempor veniam amet reprehenderit non pariatur reprehenderit ad excepteur cillum cillum. Sint eiusmod commodo nulla esse officia ullamco nisi cillum adipisicing fugiat cillum incididunt esse dolor. Sint veniam deserunt duis laborum nisi dolore enim officia sint.",
    @expiration_date = "Sun Sep 04 2011 12:30:33 GMT+0000 (UTC)",
    @expiration_reason = "Do mollit aute id excepteur enim culpa eu excepteur. Laboris exercitation mollit veniam ea ex amet est officia laborum ex sint elit sit. Aliquip eiusmod eiusmod amet laboris aliqua Lorem deserunt amet consectetur quis eu id consectetur veniam. Reprehenderit laboris voluptate exercitation est cillum irure nisi labore nulla. Aliquip amet exercitation quis cupidatat ipsum fugiat reprehenderit. Ullamco sit laboris qui tempor.",
    @created_date = "Tue Jul 06 2004 05:28:29 GMT+0000 (UTC)",
    @updated_date = "Fri May 04 2007 21:43:25 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 46,
    @cid_type = "software",
    @cid_id = 46,
    @requirement_type = "new_requirement",
    @requirement_id = 46,
    @order_comments = "Elit in dolore consequat velit do est. Irure mollit dolor sit ea nisi id duis nulla veniam. Eiusmod quis anim reprehenderit fugiat in nostrud anim cillum ad. Magna laborum amet dolor ullamco.",
    @priority = "medium",
    @expected_completion_date = "Mon May 28 2018 12:52:40 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  342122,
    @customer_name =  "COMDOM",
    @ship_to_address = "139 Winthrop Street, Jessie, Oregon, 4728",
    @model = "MP 2953TE",
    @old_cid =  "5ad0f021907b9b5db7b90ecb",
    @new_cid = "5ad0f02143a32fa17be63afc",
    @soa_instance_id = 47,
    @order_number = 550637,
    @order_line_number = 47,
    @solution = "Sunt fugiat deserunt et mollit aliqua ut id. Duis sit aute exercitation anim enim enim id velit commodo reprehenderit dolor ullamco. Nulla Lorem in tempor adipisicing ipsum reprehenderit fugiat. Mollit ut sit mollit reprehenderit officia mollit reprehenderit reprehenderit do dolor anim officia aute veniam. Sit occaecat qui exercitation dolor exercitation.",
    @field_config = "Ipsum sunt nisi aute sit dolor minim do deserunt mollit ipsum. In duis elit eu culpa cillum consectetur exercitation officia cillum nostrud Lorem. Ex consequat non laborum deserunt consequat laboris anim sit. Sunt labore eiusmod dolore exercitation aute aliqua est velit incididunt minim reprehenderit est esse nulla. Excepteur culpa aute elit fugiat consequat cupidatat aute nisi cupidatat fugiat duis cupidatat Lorem.",
    @expiration_date = "Sun Apr 16 1989 12:31:55 GMT+0000 (UTC)",
    @expiration_reason = "Duis Lorem ipsum elit cupidatat. Occaecat dolor aliqua ad in cillum Lorem pariatur do officia ex. Anim et cillum adipisicing ad veniam cupidatat veniam qui sit excepteur labore Lorem consectetur.",
    @created_date = "Fri Jul 18 1986 14:13:23 GMT+0000 (UTC)",
    @updated_date = "Tue Jul 02 1985 17:39:42 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 47,
    @cid_type = "software",
    @cid_id = 47,
    @requirement_type = "revised_requirement",
    @requirement_id = 47,
    @order_comments = "Exercitation ad consectetur consectetur laborum exercitation est aute proident est laborum consectetur. Laborum consectetur duis eu non nostrud anim ullamco nostrud duis in nostrud qui irure. Adipisicing ut do incididunt dolor voluptate non aliquip elit irure fugiat deserunt dolore Lorem. Pariatur in dolore quis dolore nostrud cillum culpa. Enim in incididunt deserunt sit esse aliqua irure exercitation nulla in eu laborum amet fugiat.",
    @priority = "high",
    @expected_completion_date = "Sat Jun 09 2018 12:15:50 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  377237,
    @customer_name =  "ANDERSHUN",
    @ship_to_address = "164 Adelphi Street, Mulino, Missouri, 966",
    @model = "MP 2950SP",
    @old_cid =  "5ad0f0218afd43362885a905",
    @new_cid = "5ad0f021cf50000c63f930a3",
    @soa_instance_id = 48,
    @order_number = 792464,
    @order_line_number = 48,
    @solution = "Aliquip do nisi ut labore excepteur aliqua non eu occaecat ipsum quis. In aliquip ut elit mollit. Cillum in laborum aute nulla ex cillum aliquip id labore est laborum eiusmod magna exercitation. Laboris occaecat Lorem amet eu id ullamco. In anim aute duis fugiat dolore eiusmod anim proident.",
    @field_config = "Reprehenderit in nisi proident laboris sunt pariatur mollit ullamco enim labore minim do adipisicing nostrud. Est pariatur Lorem eiusmod quis veniam commodo incididunt nostrud fugiat. Anim enim cillum enim sint id id in eu aute mollit ullamco. Lorem cupidatat tempor duis ex nulla ut eu. Nostrud nostrud proident qui ex magna consequat ut ea.",
    @expiration_date = "Fri Jan 09 2015 23:27:35 GMT+0000 (UTC)",
    @expiration_reason = "Irure aliqua cupidatat laborum dolor. Nisi est sit cillum voluptate deserunt. Cupidatat in consectetur esse nulla ad consectetur excepteur fugiat deserunt. Sit culpa est culpa tempor aute ex et reprehenderit. Cillum nostrud anim nisi sunt nostrud qui tempor ad labore sint aliqua deserunt aute exercitation. Occaecat ipsum culpa dolor sunt elit proident id laborum consequat consequat ad commodo.",
    @created_date = "Tue Jan 15 2002 23:33:49 GMT+0000 (UTC)",
    @updated_date = "Mon Nov 17 2014 17:04:05 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 48,
    @cid_type = "hardware",
    @cid_id = 48,
    @requirement_type = "new_requirement",
    @requirement_id = 48,
    @order_comments = "Nulla culpa aute ipsum incididunt incididunt officia cillum ea dolor. Id nisi minim eiusmod in incididunt deserunt magna minim. Dolor cillum consectetur aute quis veniam. Veniam id incididunt excepteur sint pariatur quis aute consectetur. Et do tempor mollit in cillum enim sunt incididunt aliqua nisi magna reprehenderit. Labore aute aliqua eiusmod veniam aliqua consequat veniam sint. Irure exercitation labore voluptate irure est.",
    @priority = "medium",
    @expected_completion_date = "Wed May 02 2018 15:35:02 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  420814,
    @customer_name =  "POLARIUM",
    @ship_to_address = "449 Duryea Place, Washington, Washington, 7697",
    @model = "MP 2949 TE for Education",
    @old_cid =  "5ad0f02177b7871b76aba779",
    @new_cid = "5ad0f021a289a86075e72d0c",
    @soa_instance_id = 49,
    @order_number = 976316,
    @order_line_number = 49,
    @solution = "Sint occaecat voluptate consectetur consequat esse. Laborum ea aliqua aute adipisicing laborum incididunt enim. Commodo enim occaecat deserunt exercitation elit qui aliquip ex deserunt mollit veniam. Ea excepteur consectetur mollit eiusmod labore excepteur cillum magna reprehenderit laboris qui.",
    @field_config = "Aliquip exercitation eiusmod Lorem aliquip adipisicing proident commodo nostrud do id. Elit ea velit dolore elit tempor nisi reprehenderit. Aliquip aliqua cupidatat cupidatat velit nulla culpa fugiat. Eiusmod labore et reprehenderit eu proident duis amet voluptate cupidatat. Adipisicing excepteur eu reprehenderit officia voluptate. Tempor eiusmod laborum amet amet pariatur consectetur do officia enim est id commodo. Laborum ex reprehenderit commodo deserunt.",
    @expiration_date = "Thu May 04 1978 20:18:24 GMT+0000 (UTC)",
    @expiration_reason = "Exercitation commodo veniam consectetur fugiat officia anim cupidatat laborum aliquip. Ex velit non culpa laboris ipsum duis aliquip irure commodo eiusmod. Dolor consectetur non do sint reprehenderit elit eiusmod incididunt. Qui non est non non id ut. Duis enim sit ipsum do. Commodo enim qui tempor consectetur voluptate cillum fugiat incididunt laboris.",
    @created_date = "Tue Sep 18 2007 01:03:16 GMT+0000 (UTC)",
    @updated_date = "Sun Jul 03 1983 08:53:25 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 49,
    @cid_type = "hardware",
    @cid_id = 49,
    @requirement_type = "new_requirement",
    @requirement_id = 49,
    @order_comments = "Nulla do sit amet sit ex officia sint elit est et deserunt aliquip amet. Duis occaecat elit commodo in dolore adipisicing dolor ad proident est deserunt. Ullamco incididunt nostrud nulla esse ad deserunt incididunt duis. Nisi sunt exercitation quis qui adipisicing commodo magna proident. Commodo magna mollit labore velit et Lorem reprehenderit ut veniam magna pariatur sit tempor esse.",
    @priority = "low",
    @expected_completion_date = "Mon Jun 04 2018 09:37:58 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  78932,
    @customer_name =  "STREZZO",
    @ship_to_address = "965 Fay Court, Jackpot, Minnesota, 7792",
    @model = "MP 2882SP",
    @old_cid =  "5ad0f0213b1db436193cb707",
    @new_cid = "5ad0f021268ee6580150eeb3",
    @soa_instance_id = 50,
    @order_number = 303748,
    @order_line_number = 50,
    @solution = "Ad consequat ea sit elit reprehenderit elit anim laboris. Duis reprehenderit pariatur culpa tempor do eiusmod nostrud id proident consectetur consectetur non labore tempor. Fugiat veniam quis excepteur et velit ex deserunt consequat excepteur. Minim eiusmod eiusmod ea qui voluptate nisi reprehenderit magna magna do in sit id. Occaecat consequat occaecat ea adipisicing sint aliquip dolore aliqua et aliqua. Esse labore excepteur aliquip dolor consectetur laboris dolor ullamco nulla elit voluptate sit fugiat. Non esse enim ad et deserunt veniam Lorem commodo pariatur proident aliquip adipisicing deserunt.",
    @field_config = "Laborum ullamco fugiat aliqua deserunt nostrud. Est incididunt do reprehenderit ut. Ipsum irure excepteur commodo fugiat ipsum. Cillum laboris esse laborum fugiat deserunt est. Est qui Lorem amet esse do enim tempor aute consectetur exercitation voluptate ea adipisicing minim.",
    @expiration_date = "Sat Apr 25 2009 05:31:10 GMT+0000 (UTC)",
    @expiration_reason = "Tempor sunt irure ut fugiat tempor minim aliqua ullamco qui non elit. Aliqua quis eiusmod est consequat fugiat dolore. Ut deserunt cupidatat ullamco dolor.",
    @created_date = "Sun Oct 15 1972 11:09:26 GMT+0000 (UTC)",
    @updated_date = "Mon Nov 21 2016 13:07:42 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 50,
    @cid_type = "hardware",
    @cid_id = 50,
    @requirement_type = "revised_requirement",
    @requirement_id = 50,
    @order_comments = "Laborum sunt eu ea sint aliqua nostrud elit nulla. Voluptate aliquip culpa tempor adipisicing commodo amet officia Lorem sit aliquip id quis. Veniam sit Lorem dolor cillum laborum sunt amet voluptate ipsum culpa nostrud ullamco cillum. Aute et exercitation do reprehenderit. Exercitation ex cupidatat commodo pariatur sint. In labore exercitation proident velit cillum cillum duis dolore.",
    @priority = "medium",
    @expected_completion_date = "Wed May 09 2018 11:16:50 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  18445,
    @customer_name =  "ROTODYNE",
    @ship_to_address = "147 Chester Court, Dixie, Louisiana, 643",
    @model = "MP 3799SP",
    @old_cid =  "5ad0f021732e1f99938af3ff",
    @new_cid = "5ad0f021d0f881b220263bb4",
    @soa_instance_id = 51,
    @order_number = 51121,
    @order_line_number = 51,
    @solution = "Occaecat adipisicing sunt cupidatat exercitation ipsum ea sint qui anim laborum esse. Consectetur laborum ex anim id consectetur id. Nisi laboris aute ea sint magna anim labore enim tempor eu. Laboris magna dolor elit ullamco consequat sunt laborum culpa ea quis nostrud officia magna.",
    @field_config = "Reprehenderit incididunt irure commodo exercitation ullamco irure laborum consequat culpa laboris. Labore cillum nisi non reprehenderit esse elit reprehenderit proident aliqua minim ut consectetur. Est magna ullamco in veniam nisi laboris ea ipsum duis culpa. Occaecat est laboris laboris elit veniam excepteur irure est amet esse. Occaecat culpa ea veniam voluptate nulla minim pariatur. Laborum sit excepteur laboris in irure pariatur. Irure minim laboris eu consectetur mollit voluptate aliqua eiusmod laborum elit.",
    @expiration_date = "Wed Dec 09 1998 02:52:45 GMT+0000 (UTC)",
    @expiration_reason = "Labore proident officia laboris ex ad fugiat tempor. Culpa consequat qui consectetur labore eu laboris et pariatur id. Laboris consequat consectetur non nulla commodo exercitation eiusmod dolor fugiat ipsum culpa elit tempor. Elit non aute mollit consequat irure amet excepteur et ex cupidatat.",
    @created_date = "Thu Sep 25 1986 14:07:24 GMT+0000 (UTC)",
    @updated_date = "Thu May 11 1972 12:08:12 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 51,
    @cid_type = "hardware",
    @cid_id = 51,
    @requirement_type = "new_requirement",
    @requirement_id = 51,
    @order_comments = "Pariatur et minim quis dolore duis est est et. Sit consectetur aute dolore esse qui incididunt occaecat. Anim deserunt deserunt occaecat sit irure anim sunt reprehenderit amet id reprehenderit in ex pariatur. Eu proident exercitation incididunt exercitation dolore aliqua aliquip voluptate nostrud proident.",
    @priority = "medium",
    @expected_completion_date = "Tue May 01 2018 20:49:33 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  178727,
    @customer_name =  "KIGGLE",
    @ship_to_address = "936 Tillary Street, Ypsilanti, Pennsylvania, 4664",
    @model = "MP 2481SP",
    @old_cid =  "5ad0f021e5f6a4cc1b5a01ab",
    @new_cid = "5ad0f021b5f50919daa1efd2",
    @soa_instance_id = 52,
    @order_number = 822340,
    @order_line_number = 52,
    @solution = "Sit dolore elit id cupidatat. Labore laboris est in fugiat sint mollit laboris ad nostrud. Consectetur non in cillum consectetur enim laboris exercitation consequat non nulla laboris dolore. Veniam veniam commodo adipisicing fugiat et consequat velit velit cillum labore tempor. Sit ad magna incididunt veniam ex in cillum.",
    @field_config = "Enim sint esse esse reprehenderit laboris et. Do nulla proident ad cillum dolor sit laboris sint ipsum mollit dolore cillum reprehenderit. Commodo reprehenderit reprehenderit enim tempor. Nostrud proident deserunt non eiusmod. Dolor aute aliqua anim exercitation mollit deserunt. Sunt culpa quis exercitation amet nulla nulla do consectetur culpa dolor anim veniam fugiat ullamco.",
    @expiration_date = "Fri Feb 28 1997 07:51:04 GMT+0000 (UTC)",
    @expiration_reason = "Cupidatat exercitation ut adipisicing amet anim consequat labore pariatur Lorem aliqua sint commodo officia do. Et ea incididunt ut dolor adipisicing laborum enim. Voluptate proident qui ut ipsum qui ea sit pariatur incididunt ipsum amet aliqua in ex. Enim pariatur eu do cupidatat aute. Duis veniam voluptate magna irure consequat occaecat mollit aliquip ipsum elit veniam. Culpa labore Lorem cillum proident aute exercitation ipsum sit veniam magna aliqua. Aliqua dolore nisi nulla laboris reprehenderit et.",
    @created_date = "Fri Nov 05 1993 15:03:23 GMT+0000 (UTC)",
    @updated_date = "Sun Apr 16 1978 16:13:44 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 52,
    @cid_type = "software",
    @cid_id = 52,
    @requirement_type = "new_requirement",
    @requirement_id = 52,
    @order_comments = "Non dolor ad eiusmod id aliqua duis adipisicing cupidatat ea nulla. Exercitation veniam nisi esse non. Nisi Lorem anim aute labore sunt duis nisi enim enim culpa. Non dolor nisi cillum consectetur elit duis excepteur amet magna.",
    @priority = "high",
    @expected_completion_date = "Fri Jun 01 2018 15:16:05 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  161099,
    @customer_name =  "ZIALACTIC",
    @ship_to_address = "137 Polar Street, Shelby, Delaware, 2738",
    @model = "MP 3655TE",
    @old_cid =  "5ad0f021cecd6c0b3a0c10b0",
    @new_cid = "5ad0f021ca452c953f0d2604",
    @soa_instance_id = 53,
    @order_number = 864077,
    @order_line_number = 53,
    @solution = "Ex id adipisicing occaecat dolore anim veniam deserunt voluptate. Cupidatat pariatur dolor consectetur aliqua aliquip quis in commodo sit ad voluptate consequat. Veniam in pariatur amet reprehenderit eiusmod non. Est tempor magna in ex ad nisi occaecat ut consectetur. Lorem voluptate cupidatat qui occaecat anim tempor eiusmod consequat nostrud veniam sit dolore. Non excepteur laboris duis commodo.",
    @field_config = "Irure ullamco ex esse deserunt officia qui proident eu cillum Lorem. Adipisicing consequat deserunt officia amet incididunt proident. Et qui nostrud irure ipsum eu pariatur aliquip laborum ex.",
    @expiration_date = "Mon Mar 11 2002 19:58:01 GMT+0000 (UTC)",
    @expiration_reason = "Incididunt voluptate do deserunt do ut anim consectetur non aliquip nisi aliquip dolore excepteur. Sunt aliqua commodo mollit nulla. Id occaecat voluptate irure consectetur consectetur dolor nostrud. Irure qui tempor sint cupidatat reprehenderit anim laboris Lorem labore nisi.",
    @created_date = "Wed Nov 10 1971 05:22:34 GMT+0000 (UTC)",
    @updated_date = "Mon Mar 01 1971 22:06:49 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 53,
    @cid_type = "hardware",
    @cid_id = 53,
    @requirement_type = "revised_requirement",
    @requirement_id = 53,
    @order_comments = "Mollit cillum eiusmod id pariatur. Exercitation occaecat sit ex sint sit esse. Minim ut excepteur ad et incididunt irure. Qui consequat et esse aliquip commodo ullamco labore consectetur. Non veniam reprehenderit incididunt enim qui quis excepteur reprehenderit mollit anim ex. Ut eu labore consequat labore cillum non nulla et velit incididunt voluptate magna ea fugiat.",
    @priority = "medium",
    @expected_completion_date = "Tue May 29 2018 07:09:03 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  39039,
    @customer_name =  "PAWNAGRA",
    @ship_to_address = "923 Boardwalk , Brandermill, Florida, 4818",
    @model = "MP 3935TE",
    @old_cid =  "5ad0f0219cbb4a413e436729",
    @new_cid = "5ad0f02133ee8ec9b9697d12",
    @soa_instance_id = 54,
    @order_number = 175407,
    @order_line_number = 54,
    @solution = "Commodo officia cillum sint esse minim commodo eiusmod ullamco. Dolore tempor duis eiusmod magna voluptate excepteur officia culpa. Exercitation ea duis eu tempor do ea adipisicing officia labore pariatur mollit cillum laborum mollit.",
    @field_config = "Non eu fugiat nisi minim in consequat aliqua. Excepteur nostrud pariatur duis aliqua aute ut eiusmod eu enim aliquip. Laborum ullamco elit nulla nostrud anim exercitation consequat labore. Voluptate tempor commodo cillum eiusmod minim commodo amet incididunt qui elit occaecat laboris. Pariatur minim ex pariatur veniam deserunt proident dolor dolore enim amet voluptate consectetur. Anim reprehenderit aliqua esse sit duis laborum adipisicing elit eu anim culpa do quis. Esse exercitation nisi dolore minim et elit ullamco aute occaecat do.",
    @expiration_date = "Wed Dec 25 1974 03:15:30 GMT+0000 (UTC)",
    @expiration_reason = "Dolor culpa aliquip deserunt Lorem velit voluptate nisi. Elit id amet ad sit sit occaecat reprehenderit veniam excepteur ad cupidatat elit. Ea non consequat laboris magna ipsum dolore ea exercitation cillum commodo dolor do. Commodo fugiat ea quis ipsum. Id voluptate id dolore laborum non laborum et sit nisi enim et ullamco cillum. Aute deserunt mollit eu officia voluptate aliqua ipsum mollit laboris eu consequat. Culpa eu esse officia reprehenderit velit pariatur reprehenderit exercitation culpa consequat labore duis ex ipsum.",
    @created_date = "Wed Jun 09 1976 01:20:41 GMT+0000 (UTC)",
    @updated_date = "Sun Nov 23 1980 01:46:06 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 54,
    @cid_type = "hardware",
    @cid_id = 54,
    @requirement_type = "revised_requirement",
    @requirement_id = 54,
    @order_comments = "In in nostrud incididunt officia velit nulla commodo labore. Amet sit sit sint laborum cupidatat sint adipisicing mollit nulla dolor laboris nostrud. Duis dolore voluptate sit ea occaecat dolore nisi adipisicing laborum dolore nisi proident cillum laboris. Eu culpa reprehenderit duis laborum pariatur enim minim consequat voluptate dolor amet.",
    @priority = "low",
    @expected_completion_date = "Tue Jun 19 2018 00:53:49 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  384864,
    @customer_name =  "AMRIL",
    @ship_to_address = "810 Joralemon Street, Westmoreland, Alaska, 4871",
    @model = "MP 2389 TE for Education",
    @old_cid =  "5ad0f021dd642bd833c119ce",
    @new_cid = "5ad0f021acd478933dd400f1",
    @soa_instance_id = 55,
    @order_number = 509556,
    @order_line_number = 55,
    @solution = "Eu mollit anim nostrud ex proident veniam enim irure aliqua officia et cupidatat. Id mollit dolore in culpa sunt. Deserunt amet commodo laboris aliqua nostrud sint veniam sint veniam laboris nisi ipsum. Amet nostrud nostrud veniam in fugiat ut consequat do esse anim. Non tempor ea sunt cillum ullamco sit culpa cupidatat commodo do adipisicing. Nisi anim non ad mollit adipisicing aliquip labore officia et laborum esse reprehenderit labore in.",
    @field_config = "Cillum commodo ullamco irure adipisicing do anim officia eiusmod in. Dolor ex nostrud sit ut magna tempor. Eu occaecat deserunt eu tempor. Excepteur laborum nostrud eiusmod excepteur do duis. Qui id do Lorem qui. Veniam do fugiat non cillum sit fugiat in in excepteur ea irure aute. Sunt laborum anim magna cillum nostrud pariatur nisi minim reprehenderit.",
    @expiration_date = "Tue May 18 1982 10:11:20 GMT+0000 (UTC)",
    @expiration_reason = "Duis dolore elit eiusmod nostrud. Id nostrud et duis eu sint ipsum esse ex adipisicing magna fugiat. Eiusmod tempor officia mollit voluptate cillum adipisicing velit magna. Officia velit exercitation nulla eu id amet anim in in elit nisi sint. Anim non exercitation occaecat consequat cupidatat laborum minim.",
    @created_date = "Tue Sep 30 1975 13:47:45 GMT+0000 (UTC)",
    @updated_date = "Thu Jun 11 1981 12:27:29 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 55,
    @cid_type = "software",
    @cid_id = 55,
    @requirement_type = "revised_requirement",
    @requirement_id = 55,
    @order_comments = "Anim laboris non magna anim ad veniam. Ipsum tempor voluptate nulla qui sunt nostrud sit. Quis enim esse et tempor laboris.",
    @priority = "medium",
    @expected_completion_date = "Wed May 09 2018 12:04:42 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  286389,
    @customer_name =  "VERTIDE",
    @ship_to_address = "825 Tabor Court, Crumpler, West Virginia, 8593",
    @model = "MP 3080TE",
    @old_cid =  "5ad0f021dd3473d94e25ac26",
    @new_cid = "5ad0f021d36bb00345cfffb4",
    @soa_instance_id = 56,
    @order_number = 133593,
    @order_line_number = 56,
    @solution = "In est anim sunt commodo eiusmod sit commodo. In elit nisi aliqua dolore eu dolore ut voluptate deserunt anim labore. Ad ut dolore ea pariatur occaecat aliquip laborum in. Incididunt do do do irure.",
    @field_config = "Id minim consequat ex enim nulla tempor deserunt. Commodo excepteur magna sint et enim aute consequat et ullamco voluptate. Laboris enim ad ea esse deserunt fugiat velit exercitation id. Do minim ad cupidatat est quis pariatur mollit labore elit minim. Laborum enim qui sit laboris do incididunt. Adipisicing ut excepteur nisi quis consectetur magna ut cupidatat.",
    @expiration_date = "Wed Nov 13 2002 15:45:18 GMT+0000 (UTC)",
    @expiration_reason = "Fugiat nulla officia pariatur eiusmod minim ipsum minim occaecat aute enim sit. Consectetur incididunt dolor id tempor incididunt. Ullamco Lorem labore amet sint Lorem culpa do.",
    @created_date = "Mon Mar 03 1997 01:33:34 GMT+0000 (UTC)",
    @updated_date = "Thu Jul 31 1986 04:34:46 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 56,
    @cid_type = "software",
    @cid_id = 56,
    @requirement_type = "revised_requirement",
    @requirement_id = 56,
    @order_comments = "Nulla cupidatat sit culpa nulla mollit non aliqua. Id consequat deserunt nisi occaecat tempor anim elit cillum aliqua reprehenderit occaecat. Veniam laboris sint dolore mollit consectetur proident minim Lorem ipsum culpa ullamco irure.",
    @priority = "low",
    @expected_completion_date = "Tue May 08 2018 10:04:39 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  80711,
    @customer_name =  "RAMEON",
    @ship_to_address = "464 Garden Street, Genoa, New York, 3680",
    @model = "MP 2887TE",
    @old_cid =  "5ad0f02114297e6cbc14a12b",
    @new_cid = "5ad0f0213d22cba716b8ebcf",
    @soa_instance_id = 57,
    @order_number = 765983,
    @order_line_number = 57,
    @solution = "Qui est cillum incididunt exercitation. Occaecat esse sunt proident anim ut non consequat sunt ea cillum pariatur ea. Eiusmod ullamco minim duis occaecat esse enim ex tempor ad. Deserunt culpa tempor in non fugiat pariatur. Id laborum elit dolore tempor ut nulla enim esse.",
    @field_config = "Consequat id et consequat sint adipisicing commodo. Laborum mollit occaecat irure pariatur mollit. Exercitation ea veniam do id ipsum cillum. Anim dolor dolor dolor occaecat qui Lorem culpa quis.",
    @expiration_date = "Wed Aug 22 2007 12:36:16 GMT+0000 (UTC)",
    @expiration_reason = "Sint dolore adipisicing laboris anim adipisicing veniam aliqua occaecat. Nulla sit ut ea qui quis dolore ea dolor ea consectetur. Deserunt officia ex et ipsum veniam est qui et commodo ea. Dolor eiusmod Lorem et consectetur consectetur ad laborum nulla labore et aute in. Est eiusmod tempor non veniam culpa.",
    @created_date = "Mon Aug 14 2017 15:06:49 GMT+0000 (UTC)",
    @updated_date = "Wed Sep 07 1988 04:35:55 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 57,
    @cid_type = "hardware",
    @cid_id = 57,
    @requirement_type = "revised_requirement",
    @requirement_id = 57,
    @order_comments = "Incididunt exercitation duis laboris eiusmod. Cillum dolore amet velit eu esse labore eiusmod eiusmod aliquip tempor aliquip non eiusmod minim. Adipisicing sit ea occaecat pariatur ea enim aliqua est anim sint eu ut. Cillum commodo veniam est voluptate laboris. Voluptate sit occaecat reprehenderit tempor eu.",
    @priority = "medium",
    @expected_completion_date = "Thu May 17 2018 01:02:03 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  116347,
    @customer_name =  "VIRXO",
    @ship_to_address = "341 Everit Street, Interlochen, North Carolina, 3266",
    @model = "MP 2688 TE for Education",
    @old_cid =  "5ad0f0216e61a962d0c6746a",
    @new_cid = "5ad0f02108a975f0503d0c8b",
    @soa_instance_id = 58,
    @order_number = 150495,
    @order_line_number = 58,
    @solution = "Ad officia deserunt id nostrud laborum magna nulla id deserunt in amet laboris ea. Sunt sunt sunt dolore mollit quis excepteur deserunt est ipsum. Velit adipisicing eu voluptate deserunt Lorem enim aliquip sint.",
    @field_config = "Eu incididunt duis ea Lorem veniam dolor incididunt. Nostrud fugiat officia tempor aute incididunt. Eiusmod exercitation in veniam ullamco ad sunt aliqua.",
    @expiration_date = "Fri Dec 21 1990 19:39:46 GMT+0000 (UTC)",
    @expiration_reason = "Irure esse occaecat laborum mollit fugiat. Enim ex et ea ex exercitation eiusmod dolor. Officia reprehenderit ea Lorem aliqua tempor ipsum non fugiat laboris consequat non. Non laboris Lorem exercitation laborum.",
    @created_date = "Wed Aug 15 1984 08:40:04 GMT+0000 (UTC)",
    @updated_date = "Fri Oct 09 2015 22:05:22 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 58,
    @cid_type = "hardware",
    @cid_id = 58,
    @requirement_type = "new_requirement",
    @requirement_id = 58,
    @order_comments = "Reprehenderit amet sint aliqua anim aliquip sit aute irure eu et. Mollit nostrud labore qui commodo in irure minim dolor eu ea sit. Nisi culpa officia ex minim incididunt fugiat incididunt est id. Consectetur qui fugiat veniam magna est. Officia excepteur laborum magna velit aute ea eu cupidatat commodo voluptate Lorem non elit.",
    @priority = "high",
    @expected_completion_date = "Sun May 13 2018 00:07:22 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  124628,
    @customer_name =  "ZILIDIUM",
    @ship_to_address = "478 Exeter Street, Springville, Connecticut, 4676",
    @model = "MP 4205 TE for Education",
    @old_cid =  "5ad0f021c07c18c88b3b6340",
    @new_cid = "5ad0f021ac5b61608a317290",
    @soa_instance_id = 59,
    @order_number = 567703,
    @order_line_number = 59,
    @solution = "Cillum culpa consequat pariatur ut duis officia tempor ullamco et cupidatat ut nostrud cupidatat id. Nisi enim ipsum reprehenderit pariatur veniam sunt magna ipsum commodo sint amet velit aute. Lorem quis amet et laborum minim quis consectetur voluptate officia commodo. Magna dolor esse anim magna ut.",
    @field_config = "Aliqua ullamco in consequat aliquip consequat esse. Commodo veniam ut elit laboris pariatur deserunt laborum esse sit deserunt esse. Sunt labore commodo nulla velit consectetur do laboris laboris nulla.",
    @expiration_date = "Thu Mar 02 1989 16:25:26 GMT+0000 (UTC)",
    @expiration_reason = "Sint nostrud esse enim ad ipsum laborum in est non irure aliquip occaecat anim ex. Sint exercitation ea sunt ullamco ad excepteur labore duis. Ex nostrud magna velit sit irure laboris et nulla. Nisi sit nisi in duis excepteur. In in adipisicing do non sint veniam veniam veniam ullamco incididunt reprehenderit elit.",
    @created_date = "Fri Jul 09 1976 01:34:53 GMT+0000 (UTC)",
    @updated_date = "Sun Jan 10 1999 03:22:34 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 59,
    @cid_type = "hardware",
    @cid_id = 59,
    @requirement_type = "new_requirement",
    @requirement_id = 59,
    @order_comments = "Quis culpa in minim est deserunt ipsum officia ullamco nulla consectetur. Exercitation adipisicing anim aute tempor officia aliqua non. Quis ipsum sunt do veniam esse tempor consequat nisi. Laboris est culpa exercitation elit reprehenderit veniam voluptate voluptate fugiat ad consequat deserunt ut. Non id eu est laboris consequat consectetur in sint commodo. Tempor ullamco tempor consequat dolore nostrud minim eiusmod duis ea ipsum. Fugiat duis enim consectetur est deserunt amet dolore voluptate reprehenderit.",
    @priority = "medium",
    @expected_completion_date = "Sat May 19 2018 00:52:16 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  410392,
    @customer_name =  "KYAGURU",
    @ship_to_address = "781 Veronica Place, Roosevelt, Arizona, 7702",
    @model = "MP 3161SP",
    @old_cid =  "5ad0f022a7efce80b32c6f0a",
    @new_cid = "5ad0f0223736bcd36036015f",
    @soa_instance_id = 60,
    @order_number = 215373,
    @order_line_number = 60,
    @solution = "Non quis est do magna dolor nostrud qui enim ullamco ullamco cupidatat. Adipisicing dolor esse ea magna esse irure. Esse exercitation anim esse esse dolore esse nostrud officia. Laboris veniam nisi adipisicing labore incididunt minim pariatur. Incididunt nisi sint dolore consectetur.",
    @field_config = "Incididunt velit ex dolor eiusmod ex adipisicing. Eu ullamco reprehenderit occaecat reprehenderit proident. Quis cupidatat ipsum ullamco excepteur. Sit laborum aute aliqua proident excepteur consectetur nostrud sit nostrud.",
    @expiration_date = "Tue Dec 18 1990 12:28:00 GMT+0000 (UTC)",
    @expiration_reason = "Do reprehenderit cupidatat nostrud officia laborum est quis ipsum labore nulla aliqua Lorem. Fugiat magna consectetur laboris do consectetur pariatur occaecat pariatur cupidatat in excepteur excepteur ex. Ut ipsum tempor quis sit velit sint sint Lorem. Ex nostrud adipisicing laboris Lorem Lorem in excepteur. Do aute ipsum est ad ipsum aute fugiat laborum elit adipisicing dolor velit nisi ut. Eu laborum excepteur occaecat elit duis laboris eu ex cupidatat incididunt nulla in aute. Officia deserunt exercitation nulla amet do non fugiat id eu.",
    @created_date = "Mon Mar 20 1989 17:04:51 GMT+0000 (UTC)",
    @updated_date = "Sun Nov 06 1977 15:00:15 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 60,
    @cid_type = "software",
    @cid_id = 60,
    @requirement_type = "revised_requirement",
    @requirement_id = 60,
    @order_comments = "Sit magna nostrud eu laboris ad reprehenderit adipisicing exercitation dolore et culpa. Do cupidatat commodo aliqua officia. Id labore mollit tempor mollit tempor elit laboris incididunt dolor ut excepteur esse. Commodo nisi adipisicing nostrud ex ut. Consectetur occaecat sit do pariatur voluptate culpa in enim minim commodo sit voluptate. Pariatur nulla culpa laboris pariatur incididunt veniam exercitation consectetur nisi sunt adipisicing. Excepteur elit aute deserunt aliquip fugiat ipsum amet sint in elit in.",
    @priority = "low",
    @expected_completion_date = "Sat Apr 28 2018 10:04:38 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  91366,
    @customer_name =  "POWERNET",
    @ship_to_address = "133 Engert Avenue, Ona, Maine, 642",
    @model = "MP 2653TE",
    @old_cid =  "5ad0f022cad8757955585e91",
    @new_cid = "5ad0f0227282a2f79e144601",
    @soa_instance_id = 61,
    @order_number = 873047,
    @order_line_number = 61,
    @solution = "Lorem amet pariatur est aute consectetur. Mollit sint consequat laboris occaecat non aute velit irure consequat irure eiusmod. Ex tempor non labore qui esse sint sit qui do. Sunt aliquip ut sunt cupidatat nulla nostrud aliquip commodo velit. Sit eiusmod minim aute laborum do aliqua consectetur ullamco proident ipsum sit eu do deserunt.",
    @field_config = "Dolor esse in velit cupidatat amet ex laborum amet commodo ipsum laborum. Occaecat id duis Lorem pariatur aute aliquip ea est. In ullamco aute aliqua pariatur pariatur ex aute consequat magna exercitation minim velit enim.",
    @expiration_date = "Tue Feb 12 1980 00:03:58 GMT+0000 (UTC)",
    @expiration_reason = "Et labore minim in velit tempor ut minim adipisicing occaecat dolor. Nostrud in laboris et commodo ullamco nostrud minim ex sunt aliqua aute mollit duis proident. Laboris ex ad ad amet magna velit incididunt amet incididunt consectetur. Ex ut officia ullamco cupidatat. Officia proident tempor amet ipsum commodo aliqua occaecat. Fugiat adipisicing deserunt in aute irure. Consequat cupidatat enim fugiat deserunt irure mollit ea dolor.",
    @created_date = "Sun Oct 20 1991 18:58:32 GMT+0000 (UTC)",
    @updated_date = "Wed Aug 10 1977 13:18:10 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 61,
    @cid_type = "software",
    @cid_id = 61,
    @requirement_type = "new_requirement",
    @requirement_id = 61,
    @order_comments = "Nostrud magna qui ex sunt nulla duis est adipisicing quis aliquip adipisicing non. Nostrud cupidatat duis et quis nostrud esse officia pariatur veniam occaecat tempor. Incididunt non minim elit elit quis ullamco incididunt officia pariatur irure ad adipisicing. Eiusmod eu irure reprehenderit veniam adipisicing ullamco do consequat nostrud nulla.",
    @priority = "high",
    @expected_completion_date = "Tue Jun 05 2018 01:21:08 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  377431,
    @customer_name =  "ACRUEX",
    @ship_to_address = "774 Lincoln Avenue, Darlington, Northern Mariana Islands, 6897",
    @model = "MP 3306 TE for Education",
    @old_cid =  "5ad0f022ae4e00f5abb144ef",
    @new_cid = "5ad0f022ca1c252cc9c52be4",
    @soa_instance_id = 62,
    @order_number = 339148,
    @order_line_number = 62,
    @solution = "Nulla reprehenderit id consectetur laborum anim proident mollit voluptate irure anim reprehenderit do eiusmod. Pariatur non aliquip pariatur amet officia anim excepteur mollit et. Lorem veniam aute nisi do labore ad et dolore ea ad pariatur est. Nostrud ullamco aliqua incididunt consectetur in do non irure reprehenderit.",
    @field_config = "Excepteur aliqua cupidatat irure sint nostrud ad dolore elit id nulla velit irure sunt. Et aute ullamco veniam duis ut. Aliquip sunt veniam ea nostrud. Cillum ea minim enim sint ullamco eiusmod qui aliqua aliquip elit. Adipisicing sunt ut nostrud ipsum id excepteur deserunt elit. Tempor eu do enim ea ea qui esse veniam et non. In labore eiusmod quis ut sunt ut veniam veniam eu non do officia laborum.",
    @expiration_date = "Mon Oct 28 1985 09:43:19 GMT+0000 (UTC)",
    @expiration_reason = "Dolore elit cupidatat exercitation sunt sit. Tempor velit mollit sunt ullamco nulla anim id. Tempor duis sint dolor duis excepteur anim minim officia duis eu ullamco ex. Fugiat sint voluptate dolore est reprehenderit laborum proident elit ullamco officia. Officia do labore qui et deserunt laborum tempor sit. Deserunt sint Lorem deserunt id irure et dolor amet aliqua ipsum ut pariatur proident.",
    @created_date = "Thu Jul 09 1981 07:13:39 GMT+0000 (UTC)",
    @updated_date = "Tue Jun 09 1970 01:19:37 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 62,
    @cid_type = "software",
    @cid_id = 62,
    @requirement_type = "revised_requirement",
    @requirement_id = 62,
    @order_comments = "Dolore voluptate adipisicing qui id mollit dolor sint voluptate aute irure aute non excepteur. Pariatur proident mollit deserunt laborum sunt ea sunt cupidatat irure consectetur. Enim et cillum id proident laborum deserunt. Culpa do velit est nisi. Nisi voluptate enim incididunt ex do nisi. Sint non anim nisi elit eu est nostrud.",
    @priority = "low",
    @expected_completion_date = "Mon Jun 25 2018 02:39:58 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  269097,
    @customer_name =  "DYNO",
    @ship_to_address = "564 Jackson Street, Marysville, Nebraska, 5449",
    @model = "MP 3586SP",
    @old_cid =  "5ad0f022db4b819bb1acd41f",
    @new_cid = "5ad0f02250d0557439184cd2",
    @soa_instance_id = 63,
    @order_number = 207048,
    @order_line_number = 63,
    @solution = "Voluptate occaecat proident ad anim veniam. Ut exercitation laborum nisi in esse tempor tempor amet laborum irure ipsum sit deserunt. Nisi do ea esse sunt enim Lorem do proident.",
    @field_config = "Ex consequat dolor labore cupidatat non eu esse est eu ad. Reprehenderit cupidatat laborum Lorem magna magna aliqua amet laboris minim veniam velit esse velit. Consectetur deserunt in sit ea ipsum duis anim eiusmod consectetur. Aliquip anim magna ad qui. Qui nulla amet deserunt consequat non ipsum velit id sint duis minim excepteur. Non officia consequat dolor elit sit sint ut dolore. Lorem nisi adipisicing ipsum esse.",
    @expiration_date = "Wed Aug 22 2012 11:12:15 GMT+0000 (UTC)",
    @expiration_reason = "Aliqua velit sit quis voluptate. Irure cupidatat veniam ipsum duis non Lorem est Lorem eiusmod cillum irure sit proident. Incididunt quis sit enim sit. Voluptate sit pariatur excepteur ex ullamco pariatur tempor laboris reprehenderit reprehenderit nulla qui. Amet tempor deserunt consequat dolore aute excepteur. Veniam sit adipisicing consequat sint non amet est. Irure est ea exercitation commodo proident dolor tempor.",
    @created_date = "Fri Feb 23 2018 13:44:09 GMT+0000 (UTC)",
    @updated_date = "Mon Aug 23 1976 23:03:50 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 63,
    @cid_type = "software",
    @cid_id = 63,
    @requirement_type = "revised_requirement",
    @requirement_id = 63,
    @order_comments = "Sit culpa qui amet sit consectetur tempor consectetur sit nisi. Velit minim sit est enim anim consectetur do dolor ad eiusmod aliquip. Sint quis Lorem anim veniam ea duis.",
    @priority = "high",
    @expected_completion_date = "Tue Apr 24 2018 22:09:03 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  276422,
    @customer_name =  "DIGIPRINT",
    @ship_to_address = "879 Virginia Place, Silkworth, Ohio, 7202",
    @model = "MP 3547TE",
    @old_cid =  "5ad0f0224b968bd7789bbbed",
    @new_cid = "5ad0f022b73adca26dba704b",
    @soa_instance_id = 64,
    @order_number = 304432,
    @order_line_number = 64,
    @solution = "Commodo qui aliqua consequat pariatur adipisicing proident. Excepteur ullamco deserunt enim exercitation. Sunt sunt reprehenderit tempor aliqua nisi non sit aliqua. In nisi enim exercitation duis in irure velit est ea cupidatat. Elit proident eu incididunt irure est aute duis enim. Ad adipisicing adipisicing nostrud exercitation excepteur qui voluptate nostrud.",
    @field_config = "Dolore sint in esse velit dolore deserunt officia sunt quis do occaecat exercitation. Pariatur adipisicing consequat ut incididunt aliqua ea nisi. Do deserunt dolor est est. Occaecat nostrud ullamco magna deserunt quis nisi laborum magna aliqua cupidatat elit. Ullamco reprehenderit labore et laborum officia non minim eu commodo sunt et et. Ullamco reprehenderit magna incididunt anim sint cupidatat eiusmod minim voluptate cillum Lorem adipisicing. Qui cillum esse quis aute cupidatat incididunt fugiat.",
    @expiration_date = "Wed Nov 19 2008 20:04:12 GMT+0000 (UTC)",
    @expiration_reason = "Tempor nulla enim do quis ad in occaecat pariatur consectetur. Veniam eu veniam ad eiusmod est enim occaecat excepteur. Ipsum eiusmod sint est ipsum duis. Qui dolor cupidatat quis reprehenderit incididunt Lorem ad excepteur cillum esse non. Pariatur sunt consectetur deserunt cupidatat qui non quis ad aute in ea.",
    @created_date = "Mon Jul 20 2015 04:00:57 GMT+0000 (UTC)",
    @updated_date = "Sat Mar 28 1981 14:20:29 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 64,
    @cid_type = "software",
    @cid_id = 64,
    @requirement_type = "new_requirement",
    @requirement_id = 64,
    @order_comments = "Magna in anim esse deserunt excepteur qui occaecat dolor culpa. Occaecat deserunt esse ullamco tempor ipsum do irure cupidatat officia id in pariatur consequat. Tempor enim et magna quis anim pariatur. Aliqua qui consectetur sint id do.",
    @priority = "low",
    @expected_completion_date = "Sun Apr 15 2018 16:09:50 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  277318,
    @customer_name =  "LYRICHORD",
    @ship_to_address = "154 Clara Street, Bagtown, Alabama, 4618",
    @model = "MP 4040 TE for Education",
    @old_cid =  "5ad0f0228ea6fa5988d4ca71",
    @new_cid = "5ad0f0225fb6e28045324908",
    @soa_instance_id = 65,
    @order_number = 637592,
    @order_line_number = 65,
    @solution = "Sunt excepteur consectetur aliquip veniam dolor veniam elit sit amet. Mollit qui officia deserunt eiusmod occaecat cillum tempor consectetur minim est reprehenderit officia duis. Nulla do esse ipsum nulla ut magna voluptate ex proident qui id duis mollit consectetur.",
    @field_config = "Excepteur velit officia dolore do ad et ullamco amet eu. Enim aute eu labore amet pariatur amet commodo officia ipsum incididunt est aute incididunt ea. Ut tempor et magna consequat esse sit exercitation ut ullamco.",
    @expiration_date = "Tue Dec 29 1981 09:59:41 GMT+0000 (UTC)",
    @expiration_reason = "Consequat nulla est et mollit aliquip adipisicing. Et in ipsum fugiat voluptate laboris adipisicing Lorem fugiat commodo nisi esse incididunt qui dolore. Duis labore ut labore dolore. Officia labore labore non ullamco aliqua veniam quis ullamco nulla. Duis ullamco magna et qui duis culpa in amet Lorem ex id aute.",
    @created_date = "Fri Oct 12 2007 05:29:40 GMT+0000 (UTC)",
    @updated_date = "Mon Sep 26 1983 16:58:02 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 65,
    @cid_type = "software",
    @cid_id = 65,
    @requirement_type = "new_requirement",
    @requirement_id = 65,
    @order_comments = "Cillum consectetur non tempor sint deserunt ipsum. Amet est occaecat excepteur consequat dolor ea deserunt id est aliquip eu. Laborum incididunt id elit reprehenderit ex exercitation ut velit dolore. Aute exercitation id mollit culpa et ullamco ad cupidatat.",
    @priority = "low",
    @expected_completion_date = "Mon Jun 04 2018 05:05:03 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  228209,
    @customer_name =  "NETAGY",
    @ship_to_address = "314 Throop Avenue, Gambrills, Massachusetts, 6214",
    @model = "MP 4023SP",
    @old_cid =  "5ad0f022ee9a5b7e9a2d6c62",
    @new_cid = "5ad0f0222cb2d7f5865411cd",
    @soa_instance_id = 66,
    @order_number = 703683,
    @order_line_number = 66,
    @solution = "Ex cillum occaecat nostrud labore nostrud velit excepteur qui in. Ut sunt non pariatur eu aliquip cupidatat eiusmod duis. Id laborum culpa aliquip fugiat laboris ullamco pariatur. Veniam ut sint esse laboris velit in elit elit Lorem ea. Cillum incididunt ullamco esse duis elit irure tempor est enim ipsum occaecat eiusmod.",
    @field_config = "Ex ex dolor ipsum cillum pariatur in excepteur pariatur exercitation duis cillum nisi anim do. Ullamco labore quis tempor do. Aute id ea aliquip commodo aliquip consequat tempor esse consectetur. Ullamco ad deserunt officia anim minim velit dolor ut nostrud.",
    @expiration_date = "Fri Oct 15 1976 03:15:08 GMT+0000 (UTC)",
    @expiration_reason = "Magna dolor exercitation magna ullamco. Commodo fugiat aliquip non id veniam occaecat ea. Ut enim reprehenderit amet excepteur est id. Aliquip ex fugiat elit duis. Pariatur ex aliqua eiusmod ad consectetur amet qui quis proident sint ut aliquip. Eiusmod excepteur dolore incididunt officia aute deserunt. Sint Lorem culpa eu enim reprehenderit proident nisi.",
    @created_date = "Wed Oct 14 1987 21:54:43 GMT+0000 (UTC)",
    @updated_date = "Fri Jun 20 2003 13:34:25 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 66,
    @cid_type = "software",
    @cid_id = 66,
    @requirement_type = "revised_requirement",
    @requirement_id = 66,
    @order_comments = "Enim non aliqua ea anim. Ex nisi consequat ullamco amet do eiusmod cillum in aliquip aute adipisicing. Nostrud ad amet laborum consequat est quis velit pariatur occaecat voluptate duis duis. Fugiat nulla nostrud deserunt sunt cupidatat magna qui aliqua deserunt deserunt elit non eiusmod. Irure aliqua reprehenderit qui ea.",
    @priority = "low",
    @expected_completion_date = "Mon May 28 2018 23:35:25 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  395635,
    @customer_name =  "CENTREGY",
    @ship_to_address = "642 Bath Avenue, Sidman, Virginia, 271",
    @model = "MP 3791SP",
    @old_cid =  "5ad0f02273dcc26492812770",
    @new_cid = "5ad0f022aa2203e6e81a32db",
    @soa_instance_id = 67,
    @order_number = 331766,
    @order_line_number = 67,
    @solution = "Proident laborum fugiat ipsum voluptate voluptate proident. Veniam voluptate cillum commodo quis Lorem officia labore ipsum ex ea quis. Reprehenderit aliqua est ipsum tempor amet. Tempor in ipsum eu velit aliqua cillum culpa aliquip tempor irure dolore do Lorem. Velit tempor voluptate eiusmod aute ut. Et dolore laboris exercitation velit do anim velit labore do consectetur laboris.",
    @field_config = "Tempor sunt tempor quis aute reprehenderit deserunt veniam nostrud id officia. Do laboris culpa sint magna. Voluptate enim ipsum sit minim enim in occaecat dolor sit.",
    @expiration_date = "Thu Oct 24 1974 01:33:48 GMT+0000 (UTC)",
    @expiration_reason = "Esse sint adipisicing aute reprehenderit labore sunt elit dolor ut officia magna ea ea. Sint magna irure ea excepteur nulla enim mollit cupidatat esse id. Eu occaecat et quis in qui sint fugiat sint duis anim. Dolor irure aliquip id non. Esse id sit in nostrud proident culpa excepteur irure veniam amet ex labore. Eu incididunt irure aliquip laborum occaecat sunt adipisicing cupidatat deserunt esse culpa fugiat adipisicing.",
    @created_date = "Mon Jul 02 1984 14:34:32 GMT+0000 (UTC)",
    @updated_date = "Thu Sep 23 1976 14:42:33 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 67,
    @cid_type = "hardware",
    @cid_id = 67,
    @requirement_type = "new_requirement",
    @requirement_id = 67,
    @order_comments = "Irure duis labore adipisicing id esse ullamco. Ullamco Lorem officia in ex occaecat velit labore reprehenderit. Anim aliquip fugiat ad pariatur exercitation. Nostrud labore ipsum consectetur amet laborum. Amet minim adipisicing culpa reprehenderit nulla voluptate mollit duis tempor quis nulla proident. Aute mollit irure laboris aliquip officia.",
    @priority = "medium",
    @expected_completion_date = "Sun May 20 2018 01:02:41 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  67916,
    @customer_name =  "MAXIMIND",
    @ship_to_address = "945 Porter Avenue, Kansas, Nevada, 1199",
    @model = "MP 2760TE",
    @old_cid =  "5ad0f02278f86b715aebec2a",
    @new_cid = "5ad0f0223b11a41ebfbc1678",
    @soa_instance_id = 68,
    @order_number = 676636,
    @order_line_number = 68,
    @solution = "Enim voluptate nostrud commodo enim. Officia velit anim sunt elit dolore Lorem mollit veniam et labore laborum reprehenderit et. Adipisicing do exercitation deserunt nulla eu amet. Exercitation occaecat enim culpa deserunt et culpa ut in nostrud.",
    @field_config = "Dolore sit commodo fugiat eiusmod magna elit labore do minim sint amet. Sit laborum nisi pariatur culpa culpa consequat et sunt. Mollit cupidatat reprehenderit labore eu. Enim irure qui exercitation eu pariatur cupidatat occaecat. Voluptate et deserunt laborum anim do in sint pariatur et eu do nisi amet nulla.",
    @expiration_date = "Sat Mar 21 2015 16:00:18 GMT+0000 (UTC)",
    @expiration_reason = "Magna non non nulla et aute id proident fugiat esse minim do. Amet consectetur commodo elit proident ullamco magna reprehenderit non tempor et occaecat magna. Ex ex sit reprehenderit in. Do est reprehenderit aliqua elit. Veniam laborum labore in esse dolore commodo do ea. Nulla fugiat culpa nulla cupidatat est eiusmod velit consectetur nostrud.",
    @created_date = "Mon Nov 11 2013 06:12:16 GMT+0000 (UTC)",
    @updated_date = "Wed Sep 10 2003 13:59:19 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 68,
    @cid_type = "software",
    @cid_id = 68,
    @requirement_type = "new_requirement",
    @requirement_id = 68,
    @order_comments = "Magna dolor eu minim exercitation. Aliquip eiusmod voluptate proident sint reprehenderit. Enim qui dolor dolore nulla aliqua ut qui.",
    @priority = "high",
    @expected_completion_date = "Sat May 05 2018 05:57:31 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  200517,
    @customer_name =  "MAINELAND",
    @ship_to_address = "303 Bogart Street, Glidden, Oklahoma, 3029",
    @model = "MP 2969TE",
    @old_cid =  "5ad0f022466a069c7eb120ba",
    @new_cid = "5ad0f022d32112f2b9a37311",
    @soa_instance_id = 69,
    @order_number = 507078,
    @order_line_number = 69,
    @solution = "Consequat sunt laborum Lorem aliquip fugiat excepteur nulla mollit minim labore eiusmod sint. Excepteur id commodo fugiat sit veniam nulla adipisicing ipsum veniam commodo labore est consequat. Fugiat anim veniam Lorem tempor incididunt sint consectetur eu consectetur tempor. Nulla officia ut aliqua consequat laboris voluptate pariatur elit nisi cillum. Sint deserunt eiusmod labore elit qui officia ipsum elit reprehenderit nisi aute velit. Mollit sit commodo tempor eu sit et officia.",
    @field_config = "Incididunt excepteur nisi cillum dolore aliquip eiusmod est labore ex ea incididunt ut pariatur. Sint aliqua amet dolore do nisi dolore. Ad anim sunt eiusmod non duis tempor et labore anim labore. Officia aute ipsum labore cillum est enim nostrud enim ad non. Dolore culpa esse ex voluptate exercitation aliquip aute nulla nostrud sit. Ut minim dolore aute sit commodo cillum. Non id exercitation aliquip consequat nisi.",
    @expiration_date = "Tue Dec 07 2004 22:34:21 GMT+0000 (UTC)",
    @expiration_reason = "Nulla pariatur deserunt aliqua veniam qui veniam elit. Exercitation aute incididunt enim pariatur occaecat ut eiusmod qui non quis. Sit tempor magna ullamco reprehenderit ullamco cupidatat eiusmod enim commodo officia qui.",
    @created_date = "Tue Jun 06 1972 08:56:43 GMT+0000 (UTC)",
    @updated_date = "Mon May 09 1988 02:43:07 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 69,
    @cid_type = "software",
    @cid_id = 69,
    @requirement_type = "new_requirement",
    @requirement_id = 69,
    @order_comments = "Enim et cillum duis consectetur esse voluptate. Est et occaecat ipsum sunt aute tempor magna nostrud consectetur non. Anim incididunt eiusmod ea cillum incididunt consequat sit fugiat nisi reprehenderit.",
    @priority = "medium",
    @expected_completion_date = "Sun Jun 10 2018 05:41:00 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  148609,
    @customer_name =  "KIDSTOCK",
    @ship_to_address = "118 Nautilus Avenue, Thomasville, Montana, 263",
    @model = "MP 3271SP",
    @old_cid =  "5ad0f022c6b397563acce6d2",
    @new_cid = "5ad0f02216ef33a3c3fc4054",
    @soa_instance_id = 70,
    @order_number = 465555,
    @order_line_number = 70,
    @solution = "Tempor irure id velit voluptate eiusmod laboris irure anim elit. Veniam enim tempor enim pariatur anim laboris. Id ullamco quis excepteur labore do.",
    @field_config = "Reprehenderit labore sint sit labore culpa laboris deserunt non nulla pariatur in irure. Id labore consequat culpa ipsum. Ullamco enim do quis culpa exercitation fugiat incididunt.",
    @expiration_date = "Sat Feb 27 1971 15:27:26 GMT+0000 (UTC)",
    @expiration_reason = "Nisi proident magna labore Lorem amet est qui nostrud voluptate. Do elit duis velit laboris dolor mollit exercitation eu adipisicing fugiat do aute. Velit adipisicing proident et ad sit anim pariatur. Ad minim enim nostrud commodo enim est sint commodo. Elit anim quis officia incididunt quis ut pariatur aliquip est commodo.",
    @created_date = "Thu May 05 1994 23:32:18 GMT+0000 (UTC)",
    @updated_date = "Sat Feb 16 1980 17:40:49 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 70,
    @cid_type = "software",
    @cid_id = 70,
    @requirement_type = "revised_requirement",
    @requirement_id = 70,
    @order_comments = "Fugiat Lorem deserunt nostrud ad. Tempor excepteur est nisi consectetur nisi ea consectetur voluptate deserunt do. Ea occaecat mollit aliquip voluptate veniam culpa. Irure eiusmod occaecat eiusmod excepteur ipsum adipisicing voluptate et anim laborum deserunt.",
    @priority = "low",
    @expected_completion_date = "Fri Jun 08 2018 10:28:41 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  297058,
    @customer_name =  "LOTRON",
    @ship_to_address = "803 Ralph Avenue, Curtice, South Dakota, 6204",
    @model = "MP 2662 TE for Education",
    @old_cid =  "5ad0f022a09b151cc9873ba9",
    @new_cid = "5ad0f0229c3496b0db0697b7",
    @soa_instance_id = 71,
    @order_number = 807278,
    @order_line_number = 71,
    @solution = "Aute fugiat ad in amet sit duis nulla eu elit ipsum ex nisi et. Exercitation nostrud aute adipisicing est sunt ea laboris occaecat labore ullamco Lorem nisi reprehenderit commodo. Elit et sint sint velit cillum consectetur culpa velit commodo. Irure dolor culpa sint cupidatat. Et proident eu aliquip velit sit esse ipsum excepteur dolore. Ullamco fugiat aute deserunt aute Lorem eu do.",
    @field_config = "Irure mollit pariatur pariatur mollit ea. Pariatur incididunt veniam exercitation qui cupidatat culpa nostrud culpa veniam eiusmod. Aute est duis adipisicing laborum quis minim. Commodo magna Lorem reprehenderit cupidatat duis. Incididunt excepteur amet sint ea esse tempor cupidatat qui anim duis anim. Fugiat quis cillum qui exercitation.",
    @expiration_date = "Fri Feb 10 2017 12:53:38 GMT+0000 (UTC)",
    @expiration_reason = "Nulla sint nulla duis nulla anim sunt laboris cillum nulla nisi deserunt exercitation. Cupidatat veniam Lorem ut sunt ipsum enim ad sunt officia pariatur duis dolore Lorem. Est consectetur anim sit aute labore id voluptate consectetur dolor officia. Est sunt est exercitation excepteur proident pariatur sunt aute ut magna. Adipisicing tempor elit incididunt qui duis.",
    @created_date = "Thu Feb 14 1980 07:38:20 GMT+0000 (UTC)",
    @updated_date = "Mon Oct 13 2014 05:11:11 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 71,
    @cid_type = "hardware",
    @cid_id = 71,
    @requirement_type = "revised_requirement",
    @requirement_id = 71,
    @order_comments = "Commodo nostrud eiusmod nostrud velit labore nisi exercitation do magna cillum sunt dolor ullamco proident. Aute fugiat esse minim qui excepteur. Aliquip enim deserunt do sint sit ut proident non minim est sint amet ipsum.",
    @priority = "high",
    @expected_completion_date = "Sat Apr 21 2018 15:38:05 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  169735,
    @customer_name =  "FUTURITY",
    @ship_to_address = "114 Story Street, Floriston, Wyoming, 5964",
    @model = "MP 2891TE",
    @old_cid =  "5ad0f022d7f6272c29f28e7a",
    @new_cid = "5ad0f022251b5e6046c38ce2",
    @soa_instance_id = 72,
    @order_number = 974689,
    @order_line_number = 72,
    @solution = "Lorem ea eiusmod sint esse ea ullamco adipisicing minim exercitation fugiat anim irure. Culpa commodo exercitation nisi ad. Do proident laboris ex laborum voluptate adipisicing mollit commodo ad quis proident duis incididunt officia.",
    @field_config = "Sunt id commodo commodo irure culpa. Dolor voluptate aliquip et cillum velit dolor est nulla. Est voluptate velit qui proident ex eiusmod in cupidatat aliquip sit non. Dolor officia dolor reprehenderit labore.",
    @expiration_date = "Thu Nov 09 1978 21:11:46 GMT+0000 (UTC)",
    @expiration_reason = "Tempor cupidatat aliqua sint fugiat eu eu dolore duis aliquip et ea nostrud. Voluptate elit sint irure ex reprehenderit nostrud dolore officia nostrud qui veniam sint. Ut est aute fugiat commodo velit et eiusmod culpa occaecat eu.",
    @created_date = "Tue Jul 22 2003 04:41:27 GMT+0000 (UTC)",
    @updated_date = "Mon Jan 08 2018 19:25:54 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 72,
    @cid_type = "hardware",
    @cid_id = 72,
    @requirement_type = "new_requirement",
    @requirement_id = 72,
    @order_comments = "Id duis consequat mollit aliquip nulla et nostrud labore excepteur. Tempor magna proident aliquip tempor occaecat laboris enim aliquip incididunt anim labore. Voluptate nulla adipisicing labore aliqua anim voluptate non incididunt ipsum. Velit sint culpa non incididunt commodo eu nostrud sint aute officia.",
    @priority = "low",
    @expected_completion_date = "Fri Apr 13 2018 20:27:22 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  407814,
    @customer_name =  "ZAPPIX",
    @ship_to_address = "225 Hubbard Place, Gibbsville, Wisconsin, 6144",
    @model = "MP 2717 TE for Education",
    @old_cid =  "5ad0f022c721d3306c3d5f9e",
    @new_cid = "5ad0f022a20f9b2159054265",
    @soa_instance_id = 73,
    @order_number = 227555,
    @order_line_number = 73,
    @solution = "Nisi quis dolor in qui sunt. Occaecat deserunt id labore laborum anim eiusmod consequat reprehenderit et. Veniam ea anim et dolor. Occaecat tempor cupidatat elit enim adipisicing elit eu mollit excepteur ipsum anim irure velit adipisicing.",
    @field_config = "Voluptate duis non pariatur non labore et voluptate. Do nulla consequat consequat et laborum proident dolor enim. Qui nulla labore veniam non reprehenderit consectetur aliqua elit laboris consectetur ex amet ullamco. Minim elit quis officia deserunt. Mollit minim anim ipsum sint mollit eu.",
    @expiration_date = "Mon Apr 12 2004 00:19:00 GMT+0000 (UTC)",
    @expiration_reason = "Dolore veniam consectetur labore excepteur laboris. Dolor sint incididunt incididunt nostrud minim proident exercitation ipsum veniam proident. Veniam nisi labore sit ullamco eu aute duis fugiat cillum et reprehenderit sint. Magna exercitation in id cupidatat non minim velit aliqua. Cupidatat eu ea consectetur sint est eiusmod quis est fugiat laborum sunt. Laborum fugiat occaecat commodo elit cupidatat ullamco Lorem culpa qui.",
    @created_date = "Sat Jun 24 1972 09:15:13 GMT+0000 (UTC)",
    @updated_date = "Fri Jun 02 1995 14:10:19 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 73,
    @cid_type = "software",
    @cid_id = 73,
    @requirement_type = "new_requirement",
    @requirement_id = 73,
    @order_comments = "Dolor ex ea quis dolore pariatur officia magna exercitation aliqua. Qui ea amet voluptate aliqua voluptate quis id aliqua. Laboris ipsum consequat non nostrud magna anim labore sunt qui laborum ex laborum labore enim. Esse mollit aliqua et occaecat id esse commodo in tempor elit cillum. Velit cupidatat officia id do eiusmod deserunt velit cupidatat fugiat amet. Laborum enim sunt deserunt occaecat et in quis.",
    @priority = "medium",
    @expected_completion_date = "Thu Apr 26 2018 23:24:08 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  314195,
    @customer_name =  "ZILENCIO",
    @ship_to_address = "670 Stockholm Street, Dana, Arkansas, 8550",
    @model = "MP 3933SP",
    @old_cid =  "5ad0f0220b5d7507f94e96db",
    @new_cid = "5ad0f022af6cb0b3f1564a05",
    @soa_instance_id = 74,
    @order_number = 50730,
    @order_line_number = 74,
    @solution = "Dolore proident eu anim eu enim exercitation proident pariatur excepteur nisi fugiat. Cupidatat labore non dolore deserunt sint cillum officia nostrud. Fugiat in sit ullamco veniam officia tempor Lorem proident amet eu. Consectetur quis labore ut adipisicing do commodo qui esse veniam. Quis laboris elit cupidatat minim minim labore aute. Consectetur cillum ea aliqua pariatur enim elit ex fugiat ea. Laborum proident in veniam amet incididunt nisi ad sunt excepteur nulla.",
    @field_config = "Mollit magna ipsum ipsum exercitation sit reprehenderit ex velit commodo commodo officia in do. Ullamco est ut elit exercitation. Pariatur ad officia reprehenderit minim veniam aliquip. Ea amet ea exercitation magna voluptate ullamco mollit. Occaecat Lorem voluptate veniam aute dolor consequat dolor duis. Et voluptate tempor incididunt fugiat proident adipisicing ut et et anim consequat duis. Qui ad occaecat culpa cillum duis adipisicing anim nisi voluptate excepteur anim.",
    @expiration_date = "Wed Jun 30 1971 11:19:17 GMT+0000 (UTC)",
    @expiration_reason = "Fugiat sit anim laboris cupidatat nulla officia ea nulla anim commodo. Culpa ullamco et qui voluptate amet quis. Veniam aliqua consequat tempor elit ad. Sint exercitation dolore voluptate id aliqua culpa. Qui aliqua ut aute ad enim reprehenderit. Sit minim amet id consequat nulla elit nisi dolore eiusmod quis voluptate. Reprehenderit pariatur quis aliqua incididunt mollit culpa.",
    @created_date = "Mon May 04 1998 07:11:11 GMT+0000 (UTC)",
    @updated_date = "Tue Jul 18 2000 06:33:32 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 74,
    @cid_type = "hardware",
    @cid_id = 74,
    @requirement_type = "new_requirement",
    @requirement_id = 74,
    @order_comments = "Consectetur quis sunt aute cupidatat ea aute excepteur in elit ex excepteur esse. Pariatur aute nulla dolore aute quis pariatur fugiat proident quis voluptate non. Nostrud consectetur in incididunt ullamco excepteur labore et anim occaecat ipsum aute anim cillum.",
    @priority = "high",
    @expected_completion_date = "Sat Jun 09 2018 16:39:03 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  253996,
    @customer_name =  "BUZZNESS",
    @ship_to_address = "356 Metropolitan Avenue, Twilight, Palau, 7766",
    @model = "MP 3811TE",
    @old_cid =  "5ad0f022289a68048f1d717f",
    @new_cid = "5ad0f022fdbb12985870be77",
    @soa_instance_id = 75,
    @order_number = 102150,
    @order_line_number = 75,
    @solution = "Enim proident voluptate nostrud velit culpa ut do cupidatat amet culpa ad. Proident occaecat est ad in cupidatat in exercitation qui commodo id dolor consectetur aliqua. Quis eiusmod veniam aute quis ut velit officia laboris Lorem cupidatat. Lorem proident ad ad labore magna mollit ad ad commodo deserunt irure pariatur dolore. Occaecat commodo qui reprehenderit sunt reprehenderit ipsum aute ad laboris laboris aliquip.",
    @field_config = "Non consectetur aliquip officia ullamco laborum laboris cillum voluptate proident enim dolor culpa nulla dolor. Irure irure reprehenderit et dolor magna nulla consequat Lorem in eu nisi velit ut officia. Quis Lorem incididunt cupidatat deserunt Lorem cillum cillum consectetur. Deserunt fugiat fugiat magna esse eiusmod velit enim mollit voluptate occaecat Lorem voluptate. Exercitation qui reprehenderit aute nisi adipisicing esse anim cillum eu. Non non anim sunt aliquip enim sint voluptate labore fugiat cillum enim occaecat nisi. Et in exercitation ea Lorem eu non veniam.",
    @expiration_date = "Tue Mar 13 2007 01:51:37 GMT+0000 (UTC)",
    @expiration_reason = "Adipisicing ipsum aute enim duis ipsum adipisicing esse nulla irure eiusmod. Velit reprehenderit cupidatat cillum ullamco. Irure do pariatur esse adipisicing est duis aliquip. Sunt et adipisicing tempor veniam nisi non. Adipisicing do Lorem sit eu adipisicing culpa qui est veniam veniam amet minim deserunt.",
    @created_date = "Mon Nov 27 2006 16:09:57 GMT+0000 (UTC)",
    @updated_date = "Tue Aug 03 1999 20:40:38 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 75,
    @cid_type = "hardware",
    @cid_id = 75,
    @requirement_type = "new_requirement",
    @requirement_id = 75,
    @order_comments = "Sit sint laboris velit aliquip enim pariatur velit. Ea eiusmod fugiat amet ut officia est tempor commodo. Ullamco tempor dolor do irure ea qui aliqua amet sunt. Dolor laborum ad id laborum ad aute ex velit in non cupidatat.",
    @priority = "high",
    @expected_completion_date = "Sat May 05 2018 02:59:15 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  88072,
    @customer_name =  "VIXO",
    @ship_to_address = "647 Celeste Court, Whitehaven, Colorado, 169",
    @model = "MP 2986SP",
    @old_cid =  "5ad0f022402c90ba8dd6ee38",
    @new_cid = "5ad0f022982497c5d0f2b2d0",
    @soa_instance_id = 76,
    @order_number = 401229,
    @order_line_number = 76,
    @solution = "Officia enim nisi officia enim quis nulla consequat adipisicing. Sint aliquip magna aute voluptate voluptate ipsum sint irure. Mollit sit duis dolor aliqua laboris. Velit consequat ea minim consequat. Culpa eu sunt duis ipsum in pariatur laboris. Et amet veniam aute ex eu exercitation. Nisi velit consectetur consequat adipisicing do sit aliqua eu enim.",
    @field_config = "Eiusmod velit est do exercitation consectetur do aute proident cillum irure fugiat amet. Amet reprehenderit occaecat amet do esse elit do enim ad. Sunt sunt do non quis adipisicing officia ad.",
    @expiration_date = "Thu Feb 25 1971 07:21:55 GMT+0000 (UTC)",
    @expiration_reason = "Ea velit laborum incididunt qui nulla. Irure labore mollit quis do Lorem non ea in magna proident laborum sint ad. Cupidatat adipisicing culpa velit quis non incididunt quis aute minim aute officia. Enim Lorem amet ex excepteur laboris veniam et aliquip eu. Culpa laboris veniam ex ex ea id. Consequat culpa eiusmod elit id officia ut.",
    @created_date = "Thu May 04 1972 00:43:18 GMT+0000 (UTC)",
    @updated_date = "Mon Mar 18 1985 12:42:17 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 76,
    @cid_type = "software",
    @cid_id = 76,
    @requirement_type = "new_requirement",
    @requirement_id = 76,
    @order_comments = "Laboris proident nisi id exercitation mollit dolor esse fugiat anim. Culpa officia id ex eu labore cupidatat velit enim cillum ad ut. Pariatur ullamco dolor fugiat sit consequat laborum labore laborum adipisicing veniam qui esse consectetur. Exercitation nulla enim veniam duis et reprehenderit minim esse labore commodo tempor ut fugiat voluptate. Laborum occaecat elit ea exercitation dolore sunt exercitation consectetur deserunt ullamco dolore commodo ea. Laborum et occaecat veniam consequat sit.",
    @priority = "high",
    @expected_completion_date = "Mon Jun 18 2018 05:55:53 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  33378,
    @customer_name =  "VELOS",
    @ship_to_address = "467 Hale Avenue, Dodge, Vermont, 6513",
    @model = "MP 3532SP",
    @old_cid =  "5ad0f022aadc26969b8aeee1",
    @new_cid = "5ad0f02205440b83cc5cdf33",
    @soa_instance_id = 77,
    @order_number = 509938,
    @order_line_number = 77,
    @solution = "Eiusmod nisi enim non in fugiat veniam proident ipsum incididunt eiusmod in. Ex ut eu incididunt minim et Lorem amet adipisicing nisi officia. Do ullamco enim deserunt officia. Labore qui nostrud aliquip consequat. Proident id consequat velit in. Deserunt officia reprehenderit occaecat qui aliqua exercitation in irure dolor reprehenderit magna consectetur officia est.",
    @field_config = "Labore tempor id minim ad qui do officia id ex in adipisicing labore. Ex velit ipsum veniam quis exercitation. Aliqua exercitation veniam fugiat consequat qui culpa excepteur. Et qui ut tempor nisi voluptate quis commodo id fugiat. Labore nostrud proident eiusmod ut adipisicing ipsum voluptate voluptate in elit veniam. Ipsum qui dolore ipsum dolore aliquip elit ipsum qui minim tempor veniam proident deserunt excepteur.",
    @expiration_date = "Fri May 16 2014 15:03:18 GMT+0000 (UTC)",
    @expiration_reason = "Nisi pariatur aute reprehenderit excepteur occaecat ea aute cillum proident officia eiusmod eu pariatur elit. Minim culpa ut culpa est tempor tempor ullamco elit reprehenderit adipisicing ex officia cupidatat. Sunt esse culpa aliquip duis cillum eu exercitation. Sunt excepteur consequat cillum occaecat. Officia nulla deserunt laborum magna ex velit culpa sit ipsum dolor ut. Eiusmod officia nostrud ipsum nostrud. Incididunt culpa consectetur est tempor quis mollit aliquip tempor proident commodo.",
    @created_date = "Mon Sep 07 1981 03:34:34 GMT+0000 (UTC)",
    @updated_date = "Fri Mar 25 1994 12:26:28 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 77,
    @cid_type = "software",
    @cid_id = 77,
    @requirement_type = "new_requirement",
    @requirement_id = 77,
    @order_comments = "Ea ea dolor amet excepteur laboris aliquip. Excepteur qui ea ipsum consequat officia deserunt. Sit laboris anim culpa anim consequat aliqua pariatur non laborum deserunt commodo laborum Lorem aute. Aliquip fugiat cillum cupidatat adipisicing amet amet ex excepteur magna mollit.",
    @priority = "medium",
    @expected_completion_date = "Wed May 23 2018 04:57:31 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  296332,
    @customer_name =  "INTERFIND",
    @ship_to_address = "930 Canarsie Road, Edgar, Guam, 7183",
    @model = "MP 2634 TE for Education",
    @old_cid =  "5ad0f0228aa4d88e129cdbad",
    @new_cid = "5ad0f02295d7956266c5455a",
    @soa_instance_id = 78,
    @order_number = 988151,
    @order_line_number = 78,
    @solution = "Esse ullamco ullamco occaecat amet non est pariatur labore quis fugiat. Ad elit aute excepteur quis sunt. Lorem proident quis fugiat officia duis minim sint ut voluptate. Consequat ut sit nisi velit. Quis incididunt dolore sint laboris sunt reprehenderit quis.",
    @field_config = "Est exercitation dolore consequat irure fugiat do dolore minim dolore nostrud nulla pariatur id. Aliqua incididunt amet tempor ipsum esse commodo laboris deserunt dolor. Aute labore ex qui adipisicing proident fugiat excepteur fugiat aute irure exercitation dolore adipisicing cillum. Dolore cillum Lorem adipisicing aliquip commodo voluptate ullamco ex officia eu consectetur magna voluptate. Et reprehenderit ullamco nostrud cupidatat in cillum aliqua aliquip est ipsum commodo velit irure aute. Qui magna do adipisicing exercitation aliquip ipsum enim culpa cillum non consectetur tempor sunt.",
    @expiration_date = "Sun Feb 07 1993 20:55:41 GMT+0000 (UTC)",
    @expiration_reason = "Magna sint laborum do est eu cillum cillum excepteur et pariatur. Exercitation ut tempor amet reprehenderit dolore sint aliquip amet irure voluptate. Aliqua non elit eiusmod duis ullamco nulla dolore cupidatat. Veniam magna ipsum ullamco cillum enim et minim nulla consequat irure.",
    @created_date = "Tue Aug 23 2016 05:10:51 GMT+0000 (UTC)",
    @updated_date = "Wed Nov 11 1992 18:26:59 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 78,
    @cid_type = "software",
    @cid_id = 78,
    @requirement_type = "revised_requirement",
    @requirement_id = 78,
    @order_comments = "Tempor proident eu est commodo voluptate exercitation est dolore minim ipsum elit reprehenderit adipisicing. Ad proident ea aliqua sint officia dolor ut eiusmod deserunt labore dolor dolore ad. Cillum ea occaecat do deserunt deserunt proident magna eu quis occaecat. Ipsum irure incididunt cupidatat amet occaecat nisi aliquip id cillum est est.",
    @priority = "high",
    @expected_completion_date = "Thu Jun 14 2018 08:08:04 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  217764,
    @customer_name =  "ENERVATE",
    @ship_to_address = "458 Brighton Court, Warsaw, Georgia, 2551",
    @model = "MP 3553TE",
    @old_cid =  "5ad0f022ab099864ef337fbc",
    @new_cid = "5ad0f02267881fc98437dcc7",
    @soa_instance_id = 79,
    @order_number = 699472,
    @order_line_number = 79,
    @solution = "Non sit laboris enim commodo labore reprehenderit. Cillum deserunt fugiat dolore non ea reprehenderit anim irure magna dolore. Anim dolor ullamco irure non minim. Eu nisi cupidatat tempor ad exercitation pariatur id proident tempor veniam adipisicing qui quis. Excepteur ut est laborum consectetur incididunt consectetur magna fugiat labore fugiat voluptate tempor.",
    @field_config = "Officia ullamco sit laboris voluptate ullamco aliquip qui mollit veniam amet enim. Laboris veniam ex tempor voluptate. Labore deserunt magna ut voluptate exercitation eu veniam occaecat commodo sunt proident. Laborum ut velit consequat exercitation amet proident amet. Laboris labore labore ad sunt id non. Est sint anim adipisicing officia sunt deserunt cillum sit.",
    @expiration_date = "Sun Apr 12 1970 18:48:59 GMT+0000 (UTC)",
    @expiration_reason = "Esse nisi nostrud in velit. Deserunt qui fugiat ex dolore minim officia ullamco fugiat velit dolore exercitation aliquip magna. Ut ad commodo ullamco sint mollit incididunt officia in occaecat enim nostrud commodo ea ad. Cupidatat exercitation aliquip enim anim.",
    @created_date = "Mon May 10 1976 13:11:59 GMT+0000 (UTC)",
    @updated_date = "Fri Aug 13 1999 23:34:27 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 79,
    @cid_type = "software",
    @cid_id = 79,
    @requirement_type = "new_requirement",
    @requirement_id = 79,
    @order_comments = "Aliquip minim excepteur labore voluptate. Quis esse consectetur excepteur incididunt voluptate aute laborum sint. Do eiusmod proident excepteur ipsum occaecat labore aute nostrud dolor sit aliqua pariatur id ut. Tempor anim ex incididunt nostrud est adipisicing. Ipsum velit consequat mollit ullamco labore minim labore. Veniam cupidatat excepteur minim proident tempor eu dolore ex sunt.",
    @priority = "high",
    @expected_completion_date = "Sun Jun 10 2018 17:50:37 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  4161,
    @customer_name =  "UNIWORLD",
    @ship_to_address = "270 Fountain Avenue, Marienthal, Tennessee, 4562",
    @model = "MP 3007SP",
    @old_cid =  "5ad0f0221724826254c4f87b",
    @new_cid = "5ad0f022779be0944f570244",
    @soa_instance_id = 80,
    @order_number = 316039,
    @order_line_number = 80,
    @solution = "Id laboris proident occaecat amet. Exercitation laborum excepteur aliquip eu enim aliquip voluptate pariatur est occaecat commodo proident ullamco. Excepteur aliqua tempor aute consequat. Consectetur adipisicing et Lorem aliquip qui ut esse esse et. Ipsum est ad consequat amet anim laboris do proident enim culpa ad consequat. Tempor et labore dolor ullamco qui.",
    @field_config = "Occaecat ut sit aliqua consectetur adipisicing eiusmod aute minim. Velit nostrud voluptate et ut ex proident aliquip. Cupidatat adipisicing ullamco amet duis minim eu ipsum dolor dolor id deserunt voluptate anim. Do incididunt exercitation cillum pariatur magna anim sint amet. Ipsum sint id esse excepteur pariatur proident ex adipisicing reprehenderit do et.",
    @expiration_date = "Wed Jun 14 1989 13:42:24 GMT+0000 (UTC)",
    @expiration_reason = "Velit non dolor quis tempor elit tempor ea anim veniam duis aliquip enim elit dolor. Veniam magna duis aute sint mollit amet. Ipsum laborum anim dolore nisi sit minim. Consectetur voluptate proident ex ea in nulla veniam id.",
    @created_date = "Fri Jul 27 2007 01:20:58 GMT+0000 (UTC)",
    @updated_date = "Sat Nov 24 1984 23:19:03 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 80,
    @cid_type = "software",
    @cid_id = 80,
    @requirement_type = "revised_requirement",
    @requirement_id = 80,
    @order_comments = "Ullamco proident aliqua ea eiusmod dolore voluptate in non. Culpa ipsum proident anim nostrud deserunt commodo ea fugiat quis culpa excepteur excepteur nostrud ad. Id est eiusmod cupidatat aute deserunt quis in dolor est proident anim eu cillum qui.",
    @priority = "high",
    @expected_completion_date = "Fri Apr 20 2018 13:18:07 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  313305,
    @customer_name =  "CENTURIA",
    @ship_to_address = "317 Ryerson Street, Mooresburg, Marshall Islands, 1056",
    @model = "MP 2749 TE for Education",
    @old_cid =  "5ad0f0229f825d72a4d74a76",
    @new_cid = "5ad0f02207bac07eb1c559a6",
    @soa_instance_id = 81,
    @order_number = 569220,
    @order_line_number = 81,
    @solution = "Irure do dolor ullamco dolore. Cupidatat exercitation reprehenderit sit est velit anim. Et Lorem duis ad incididunt. Ex laboris adipisicing sint occaecat quis labore tempor ea labore laboris consequat aute proident. Laborum aliquip ea et esse.",
    @field_config = "Enim incididunt culpa sit nisi. Elit esse ut eu enim laborum elit ad esse excepteur eiusmod dolor qui adipisicing. Qui adipisicing voluptate Lorem veniam est tempor sint ex ullamco minim anim ipsum magna. Quis aliqua laborum exercitation et culpa velit proident tempor laborum ex.",
    @expiration_date = "Mon Feb 18 1985 19:21:24 GMT+0000 (UTC)",
    @expiration_reason = "Qui eu eiusmod ut cupidatat. Laboris ex sunt irure ullamco ullamco magna ex id. Mollit eiusmod amet culpa consectetur incididunt voluptate magna laboris magna excepteur sit sint. Aute ex enim in aute dolor amet sunt ea aliqua culpa ut duis eu et. Magna veniam laboris nostrud in esse occaecat mollit nostrud.",
    @created_date = "Fri Aug 23 2002 21:13:59 GMT+0000 (UTC)",
    @updated_date = "Thu Sep 17 1992 09:47:08 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 81,
    @cid_type = "hardware",
    @cid_id = 81,
    @requirement_type = "revised_requirement",
    @requirement_id = 81,
    @order_comments = "Enim dolor commodo ad do consectetur aliquip sit qui consectetur. Proident in est labore tempor ex. Elit amet adipisicing laborum ex dolor voluptate mollit qui ullamco qui voluptate. Exercitation est cupidatat excepteur non ea veniam irure veniam. Sint ea labore elit minim sunt sit.",
    @priority = "low",
    @expected_completion_date = "Tue Jun 19 2018 14:42:59 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  275605,
    @customer_name =  "SPHERIX",
    @ship_to_address = "525 Radde Place, Westerville, New Mexico, 8116",
    @model = "MP 2871TE",
    @old_cid =  "5ad0f022e1fa3a0f8798614e",
    @new_cid = "5ad0f022b66619b914ea6bea",
    @soa_instance_id = 82,
    @order_number = 257601,
    @order_line_number = 82,
    @solution = "Magna voluptate culpa et laborum amet voluptate id eu adipisicing consequat veniam eiusmod qui excepteur. Qui et ullamco enim aute nulla ad commodo Lorem irure id. Consequat anim eu nisi eiusmod nostrud adipisicing sint do aliqua. Nostrud cupidatat voluptate aliquip proident.",
    @field_config = "Ea reprehenderit eu ipsum culpa sit sunt ex. Irure veniam ut sint commodo Lorem ut. Duis consequat quis ex amet aute dolor sunt culpa.",
    @expiration_date = "Sat Nov 07 1992 03:13:05 GMT+0000 (UTC)",
    @expiration_reason = "Quis culpa fugiat non officia ad anim aliqua ut exercitation do mollit exercitation eu dolor. Cillum commodo minim commodo adipisicing consectetur cupidatat sunt ullamco eiusmod in in consequat enim cillum. Reprehenderit magna proident veniam commodo laboris veniam et labore. Reprehenderit occaecat aute ut duis consectetur cupidatat. Culpa pariatur nulla reprehenderit exercitation nisi elit ea.",
    @created_date = "Sun Aug 29 2004 14:00:18 GMT+0000 (UTC)",
    @updated_date = "Fri Feb 23 2007 15:34:53 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 82,
    @cid_type = "hardware",
    @cid_id = 82,
    @requirement_type = "revised_requirement",
    @requirement_id = 82,
    @order_comments = "Exercitation ut culpa occaecat cupidatat consequat. Ullamco Lorem id ipsum aliqua voluptate id duis nisi nisi quis non ut in. Consectetur nulla ipsum ea labore. In ullamco excepteur consequat incididunt nulla incididunt exercitation aute est. Do quis cupidatat cillum voluptate voluptate mollit. Deserunt nulla proident ea sunt. Nulla veniam ut ullamco nostrud sit.",
    @priority = "high",
    @expected_completion_date = "Wed May 09 2018 02:34:22 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  136070,
    @customer_name =  "UTARA",
    @ship_to_address = "709 Clark Street, Bynum, Puerto Rico, 5260",
    @model = "MP 2628 TE for Education",
    @old_cid =  "5ad0f022286514685a9acf89",
    @new_cid = "5ad0f02217bde6cbc289a834",
    @soa_instance_id = 83,
    @order_number = 275776,
    @order_line_number = 83,
    @solution = "Amet minim elit magna cillum amet magna id sit voluptate labore deserunt excepteur deserunt. Nulla laborum voluptate excepteur excepteur dolore officia pariatur duis reprehenderit. Qui nulla ex consectetur non cupidatat adipisicing. Voluptate aute enim ex sint non velit id esse.",
    @field_config = "Culpa pariatur labore eiusmod pariatur cillum proident nostrud anim do quis esse. Labore cupidatat fugiat anim duis ad. Officia esse sint sint duis ad cillum. Ullamco enim voluptate non laboris deserunt laborum eiusmod mollit sint excepteur ad ullamco ex pariatur. Cillum fugiat labore ea sunt reprehenderit officia voluptate non sint occaecat excepteur aute non. Ipsum et deserunt quis fugiat anim id enim minim cillum dolor nostrud.",
    @expiration_date = "Wed Feb 21 1996 09:03:24 GMT+0000 (UTC)",
    @expiration_reason = "Pariatur esse nisi eu anim magna amet. Eu id adipisicing laborum quis esse do eiusmod aliqua dolore. Labore minim reprehenderit velit ex aliqua laborum fugiat dolor occaecat consequat. Irure quis cupidatat veniam quis cillum do sit id. Ipsum minim aute dolor incididunt sunt sint est occaecat ad reprehenderit.",
    @created_date = "Thu Oct 12 2017 22:52:53 GMT+0000 (UTC)",
    @updated_date = "Tue Apr 19 2005 22:25:11 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 83,
    @cid_type = "software",
    @cid_id = 83,
    @requirement_type = "new_requirement",
    @requirement_id = 83,
    @order_comments = "Officia sit veniam culpa non sit magna dolore dolor nulla id. Sint deserunt adipisicing dolor eu. Commodo commodo quis ipsum deserunt non est amet. Consectetur fugiat amet tempor aute consectetur proident quis. Adipisicing velit veniam laborum Lorem duis sunt pariatur mollit. Ullamco cupidatat commodo et in elit consequat aute minim culpa fugiat dolore. Eiusmod esse culpa ut id mollit sint aute quis eiusmod quis aliquip.",
    @priority = "low",
    @expected_completion_date = "Sun Apr 29 2018 22:16:13 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  145052,
    @customer_name =  "QUIZKA",
    @ship_to_address = "463 Powers Street, Tilden, District Of Columbia, 8837",
    @model = "MP 4137TE",
    @old_cid =  "5ad0f022c97066d29aa2bfa8",
    @new_cid = "5ad0f022087a1000643011db",
    @soa_instance_id = 84,
    @order_number = 517713,
    @order_line_number = 84,
    @solution = "In labore aute est exercitation do aliquip. Aliqua commodo labore exercitation laborum laborum consequat. Reprehenderit qui dolor sit duis commodo. Elit quis minim sint cupidatat aute proident ipsum cupidatat veniam irure ad nulla in do.",
    @field_config = "Id ullamco officia dolor commodo ea do consequat officia. Mollit cillum ullamco reprehenderit magna ipsum magna. Voluptate deserunt sit est amet sit nisi aliqua elit tempor ullamco veniam minim esse. Ea incididunt pariatur cupidatat officia eiusmod aute do consectetur nisi proident veniam magna. Nisi ut Lorem aliqua anim mollit mollit eiusmod irure labore amet voluptate ea. In occaecat sunt elit et proident occaecat elit. Amet id aliquip consequat ipsum esse commodo do magna non irure id nulla est.",
    @expiration_date = "Sat Oct 24 2009 21:18:37 GMT+0000 (UTC)",
    @expiration_reason = "Duis dolor commodo adipisicing nulla sint nostrud dolor. Nostrud aliquip incididunt adipisicing et Lorem aliquip consequat reprehenderit sint voluptate anim sit qui non. Sint proident aute reprehenderit nisi laboris veniam deserunt. Cillum Lorem occaecat consectetur est occaecat ullamco minim laboris tempor excepteur est duis ad commodo. Ut aliquip qui tempor voluptate tempor eu qui in labore nisi.",
    @created_date = "Wed Jul 15 2015 21:26:16 GMT+0000 (UTC)",
    @updated_date = "Tue Nov 01 1988 12:12:21 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 84,
    @cid_type = "hardware",
    @cid_id = 84,
    @requirement_type = "revised_requirement",
    @requirement_id = 84,
    @order_comments = "Duis eiusmod amet qui reprehenderit. Do pariatur proident laboris elit deserunt aute sit laborum occaecat. Qui veniam irure id velit occaecat adipisicing excepteur laborum. Cupidatat proident magna nulla esse ex Lorem duis commodo labore deserunt nostrud. Adipisicing sit elit ut minim ad aliquip amet non officia magna cillum eiusmod tempor Lorem. Reprehenderit exercitation mollit duis quis labore cupidatat duis ea aliquip. Ad sunt eiusmod ipsum nostrud et.",
    @priority = "medium",
    @expected_completion_date = "Tue Apr 24 2018 12:08:04 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  173882,
    @customer_name =  "TROPOLI",
    @ship_to_address = "382 Woodbine Street, Allentown, Rhode Island, 9983",
    @model = "MP 3632 TE for Education",
    @old_cid =  "5ad0f0227ffb215a8346bbbd",
    @new_cid = "5ad0f022f33f8beb0a45ffa7",
    @soa_instance_id = 85,
    @order_number = 717974,
    @order_line_number = 85,
    @solution = "Lorem minim adipisicing commodo officia reprehenderit qui consectetur voluptate nisi laboris tempor et nostrud quis. Non est excepteur fugiat exercitation. Cupidatat ullamco officia sint exercitation commodo laborum ad ut cillum aute in cupidatat consectetur. Cillum in consectetur laboris consequat magna proident. Irure ullamco exercitation nisi elit anim aliquip. Ut irure eiusmod aliquip est dolore velit proident.",
    @field_config = "Ex dolore dolore occaecat proident deserunt aute eu. Culpa incididunt laboris adipisicing eiusmod. Adipisicing laborum cillum mollit cupidatat ullamco nostrud. In ad elit culpa aliqua officia aute. Consectetur eiusmod veniam tempor aute aliquip fugiat. Labore esse culpa fugiat culpa aliquip consectetur eu minim. Nisi cupidatat reprehenderit non excepteur eu aute amet excepteur aute.",
    @expiration_date = "Mon Oct 17 1994 19:22:08 GMT+0000 (UTC)",
    @expiration_reason = "Velit occaecat pariatur laborum in do. Aliqua voluptate tempor enim amet esse ullamco ea sunt proident nulla aute est voluptate. Minim consectetur ipsum aliquip aliquip mollit commodo aliquip aliquip proident et consectetur nisi. Sunt labore reprehenderit minim commodo non eiusmod.",
    @created_date = "Fri Apr 20 1984 15:10:13 GMT+0000 (UTC)",
    @updated_date = "Wed Nov 26 2003 08:31:11 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 85,
    @cid_type = "software",
    @cid_id = 85,
    @requirement_type = "new_requirement",
    @requirement_id = 85,
    @order_comments = "Laboris excepteur cupidatat veniam consequat est laboris reprehenderit cillum. Non commodo duis enim dolor non est veniam mollit amet elit in laborum excepteur. Ullamco est veniam aliqua officia. Pariatur dolor labore nostrud amet et esse et.",
    @priority = "high",
    @expected_completion_date = "Sun May 27 2018 13:39:24 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  226728,
    @customer_name =  "MOREGANIC",
    @ship_to_address = "491 Goodwin Place, Wikieup, Iowa, 4145",
    @model = "MP 3569 TE for Education",
    @old_cid =  "5ad0f02253a1fa815bae85ed",
    @new_cid = "5ad0f0223741615ce659736d",
    @soa_instance_id = 86,
    @order_number = 203276,
    @order_line_number = 86,
    @solution = "Aliquip sunt amet incididunt magna. Lorem in duis ad fugiat cillum irure cillum nulla. Ut excepteur eiusmod irure aliquip sint dolor elit sit sint.",
    @field_config = "Elit quis ex Lorem commodo cillum amet officia ut est consequat voluptate. Eu nulla irure nisi ex sunt tempor id ex irure magna ea minim nostrud incididunt. Et pariatur adipisicing nostrud voluptate. Deserunt amet dolore eu aute id culpa elit.",
    @expiration_date = "Sun Apr 04 1993 13:15:24 GMT+0000 (UTC)",
    @expiration_reason = "Deserunt pariatur sunt reprehenderit exercitation et id proident ipsum dolor amet qui velit voluptate voluptate. Excepteur officia cillum esse aliquip irure veniam tempor proident cupidatat veniam Lorem est. Sint in cillum ea cillum dolore quis sit exercitation Lorem. Occaecat excepteur ex veniam ad nostrud consequat. Nulla cupidatat ea aliqua laborum minim nostrud id amet.",
    @created_date = "Tue Aug 04 2015 23:14:45 GMT+0000 (UTC)",
    @updated_date = "Sat Apr 10 1982 19:46:18 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 86,
    @cid_type = "software",
    @cid_id = 86,
    @requirement_type = "new_requirement",
    @requirement_id = 86,
    @order_comments = "Ad velit nulla aliquip eu ea mollit id ad eu deserunt do. Aute occaecat non consequat ipsum veniam commodo mollit magna officia velit minim. Aliquip officia aliquip proident sunt ea velit incididunt laboris.",
    @priority = "medium",
    @expected_completion_date = "Mon May 28 2018 15:27:38 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  42407,
    @customer_name =  "YOGASM",
    @ship_to_address = "240 Blake Court, Detroit, Kansas, 9350",
    @model = "MP 3068 TE for Education",
    @old_cid =  "5ad0f022b8230527f1a88f1e",
    @new_cid = "5ad0f0223e97ea3cf0d14779",
    @soa_instance_id = 87,
    @order_number = 828371,
    @order_line_number = 87,
    @solution = "Amet mollit officia do do voluptate elit. Duis cillum deserunt voluptate cupidatat laboris labore reprehenderit labore ut reprehenderit. Nisi laboris cillum velit dolore minim occaecat excepteur cupidatat nostrud officia excepteur. In laboris ex cillum eu aliqua minim in ipsum ullamco qui eu do exercitation dolore. Veniam magna aliquip sint ullamco commodo.",
    @field_config = "Commodo occaecat sint sint irure est. Eu aliqua veniam commodo non tempor labore sunt qui do do. Sit minim incididunt magna voluptate. Do eiusmod incididunt ipsum do dolore aute id commodo ea esse exercitation. Velit id mollit velit ullamco aute ullamco incididunt officia magna ipsum minim elit et. Pariatur laboris est nulla nulla sint dolore proident nostrud do quis laboris ad. Velit laboris ipsum incididunt exercitation.",
    @expiration_date = "Sun Apr 29 1973 03:51:58 GMT+0000 (UTC)",
    @expiration_reason = "Incididunt esse ea tempor sint. Incididunt nulla consectetur irure esse exercitation occaecat culpa. Aliquip amet veniam commodo velit non et sunt nostrud sit. Est ex labore dolor fugiat ullamco. Lorem tempor nulla aliquip ipsum ipsum enim labore proident culpa anim aliqua velit ullamco veniam. Tempor et in exercitation labore occaecat irure deserunt. Nisi in est Lorem ad aliquip culpa in culpa.",
    @created_date = "Sat Apr 12 2014 08:32:33 GMT+0000 (UTC)",
    @updated_date = "Tue Apr 28 2009 13:07:53 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 87,
    @cid_type = "hardware",
    @cid_id = 87,
    @requirement_type = "new_requirement",
    @requirement_id = 87,
    @order_comments = "Enim id nulla nulla reprehenderit eiusmod mollit elit cupidatat et non velit voluptate ipsum. Sit sit ipsum nisi dolore officia laboris aliqua veniam proident minim commodo amet. Et laborum laborum adipisicing nisi duis enim quis pariatur aliquip velit ex exercitation ad. Anim consequat dolor ex non fugiat non amet labore.",
    @priority = "medium",
    @expected_completion_date = "Thu Jun 28 2018 09:31:56 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  25647,
    @customer_name =  "ISOTRONIC",
    @ship_to_address = "806 Bond Street, Denio, North Dakota, 2083",
    @model = "MP 3407 TE for Education",
    @old_cid =  "5ad0f02256de7619ad1657a4",
    @new_cid = "5ad0f022488ac0da5078d1d4",
    @soa_instance_id = 88,
    @order_number = 414379,
    @order_line_number = 88,
    @solution = "Nulla aliqua dolor cupidatat velit laborum. Proident minim eiusmod ipsum exercitation cillum enim id voluptate culpa adipisicing. Non culpa minim tempor est nostrud. In ex quis elit adipisicing nulla irure cillum minim aliquip ut et do consectetur ea. Deserunt cupidatat qui pariatur elit qui id consectetur laboris do qui. Irure exercitation aliquip cillum deserunt. Aliqua labore officia adipisicing esse ipsum irure ipsum qui eu duis ad anim ea magna.",
    @field_config = "In dolor ea in occaecat laborum adipisicing. Veniam sit magna in ex elit nulla id fugiat labore. Duis ad in exercitation et qui. Magna proident pariatur reprehenderit esse eu Lorem culpa elit veniam proident consequat amet aliqua id. Nostrud anim ullamco est magna dolore elit ea et minim ad dolor nulla aute. Nostrud ex pariatur aliqua tempor est id commodo sit.",
    @expiration_date = "Thu Dec 23 1971 13:09:04 GMT+0000 (UTC)",
    @expiration_reason = "Fugiat irure amet consectetur nostrud do deserunt culpa sit sit do nulla sunt nostrud. Irure minim elit dolore consectetur consequat dolor. Adipisicing cillum duis sit fugiat aliqua labore ex.",
    @created_date = "Fri Dec 02 2016 21:13:31 GMT+0000 (UTC)",
    @updated_date = "Thu Feb 25 2016 12:03:48 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 88,
    @cid_type = "software",
    @cid_id = 88,
    @requirement_type = "revised_requirement",
    @requirement_id = 88,
    @order_comments = "Laboris occaecat est eu voluptate consectetur. Mollit aute in et sit. Dolore tempor est ullamco nulla quis. Pariatur ad id quis in deserunt. Cupidatat elit aute aliqua dolore consequat sint labore dolore. Culpa non et esse voluptate laborum sunt.",
    @priority = "high",
    @expected_completion_date = "Fri Jun 29 2018 19:44:34 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  150944,
    @customer_name =  "REMOLD",
    @ship_to_address = "521 Evans Street, Caln, New Hampshire, 1903",
    @model = "MP 2817SP",
    @old_cid =  "5ad0f022e061d140450ed4e7",
    @new_cid = "5ad0f022230b4b98d27b637c",
    @soa_instance_id = 89,
    @order_number = 94385,
    @order_line_number = 89,
    @solution = "Cillum cupidatat magna qui minim amet. Lorem officia eu occaecat irure duis consequat irure veniam est nulla elit. Magna velit eiusmod ad magna ad. Proident ipsum incididunt aliquip pariatur elit labore nulla veniam et cupidatat veniam.",
    @field_config = "Ut ipsum commodo ut pariatur cupidatat ipsum laborum adipisicing ipsum laborum. Anim elit dolore duis cillum ad laboris Lorem. Eiusmod exercitation in deserunt reprehenderit. Exercitation incididunt id sint pariatur esse aliqua cillum.",
    @expiration_date = "Sat Jul 02 1994 05:45:16 GMT+0000 (UTC)",
    @expiration_reason = "Eu pariatur laborum proident ipsum irure. Excepteur pariatur reprehenderit fugiat sunt sunt ullamco eu nisi. Cupidatat dolore consectetur deserunt ea consectetur. Ullamco eu cillum proident commodo minim est. Aliquip aliqua minim fugiat est qui reprehenderit culpa magna ipsum quis ipsum eu officia.",
    @created_date = "Fri Jun 22 1973 03:44:15 GMT+0000 (UTC)",
    @updated_date = "Thu Feb 11 1988 01:13:14 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 89,
    @cid_type = "software",
    @cid_id = 89,
    @requirement_type = "new_requirement",
    @requirement_id = 89,
    @order_comments = "Ad aute laboris cupidatat irure cupidatat. Culpa dolore nisi commodo cupidatat deserunt enim irure minim exercitation minim sunt consequat. Veniam ad deserunt laboris labore dolor dolor non ut minim mollit dolore aliquip nisi.",
    @priority = "high",
    @expected_completion_date = "Mon May 07 2018 16:33:27 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  194484,
    @customer_name =  "HAIRPORT",
    @ship_to_address = "384 Amber Street, Ada, Idaho, 2068",
    @model = "MP 2709SP",
    @old_cid =  "5ad0f02281db5515cd60f395",
    @new_cid = "5ad0f02225935890349cdaca",
    @soa_instance_id = 90,
    @order_number = 302719,
    @order_line_number = 90,
    @solution = "Nisi minim aliquip laboris tempor id dolore mollit velit proident. Minim laborum non cillum anim enim quis adipisicing. Minim adipisicing excepteur ex irure amet. Qui est ex quis ullamco.",
    @field_config = "Occaecat non eu culpa irure amet cupidatat est ullamco. Dolore cillum consectetur consequat adipisicing magna ipsum. Irure sunt occaecat dolore laboris dolore non eiusmod dolore deserunt mollit et do do incididunt. Eiusmod nostrud exercitation ex incididunt nulla. Quis aliquip non non quis veniam adipisicing sunt sint qui veniam anim adipisicing in minim. Id ex id culpa commodo eiusmod non eiusmod ad voluptate est.",
    @expiration_date = "Wed Apr 12 2017 20:30:38 GMT+0000 (UTC)",
    @expiration_reason = "In reprehenderit ea et labore deserunt irure cupidatat. Cupidatat proident mollit ad labore tempor velit. Excepteur voluptate consequat ut excepteur ea pariatur duis ex ad. Dolore id irure commodo consectetur occaecat magna nulla. Ipsum adipisicing consequat anim voluptate nostrud aute veniam officia id ullamco reprehenderit sint id. Laboris laboris voluptate duis laboris pariatur mollit et exercitation fugiat esse exercitation.",
    @created_date = "Wed Oct 17 2012 17:31:17 GMT+0000 (UTC)",
    @updated_date = "Mon Feb 10 2003 12:17:04 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 90,
    @cid_type = "software",
    @cid_id = 90,
    @requirement_type = "new_requirement",
    @requirement_id = 90,
    @order_comments = "Consectetur exercitation nostrud deserunt ea dolor tempor. Consectetur in reprehenderit cupidatat dolor cupidatat consectetur labore ex esse irure consectetur nisi culpa laboris. Anim consectetur consequat tempor enim cupidatat duis est. Dolor dolore cillum voluptate eu occaecat nulla exercitation aute sint laborum laboris. Magna ut duis exercitation adipisicing non duis labore id ullamco.",
    @priority = "high",
    @expected_completion_date = "Mon Apr 23 2018 16:42:21 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  346678,
    @customer_name =  "GORGANIC",
    @ship_to_address = "842 Kenmore Court, Cuylerville, Texas, 2601",
    @model = "MP 4223SP",
    @old_cid =  "5ad0f02270f944ec329c0204",
    @new_cid = "5ad0f022ff7fcf521a365cec",
    @soa_instance_id = 91,
    @order_number = 14203,
    @order_line_number = 91,
    @solution = "Non qui voluptate adipisicing ea laboris est labore mollit ex nisi dolor nulla exercitation. Incididunt minim consequat duis pariatur occaecat quis ad. Ipsum ipsum cillum reprehenderit cupidatat ad occaecat in nisi consequat eiusmod voluptate eiusmod exercitation.",
    @field_config = "Consectetur eiusmod aliquip ut fugiat laborum reprehenderit cupidatat est fugiat. Occaecat culpa ad culpa officia exercitation adipisicing aliqua ut ullamco incididunt nostrud. Deserunt dolore non eu elit culpa minim occaecat proident eiusmod. Proident magna ad pariatur proident esse ad cillum culpa Lorem velit ea excepteur in. Labore exercitation anim qui nulla eiusmod nulla nostrud anim consequat. Aliquip mollit tempor sunt nisi ullamco ea pariatur excepteur nostrud.",
    @expiration_date = "Sun Dec 01 2013 20:24:34 GMT+0000 (UTC)",
    @expiration_reason = "Magna laborum non voluptate in in nulla esse aliqua veniam culpa adipisicing occaecat sunt consectetur. Ea quis aliqua mollit sint laboris sit sunt officia esse. Sunt non culpa consequat eiusmod ad ea irure adipisicing anim aute enim labore pariatur. Nisi adipisicing reprehenderit magna cupidatat esse ad aliquip non ullamco anim. Amet qui culpa in in sunt dolore sit mollit id culpa aliquip cupidatat. Adipisicing quis ullamco labore amet sunt.",
    @created_date = "Sun Oct 02 1988 14:21:38 GMT+0000 (UTC)",
    @updated_date = "Fri Jul 23 2010 04:38:51 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 91,
    @cid_type = "software",
    @cid_id = 91,
    @requirement_type = "new_requirement",
    @requirement_id = 91,
    @order_comments = "Mollit voluptate in do minim pariatur ea et amet excepteur laborum ullamco excepteur laborum cupidatat. Adipisicing laboris eiusmod voluptate tempor deserunt cupidatat laborum cupidatat cillum proident exercitation. Do reprehenderit commodo laborum nulla veniam ex irure ex aliqua commodo ipsum non do. In exercitation sint cupidatat ullamco adipisicing deserunt magna amet eu deserunt aliquip ad do.",
    @priority = "high",
    @expected_completion_date = "Fri Jun 01 2018 15:35:35 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  137430,
    @customer_name =  "HYPLEX",
    @ship_to_address = "398 Utica Avenue, Dellview, Indiana, 882",
    @model = "MP 3996SP",
    @old_cid =  "5ad0f02211d6ce6a7d653ff1",
    @new_cid = "5ad0f022ef6b00a5e1d1194a",
    @soa_instance_id = 92,
    @order_number = 627403,
    @order_line_number = 92,
    @solution = "Aute Lorem reprehenderit velit et ipsum esse aliqua ullamco officia quis ipsum cillum est minim. Excepteur amet exercitation est sunt mollit exercitation deserunt excepteur pariatur. Dolore enim sunt pariatur culpa. Qui mollit laboris ullamco exercitation irure proident esse duis do est laborum cupidatat ipsum. Aliquip ea incididunt cillum pariatur nulla cillum non excepteur elit mollit irure voluptate exercitation sit.",
    @field_config = "Exercitation fugiat commodo reprehenderit cillum exercitation excepteur velit quis reprehenderit irure ullamco. Lorem commodo excepteur sit aliqua tempor laboris Lorem laboris aliqua. Cillum magna in nostrud nisi ipsum velit ipsum anim fugiat irure. Quis proident Lorem veniam pariatur sint enim ea.",
    @expiration_date = "Thu Dec 23 1971 05:11:09 GMT+0000 (UTC)",
    @expiration_reason = "Mollit minim anim fugiat exercitation magna exercitation deserunt sint irure aliqua occaecat non id mollit. Pariatur deserunt eiusmod qui exercitation ea deserunt adipisicing voluptate reprehenderit et. Pariatur consequat excepteur excepteur id ullamco aliquip ullamco irure velit pariatur pariatur. Ad sunt voluptate ullamco consequat mollit. Mollit aute officia voluptate do sit anim quis veniam. Dolore et culpa ipsum ullamco sint id cillum cupidatat.",
    @created_date = "Wed Mar 26 2003 01:03:20 GMT+0000 (UTC)",
    @updated_date = "Mon Jul 11 1988 08:31:28 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 92,
    @cid_type = "hardware",
    @cid_id = 92,
    @requirement_type = "new_requirement",
    @requirement_id = 92,
    @order_comments = "Ad duis ea culpa tempor dolore adipisicing. Magna irure duis sint dolore. Culpa sunt nisi veniam mollit ea nulla voluptate ullamco exercitation qui sint ea mollit cillum. Officia proident veniam fugiat labore officia et velit elit. Elit Lorem officia nulla non reprehenderit aliquip quis enim eu reprehenderit. Sunt ipsum voluptate est consequat voluptate ex minim amet sunt adipisicing eu. Enim laborum est nulla sint dolor sint magna officia est consequat occaecat amet.",
    @priority = "medium",
    @expected_completion_date = "Wed May 30 2018 09:23:39 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  287439,
    @customer_name =  "SPORTAN",
    @ship_to_address = "246 Applegate Court, Foscoe, Illinois, 1523",
    @model = "MP 2966SP",
    @old_cid =  "5ad0f0223056c836f0592311",
    @new_cid = "5ad0f022d420b5a0093e059f",
    @soa_instance_id = 93,
    @order_number = 39979,
    @order_line_number = 93,
    @solution = "Laborum ad excepteur dolor Lorem anim mollit incididunt labore cupidatat velit Lorem non. Velit amet est laboris esse excepteur proident dolor aliquip nulla. Duis aute aliqua do ad id cupidatat amet irure laborum incididunt ullamco anim do ut. Commodo duis do officia tempor mollit esse labore sit ut enim duis.",
    @field_config = "Tempor ad culpa ea ea incididunt velit labore cillum irure laborum proident sunt elit Lorem. Qui dolor reprehenderit labore excepteur et voluptate Lorem eiusmod in ullamco do aute occaecat. Ipsum nostrud aute minim mollit magna. Dolore culpa veniam laboris adipisicing non officia elit. Sint ex nulla anim proident laboris dolor deserunt pariatur. Cupidatat sunt et irure laborum qui enim. Reprehenderit anim exercitation proident officia commodo id aliqua excepteur aliqua veniam.",
    @expiration_date = "Sun Apr 06 1986 10:00:19 GMT+0000 (UTC)",
    @expiration_reason = "Ad magna enim adipisicing ut. Eiusmod incididunt Lorem proident eiusmod enim ea cillum minim. Voluptate culpa minim id cillum Lorem irure aliqua elit. Duis adipisicing laboris labore elit ad mollit non. Tempor incididunt commodo ullamco cupidatat ut labore eiusmod minim aute. Officia ut consequat elit qui in qui. Minim anim sit ullamco occaecat duis aliqua elit veniam ex aliqua quis est deserunt.",
    @created_date = "Mon May 28 1979 16:51:57 GMT+0000 (UTC)",
    @updated_date = "Thu Aug 21 1975 23:08:54 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 93,
    @cid_type = "software",
    @cid_id = 93,
    @requirement_type = "revised_requirement",
    @requirement_id = 93,
    @order_comments = "Eu nulla nostrud ea sit labore nostrud aliquip non quis incididunt mollit. Ut magna incididunt ex laborum do dolore dolore laboris nisi velit ea officia. Fugiat esse est aliqua mollit ex. Sit amet id ipsum deserunt mollit incididunt duis do consequat.",
    @priority = "low",
    @expected_completion_date = "Tue May 22 2018 07:36:44 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  179563,
    @customer_name =  "ANOCHA",
    @ship_to_address = "707 Tompkins Place, Jeff, New Jersey, 628",
    @model = "MP 3973SP",
    @old_cid =  "5ad0f02288449e9a5d49e578",
    @new_cid = "5ad0f0223f56fc3262db0942",
    @soa_instance_id = 94,
    @order_number = 170416,
    @order_line_number = 94,
    @solution = "Deserunt deserunt quis veniam dolor ad pariatur ipsum anim. Lorem reprehenderit non deserunt voluptate aliqua non ut. Nisi anim et sint est. Aliqua nulla Lorem aliquip ullamco est.",
    @field_config = "Labore eu quis voluptate nostrud adipisicing id officia magna deserunt id ipsum proident. Duis laborum tempor esse voluptate veniam Lorem nostrud cillum. Laboris ea labore anim velit reprehenderit in.",
    @expiration_date = "Mon May 08 1978 02:46:53 GMT+0000 (UTC)",
    @expiration_reason = "Irure ut incididunt enim adipisicing do. Dolor aute ea cupidatat occaecat nulla ad commodo Lorem dolore. Consequat est ipsum duis id incididunt enim veniam. Sunt sunt magna tempor incididunt cillum veniam cillum qui cupidatat tempor tempor do sit.",
    @created_date = "Sat Nov 25 2017 09:06:35 GMT+0000 (UTC)",
    @updated_date = "Sun Jan 04 2004 13:57:12 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 94,
    @cid_type = "hardware",
    @cid_id = 94,
    @requirement_type = "revised_requirement",
    @requirement_id = 94,
    @order_comments = "Nulla fugiat qui commodo cillum consequat ipsum non aliquip quis non ex. Ullamco laboris consequat amet ad ut qui veniam deserunt officia. Dolor adipisicing commodo culpa laborum occaecat esse irure anim enim aliquip dolor nostrud. Culpa consectetur consequat cillum cillum consectetur consequat proident et pariatur.",
    @priority = "high",
    @expected_completion_date = "Mon Jun 11 2018 20:04:45 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  316529,
    @customer_name =  "EWAVES",
    @ship_to_address = "740 Rockaway Parkway, Southmont, Virgin Islands, 8815",
    @model = "MP 4129SP",
    @old_cid =  "5ad0f022a0c93e9ff01fdf7a",
    @new_cid = "5ad0f02291049ee32a9af5c2",
    @soa_instance_id = 95,
    @order_number = 213551,
    @order_line_number = 95,
    @solution = "Tempor dolor esse est incididunt in adipisicing cillum laboris dolor. Anim est ex sit nulla ullamco id elit aliqua commodo velit excepteur est. Magna minim veniam elit nisi cillum magna dolore sit Lorem minim ex ipsum. In ex officia enim consequat deserunt consectetur commodo ullamco. Lorem velit ipsum anim esse aliquip ipsum exercitation labore minim occaecat. Aliquip non nulla aliquip voluptate velit aute ut. Consequat nisi duis fugiat excepteur nisi eiusmod.",
    @field_config = "Do adipisicing ad voluptate sit elit ea do. Duis cillum exercitation culpa adipisicing incididunt duis et culpa officia ex. Nostrud qui ipsum adipisicing ullamco amet occaecat sit incididunt et voluptate. Dolore ea proident velit sunt officia tempor occaecat nisi non esse.",
    @expiration_date = "Sun Jun 07 1998 20:16:48 GMT+0000 (UTC)",
    @expiration_reason = "Fugiat esse tempor sint dolore reprehenderit ea deserunt. Do magna irure nisi dolore nostrud sint. Cillum incididunt officia exercitation elit.",
    @created_date = "Sun Dec 16 1990 22:08:20 GMT+0000 (UTC)",
    @updated_date = "Thu Feb 20 1992 19:43:50 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 95,
    @cid_type = "software",
    @cid_id = 95,
    @requirement_type = "new_requirement",
    @requirement_id = 95,
    @order_comments = "Culpa ad cupidatat eu consequat magna Lorem amet ea excepteur aliqua mollit. Quis aliqua nulla occaecat qui minim deserunt labore ad mollit velit anim. Mollit non magna aliqua sunt amet pariatur. Voluptate quis mollit mollit irure culpa.",
    @priority = "medium",
    @expected_completion_date = "Fri Jun 29 2018 19:31:23 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  349403,
    @customer_name =  "KEENGEN",
    @ship_to_address = "387 Ovington Avenue, Moscow, Michigan, 7543",
    @model = "MP 2328 TE for Education",
    @old_cid =  "5ad0f022dac835a7d4f563eb",
    @new_cid = "5ad0f022fb368b66468e2dac",
    @soa_instance_id = 96,
    @order_number = 313564,
    @order_line_number = 96,
    @solution = "Lorem nisi est commodo officia fugiat labore reprehenderit enim do. Aute ullamco consectetur minim nulla fugiat incididunt. Consectetur cupidatat pariatur minim proident.",
    @field_config = "Nulla consequat amet esse reprehenderit laboris in anim culpa consequat Lorem labore. Adipisicing duis ad culpa consequat irure Lorem nostrud Lorem consectetur laboris. Ex consequat consequat aliqua ullamco proident duis incididunt ipsum in. Tempor consequat consequat aute amet tempor eiusmod incididunt. Et proident do velit nisi nulla amet fugiat aliqua excepteur in deserunt est. Anim ullamco deserunt commodo ad do exercitation culpa laborum commodo elit ex ullamco. Minim quis tempor eu est ullamco tempor excepteur et consectetur proident dolor amet.",
    @expiration_date = "Sat Apr 14 2007 04:57:40 GMT+0000 (UTC)",
    @expiration_reason = "Officia ut reprehenderit culpa proident labore aute irure pariatur laboris sunt eiusmod nulla incididunt. Fugiat consequat consectetur nulla mollit ullamco. Et aliqua voluptate commodo elit. Incididunt ut ea dolore consequat eiusmod proident. Laborum consequat aliqua ullamco ea labore voluptate officia reprehenderit mollit dolore irure. Aliquip do consectetur deserunt culpa aliqua dolore anim qui proident minim non reprehenderit ex.",
    @created_date = "Thu Jan 07 2010 15:34:12 GMT+0000 (UTC)",
    @updated_date = "Sat Apr 29 1995 19:59:25 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 96,
    @cid_type = "software",
    @cid_id = 96,
    @requirement_type = "new_requirement",
    @requirement_id = 96,
    @order_comments = "Officia officia labore non cillum labore dolore elit incididunt consequat. Nostrud dolor ad id aliqua magna fugiat ad ut veniam quis tempor mollit non. Esse consectetur consequat et veniam exercitation enim cupidatat nostrud duis id consequat in. Sint fugiat ea aliqua adipisicing sunt labore ullamco officia aliqua officia aute exercitation labore culpa. In magna elit ad dolore amet id ut dolore esse irure ea tempor. Proident commodo sunt tempor ex irure ea exercitation incididunt. Ea pariatur tempor occaecat enim sunt occaecat cillum qui est sint.",
    @priority = "low",
    @expected_completion_date = "Mon May 21 2018 21:29:22 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  157248,
    @customer_name =  "ORBAXTER",
    @ship_to_address = "859 Gates Avenue, Reno, Federated States Of Micronesia, 4671",
    @model = "MP 3995TE",
    @old_cid =  "5ad0f02258c668c81f993977",
    @new_cid = "5ad0f022f53f19278c7d25ec",
    @soa_instance_id = 97,
    @order_number = 787845,
    @order_line_number = 97,
    @solution = "Do est cillum proident fugiat. Aute id incididunt Lorem ea ad mollit commodo. Pariatur velit anim occaecat dolore nulla id excepteur elit dolor pariatur excepteur irure non ullamco. Nisi mollit amet pariatur qui ut non commodo consequat. Incididunt excepteur fugiat aliquip sint est nostrud. Id reprehenderit adipisicing qui esse elit laborum veniam in exercitation sunt et eiusmod.",
    @field_config = "Elit esse commodo amet elit anim. Dolor ex eiusmod officia nostrud voluptate anim consectetur ullamco deserunt laborum amet eiusmod duis. Exercitation reprehenderit cupidatat consequat magna ullamco ex proident nostrud. Irure qui nulla magna adipisicing ea in do ad nostrud minim culpa labore ullamco. Id aliquip esse minim tempor.",
    @expiration_date = "Wed Sep 02 2015 19:00:12 GMT+0000 (UTC)",
    @expiration_reason = "Eu nisi anim laborum magna aliquip ex sunt labore. Amet Lorem reprehenderit esse nulla excepteur adipisicing. Nulla ex anim aliqua cillum.",
    @created_date = "Sun Jul 23 2017 23:02:55 GMT+0000 (UTC)",
    @updated_date = "Mon Jan 30 2017 08:25:28 GMT+0000 (UTC)",
    @site_type = "site_specific",
    @site_id = 97,
    @cid_type = "software",
    @cid_id = 97,
    @requirement_type = "revised_requirement",
    @requirement_id = 97,
    @order_comments = "Tempor minim laboris nulla enim officia. Et enim exercitation enim dolor ea irure veniam non quis minim laboris eiusmod ea enim. Aliquip et pariatur labore qui.",
    @priority = "medium",
    @expected_completion_date = "Sun Jun 10 2018 08:59:36 GMT+0000 (UTC)"
;
EXECUTE [dbo].[setFullCid]
    @customer_account_number =  316282,
    @customer_name =  "RETROTEX",
    @ship_to_address = "513 Noble Street, Ellerslie, California, 9680",
    @model = "MP 3019 TE for Education",
    @old_cid =  "5ad0f022905ae83850fa7479",
    @new_cid = "5ad0f022a0864088c67d4115",
    @soa_instance_id = 98,
    @order_number = 570343,
    @order_line_number = 98,
    @solution = "Culpa cillum ad commodo veniam aliqua fugiat ex et anim nisi sunt. Tempor voluptate nisi consequat est ut ullamco eu. Pariatur consectetur quis aliqua dolore ex irure pariatur nisi consequat magna dolore in ipsum.",
    @field_config = "Tempor ipsum commodo consectetur minim est anim velit elit tempor minim esse culpa et. Aute anim ullamco nisi consequat velit nostrud id nulla nulla aliqua minim pariatur ipsum exercitation. Mollit reprehenderit mollit nulla duis incididunt qui officia veniam. Enim eiusmod tempor labore eiusmod do nostrud reprehenderit sint excepteur in nulla. Ex ex nisi eu laboris laboris anim ex. Aliqua quis laborum proident elit nisi do.",
    @expiration_date = "Mon Mar 25 1985 01:12:12 GMT+0000 (UTC)",
    @expiration_reason = "Excepteur tempor consectetur veniam deserunt non mollit. Veniam irure amet exercitation consectetur quis nulla cillum. Velit dolor aliqua quis aute cupidatat adipisicing nulla sint et sit. Cupidatat cillum magna velit labore proident deserunt do ullamco officia minim nostrud veniam cillum quis.",
    @created_date = "Tue May 02 1995 12:21:02 GMT+0000 (UTC)",
    @updated_date = "Fri Mar 16 2018 01:24:09 GMT+0000 (UTC)",
    @site_type = "non_site_specific",
    @site_id = 98,
    @cid_type = "software",
    @cid_id = 98,
    @requirement_type = "revised_requirement",
    @requirement_id = 98,
    @order_comments = "Quis deserunt laborum excepteur mollit cupidatat incididunt nostrud. Proident incididunt Lorem officia ipsum laborum amet laboris consectetur. Irure duis culpa consequat consequat proident elit labore velit duis do reprehenderit incididunt nisi fugiat. Est aliquip ipsum ex cupidatat eiusmod. Nulla aliquip sunt anim laboris aliquip duis nulla consectetur esse.",
    @priority = "high",
    @expected_completion_date = "Sun May 13 2018 14:18:07 GMT+0000 (UTC)";

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------

/*
select * from [dbo].[rscc_customer];
select * from [dbo].[rscc_model];
select * from [dbo].[rscc_sitetype];
select * from [dbo].[rscc_sitespecific];
select * from [dbo].[rscc_nonsitespecific];
select * from [dbo].[rscc_cidtype];
select * from [dbo].[rscc_hardwarecid];
select * from [dbo].[rscc_softwarecid];
select * from [dbo].[rscc_requirementtype];
select * from [dbo].[rscc_new_requirement];
select * from [dbo].[rscc_revised_requirement];
select * from [dbo].[rscc_om_cid];

*/