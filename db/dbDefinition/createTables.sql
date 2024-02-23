CREATE DATABASE BBD_BursaryDB3

GO

USE BBD_BursaryDB3;

GO



CREATE TABLE [dbo].[Application_Status]
(
  [ApplicationStatusID] INT IDENTITY(1,1) NOT NULL,
  [Status] VARCHAR(8) NOT NULL,
);

GO

CREATE TABLE [dbo].[Bursary_Applicants]
(
  [BursaryApplicantID] INT IDENTITY(1,1) NOT NULL,
  [StudentID] INT NOT NULL,
  [HeadOfDepartmentID] INT NOT NULL,
  [InstituteFundAllocationID] INT NOT NULL,
  [BursaryAmount] MONEY NOT NULL,
  [Motivation] VARCHAR (500) NOT NULL,
  [BursaryApplicantStatusID] INT NOT NULL,
  [AverageMarks] INT NOT NULL
);

GO

CREATE TABLE [dbo].[Document]
(
  [DocumentID] INT NOT NULL,
  [Transcript] VARCHAR(200) NOT NULL,
  [IdentityDocument]  VARCHAR(200) NOT NULL,
  [BursaryApplicantID] INT NOT NULL,
);
 
GO

CREATE TABLE [dbo].[Bursary_Fund]
(
  [BursaryFundID] INT IDENTITY(2024,1) NOT NULL,
  [FundAmount] MONEY NOT NULL DEFAULT 0,
  [FundRemainingAmount] MONEY NOT NULL,
  [StudentMaxAllocation] MONEY NOT NULL,
  [FinacialDate] DATE NOT NULL
);
 
GO

CREATE TABLE [dbo].[Contact_Details]
(
  [ContactDetailsID] INT IDENTITY(1,1) NOT NULL,
  [PhoneNumber] VARCHAR(12) NOT NULL,
  [Email] VARCHAR(320) NOT NULL,
);
 
GO

CREATE TABLE [dbo].[Institute_Application]
(
  [InstituteApplicationID] INT IDENTITY(1,1) NOT NULL,
  [Motivation] VARCHAR(100) NOT NULL,
  [RejectionComment] VARCHAR(200),
  [ApplicationStatusID] INT NOT NULL,
);

GO

CREATE TABLE [dbo].[Head_Of_Department]
(
  [HeadOfDepartmentID] INT IDENTITY(1,1) NOT NULL,
  [InstituteID] INT NOT NULL,
  [UserID] INT NOT NULL,
);
 
GO



CREATE TABLE [dbo].[Institution_Fund_Allocation]
(
  [InstitutionFundAllocationID] INT IDENTITY(1,1) NOT NULL,
  [AllocatedAmount] MONEY DEFAULT 0,
  [AllocatedRemainingAmount] MONEY DEFAULT 0,
  [InstituteID] INT DEFAULT 0,
  [BursaryFundID] INT DEFAULT 0,
);
 
GO

CREATE TABLE [dbo].[Institute_Info]
(
  [InstituteID] INT NOT NULL IDENTITY(1,1),
  [InstituteName] VARCHAR(100) NOT NULL,
  [ContactDetailsID] INT NOT NULL,
  [InstituteApplicationID] INT NOT NULL,
);
 
GO

CREATE TABLE [dbo].[Race]
(
  [RaceID][int] IDENTITY(1,1) NOT NULL,
  [Race][varchar](8) NOT NULL,

);
 
GO

CREATE TABLE [dbo].[Roles]
(
  [RoleID][int] IDENTITY(1,1) NOT NULL,
  [Role][varchar](9) NOT NULL,

);
 
GO

CREATE TABLE [Student]
(
  [StudentID] INT IDENTITY(1,1) NOT NULL,
  [UserID] INT NOT NULL,
  [ID_Number] CHAR(13) NOT NULL,
  [RaceID] INT NOT NULL,
);
 
GO

CREATE TABLE [dbo].[User_Details]
(
  [UserID] INT IDENTITY(1,1) NOT NULL,
  [FirstName] VARCHAR(100) NOT NULL,
  [LastName] VARCHAR(100) NOT NULL,
  [IsActive] BIT DEFAULT 1 NOT NULL,
  [ContactDetailsID] INT NOT NULL,
  [RoleID] INT NOT NULL,
);
GO

CREATE TABLE [dbo].[BBD_Admin]
(
  [BBDAdminID] INT IDENTITY(1,1) NOT NULL,
  [UserID] INT NOT NULL,
);
GO



CREATE VIEW [dbo].[Bursary_Applicant_View]
AS
SELECT 
  BursaryApplicantID,
  StudentID,
  HeadOfDepartmentID,
  InstituteFundAllocationID,
  BursaryAmount,
  Motivation,
  BursaryApplicantStatusID,
  AverageMarks
FROM Bursary_Applicants;