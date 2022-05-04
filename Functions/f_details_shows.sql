create or replace type object_shows as object
	( o_showTime varchar(20),
	o_showDate date,
	o_seatsRemainingGold int,
	o_seatsRemainingSilver int,
	o_goldClassCost int,
	o_silverClassCost int
);
/


create or replace type type_shows is table of object_shows;
/


create or replace function details_shows(moviename varchar, theatre varchar)
return type_shows 
is
	p_showTime varchar(20);
	p_showDate date;
	p_seatsRemainingGold int;
	p_seatsRemainingSilver int;
	p_goldClassCost int;
	p_silverClassCost int;

	detail5 type_shows := type_shows();
begin
	detail5.extend();
	
	select 	showTime, showDate, seatsRemainingGold, seatsRemainingSilver, goldClassCost, silverClassCost into
	p_showTime, p_showDate , p_seatsRemainingGold , p_seatsRemainingSilver , p_goldClassCost , p_silverClassCost from Shows
	where movieID in (select movieID from Movie where name = moviename ) 
	AND screenID in (select screenID from Screen,Theatre where Screen.theatreID = Theatre.theatreID AND Theatre.nameOfTheatre = theatre);	


	detail5(1) := object_shows(p_showTime, p_showDate , p_seatsRemainingGold , p_seatsRemainingSilver , p_goldClassCost , p_silverClassCost);
	

	return detail5;
end;
/