create function fn_getMeds1(@dia varchar(255))
returns varchar(255)
as
begin
declare @meds varchar(255);

select @meds = stuff((select ',' + MedicineName from medicine where DiagnosisId in 
(select Id from diagnosis where Id in (select value from string_split(@dia,',')))
 for xml path('')),1,1,'')
 return @meds
end

select dbo.fn_getMeds1(1)



create function fn_GetName(@Id int)
returns varchar(255)
as
begin
	declare @Name varchar(255);
	select @Name = (U.firstName + ' ' + U.lastName)  from [User] U where U.Id = @Id
	return @Name
end


select	dbo.fn_GetName(T.PatientId) as PatientName, 
		dbo.fn_GetName(T.DoctorId) as DoctorName, 
		dbo.fn_GetName(T.NurseId) as NurseName,
		dbo.fn_getMeds1(T.DiagnosisId) ,
		T.TreatmentFee,
		T.DOT,
		(CI.StateName + ',' + S.StateName + ',' + C.CountryName) as [Address],
		U.MobileNo
		from TreatmentDetails T,[User] U,City CI,Country C,States S
		where T.Id = 3 and U.Id = T.PatientId and 
		U.CountryId = C.Id 
		and 
			U.StateId = S.Id 
		and 
			U.CityId = CI.Id 


sp_helptext [dbo].[fn_getMeds1]


select stuff((select FirstName from [User] for xml path('')),1,1,'') as s









create   proc RetriveTreatmentDetails(  
 @treatMent int =null  
)  
as  
begin  
  
select   
  UP.FirstName + ' ' + UP.LastName as PatientName,  
  UD.FirstName + ' ' + UD.LastName as DoctorName,  
  UN.FirstName + ' ' + UN.LastName as NurseName,  
  dbo.returnMedicine1(D.Id) as Medicine,  
  TD.DOT,  
  UP.Address as PatientAddress,  
  UP.MobileNo as PatientMobileNo,  
  'RS'+' '+ convert(varchar(250),TD.TreatmentFee) as TreatmentFee  
  
  from TreatmentDetails TD  
  inner join [User] as UD on TD.DoctorId  = UD.Id  
  inner join[User] as UP on TD.PatientId=UP.Id  
  inner join[User] as UN on TD.NurseId=UN.Id  
  inner join Diagnosis as D on TD.DiagnosisId = D.Id  
  where TD.Id = case when @treatMent is null then TD.Id else @treatMent end  
  
end