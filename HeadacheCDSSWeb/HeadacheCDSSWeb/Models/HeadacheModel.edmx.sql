
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/03/2013 10:02:55
-- Generated from EDMX file: D:\2013HeadacheCDSS\Code\HeadacheCDSS\HeadacheCDSSWeb\HeadacheCDSSWeb\Models\HeadacheModel.edmx
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
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewHeadachePlace]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadachePlaceSet] DROP CONSTRAINT [FK_HeadachaOverViewHeadachePlace];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewHeadacheAccompany]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadacheAccompanySet] DROP CONSTRAINT [FK_HeadachaOverViewHeadacheAccompany];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewHeadacheProdrome]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadacheProdromeSet] DROP CONSTRAINT [FK_HeadachaOverViewHeadacheProdrome];
GO
IF OBJECT_ID(N'[dbo].[FK_LifestyleSpecialDiet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialDietSet] DROP CONSTRAINT [FK_LifestyleSpecialDiet];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforVisitRecord]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VisitRecordSet] DROP CONSTRAINT [FK_PatBasicInforVisitRecord];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewMitigatingFactors]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MitigatingFactorsSet] DROP CONSTRAINT [FK_HeadachaOverViewMitigatingFactors];
GO
IF OBJECT_ID(N'[dbo].[FK_HeadachaOverViewPrecipitatingFactor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrecipitatingFactorSet] DROP CONSTRAINT [FK_HeadachaOverViewPrecipitatingFactor];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordMecicationAdvice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MedicationAdviceSet] DROP CONSTRAINT [FK_VisitRecordMecicationAdvice];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforPreviousDrug]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PreviousDrugSet] DROP CONSTRAINT [FK_PatBasicInforPreviousDrug];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforPreviousExam]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PreviousExamSet] DROP CONSTRAINT [FK_PatBasicInforPreviousExam];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforHeadacheFamilyMember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HeadacheFamilyMemberSet] DROP CONSTRAINT [FK_PatBasicInforHeadacheFamilyMember];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforOtherFamilyDisease]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OtherFamilyDiseaseSet] DROP CONSTRAINT [FK_PatBasicInforOtherFamilyDisease];
GO
IF OBJECT_ID(N'[dbo].[FK_PatBasicInforLifestyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PatBasicInforSet] DROP CONSTRAINT [FK_PatBasicInforLifestyle];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordSecondaryHeadacheSymptom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SecondaryHeadacheSymptomSet] DROP CONSTRAINT [FK_VisitRecordSecondaryHeadacheSymptom];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitRecordPrimaryHeadachaOverView]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrimaryHeadacheOverViewSet] DROP CONSTRAINT [FK_VisitRecordPrimaryHeadachaOverView];
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
IF OBJECT_ID(N'[dbo].[PrimaryHeadacheOverViewSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrimaryHeadacheOverViewSet];
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
IF OBJECT_ID(N'[dbo].[HeadacheFamilyMemberSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HeadacheFamilyMemberSet];
GO
IF OBJECT_ID(N'[dbo].[OtherFamilyDiseaseSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OtherFamilyDiseaseSet];
GO
IF OBJECT_ID(N'[dbo].[SpecialDietSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialDietSet];
GO
IF OBJECT_ID(N'[dbo].[MedicationAdviceSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MedicationAdviceSet];
GO
IF OBJECT_ID(N'[dbo].[PrecipitatingFactorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrecipitatingFactorSet];
GO
IF OBJECT_ID(N'[dbo].[MitigatingFactorsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MitigatingFactorsSet];
GO
IF OBJECT_ID(N'[dbo].[SecondaryHeadacheSymptomSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SecondaryHeadacheSymptomSet];
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
    [Address] nvarchar(max)  NULL,
    [Identity] nvarchar(max)  NULL,
    [ChiefDoctor] nvarchar(max)  NULL,
    [DoctorAccountId] int  NOT NULL,
    [SimilarFamily] bit  NULL,
    [Lifestyle_Id] int  NOT NULL
);
GO

-- Creating table 'VisitRecordSet'
CREATE TABLE [dbo].[VisitRecordSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OutpatientID] nvarchar(max)  NULL,
    [ChiefComplaint] nvarchar(max)  NOT NULL,
    [VisitDate] datetime  NOT NULL,
    [PatBasicInforId] nvarchar(255)  NOT NULL,
    [CDSSDiagnosis1] nvarchar(max)  NOT NULL,
    [CDSSDiagnosis2] nvarchar(max)  NULL,
    [CDSSDiagnosis3] nvarchar(max)  NULL,
    [DiagnosisResult1] nvarchar(max)  NOT NULL,
    [DiagnosisResult2] nvarchar(max)  NULL,
    [DiagnosisResult3] nvarchar(max)  NULL,
    [Prescription] nvarchar(max)  NULL
);
GO

-- Creating table 'PrimaryHeadacheOverViewSet'
CREATE TABLE [dbo].[PrimaryHeadacheOverViewSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HeadacheType] nvarchar(max)  NOT NULL,
    [HeadacheDegree] nvarchar(max)  NOT NULL,
    [HeadcheTime] nvarchar(max)  NOT NULL,
    [HeacheTimeUnit] nvarchar(max)  NOT NULL,
    [FrequencyPerDay] nvarchar(max)  NOT NULL,
    [FrequencyPerMonth] nvarchar(max)  NOT NULL,
    [OnsetFixedPeriod] nvarchar(max)  NOT NULL,
    [OnsetDate] datetime  NOT NULL,
    [OnsetAmount] nvarchar(max)  NOT NULL,
    [DailyAggravation] nvarchar(max)  NOT NULL,
    [FirstOnsetContinue] nvarchar(max)  NOT NULL,
    [VisitRecord_Id] int  NOT NULL
);
GO

-- Creating table 'LifestyleSet'
CREATE TABLE [dbo].[LifestyleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SmokeState] nvarchar(max)  NULL,
    [SmokeStartAge] nvarchar(max)  NULL,
    [SmokeQuitYear] nvarchar(max)  NULL,
    [SmokeYear] nvarchar(max)  NULL,
    [CigarettesPerDay] nvarchar(max)  NULL,
    [DrinkState] nvarchar(max)  NULL,
    [DrinkStartAge] nvarchar(max)  NULL,
    [DrinkYear] nvarchar(max)  NULL,
    [DrinkQuitYear] nvarchar(max)  NULL,
    [DrinkPerDay] nvarchar(max)  NULL,
    [DrinkCategory] nvarchar(max)  NULL,
    [TeaPerDay] nvarchar(max)  NULL,
    [CoffePerDay] nvarchar(max)  NULL,
    [ExercisePerWeek] nvarchar(max)  NULL,
    [ExerciseTime] nvarchar(max)  NULL,
    [ExerciseDescription] nvarchar(max)  NULL,
    [WeightChange] nvarchar(max)  NULL,
    [WeightChangeNote] nvarchar(max)  NULL
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
    [DrugCategory] nvarchar(max)  NOT NULL,
    [DrugName] nvarchar(max)  NOT NULL,
    [DayAmoutnPerM] nvarchar(max)  NOT NULL,
    [MonthTotalAmount] nvarchar(max)  NOT NULL,
    [PatBasicInforId] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'PreviousExamSet'
CREATE TABLE [dbo].[PreviousExamSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ExamName] nvarchar(max)  NOT NULL,
    [Result] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [PatBasicInforId] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'HeadacheFamilyMemberSet'
CREATE TABLE [dbo].[HeadacheFamilyMemberSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Person] nvarchar(max)  NOT NULL,
    [PatBasicInforId] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'OtherFamilyDiseaseSet'
CREATE TABLE [dbo].[OtherFamilyDiseaseSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DiseaseName] nvarchar(max)  NOT NULL,
    [PatBasicInforId] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'SpecialDietSet'
CREATE TABLE [dbo].[SpecialDietSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Kind] nvarchar(max)  NOT NULL,
    [LifestyleId] int  NOT NULL
);
GO

-- Creating table 'MedicationAdviceSet'
CREATE TABLE [dbo].[MedicationAdviceSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DrugApplication] nvarchar(max)  NOT NULL,
    [DrugCategory] nvarchar(max)  NOT NULL,
    [DrugName] nvarchar(max)  NOT NULL,
    [Therapy] nvarchar(max)  NOT NULL,
    [DrugDose] nvarchar(max)  NOT NULL,
    [VisitRecordId] int  NOT NULL
);
GO

-- Creating table 'PrecipitatingFactorSet'
CREATE TABLE [dbo].[PrecipitatingFactorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FactorName] nvarchar(max)  NOT NULL,
    [HeadachaOverViewId] int  NOT NULL,
    [FactorDetail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MitigatingFactorsSet'
CREATE TABLE [dbo].[MitigatingFactorsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FactorName] nvarchar(max)  NOT NULL,
    [HeadachaOverViewId] int  NOT NULL
);
GO

-- Creating table 'SecondaryHeadacheSymptomSet'
CREATE TABLE [dbo].[SecondaryHeadacheSymptomSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Symptom] nvarchar(max)  NOT NULL,
    [VisitRecordId] int  NOT NULL
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

-- Creating primary key on [Id] in table 'PrimaryHeadacheOverViewSet'
ALTER TABLE [dbo].[PrimaryHeadacheOverViewSet]
ADD CONSTRAINT [PK_PrimaryHeadacheOverViewSet]
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

-- Creating primary key on [Id] in table 'MedicationAdviceSet'
ALTER TABLE [dbo].[MedicationAdviceSet]
ADD CONSTRAINT [PK_MedicationAdviceSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrecipitatingFactorSet'
ALTER TABLE [dbo].[PrecipitatingFactorSet]
ADD CONSTRAINT [PK_PrecipitatingFactorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MitigatingFactorsSet'
ALTER TABLE [dbo].[MitigatingFactorsSet]
ADD CONSTRAINT [PK_MitigatingFactorsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SecondaryHeadacheSymptomSet'
ALTER TABLE [dbo].[SecondaryHeadacheSymptomSet]
ADD CONSTRAINT [PK_SecondaryHeadacheSymptomSet]
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

-- Creating foreign key on [HeadachaOverViewId] in table 'HeadachePlaceSet'
ALTER TABLE [dbo].[HeadachePlaceSet]
ADD CONSTRAINT [FK_HeadachaOverViewHeadachePlace]
    FOREIGN KEY ([HeadachaOverViewId])
    REFERENCES [dbo].[PrimaryHeadacheOverViewSet]
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
    REFERENCES [dbo].[PrimaryHeadacheOverViewSet]
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
    REFERENCES [dbo].[PrimaryHeadacheOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HeadachaOverViewHeadacheProdrome'
CREATE INDEX [IX_FK_HeadachaOverViewHeadacheProdrome]
ON [dbo].[HeadacheProdromeSet]
    ([HeadachaOverViewId]);
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

-- Creating foreign key on [HeadachaOverViewId] in table 'MitigatingFactorsSet'
ALTER TABLE [dbo].[MitigatingFactorsSet]
ADD CONSTRAINT [FK_HeadachaOverViewMitigatingFactors]
    FOREIGN KEY ([HeadachaOverViewId])
    REFERENCES [dbo].[PrimaryHeadacheOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HeadachaOverViewMitigatingFactors'
CREATE INDEX [IX_FK_HeadachaOverViewMitigatingFactors]
ON [dbo].[MitigatingFactorsSet]
    ([HeadachaOverViewId]);
GO

-- Creating foreign key on [HeadachaOverViewId] in table 'PrecipitatingFactorSet'
ALTER TABLE [dbo].[PrecipitatingFactorSet]
ADD CONSTRAINT [FK_HeadachaOverViewPrecipitatingFactor]
    FOREIGN KEY ([HeadachaOverViewId])
    REFERENCES [dbo].[PrimaryHeadacheOverViewSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HeadachaOverViewPrecipitatingFactor'
CREATE INDEX [IX_FK_HeadachaOverViewPrecipitatingFactor]
ON [dbo].[PrecipitatingFactorSet]
    ([HeadachaOverViewId]);
GO

-- Creating foreign key on [VisitRecordId] in table 'MedicationAdviceSet'
ALTER TABLE [dbo].[MedicationAdviceSet]
ADD CONSTRAINT [FK_VisitRecordMecicationAdvice]
    FOREIGN KEY ([VisitRecordId])
    REFERENCES [dbo].[VisitRecordSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordMecicationAdvice'
CREATE INDEX [IX_FK_VisitRecordMecicationAdvice]
ON [dbo].[MedicationAdviceSet]
    ([VisitRecordId]);
GO

-- Creating foreign key on [PatBasicInforId] in table 'PreviousDrugSet'
ALTER TABLE [dbo].[PreviousDrugSet]
ADD CONSTRAINT [FK_PatBasicInforPreviousDrug]
    FOREIGN KEY ([PatBasicInforId])
    REFERENCES [dbo].[PatBasicInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforPreviousDrug'
CREATE INDEX [IX_FK_PatBasicInforPreviousDrug]
ON [dbo].[PreviousDrugSet]
    ([PatBasicInforId]);
GO

-- Creating foreign key on [PatBasicInforId] in table 'PreviousExamSet'
ALTER TABLE [dbo].[PreviousExamSet]
ADD CONSTRAINT [FK_PatBasicInforPreviousExam]
    FOREIGN KEY ([PatBasicInforId])
    REFERENCES [dbo].[PatBasicInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforPreviousExam'
CREATE INDEX [IX_FK_PatBasicInforPreviousExam]
ON [dbo].[PreviousExamSet]
    ([PatBasicInforId]);
GO

-- Creating foreign key on [PatBasicInforId] in table 'HeadacheFamilyMemberSet'
ALTER TABLE [dbo].[HeadacheFamilyMemberSet]
ADD CONSTRAINT [FK_PatBasicInforHeadacheFamilyMember]
    FOREIGN KEY ([PatBasicInforId])
    REFERENCES [dbo].[PatBasicInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforHeadacheFamilyMember'
CREATE INDEX [IX_FK_PatBasicInforHeadacheFamilyMember]
ON [dbo].[HeadacheFamilyMemberSet]
    ([PatBasicInforId]);
GO

-- Creating foreign key on [PatBasicInforId] in table 'OtherFamilyDiseaseSet'
ALTER TABLE [dbo].[OtherFamilyDiseaseSet]
ADD CONSTRAINT [FK_PatBasicInforOtherFamilyDisease]
    FOREIGN KEY ([PatBasicInforId])
    REFERENCES [dbo].[PatBasicInforSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforOtherFamilyDisease'
CREATE INDEX [IX_FK_PatBasicInforOtherFamilyDisease]
ON [dbo].[OtherFamilyDiseaseSet]
    ([PatBasicInforId]);
GO

-- Creating foreign key on [Lifestyle_Id] in table 'PatBasicInforSet'
ALTER TABLE [dbo].[PatBasicInforSet]
ADD CONSTRAINT [FK_PatBasicInforLifestyle]
    FOREIGN KEY ([Lifestyle_Id])
    REFERENCES [dbo].[LifestyleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatBasicInforLifestyle'
CREATE INDEX [IX_FK_PatBasicInforLifestyle]
ON [dbo].[PatBasicInforSet]
    ([Lifestyle_Id]);
GO

-- Creating foreign key on [VisitRecordId] in table 'SecondaryHeadacheSymptomSet'
ALTER TABLE [dbo].[SecondaryHeadacheSymptomSet]
ADD CONSTRAINT [FK_VisitRecordSecondaryHeadacheSymptom]
    FOREIGN KEY ([VisitRecordId])
    REFERENCES [dbo].[VisitRecordSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordSecondaryHeadacheSymptom'
CREATE INDEX [IX_FK_VisitRecordSecondaryHeadacheSymptom]
ON [dbo].[SecondaryHeadacheSymptomSet]
    ([VisitRecordId]);
GO

-- Creating foreign key on [VisitRecord_Id] in table 'PrimaryHeadacheOverViewSet'
ALTER TABLE [dbo].[PrimaryHeadacheOverViewSet]
ADD CONSTRAINT [FK_VisitRecordPrimaryHeadachaOverView]
    FOREIGN KEY ([VisitRecord_Id])
    REFERENCES [dbo].[VisitRecordSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitRecordPrimaryHeadachaOverView'
CREATE INDEX [IX_FK_VisitRecordPrimaryHeadachaOverView]
ON [dbo].[PrimaryHeadacheOverViewSet]
    ([VisitRecord_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------