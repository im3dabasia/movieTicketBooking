
create or replace procedure revenue_details(moviename varchar) as

	cursor c_movie is select * from Movie;
	r_movie c_movie%rowtype;

	cursor c_booking is select * from Booking;
	r_booking c_booking%rowtype;
	p_movieID varchar2(5);
	sum int :=0;
	temp int :=0;
begin

for r_movie in c_movie loop
	dbms_output.put_line(r_movie.name || r_movie.movieID);
	if (r_movie.name = moviename) then
		p_movieID := r_movie.movieID;
	end if;
end loop;

--for r_booking in c_booking loop
--	if r_booking.movieID = p_movieID then
--		temp := r_booking.totalCost;		
--	end if;
--end loop;

select SUM(totalCost) sum from booking where movieID = p_movieID;
dbms_output.put_line('Total Revenue from:' || moviename || 'is Rs ' ||sum);
end;
/

