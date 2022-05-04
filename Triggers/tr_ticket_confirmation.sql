create or replace trigger ticket_confirmation after insert on ticket 
for each row
declare
begin
	dbms_output.put_line('Ticket Booked Successfully');

end;
/