create or replace trigger ticket_confirmation after insert on ticket 
for each row
begin
	dbms_output.put_line('Ticket Booked Successfully');

end;
/

CREATE OR REPLACE TRIGGER ticket_confirmation
AFTER INSERT OR UPDATE ON ticket
  BEGIN
        INSERT INTO ticket (ticketID , bookingID , class , price )
        VALUES ('S0054SHT0110001', 'BK10100001', 'SLV',  350);
  END;           
/


INSERT INTO ticket(ticketID , bookingID , class , price )
VALUES('S0054SHT0110230', null, 'SLV',  350);