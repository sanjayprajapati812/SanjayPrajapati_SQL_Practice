
ALTER   proc [dbo].[RetriveDoctor](
@UserId int = null
)
as
begin

select U.FirstName +' '+ U.LastName as DoctorName,U.Address, U.MobileNo from [User] U
inner join UserType UT on U.UserTypeId = UT.Id
where U.Id = isnull(@UserId,U.Id) and UT.UserTypeName='Doctor'

end

select * from UserType

exec RetriveDoctor '1'
