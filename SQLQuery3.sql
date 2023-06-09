USE [Sp353SanjayPrajapati]
GO
/****** Object:  UserDefinedFunction [dbo].[returnMedicine1]    Script Date: 5/9/2023 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   function [dbo].[returnMedicine1](@diadnosisId varchar(250))
returns nvarchar(max)
as 
begin
declare @string nvarchar(max) = ''

select @string += case when LEN(@string) = 0 then m.MedicineName else ','+ m.MedicineName end  from Medicine M
inner join Diagnosis D on M.DiagnosisId = d.Id
where d.Id in (select value from STRING_SPLIT(@diadnosisId , ','))
return @string
end

select dbo.returnMedicine1('1,2')