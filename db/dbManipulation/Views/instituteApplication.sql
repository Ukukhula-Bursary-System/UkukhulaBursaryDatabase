USE BBD_BursaryDB;

GO

CREATE VIEW Institution_Application AS
SELECT
    InstitutionApplicationID,
    Motivation,
    RejectionComment,
    ApplicationStatusID
FROM
    [BBD_BursaryDB].[dbo].[Institute_Application]

