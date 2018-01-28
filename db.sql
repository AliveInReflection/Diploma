create table Building(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Address nvarchar(max)
)

create table Intercom(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	IpAddress nvarchar(200) NOT NULL,
	Port nvarchar(200) not null,
	BuildingId UNIQUEIDENTIFIER not null,
	constraint FK_Intercom_Building foreign key (BuildingId)  references Building(Id)
)

create table Apartment(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	BuildingId UNIQUEIDENTIFIER not null,
	IntercomId UNIQUEIDENTIFIER NOT NULL,
	constraint FK_Apartment_Building foreign key (BuildingId)  references Building(Id),
	constraint FK_Apartment_Intercom foreign key (IntercomId)  references Intercom(Id)
)

create table [Identity](
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	PasswordHash NVARCHAR(200) NOT NULL,
	Name nvarchar null,
	IsHost bit not null,
	ApartmentId UNIQUEIDENTIFIER NOT NULL,
	constraint FK_Identity_Apartment foreign key (ApartmentId)  references Apartment(Id)
)

create table EventType(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Name nvarchar(200)
)

create table EventLog(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Timestamp DATETIME NOT NULL,
	IdentityId UNIQUEIDENTIFIER NOT NULL,
	EventType int not null,
	constraint FK_EventLog_Identity foreign key (IdentityId)  references [Identity](Id),
	constraint FK_EventLog_EventType foreign key (EventType)  references EventType(Id)

)





