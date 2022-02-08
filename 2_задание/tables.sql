CREATE TABLE [dbo].[DEPARTMENT]
(
    [ID]   INT           NOT NULL PRIMARY KEY CLUSTERED, -- IDENTITY is not used to insert values manually
    [NAME] NVARCHAR(100) NOT NULL
);

CREATE TABLE [dbo].[EMPLOYEE]
(
    [ID]            INT            NOT NULL PRIMARY KEY CLUSTERED, -- IDENTITY is not used to insert values manually
    [DEPARTMENT_ID] INT            NOT NULL,
    [CHIEF_ID]      INT            NULL,
    [NAME]          NVARCHAR(100)  NOT NULL,
    [SALARY]        DECIMAL(18, 2) NOT NULL,
    CONSTRAINT [FK_DEPARTMENT_ID] FOREIGN KEY ([DEPARTMENT_ID]) REFERENCES [dbo].[DEPARTMENT],
    CONSTRAINT [FK_CHIEF_ID] FOREIGN KEY ([CHIEF_ID]) REFERENCES [dbo].[EMPLOYEE]
);

INSERT INTO [dbo].DEPARTMENT([ID], [NAME])
VALUES (1, N'Production'),
       (2, N'Purchasing'),
       (3, N'Human Resource Management'),
       (4, N'Accounting and Finance');

INSERT INTO [dbo].EMPLOYEE([ID], [DEPARTMENT_ID], [CHIEF_ID], [NAME], [SALARY])
VALUES (1, 1, NULL, N'John', 1000000),
       (2, 4, NULL, N'Don', 120000),
       (3, 3, 2, N'Sam', 110000),
       (4, 2, 1, N'Robert', 25000),
       (5, 3, 8, N'James', 40000),
       (6, 2, 1, N'Patricia', 88000),
       (7, 3, 6, N'Mary', 93500),
       (8, 1, 2, N'Jennifer', 130000),
       (9, 4, 7, N'Georgia', 440000),
       (10, 2, 7, N'Oscar', 61000);