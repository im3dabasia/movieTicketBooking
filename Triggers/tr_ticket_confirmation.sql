create or replace trigger ticket_confirmation after insert on ticket 
for each row
begin
	dbms_output.put_line('Ticket Booked Successfully');

end;
/


--INSERT INTO ticket(ticketID , bookingID , class , price )
--VALUES('S0054SHT0110230', null, 'SLV',  350);


