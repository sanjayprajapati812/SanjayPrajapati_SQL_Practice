
create table UserType(
Id int identity(1,1),
UserTypeName varchar(255)
)

--alter syntax for primary key
alter table UserType
add constraint PK_userType primary key (Id) 

--alter for constraint not null

alter table UserType
alter column UserTypeName varchar(255) not null

create table Country(
Id int primary key identity(1,1),
CountryName varchar(255) not null
)

create table States(
Id int primary key identity(1,1),
StateName varchar(255) not null,
CountryId int,
)

--alter for foreign key

alter table states
add constraint FK_States foreign key(CountryId) references Country(Id)


create table City(
Id int primary key identity(1,1),
CityName varchar(255) not null,
StateId int,
CountryId int foreign key references Country(Id),
)

alter table city
add constraint FK_City foreign Key(StateId) references states(id)


create table Diagnosis(
Id int primary key identity(1,1),
DiagnosisDetails varchar(255) not null
)


create table [User]
(
Id int primary key identity(1,1),
FirstName varchar(255) not null,
LastName varchar(255) not null,
Email varchar(255),
[Password] varchar(255),
UserTypeId int foreign key references UserType(Id),
[Address] varchar(max),
MobileNo varchar(50) not null,
CountryId int foreign key references Country(Id),
StateId int foreign key references States(Id),
CityId int foreign key references City(Id), 
)

alter table [user]
add constraint chk_Pass check(len([Password])>=8 and len([Password])<=10)


create table Medicine
(
Id int primary key identity(1,1),
MedicineName varchar(255) not null,
DiagnosisId int foreign key references Diagnosis(Id),
)

create table TreatmentDetails
(
Id int primary key identity(1,1),
PatientId int foreign key references [User](Id),
DocterId int foreign key references [User](Id),
NurseId int foreign key references [User](Id),
Diagnosis varchar(255),
Prescription varchar(255),
TreatmentFee decimal(7,2) not null,
DOT datetime,
Instruction nvarchar(max)
)


--USE BJBHAVYAJOSHI
--GO;


alter proc sp_InsertIntoCountry(
@CountryName varchar(255),
@id int = null
)
as 
begin
if(@id is null)
begin
	insert into Country values(@CountryName) 
end
else
begin
	update Country set CountryName = @CountryName where id = @id
end
end

exec sp_InsertIntoCountry 'India';
exec sp_InsertIntoCountry 'USA';
exec sp_InsertIntoCountry 'UAE';
exec sp_InsertIntoCountry 'Cannada';
exec sp_InsertIntoCountry 'Nepal';

select * from Country

--exec sp_InsertIntoCountry 'Bhutan';

GO;

create proc sp_InsertIntoState(
@StateName varchar(255),
@CountryId int
)
as 
begin
	insert into States values(@StateName,@CountryId) 
end

exec sp_InsertIntoState 'Kerela',1;
exec sp_InsertIntoState 'Gujarat',1;
exec sp_InsertIntoState 'Maharastra',1;
exec sp_InsertIntoState 'Goa',1;
exec sp_InsertIntoState 'Rajasthan',1;

--exec sp_InsertIntoState 'Jammu',14;
GO;


create proc sp_InsertIntoCity(
@CityName varchar(255),
@CountryId int,
@StateId int
)
as 
begin
	insert into City values(@CityName,@StateId,@CountryId); 
end



exec sp_InsertIntoCity 'Palanpur',1,2;
exec sp_InsertIntoCity 'Deesa',1,2;
exec sp_InsertIntoCity 'Siddhpur',1,2;
exec sp_InsertIntoCity 'Rajkot',1,2;
exec sp_InsertIntoCity 'Kuchh',1,2;

--exec sp_InsertIntoCity 'Diu',1,2;
go;


create proc sp_InsertIntoUserType(
@UserTypeName varchar(255)
)
as 
begin
	insert into UserType values(@UserTypeName); 
end

exec sp_InsertIntoUserType 'Doctor';
exec sp_InsertIntoUserType 'Patient';
exec sp_InsertIntoUserType 'Nurse';

GO;

create proc sp_InsertIntoDiagnosis
(
@DiagnosisDetails varchar(255)
)
as
begin
	insert into Diagnosis values(@DiagnosisDetails); 
end

exec sp_InsertIntoDiagnosis 'Fever';
exec sp_InsertIntoDiagnosis 'Cold';
exec sp_InsertIntoDiagnosis 'Headache';
exec sp_InsertIntoDiagnosis 'Stomachache';
exec sp_InsertIntoDiagnosis 'Vomit';

go;

create proc sp_InsertIntoMedicine
(
@MedicineName varchar(255),
@DiagnosisId int
)
as
begin
	insert into Medicine values(@MedicineName,@DiagnosisId); 
end

exec sp_InsertIntoMedicine 'DOLO600',1;
exec sp_InsertIntoMedicine 'Levocetirizine',2;
exec sp_InsertIntoMedicine 'Panadol',3;
exec sp_InsertIntoMedicine 'Liquiprine',4;
exec sp_InsertIntoMedicine 'Paracetemol',5;


create proc sp_InsertIntoUser
(
@FirstName varchar(255),
@LastName varchar(255),
@Email varchar(255),
@Password varchar(255),
@UserTypeId int,
@Address varchar(max),
@MobileNo varchar(50),
@CountryId int,
@StateId int,
@CityId int,
@UserId int = null out
)
as
begin
	insert into [User] values(@FirstName,@LastName,@Email,@Password,@UserTypeId,@Address,@MobileNo,@CountryId,@StateId,@CityId); 
	set @UserId = scope_identity();
end

exec sp_InsertIntoUser 'Bhavya','Joshi','king@gmail.com','12345789',2,'17, shukan 121','9510012445',1,2,1;
exec sp_InsertIntoUser 'Vivek','Khatri','khtari@gmail.com','12345789',2,'17, shukan 121','9510032645',1,2,2;
exec sp_InsertIntoUser 'Hemang','Dholu','dholu@gmail.com','12455789',3,'17, shukan 121','9510011645',1,2,3;
exec sp_InsertIntoUser 'Chirag','Patel','patel@gmail.com','12345189',1,'17, shukan 121','9510012645',1,2,4;
exec sp_InsertIntoUser 'yash','kotadiya','yash@gmail.com','12145789',1,'17, shukan 121','9510012645',1,2,5;
exec sp_InsertIntoUser 'Sanjay','Prajapati','sanjay@gmail.com','456789258',3,'17, shukan 121','8409888415',1,2,4;
exec sp_InsertIntoUser 'Jigar','Prajapati','jigar@gmail.com','456749258',3,'17, shukan 121','252548485',1,2,3;
declare @main int
exec sp_InsertIntoUser 'JK Mlaay','gelani','llgp@gmail.com','552517878',1,'17, shukan 121','2526248485',1,2,2,@main out;
print(@main)
print('hello')

--exec sp_InsertIntoUser 'new','enJoshi','kinge@gmail.com','123457890',2,'17, shukan 121','9510012645',1,2,6;


create proc sp_InsertIntoTreatment
(
@PatientId int,
@DocterId int,
@NurseId int,
@Diagnosis varchar(255),
@Prescription varchar(255),
@TreatmentFee decimal(7,2),
@DOT datetime,
@Instruction nvarchar(max),
@TreatmentId int =null out
)
as
begin
	insert into TreatmentDetails values(@PatientId,@DocterId,@NurseId,@Diagnosis,@Prescription,@TreatmentFee,@DOT,@Instruction); 
	set @TreatmentId = scope_identity();
end

exec sp_InsertIntoTreatment 6,7,8,'1','1',500,'2023-03-03','Get Well Soon'
exec sp_InsertIntoTreatment 8,6,6,'2','2',700,'2023-04-03','Get Well Soon'
exec sp_InsertIntoTreatment 9,8,7,'3','3',1000,'2023-02-03','Get Well Soon'
exec sp_InsertIntoTreatment 10,9,10,'4','4',500,'2023-03-03','Get Well Soon'
exec sp_InsertIntoTreatment 7,10,9,'1','1',500,'2023-03-03','Get Well Soon'


go;


alter proc getDoctors
(
	@DoctorId int=null
)
as
begin
select 'Dr '+ U.FirstName +' '+ U.LastName as DoctorName,
		City.CityName+', '+States.StateName+', '+Country.CountryName As [Address],
		U.MobileNo as MobileNO
from [User] U
inner join UserType UT on UT.Id=U.UserTypeId
inner join City on U.CityId=City.Id
inner join States on U.StateId=States.Id
inner join Country on Country.Id=U.CountryId
where UT.Id = 3 and U.Id=isnull(@DoctorId,U.Id)
end


exec getDoctors

go;

alter function fn_GetMedicine(@Diagnosis int)
returns varchar(255)
as
begin
	declare @Medicine varchar(255);
	select @Medicine = isnull(M.MedicineName,'') from medicine M where M.DiagnosisId = @Diagnosis
	return @Medicine
end

--------------- create function for get medicine------------------------




create function fn_Get_Medicine(@dia varchar(250))
returns varchar(250)
as
begin

	declare @rtnString varchar(250)
	select @rtnString = stuff((
	select ', '+ cast(Medicine.Id as varchar)+' '+Medicine.MedicineName from Medicine
	CROSS APPLY Diagnosis
	where Diagnosis.DiagnosisDetails in (select value from string_split(@dia,',')) and Diagnosis.Id = Medicine.DiagnosisId
	for xml path('')
	),1,1,'')

	return @rtnString
end

userType



exec sp_InsertIntoUser 


create function getUser(@id int)
returns varchar(250)
as
begin
return(
select FirstName+' '+LastName from [User]
where Id=@id
)
end

select dbo.getUser(6)

alter function getUserAddress(@id int)
returns varchar(250)
as
begin
return(
select CityName+', '+StateName+', '+CountryName from [User] U
inner join City on City.Id= u.CityId
inner join States on States.Id= u.StateId
inner join Country on Country.Id= u.CountryId
where U.Id=@id
)
end

select dbo.getUserAddress(6)

alter proc returnTreatmentDet
(
	@patientFName varchar(100),
	@patientLName varchar(100),
	@patientEmail varchar(100),
	@patientPass varchar(100),
	@patientAddr varchar(100),
	@patientMobile varchar(100),
	@patientCountry varchar(100),
	@patientState varchar(100),
	@patientCity varchar(100),
	@DocterId int,
	@NurseId int,
	@Diagnosis varchar(250),
	@Prescription varchar(250),
	@TreatmentFee decimal(7,2),
	@DOT date,
	@Instruction nvarchar(max)
)
as
begin
	declare @PatientId int,@TratmentId int
	begin try
		begin tran
			exec sp_InsertIntoUser @patientFName,@patientLName,@patientEmail,@patientPass,2,@patientAddr,@patientMobile,@patientCountry,@patientState,@patientCity,@PatientId out;
		commit tran
	end try
	begin catch
		print 'Error in Reg. patient'
		rollback tran
	end catch

	begin try
		begin tran
			exec sp_InsertIntoTreatment @PatientId,@DocterId,@NurseId,@Diagnosis,@Prescription,@TreatmentFee,@DOT,@Instruction,@TratmentId out
			declare @prStr varchar(250)=(
				select stuff((select ','+ DiagnosisDetails
				from Diagnosis
				where Diagnosis.Id in (select value from string_split(@Diagnosis,',')) for xml path('')),1,1,''))

			select
			dbo.getUser(TD.PatientId) as PatientName,
			dbo.getUser(TD.DocterId) as DoctorName,
			dbo.getUser(TD.NurseId) as NurseName,
			dbo.fn_Get_Medicine(@prStr) as Medicine,
			TD.DOT,
			dbo.getUserAddress(TD.PatientId) as PatientAddress,
			U.MobileNo,
			'RS '+ cast(TD.TreatmentFee as varchar(100)) as TreatmentFee

			from TreatmentDetails TD
			inner join [User] U on U.Id=TD.PatientId
			where TD.Id=@TratmentId
		commit tran
	end try
	begin catch
		print error_message()
		rollback tran
	end catch
end

exec returnTreatmentDet 'Yash','Kotadiaya','yash66@gmail.com','457845789','17, makan 121','9510172874', 1,2,3,9,11,'2,4','2,4',4500,'2019-10-10','never Get well soon come again'