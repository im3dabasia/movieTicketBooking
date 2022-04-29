create or replace procedure theater_details(bookingID varchar) as

	cursor c_theatre is select * from Theatre;
	r_theatre c_theatre%rowtype;

	cursor c_booking is select * from Booking;
	r_booking c_booking%rowtype;
	
begin

for r_booking in c_booking loop
	for r_theatre in c_theatre loop
		if (r_booking.theatreID = bookingID) then
			dbms_output.put_line('Name:' || r_theatre.nameOfTheatre);
			dbms_output.put_line('Area:' || r_theatre.area);
		end if;
	end loop;
end loop;
end;
/


