


--add new student procedure


CREATE PROCEDURE addStudent
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
    INSERT INTO Bursary_Applicants (StudentID, HeadOfDepartmentID, InstituteFundAllocationID, BursaryAmount, Motivation, BursaryApplicationStatusID, AverageMarks, BBDAdminID)
    VALUES (@studentID, @Head_Of_DepartmentID, @Head_Of_DepartmentID, @BursaryAmount, @motivation,1, @averageMarks, 1);

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
    END
END CATCH
END



