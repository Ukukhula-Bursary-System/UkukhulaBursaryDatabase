-- Getting Bursary Fund remaining amount.
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
