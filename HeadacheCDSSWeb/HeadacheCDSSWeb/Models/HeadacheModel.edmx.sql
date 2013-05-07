
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/07/2013 20:27:06
-- Generated from EDMX file: D:\2013CDSS\HeadacheCDSS\HeadacheCDSSWeb\HeadacheCDSSWeb\Models\HeadacheModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HeadacheDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_DoctorAccountPatBasicInfor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PatBasicInforSet] DROP CONSTRAINT [FK_DoctorAccountPatBasicInfor];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforVisitRecord]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VisitRecordSet] DROP CONSTRAINT [FK_PatBasicInforVisitRecord];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordCDSSDiagnosis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CDSSDiagnosisSet] DROP CONSTRAINT [FK_VisitRecordCDSSDiagnosis];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordDiagnosisResult]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DiagnosisResultSet] DROP CONSTRAINT [FK_VisitRecordDiagnosisResult];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordHeadachaOverView]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VisitRecordSet] DROP CONSTRAINT [FK_VisitRecordHeadachaOverView];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewHeadachePlace]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadachePlaceSet] DROP CONSTRAINT [FK_HeadachaOverViewHeadachePlace];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewHeadacheAccompany]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadacheAccompanySet] DROP CONSTRAINT [FK_HeadachaOverViewHeadacheAccompany];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewHeadacheProdrome]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadacheProdromeSet] DROP CONSTRAINT [FK_HeadachaOverViewHeadacheProdrome];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordMedicalHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VisitRecordSet] DROP CONSTRAINT [FK_VisitRecordMedicalHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_MedicalHistoryPreviousDrug]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PreviousDrugSet] DROP CONSTRAINT [FK_MedicalHistoryPreviousDrug];
GO
IF OBJECT_ID(N'[dbo].[FK_MedicalHistoryPreviousExam]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PreviousExamSet] DROP CONSTRAINT [FK_MedicalHistoryPreviousExam];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforRelateInfor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PatBasicInforSet] DROP CONSTRAINT [FK_PatBasicInforRelateInfor];
GO
IF OBJECT_ID(N'[dbo].[FK_RelateInforHeadacheFamilyMember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadacheFamilyMemberSet] DROP CONSTRAINT [FK_RelateInforHeadacheFamilyMember];
GO
IF OBJECT_ID(N'[dbo].[FK_RelateInforOtherFamilyDisease]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OtherFamilyDiseaseSet] DROP CONSTRAINT [FK_RelateInforOtherFamilyDisease];
GO
IF OBJECT_ID(N'[dbo].[FK_LifestyleSpecialDiet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialDietSet] DROP CONSTRAINT [FK_LifestyleSpecialDiet];
GO
IF OBJECT_ID(N'[dbo].[FK_RelateInforLifestyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RelateInforSet] DROP CONSTRAINT [FK_RelateInforLifestyle];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordPrescription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrescriptionSet] DROP CONSTRAINT [FK_VisitRecordPrescription];
GO
IF OBJECT_ID(N'[dbo].[FK_PrescriptionMecicationAdvice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MecicationAdviceSet] DROP CONSTRAINT [FK_PrescriptionMecicationAdvice];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[DoctorAccountSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DoctorAccountSet];
GO
IF OBJECT_ID(N'[dbo].[PatBasicInforSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PatBasicInforSet];
GO
IF OBJECT_ID(N'[dbo].[VisitRecordSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VisitRecordSet];
GO
IF OBJECT_ID(N'[dbo].[CDSSDiagnosisSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CDSSDiagnosisSet];
GO
IF OBJECT_ID(N'[dbo].[DiagnosisResultSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DiagnosisResultSet];
GO
IF OBJECT_ID(N'[dbo].[HeadachaOverViewSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HeadachaOverViewSet];
GO
IF OBJECT_ID(N'[dbo].[PrescriptionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrescriptionSet];
GO
IF OBJECT_ID(N'[dbo].[MedicalHistorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MedicalHistorySet];
GO
IF OBJECT_ID(N'[dbo].[LifestyleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LifestyleSet];
GO
IF OBJECT_ID(N'[dbo].[HeadachePlaceSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HeadachePlaceSet];
GO
IF OBJECT_ID(N'[dbo].[HeadacheAccompanySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HeadacheAccompanySet];
GO
IF OBJECT_ID(N'[dbo].[HeadacheProdromeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HeadacheProdromeSet];
GO
IF OBJECT_ID(N'[dbo].[PreviousDrugSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PreviousDrugSet];
GO
IF OBJECT_ID(N'[dbo].[PreviousExamSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PreviousExamSet];
GO
IF OBJECT_ID(N'[dbo].[RelateInforSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RelateInforSet];
GO
IF OBJECT_ID(N'[dbo].[HeadacheFamilyMemberSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HeadacheFamilyMemberSet];
GO
IF OBJECT_ID(N'[dbo].[OtherFamilyDiseaseSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OtherFamilyDiseaseSet];
GO
IF OBJECT_ID(N'[dbo].[SpecialDietSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialDietSet];
GO
IF OBJECT_ID(N'[dbo].[MecicationAdviceSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MecicationAdviceSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DoctorAccountSet'
CREATE TABLE [dbo].[DoctorAccountSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [PassWord] nvarchar(max)  NOT NULL,
    [Hospital] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PatBasicInforSet'
CREATE TABLE [dbo].[PatBasicInforSet] (
    [Id] nvarchar(255)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Sex] nvarchar(max)  NOT NULL,
    [Age] nvarchar(max)  NOT NULL,
    [Education] nvarchar(max)  NULL,
    [Job] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Identity] nvarchar(max)  NULL,
    [ChiefDoctor] nvarchar(max)  NULL,
    [DoctorAccountId] int  NOT NULL,
    [RelateInfor_Id] int  NOT NULL
);
GO

-- Creating table 'VisitRecordSet'
CREATE TABLE [dbo].[VisitRecordSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OutpatientID] nvarchar(max)  NOT NULL,
    [ChiefComplaint] nvarchar(max)  NOT NULL,
    [VisitDate] datetime  NOT NULL,
    [PatBasicInforId] nvarchar(255)  NOT NULL,
    [HeadachaOverView_Id] int  NOT NULL,
    [MedicalHistory_Id] int  NOT NULL
);
GO

-- Creating table 'CDSSDiagnosisSet'
CREATE TABLE [dbo].[CDSSDiagnosisSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [VisitRecordId] int  NOT NULL,
    [DiagnosisContent_FirstDianosis] nvarchar(max)  NOT NULL,
    [DiagnosisContent_SecondDiagnosis] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DiagnosisResultSet'
CREATE TABLE [dbo].[DiagnosisResultSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [VisitRecordId] int  NOT NULL,
    [DiagnosisContent_FirstDianosis] nvarchar(max)  NOT NULL,
    [DiagnosisContent_SecondDiagnosis] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'HeadachaOverViewSet'
CREATE TABLE [dbo].[HeadachaOverViewSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HeadacheType] nvarchar(max)  NOT NULL,
    [HeadacheDegree] nvarchar(max)  NOT NULL,
    [HeadcheTime] nvarchar(max)  NOT NULL,
    [HeacheTimeUnit] nvarchar(max)  NOT NULL,
    [FrequencyPerDay] nvarchar(max)  NOT NULL,
    [FrequencyPerMonth] nvarchar(max)  NOT NULL,
    [OnsetFixedDay] nvarchar(max)  NOT NULL,
    [OnsetFixedYear] nvarchar(max)  NOT NULL,
    [OnsetDate] nvarchar(max)  NOT NULL,
    [OnsetAmount] nvarchar(max)  NOT NULL,
    [DailyAggravation] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PrescriptionSet'
CREATE TABLE [dbo].[PrescriptionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DotorAdvice] nvarchar(max)  NOT NULL,
    [VisitRecord_Id] int  NOT NULL
);
GO

-- Creating table 'MedicalHistorySet'
CREATE TABLE [dbo].[MedicalHistorySet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'LifestyleSet'
CREATE TABLE [dbo].[LifestyleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SmokeState] nvarchar(max)  NOT NULL,
    [SmokeStartAge] nvarchar(max)  NOT NULL,
    [SmokeQuitYear] nvarchar(max)  NOT NULL,
    [SmokeYear] nvarchar(max)  NOT NULL,
    [CigarettesPerDay] nvarchar(max)  NOT NULL,
    [DrinkState] nvarchar(max)  NOT NULL,
    [DrinkStartAge] nvarchar(max)  NOT NULL,
    [DrinkYear] nvarchar(max)  NOT NULL,
    [DrinkQuitYear] nvarchar(max)  NOT NULL,
    [DrinkPerDay] nvarchar(max)  NOT NULL,
    [DrinkCategory] nvarchar(max)  NOT NULL,
    [TeaPerDay] nvarchar(max)  NOT NULL,
    [CoffePerDay] nvarchar(max)  NOT NULL,
    [ExercisePerWeek] nvarchar(max)  NOT NULL,
    [ExerciseTime] nvarchar(max)  NOT NULL,
    [ExerciseDescription] nvarchar(max)  NOT NULL,
    [WeightChange] nvarchar(max)  NOT NULL,
    [WeightChangeNote] nvarchar(max)  NOT NULL,
    [OtherLifeStyleFactor] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'HeadachePlaceSet'
CREATE TABLE [dbo].[HeadachePlaceSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Position] nvarchar(max)  NOT NULL,
    [SpecificPlace] nvarchar(max)  NOT NULL,
    [HeadachaOverViewId] int  NOT NULL
);
GO

-- Creating table 'HeadacheAccompanySet'
CREATE TABLE [dbo].[HeadacheAccompanySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Symptom] nvarchar(max)  NOT NULL,
    [HeadachaOverViewId] int  NOT NULL
);
GO

-- Creating table 'HeadacheProdromeSet'
CREATE TABLE [dbo].[HeadacheProdromeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Prodrome] nvarchar(max)  NOT NULL,
    [HeadachaOverViewId] int  NOT NULL
);
GO

-- Creating table 'PreviousDrugSet'
CREATE TABLE [dbo].[PreviousDrugSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MedicalHistoryId] int  NOT NULL,
    [DrugCategory] nvarchar(max)  NOT NULL,
    [DrugName] nvarchar(max)  NOT NULL,
    [DayAmoutnPerM] nvarchar(max)  NOT NULL,
    [MonthTotalAmount] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PreviousExamSet'
CREATE TABLE [dbo].[PreviousExamSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MedicalHistoryId] int  NOT NULL,
    [ExamName] nvarchar(max)  NOT NULL,
    [Result] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RelateInforSet'
CREATE TABLE [dbo].[RelateInforSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SimilarFamily] nvarchar(max)  NOT NULL,
    [Lifestyle_Id] int  NOT NULL
);
GO

-- Creating table 'HeadacheFamilyMemberSet'
CREATE TABLE [dbo].[HeadacheFamilyMemberSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Person] nvarchar(max)  NOT NULL,
    [RelateInforId] int  NOT NULL
);
GO

-- Creating table 'OtherFamilyDiseaseSet'
CREATE TABLE [dbo].[OtherFamilyDiseaseSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RelateInforId] int  NOT NULL
);
GO

-- Creating table 'SpecialDietSet'
CREATE TABLE [dbo].[SpecialDietSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Kind] nvarchar(max)  NOT NULL,
    [LifestyleId] int  NOT NULL
);
GO

-- Creating table 'MecicationAdviceSet'
CREATE TABLE [dbo].[MecicationAdviceSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PrescriptionId] int  NOT NULL,
    [DrugApplication] nvarchar(max)  NOT NULL,
    [DrugCategory] nvarchar(max)  NOT NULL,
    [DrugName] nvarchar(max)  NOT NULL,
    [Therapy] nvarchar(max)  NOT NULL,
    [DrugDose] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'DoctorAccountSet'
ALTER TABLE [dbo].[DoctorAccountSet]
ADD CONSTRAINT [PK_DoctorAccountSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PatBasicInforSet'
ALTER TABLE [dbo].[PatBasicInforSet]
ADD CONSTRAINT [PK_PatBasicInforSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VisitRecordSet'
ALTER TABLE [dbo].[VisitRecordSet]
ADD CONSTRAINT [PK_VisitRecordSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CDSSDiagnosisSet'
ALTER TABLE [dbo].[CDSSDiagnosisSet]
ADD CONSTRAINT [PK_CDSSDiagnosisSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DiagnosisResultSet'
ALTER TABLE [dbo].[DiagnosisResultSet]
ADD CONSTRAINT [PK_DiagnosisResultSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HeadachaOverViewSet'
ALTER TABLE [dbo].[HeadachaOverViewSet]
ADD CONSTRAINT [PK_HeadachaOverViewSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrescriptionSet'
ALTER TABLE [dbo].[PrescriptionSet]
ADD CONSTRAINT [PK_PrescriptionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MedicalHistorySet'
ALTER TABLE [dbo].[MedicalHistorySet]
ADD CONSTRAINT [PK_MedicalHistorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LifestyleSet'
ALTER TABLE [dbo].[LifestyleSet]
ADD CONSTRAINT [PK_LifestyleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HeadachePlaceSet'
ALTER TABLE [dbo].[HeadachePlaceSet]
ADD CONSTRAINT [PK_HeadachePlaceSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HeadacheAccompanySet'
ALTER TABLE [dbo].[HeadacheAccompanySet]
ADD CONSTRAINT [PK_HeadacheAccompanySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HeadacheProdromeSet'
ALTER TABLE [dbo].[HeadacheProdromeSet]
ADD CONSTRAINT [PK_HeadacheProdromeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PreviousDrugSet'
ALTER TABLE [dbo].[PreviousDrugSet]
ADD CONSTRAINT [PK_PreviousDrugSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PreviousExamSet'
ALTER TABLE [dbo].[PreviousExamSet]
ADD CONSTRAINT [PK_PreviousExamSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RelateInforSet'
ALTER TABLE [dbo].[RelateInforSet]
ADD CONSTRAINT [PK_RelateInforSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HeadacheFamilyMemberSet'
ALTER TABLE [dbo].[HeadacheFamilyMemberSet]
ADD CONSTRAINT [PK_HeadacheFamilyMemberSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OtherFamilyDiseaseSet'
ALTER TABLE [dbo].[OtherFamilyDiseaseSet]
ADD CONSTRAINT [PK_OtherFamilyDiseaseSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SpecialDietSet'
ALTER TABLE [dbo].[SpecialDietSet]
ADD CONSTRAINT [PK_SpecialDietSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MecicationAdviceSet'
ALTER TABLE [dbo].[MecicationAdviceSet]
ADD CONSTRAINT [PK_MecicationAdviceSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DoctorAccountId] in table 'PatBasicInforSet'
ALTER TABLE [dbo].[PatBasicInforSet]
ADD CONSTRAINT [FK_DoctorAccountPatBasicInfor]
    FOREIGN KEY ([DoctorAccountId])
    REFERENCES [dbo].[DoctorAccountSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorAccountPatBasicInfor'
CREATE INDEX [IX_FK_DoctorAccountPatBasicInfor]
ON [dbo].[PatBasicInforSet]
    ([DoctorAccountId]);
GO

-- Creating foreign key on [VisitRecordId] in table 'CDSSDiagnosisSet'
ALTER TABLE [dbo].[CDSSDiagnosisSet]
ADD CONSTRAINT [FK_VisitRecordCDSSDiagnosis]
    FOREIGN KEY ([VisitRecordId])
    REFERENCES [dbo].[VisitRecordSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordCDSSDiagnosis'
CREATE INDEX [IX_FK_VisitRecordCDSSDiagnosis]
ON [dbo].[CDSSDiagnosisSet]
    ([VisitRecordId]);
GO

-- Creating foreign key on [VisitRecordId] in table 'DiagnosisResultSet'
ALTER TABLE [dbo].[DiagnosisResultSet]
ADD CONSTRAINT [FK_VisitRecordDiagnosisResult]
    FOREIGN KEY ([VisitRecordId])
    REFERENCES [dbo].[VisitRecordSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordDiagnosisResult'
CREATE INDEX [IX_FK_VisitRecordDiagnosisResult]
ON [dbo].[DiagnosisResultSet]
    ([VisitRecordId]);
GO

-- Creating foreign key on [HeadachaOverView_Id] in table 'VisitRecordSet'
ALTER TABLE [dbo].[VisitRecordSet]
ADD CONSTRAINT [FK_VisitRecordHeadachaOverView]
    FOREIGN KEY ([HeadachaOverView_Id])
    REFERENCES [dbo].[HeadachaOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordHeadachaOverView'
CREATE INDEX [IX_FK_VisitRecordHeadachaOverView]
ON [dbo].[VisitRecordSet]
    ([HeadachaOverView_Id]);
GO

-- Creating foreign key on [HeadachaOverViewId] in table 'HeadachePlaceSet'
ALTER TABLE [dbo].[HeadachePlaceSet]
ADD CONSTRAINT [FK_HeadachaOverViewHeadachePlace]
    FOREIGN KEY ([HeadachaOverViewId])
    REFERENCES [dbo].[HeadachaOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HeadachaOverViewHeadachePlace'
CREATE INDEX [IX_FK_HeadachaOverViewHeadachePlace]
ON [dbo].[HeadachePlaceSet]
    ([HeadachaOverViewId]);
GO

-- Creating foreign key on [HeadachaOverViewId] in table 'HeadacheAccompanySet'
ALTER TABLE [dbo].[HeadacheAccompanySet]
ADD CONSTRAINT [FK_HeadachaOverViewHeadacheAccompany]
    FOREIGN KEY ([HeadachaOverViewId])
    REFERENCES [dbo].[HeadachaOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HeadachaOverViewHeadacheAccompany'
CREATE INDEX [IX_FK_HeadachaOverViewHeadacheAccompany]
ON [dbo].[HeadacheAccompanySet]
    ([HeadachaOverViewId]);
GO

-- Creating foreign key on [HeadachaOverViewId] in table 'HeadacheProdromeSet'
ALTER TABLE [dbo].[HeadacheProdromeSet]
ADD CONSTRAINT [FK_HeadachaOverViewHeadacheProdrome]
    FOREIGN KEY ([HeadachaOverViewId])
    REFERENCES [dbo].[HeadachaOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HeadachaOverViewHeadacheProdrome'
CREATE INDEX [IX_FK_HeadachaOverViewHeadacheProdrome]
ON [dbo].[HeadacheProdromeSet]
    ([HeadachaOverViewId]);
GO

-- Creating foreign key on [MedicalHistory_Id] in table 'VisitRecordSet'
ALTER TABLE [dbo].[VisitRecordSet]
ADD CONSTRAINT [FK_VisitRecordMedicalHistory]
    FOREIGN KEY ([MedicalHistory_Id])
    REFERENCES [dbo].[MedicalHistorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordMedicalHistory'
CREATE INDEX [IX_FK_VisitRecordMedicalHistory]
ON [dbo].[VisitRecordSet]
    ([MedicalHistory_Id]);
GO

-- Creating foreign key on [MedicalHistoryId] in table 'PreviousDrugSet'
ALTER TABLE [dbo].[PreviousDrugSet]
ADD CONSTRAINT [FK_MedicalHistoryPreviousDrug]
    FOREIGN KEY ([MedicalHistoryId])
    REFERENCES [dbo].[MedicalHistorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicalHistoryPreviousDrug'
CREATE INDEX [IX_FK_MedicalHistoryPreviousDrug]
ON [dbo].[PreviousDrugSet]
    ([MedicalHistoryId]);
GO

-- Creating foreign key on [MedicalHistoryId] in table 'PreviousExamSet'
ALTER TABLE [dbo].[PreviousExamSet]
ADD CONSTRAINT [FK_MedicalHistoryPreviousExam]
    FOREIGN KEY ([MedicalHistoryId])
    REFERENCES [dbo].[MedicalHistorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicalHistoryPreviousExam'
CREATE INDEX [IX_FK_MedicalHistoryPreviousExam]
ON [dbo].[PreviousExamSet]
    ([MedicalHistoryId]);
GO

-- Creating foreign key on [RelateInforId] in table 'HeadacheFamilyMemberSet'
ALTER TABLE [dbo].[HeadacheFamilyMemberSet]
ADD CONSTRAINT [FK_RelateInforHeadacheFamilyMember]
    FOREIGN KEY ([RelateInforId])
    REFERENCES [dbo].[RelateInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RelateInforHeadacheFamilyMember'
CREATE INDEX [IX_FK_RelateInforHeadacheFamilyMember]
ON [dbo].[HeadacheFamilyMemberSet]
    ([RelateInforId]);
GO

-- Creating foreign key on [RelateInforId] in table 'OtherFamilyDiseaseSet'
ALTER TABLE [dbo].[OtherFamilyDiseaseSet]
ADD CONSTRAINT [FK_RelateInforOtherFamilyDisease]
    FOREIGN KEY ([RelateInforId])
    REFERENCES [dbo].[RelateInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RelateInforOtherFamilyDisease'
CREATE INDEX [IX_FK_RelateInforOtherFamilyDisease]
ON [dbo].[OtherFamilyDiseaseSet]
    ([RelateInforId]);
GO

-- Creating foreign key on [LifestyleId] in table 'SpecialDietSet'
ALTER TABLE [dbo].[SpecialDietSet]
ADD CONSTRAINT [FK_LifestyleSpecialDiet]
    FOREIGN KEY ([LifestyleId])
    REFERENCES [dbo].[LifestyleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LifestyleSpecialDiet'
CREATE INDEX [IX_FK_LifestyleSpecialDiet]
ON [dbo].[SpecialDietSet]
    ([LifestyleId]);
GO

-- Creating foreign key on [Lifestyle_Id] in table 'RelateInforSet'
ALTER TABLE [dbo].[RelateInforSet]
ADD CONSTRAINT [FK_RelateInforLifestyle]
    FOREIGN KEY ([Lifestyle_Id])
    REFERENCES [dbo].[LifestyleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RelateInforLifestyle'
CREATE INDEX [IX_FK_RelateInforLifestyle]
ON [dbo].[RelateInforSet]
    ([Lifestyle_Id]);
GO

-- Creating foreign key on [VisitRecord_Id] in table 'PrescriptionSet'
ALTER TABLE [dbo].[PrescriptionSet]
ADD CONSTRAINT [FK_VisitRecordPrescription]
    FOREIGN KEY ([VisitRecord_Id])
    REFERENCES [dbo].[VisitRecordSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordPrescription'
CREATE INDEX [IX_FK_VisitRecordPrescription]
ON [dbo].[PrescriptionSet]
    ([VisitRecord_Id]);
GO

-- Creating foreign key on [PrescriptionId] in table 'MecicationAdviceSet'
ALTER TABLE [dbo].[MecicationAdviceSet]
ADD CONSTRAINT [FK_PrescriptionMecicationAdvice]
    FOREIGN KEY ([PrescriptionId])
    REFERENCES [dbo].[PrescriptionSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PrescriptionMecicationAdvice'
CREATE INDEX [IX_FK_PrescriptionMecicationAdvice]
ON [dbo].[MecicationAdviceSet]
    ([PrescriptionId]);
GO

-- Creating foreign key on [PatBasicInforId] in table 'VisitRecordSet'
ALTER TABLE [dbo].[VisitRecordSet]
ADD CONSTRAINT [FK_PatBasicInforVisitRecord]
    FOREIGN KEY ([PatBasicInforId])
    REFERENCES [dbo].[PatBasicInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforVisitRecord'
CREATE INDEX [IX_FK_PatBasicInforVisitRecord]
ON [dbo].[VisitRecordSet]
    ([PatBasicInforId]);
GO

-- Creating foreign key on [RelateInfor_Id] in table 'PatBasicInforSet'
ALTER TABLE [dbo].[PatBasicInforSet]
ADD CONSTRAINT [FK_PatBasicInforRelateInfor]
    FOREIGN KEY ([RelateInfor_Id])
    REFERENCES [dbo].[RelateInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforRelateInfor'
CREATE INDEX [IX_FK_PatBasicInforRelateInfor]
ON [dbo].[PatBasicInforSet]
    ([RelateInfor_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------