create or replace function requires_parental_guidance(std_name varchar)
return varchar2 is

cursor c_movie is select * from movie ;
r_movie c_movie%rowtype;
ans varchar2(50);
begin
for r_movie in c_movie loop
	if (r_movie.targetAudience   = 'A    ' ) then
		ans := 'Parental Mandatory';
	else
		ans := 'Parents Not Mandatory';
	end if;
end loop;
return ans;
end ;
/





///select name,genre,targetAudience,requires_parental_guidance(name) from movie;
