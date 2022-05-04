create or replace type object_detail as object
	( o_movieID varchar(5),
	o_name varchar(30),
	o_language varchar(10),
	o_genre varchar(20),
	o_targetAudience varchar(5),
	o_totalCost int,
	o_noOFTickets int,
	o_theatreID VARCHAR2(5),
	o_screenID VARCHAR2(5)
);
/

create or replace type type_detail is table of object_detail;
/


create or replace function details_movie(bookid varchar)
return type_detail
is
	p_movieID varchar(5);
	p_name varchar(30);
	p_language varchar(10);
	p_genre varchar(20);
	p_targetAudience varchar(5);
	p_totalCost int;
	p_noOFTickets int;
	p_theatreID VARCHAR2(5);
	p_screenID VARCHAR2(5);

	detail type_detail := type_detail();
begin
	detail.extend();
	
	select movie.movieID, movie.name, movie.language, movie.genre, movie.targetAudience, Booking.totalCost, Booking.noOFTickets, Booking.theatreID, Booking.screenID
	into p_movieID, p_name, p_language, p_genre, p_targetAudience, p_totalCost, p_noOFTickets, p_theatreID, p_screenID 
	from Booking,Movie where Booking.movieID = Movie.movieID AND Booking.bookingID = bookid;

	detail(1) := object_detail(p_movieID, p_name, p_language, p_genre, p_targetAudience, p_totalCost, p_noOFTickets, p_theatreID, p_screenID);
	

	return detail;
end;
/

select details_movie( bookingid ) from booking;