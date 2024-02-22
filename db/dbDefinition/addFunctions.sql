-- Getting Bursary Fund remaining amount.
CREATE FUNCTION [dbo].[udfGetBursary_FundRemaingAmount](@BursayFundID INT) 
    RETURNS MONEY
AS
BEGIN
    DECLARE @RemainingAmount MONEY = 0
    SELECT 
        @RemainingAmount = ([udfGetBursary_FundRemaingAmount])
    FROM 
        [dbo].[Bursary_Fund]
    WHERE
        [dbo].[Bursary_Fund] = @BursaryFundID
    RETURN @RemainingAmount
END
GO
