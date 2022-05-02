create or replace procedure theatre_area_details(area varchar) as
	cursor c_theatre is select * from Theatre;
	r_theatre c_theatre%rowtype;

begin

for r_theatre in c_theatre loop
	if (r_theatre.area = area) then
		dbms_output.put_line('Name Of theatre: ' || r_theatre.nameOfTheatre || 'in '|| area );
	end if;
end loop;
end;
/
