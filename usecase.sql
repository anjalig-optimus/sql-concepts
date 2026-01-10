create database usecase;
use usecase
CREATE TABLE Users(
    UserID INT PRIMARY KEY ,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    Role VARCHAR(50),
);
select * from users;
CREATE TABLE HiringRequisitions (
    RequisitionID INT PRIMARY KEY ,
    JobTitle VARCHAR(50),
    Department VARCHAR(50),
    Location VARCHAR(50),
    EmploymentType Varchar(50),
    SalaryRange VARCHAR(50),
    Status Varchar(50),
    HiringManagerID INT,
	FOREIGN KEY (HiringManagerID) REFERENCES Users(UserID)
);

CREATE TABLE RequisitionApprovals (
    ApprovalID INT PRIMARY KEY ,
    ApprovalStatus Varchar(50),
    RequisitionID INT,
    FOREIGN KEY (RequisitionID) REFERENCES HiringRequisitions(RequisitionID),
    ApproverID INT,
    FOREIGN KEY (ApproverID) REFERENCES Users(UserID)
);

CREATE TABLE JobPostings (
    PostingID INT PRIMARY KEY ,
    RequisitionID INT,
    PostedBy INT,
    FOREIGN KEY (RequisitionID) REFERENCES HiringRequisitions(RequisitionID),
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID)
);

CREATE TABLE Referrals (
    ReferralID INT PRIMARY KEY ,
    EmployeeID INT,
    CandidateName VARCHAR(50),
    CandidateEmail VARCHAR(50),
    JobID INT,
    Status Varchar(50),
    Resume Varchar(50),
    FOREIGN KEY (EmployeeID) REFERENCES Users(UserID),
    FOREIGN KEY (JobID) REFERENCES HiringRequisitions(RequisitionID)
);

CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY ,
    UserID INT,
    Message TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
