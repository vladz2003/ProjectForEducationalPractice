CREATE TABLE MedicineCard
(
	id int identity(1,1) primary key not null,
	FIO nvarchar(max) not null,
	Age int not null,
	Gender nvarchar(30) not null,
	PreliminaryDiagnosis nvarchar(300) not null,
	EntryMethodId int not null,
	RecieptDate date not null,
	DescriptionsId int not null,
	EndOfThreatmentId int not null
)

CREATE TABLE [Transfer]
(
	id int identity(1,1) primary key not null,
	MedicineCardId int not null,
	DateOdTransfer date not null,
	ChamberPhone nvarchar(16) not null,
	NewChamber int not null
)

CREATE TABLE DescriptionPatient
(
	id int identity(1,1) primary key not null,
	ApproximateHeight nvarchar(100) not null,
	HairColor nvarchar(100) null,
	SpecialSigns nvarchar(100) null,
	ApproximateAge int not null,
	NumberOfChambers int not null
)

CREATE TABLE EntryMethod
(
	id int identity(1,1) primary key not null,
	MethodName nvarchar(500) not null
)

CREATE TABLE EndOfThreatment
(
	id int identity(1,1) primary key not null,
	DischargeDate date not null,
	ReasonForDischargeId int not null
)

CREATE TABLE ReasonForDischarge
(
	id int identity(1,1) primary key not null,
	ReasonName nvarchar(max) not null
)



