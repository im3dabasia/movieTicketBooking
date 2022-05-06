ALTER TRIGGER update_ticket_counter  ENABLE;


CREATE OR REPLACE TRIGGER update_ticket_counter before insert ON ticket
for each row
ENABLE
declare
	gold number;
	silver number;
	v_class varchar(3);
begin
	v_class := :new.class;
	gold := select seatsRemainingGold from Shows where showID = (select showID from Booking where bookingID = :new.bookingID);
	silver := select seatsRemainingSilver from Shows where showID = (select showID from Booking where bookingID = :new.bookingID);

if v_class = 'GLD' then
	if gold = 0 then
		dbms_output.put_line('No gold seats available');
	else
		update Shows set seatsRemainingGold = seatsRemainingGold -1 where showID = (select showID from booking where bookingID = :new.bookingID );
	end if;
else
	if silver = 0 then
		dbms_output.put_line('No silver seats available');
	else
		update Shows set seatsRemainingSilver= seatsRemainingSilver -1 where showID = (select showID from booking where bookingID = :new.bookingID );
	end if;
end if;
end;
/
	

		