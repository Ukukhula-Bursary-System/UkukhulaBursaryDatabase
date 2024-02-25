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


-- Finding User Details by email
CREATE FUNCTION [dbo].[udfFindUser_DetailsByEmail](@Email VARCHAR(100))
    RETURNS TABLE
AS
    RETURN SELECT [UserID], [FirstName], [LastName], [IsActive], [PhoneNumber], [Email], [Role]
    FROM [dbo].[User_Details] userDetails
           INNER JOIN [dbo].[Contact_Details] contactDetails
           ON userDetails.[ContactDetailsID] = contactDetails.[ContactDetailsID]
           INNER JOIN [dbo].[Roles] roles
           ON userDetails.RoleID = roles.[RoleID]
           WHERE contactDetails.Email = @Email;
GO


-- Gets Bursary Fund Id for a year
CREATE FUNCTION [dbo].[udfGetBursaryFundId](@year INT)
    RETURNS INT
AS
BEGIN
    DECLARE @BursaryFundID INT = -1
    SELECT 
        @BursaryFundID = [BursaryFundID] 
    FROM 
        [dbo].[Bursary_Fund]
    WHERE
        YEAR([FinacialDate]) = @year
    RETURN @BursaryFundID
END
GO
