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




CREATE PROCEDURE [dbo].[addStudent]
(
    @FirstName varchar(50),
    @LastName varchar(50),
    @Email varchar(50),
    @phoneNumber char(13),
    @identiyNumber varchar(50),
    @race varchar(20),
    @role varchar(20),
    @motivation varchar(100),
    @averageMarks int,
    @Head_Of_DepartmentID int,
    @BursaryAmount int
   
)

AS
BEGIN
    DECLARE @raceID int;
    DECLARE @roleID int;
    DECLARE @contactDetailsID int;
    DECLARE @userID int;
    DECLARE @studentID int;
    DECLARE @instituteID int;
 
BEGIN TRY
    BEGIN TRANSACTION
    -- Get the raceID
    SELECT @raceID = RaceID
    FROM Race
    WHERE Race.race = @race;

    -- Get the roleID

    SELECT @roleID = RoleID
    FROM Roles
    WHERE Roles.Role = @role;

    -- Insert into Contact_Details
    INSERT INTO Contact_Details (PhoneNumber, Email)
    VALUES (@phoneNumber, @Email);

    SET @contactDetailsID = SCOPE_IDENTITY();
    
    -- Get the contactDetailsID
    SELECT @contactDetailsID = ContactDetailsID
    FROM Contact_Details
    WHERE Contact_Details.PhoneNumber = @phoneNumber;

    -- Insert into User_Details
    INSERT INTO User_Details (firstname, lastname, RoleID, ContactdetailsID)
    VALUES (@FirstName, @LastName, @roleID, @contactDetailsID);

    SET @userID = SCOPE_IDENTITY();

    -- insert into Student
    INSERT INTO Student (ID_number, RaceID, UserID)
    VALUES (@identiyNumber, @raceID, @userID);

    SET @studentID = SCOPE_IDENTITY();

    --insert into Bursary_Applicants
    INSERT INTO Bursary_Applicants (StudentID, HeadOfDepartmentID, InstituteFundAllocationID,
        BursaryAmount, Motivation, BursaryApplicationStatusID, AverageMarks, BBDAdminID)
    VALUES (@studentID, @Head_Of_DepartmentID, @Head_Of_DepartmentID, @BursaryAmount, @motivation,1, @averageMarks, 1);

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
    END
END CATCH
END
GO
