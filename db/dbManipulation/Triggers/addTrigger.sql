-- Calculate Bursary Fund Remaining amount when a university is allocated money
CREATE TRIGGER triggerInstituteFundAllocationBursaryFund
ON
    [dbo].[Institution_Fund_Allocation]
FOR
    INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE
        [dbo].[Bursary_Fund]
    SET
        [FundRemainingAmount] = [FundAmount] - [dbo].[udfCalculateInstituteFundAllocationSumForYear](YEAR(GETDATE()))
    WHERE
        YEAR([FinacialDate]) = YEAR(GETDATE())
END
GO

-- Calculate Institute Remaining amount //needs adjustments
CREATE TRIGGER triggerBursaryApplicantsInstitutionFundAllocation
ON
    [dbo].[Bursary_Applicants]
FOR
    UPDATE
AS
BEGIN
    DECLARE @TotalSumOfApprovedBursaryApplicants MONEY = 0;
    SELECT
        @TotalSumOfApprovedBursaryApplicants = @TotalSumOfApprovedBursaryApplicants + [BursaryAmount]
    FROM
        [dbo].[Bursary_Applicants] BursaryApplicants
    INNER JOIN
        [dbo].[Institution_Fund_Allocation] InstitutionFundAllocation
    ON
        BursaryApplicants.[InstituteFundAllocationID] = InstitutionFundAllocation.[InstitutionFundAllocationID]
    WHERE
        InstitutionFundAllocation.[BursaryFundID] = [dbo].[udfGetBursaryFundId](YEAR(GETDATE()))
    SELECT @TotalSumOfApprovedBursaryApplicants
END
