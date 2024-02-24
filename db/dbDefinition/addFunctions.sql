-- Getting Bursary Fund remaining amount.
USE BBD_BursaryDB3;

GO


CREATE FUNCTION [dbo].[udfGetBursary_FundRemaingAmount](@BursaryFundID INT) 
    RETURNS MONEY
AS
BEGIN
    DECLARE @RemainingAmount MONEY = 0
    SELECT 
        @RemainingAmount = ([FundRemainingAmount])
    FROM 
        [dbo].[Bursary_Fund]
    WHERE
        [BursaryFundID] = @BursaryFundID
    RETURN @RemainingAmount
END
GO


-- Getting Institution_Fund_Allocation remaining amount.
CREATE FUNCTION [dbo].[udfGetInstitution_Fund_AllocationRemainingAmount](@InstitutionFundAllocationID INT)
    RETURNS MONEY
AS
BEGIN
    DECLARE @RemainingAmount MONEY = 0
    SELECT
        @RemainingAmount = ([AllocatedRemainingAmount])
    FROM
        [dbo].[Institution_Fund_Allocation]
    WHERE
        [InstitutionFundAllocationID] = @InstitutionFundAllocationID
    RETURN @RemainingAmount
END
GO


CREATE PROCEDURE dbo.getStudentuniversity
  @HeadOfDepartmentID INT
AS
BEGIN
  SELECT 
    Institute_Info.InstituteName
  FROM 
    [BBD_BursaryDB].[dbo].[Institute_Info] AS Institute_Info
  JOIN 
    [BBD_BursaryDB].[dbo].[Head_Of_Department] AS Head_Of_Department
  ON 
    Institute_Info.InstituteID = Head_Of_Department.InstituteID
  WHERE 
    Head_Of_Department.HeadOfDepartmentID = @HeadOfDepartmentID;
END;

GO

CREATE FUNCTION dbo.getStudentuniversity  (@HeadOfDepartmentID INT)
  
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @InstituteName VARCHAR(100)
    SELECT 
        @InstituteName = Institute_Info.InstituteName
    FROM 
        [BBD_BursaryDB].[dbo].[Institute_Info] AS Institute_Info
    JOIN 
        [BBD_BursaryDB].[dbo].[Head_Of_Department] AS Head_Of_Department
    ON 
        Institute_Info.InstituteID = Head_Of_Department.InstituteID
    WHERE 
        Head_Of_Department.HeadOfDepartmentID = @HeadOfDepartmentID;
    RETURN @InstituteName
END;
GO



