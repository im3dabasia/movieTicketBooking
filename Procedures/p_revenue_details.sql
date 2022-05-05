

create or replace procedure revenue_details(moviename varchar) as

	cursor c_movie is select * from Movie;
	r_movie c_movie%rowtype;

	cursor c_booking is select * from Booking;
	r_booking c_booking%rowtype;
	p_movieID varchar(5);
	sum1 int :=0;
	temp int :=0;
begin

for r_movie in c_movie loop
	dbms_output.put_line(r_movie.name || r_movie.movieID);
	if (r_movie.name = moviename) then
		p_movieID := r_movie.movieID;
	end if;
end loop;

 

select SUM(totalCost) into sum1 from Booking where movieID = p_movieID groupby movieID   ;
dbms_output.put_line('Total Revenue from:' || moviename || 'is Rs ' sum1);
end;
/

