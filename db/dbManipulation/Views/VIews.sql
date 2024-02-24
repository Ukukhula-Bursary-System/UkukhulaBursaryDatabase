

CREATE VIEW allstudentApplications AS

    SELECT S.ID_Number, U.[FirstName], U.[LastName], B.[BursaryAmount], B.[Motivation], A.[Status]
    FROM [Student] AS S
        INNER JOIN [User_Details] AS U
        ON S.[UserID] = U.[UserID]
        INNER JOIN [Bursary_Applicants] AS B
        ON S.[StudentID] = B.[StudentID]
        INNER JOIN [Application_Status] AS A
        ON B.[BursaryApplicationStatusID] = A.[ApplicationStatusID];

