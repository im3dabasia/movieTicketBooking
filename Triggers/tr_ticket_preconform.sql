create or replace trigger ticket_preconform before insert on booking 
for each row
declare
begin
	dbms_output.put_line('Are you sure you want to proceed and book tickets?');

end;
/