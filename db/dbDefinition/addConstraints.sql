USE BBD_BursaryDB2;
GO

-- Application_Status Constraints
ALTER TABLE [dbo].[Application_Status]
    ADD CONSTRAINT [PK_Application_Status.ApplicationStatusID]
        PRIMARY KEY CLUSTERED ([ApplicationStatusID])
GO

-- Race Constraints
ALTER TABLE [dbo].[Race]
    ADD CONSTRAINT [PK_Race.RaceID] 
        PRIMARY KEY CLUSTERED ([RaceID])
GO

-- Roles Constraints
ALTER TABLE [dbo].[Roles]
    ADD CONSTRAINT [PK_Roles.RoleID]  
        PRIMARY KEY CLUSTERED ([RoleID])
GO

-- Contact_Details Constraints
ALTER TABLE [dbo].[Contact_Details]
    ADD CONSTRAINT [PK_ContactDetails.ContactDetailsID] 
        PRIMARY KEY CLUSTERED ([ContactDetailsID])
GO

-- Bursary Fund Constraints
ALTER TABLE [dbo].[Bursary_Fund]
    ADD CONSTRAINT [PK_BursaryFund] 
        PRIMARY KEY CLUSTERED ([BursaryFundID])
GO

-- Institution_Fund_Allocation Constraints
ALTER TABLE [dbo].[Institution_Fund_Allocation]
    ADD CONSTRAINT [PK_Institution_Fund_Allocation]
        PRIMARY KEY CLUSTERED ([InstitutionFundAllocationID])
GO

-- User_Details Constraints
ALTER TABLE [dbo].[User_Details]
    ADD CONSTRAINT [PK_User_Details.UserID] 
        PRIMARY KEY CLUSTERED ([UserID])
GO

-- Institute_Info Constraints
ALTER TABLE [dbo].[Institute_Info]
    ADD CONSTRAINT [PK_Institute_Info]
        PRIMARY KEY CLUSTERED ([InstituteID])
GO

-- Institute_Application
ALTER TABLE [dbo].[Institute_Application]
    ADD CONSTRAINT [PK_Institute_Application.InstituteApplicationID]
        PRIMARY KEY CLUSTERED ([InstituteApplicationID])
GO

-- Student Constraints
ALTER TABLE [dbo].[Student]
    ADD CONSTRAINT [PK_Student.StudentID] 
    PRIMARY KEY CLUSTERED ([StudentID])
GO

-- Head_Of_Department Constraints
ALTER TABLE [dbo].[Head_Of_Department]
    ADD CONSTRAINT [PK_Head_Of_Department] 
        PRIMARY KEY CLUSTERED ([HeadOfDepartmentID])
GO

-- Bursary_Applicants Constraints
ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [PK_Bursary_Applicants.BursaryApplicantID] 
        PRIMARY KEY CLUSTERED ([BursaryApplicantID])
GO

-- Document Constraints
ALTER TABLE [dbo].[Document]
    ADD CONSTRAINT [PK_Document.DocumentID]
        PRIMARY KEY CLUSTERED ([DocumentID])
GO

-----------------------------------------------------------------------------------
-- Institution_Fund_Allocation Constraints
ALTER TABLE [dbo].[Institution_Fund_Allocation]
    ADD CONSTRAINT [FK_Institution_Fund_Allocation_Institute_Info_InstituteID]
        FOREIGN KEY ([InstituteID])
        REFERENCES [dbo].[Institute_Info]([InstituteID])
GO

ALTER TABLE [dbo].[Institution_Fund_Allocation]
    ADD CONSTRAINT [FK_Institution_Fund_Allocation_Bursary_Fund_BursaryFundID]
        FOREIGN KEY ([BursaryFundID])
        REFERENCES [dbo].[Bursary_Fund]([BursaryFundID])
GO

ALTER TABLE [dbo].[Institution_Fund_Allocation]
    ADD CONSTRAINT [CHK_Institution_Fund_Allocation_AllocatedAmount]
        CHECK ([AllocatedAmount] >= 0)
GO

ALTER TABLE [dbo].[Institution_Fund_Allocation]
    ADD CONSTRAINT [CHK_Institution_Fund_Allocation_AllocatedRemainingAmount]
        CHECK ([AllocatedRemainingAmount] >= 0)
GO

ALTER TABLE [dbo].[Institution_Fund_Allocation]
    ADD CONSTRAINT [CHK_Institution_Fund_Allocation_AllocatedAmount_Fundable]
        CHECK ([AllocatedAmount] <= [dbo].[udfGetBursary_FundRemaingAmount]([BursaryFundID]))
GO

-- User_Details Constraints
ALTER TABLE [dbo].[User_Details]
    ADD CONSTRAINT [FK_User_Details.Contact_Details.ContactDetailsID] 
        FOREIGN KEY ([ContactDetailsID])
        REFERENCES [dbo].[Contact_Details]([ContactDetailsID])
GO

ALTER TABLE [dbo].[User_Details]
    ADD CONSTRAINT [FK_User_Details.Roles.RoleID] 
        FOREIGN KEY ([RoleID])
        REFERENCES [dbo].[Roles]([RoleID])
GO

ALTER TABLE [dbo].[User_Details]
    ADD CONSTRAINT [UNQ_User_Details.ContactDetailsID]
        UNIQUE ([ContactDetailsID])
GO

-- Institute_Info Constraints
ALTER TABLE [dbo].[Institute_Info]
    ADD CONSTRAINT [FK_Institute_Info.Institute_Application.InstituteApplicationID]
        FOREIGN KEY ([InstituteApplicationID])
        REFERENCES [dbo].[Institute_Application]([InstituteApplicationID])
GO

ALTER TABLE [dbo].[Institute_Info]
    ADD CONSTRAINT [FK_Institute_Info.ContactDetailsID]
        FOREIGN KEY ([ContactDetailsID])
        REFERENCES [dbo].[Contact_Details]([ContactDetailsID])
GO

ALTER TABLE [dbo].[Institute_Info]
    ADD CONSTRAINT [UNQ_Institute_Info.InstituteID]
        UNIQUE ([ContactDetailsID])
GO

-- Institute_Application
ALTER TABLE [dbo].[Institute_Application]
    ADD CONSTRAINT [FK_Institute_Application.Application_Status.ApplicationStatusID]
        FOREIGN KEY ([ApplicationStatusID])
        REFERENCES [dbo].[Application_Status]([ApplicationStatusID])
GO

-- Student Constraints
ALTER TABLE [dbo].[Student]
    ADD CONSTRAINT [FK_Student.Race.RaceID] 
        FOREIGN KEY ([RaceID]) 
        REFERENCES [dbo].[Race]([RaceID])
GO

ALTER TABLE [dbo].[Student]
    ADD CONSTRAINT [FK_Student.User_Details.UserID] 
        FOREIGN KEY ([UserID]) 
        REFERENCES [dbo].[User_Details]([UserID])
GO

ALTER TABLE [dbo].[Student]
    ADD CONSTRAINT [UNQ_Student.UserID]
        UNIQUE ([UserID])
GO

-- Head_Of_Department Constraints
ALTER TABLE [dbo].[Head_Of_Department]
    ADD CONSTRAINT [FK_Head_Of_Department.Institute_Info.InstituteID] 
        FOREIGN KEY ([InstituteID])
        REFERENCES [dbo].[Institute_Info]([InstituteID]) 
GO

ALTER TABLE [dbo].[Head_Of_Department]
    ADD CONSTRAINT [FK_HeadOfDepartment_UserID]
        FOREIGN KEY ([UserID])
        REFERENCES [dbo].[User_Details]([UserID])
GO

ALTER TABLE [dbo].[Head_Of_Department]
    ADD CONSTRAINT [UNQ_Head_Of_Department.UserID]
        UNIQUE ([UserID])
GO

-- Bursary_Applicants Constraints
ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [FK_Bursary_Applicants.Head_Of_Department.HeadOfDepartmentID]
        FOREIGN KEY ([HeadOfDepartmentID])
        REFERENCES [dbo].[Head_Of_Department] ([HeadOfDepartmentID])
GO

ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [FK_Bursary_Applicants.ApplicantStatus.ApplicationStatusID]
        FOREIGN KEY ([BursaryApplicantStatusID])
        REFERENCES [dbo].[Application_Status] ([ApplicationStatusID])
GO

ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [FK_Bursary_Applicants.Student.StudentID]
        FOREIGN KEY ([StudentID])
        REFERENCES[dbo].[Student]([StudentID])
GO

ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [FK_Bursary_Applicants.Institute_Fund_Allocation.InstitutionFundAllocationID]
        FOREIGN KEY ([InstituteFundAllocationID])
        REFERENCES[dbo].[Institution_Fund_Allocation]([InstitutionFundAllocationID])
GO

ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [UNQ_Bursary_Applicants.InstituteFundAllocationID]
        UNIQUE ([InstituteFundAllocationID])
GO

ALTER TABLE [dbo].[Bursary_Applicants]
    ADD CONSTRAINT [CHK_Bursary_Applicants.BursaryAmount_Valid]
        CHECK ([BursaryAmount] <= [dbo].[udfGetInstitution_Fund_AllocationRemainingAmount]([InstituteFundAllocationID]))
GO

-- Document Constraints
ALTER TABLE [dbo].[Document]
    ADD CONSTRAINT [FK_Document.Bursary_Applicants.BursaryApplicantID]
        FOREIGN KEY ([BursaryApplicantID])
        REFERENCES [dbo].[Bursary_Applicants]([BursaryApplicantID])
GO

ALTER TABLE [dbo].[Document]
    ADD CONSTRAINT [UNQ_Document.BursaryApplicantID]
        UNIQUE ([BursaryApplicantID])
GO