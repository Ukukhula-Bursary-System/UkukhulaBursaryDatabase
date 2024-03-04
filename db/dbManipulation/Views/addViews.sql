-- View for returning all institutions
CREATE VIEW [dbo].[vInstituteInfo]
AS
SELECT 
       institute.[InstituteID], 
       institute.[InstituteName], 
       ApplicationStatus.[Status], 
       ApplicationStatus.[ApplicationStatusID], 
       ContactDetails.[Email] 
FROM 
       [dbo].[Institute_Info] institute
INNER JOIN 
       [dbo].[Institute_Application] InstituteApplication
ON 
       institute.[InstituteID] = InstituteApplication.[InstituteID]
INNER JOIN 
       [dbo].[BBDAdmin] BBDAdmin
ON 
       BBDAdmin.[BBDAdminID] = institute.[BBDAdminID]
INNER JOIN 
       [dbo].[User_Details] UserDetails
ON 
       BBDAdmin.[UserID] = UserDetails.[UserID]
INNER JOIN 
       [dbo].[Contact_Details] ContactDetails
ON 
       UserDetails.[ContactDetailsID] = ContactDetails.[ContactDetailsID]
INNER JOIN 
       [dbo].[Application_Status] ApplicationStatus
ON 
       InstituteApplication.[ApplicationStatusID] = ApplicationStatus.[ApplicationStatusID]
GO


-- View for returning all institutions allocated funding
CREATE VIEW [dbo].[vInstitutionFundAllocation] 
AS
SELECT 
       InstituteInfo.[InstituteID],
       InstitutionFundAllocation.[InstitutionFundAllocationID], 
       InstitutionFundAllocation.[AllocatedAmount], 
       InstitutionFundAllocation.[AllocatedRemainingAmount], 
       InstituteInfo.[InstituteName], 
       BursaryFund.[FinacialDate] 
FROM 
       [dbo].[Institution_Fund_Allocation] InstitutionFundAllocation
INNER JOIN 
       [dbo].[Bursary_Fund] BursaryFund
ON 
       InstitutionFundAllocation.[BursaryFundID] = BursaryFund.[BursaryFundID]
INNER JOIN 
       [dbo].[Institute_Info] InstituteInfo
ON 
       InstitutionFundAllocation.[InstituteID] = InstituteInfo.[InstituteID]
GO


-- View for returning all BBD Admins
CREATE VIEW [dbo].[vBBDAdmin]
AS
SELECT
       BBDAdmin.[BBDAdminID],
       UserDetails.[FirstName],
       UserDetails.[LastName],
       UserDetails.[IsActive],
       ContactDetails.[Email],
       ContactDetails.[PhoneNumber],
       Roles.[Role]
FROM
       [dbo].[BBDAdmin] BBDAdmin
INNER JOIN
       [dbo].[User_Details] UserDetails
ON
       BBDAdmin.[UserID] = UserDetails.[UserID]
INNER JOIN
       [dbo].[Contact_Details] ContactDetails
ON
       UserDetails.[ContactDetailsID] = ContactDetails.[ContactDetailsID]
INNER JOIN
       [dbo].[Roles] Roles
ON
       UserDetails.[RoleID] = Roles.[RoleID]
GO

-- Head of department with email
CREATE VIEW [dbo].[vHeadOfDepartment]
AS
SELECT 
       HeadOfDepartment.[InstituteID],
       HeadOfDepartment.[HeadOfDepartmentID],
       [Email],
       InstituteInfo.[InstituteName]
FROM 
       [dbo].[Head_Of_Department] HeadOfDepartment 
INNER JOIN 
       [dbo].[User_Details] UserDetails 
ON 
       HeadOfDepartment.[UserID] = UserDetails.[UserID] 
INNER JOIN 
       [dbo].[Contact_Details] ContactDetails 
ON 
       ContactDetails.[ContactDetailsID] = UserDetails.[ContactDetailsID] 
INNER JOIN
       [dbo].[Institute_Info] InstituteInfo
ON
       HeadOfDepartment.[InstituteID] = InstituteInfo.[InstituteID]


GO

CREATE VIEW [dbo].[GetFullStudentDetails]
AS
 SELECT B.StudentID,C.Email,C.PhoneNumber, U.[FirstName], U.[LastName], dbo.getStudentuniversity (B.HeadofdepartmentId) as University,B.AverageMarks, B.[BursaryAmount], B.[Motivation], A.[Status], H.[HeadOfDepartmentID]
  FROM [Student] AS S
    INNER JOIN [User_Details] AS U
    ON S.[UserID] = U.[UserID]
    INNER JOIN [Bursary_Applicants] AS B
    ON S.[StudentID] = B.[StudentID]
    INNER JOIN [Application_Status] AS A
    ON B.[BursaryApplicationStatusID] = A.[ApplicationStatusID]
    INNER JOIN [dbo].[Head_Of_Department] H
    ON H.[HeadOfDepartmentID] = B.[HeadOfDepartmentID]
	INNER JOIN Contact_Details AS C
	ON C.ContactDetailsID = U.ContactDetailsID
GO
