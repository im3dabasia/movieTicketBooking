create or replace procedure print_ticket(bookid varchar) is
	cursor cur is select webUser.webUserID, webUser.fName, webUser.lName from webUser,Booking where webUser.webUserID = Booking.webUserID and Booking.BookingID = bookid;
	vcur cur%rowtype;

	cursor cur2 is select Movie.movieID, Movie.name , Movie.language, Movie.genre, Movie.targetAudience from Movie,Booking where Movie.movieID = 	Booking.movieID and  Booking.BookingID = bookid;
	vcur2 cur2%rowtype;
	
	cursor cur3 is select Screen.screenID, Screen.theatreID  from Screen,Booking where Screen.screenID = Booking.screenID and  Booking.BookingID = bookid;
	vcur3 cur3%rowtype;

	cursor cur4 is select totalcost from booking where Booking.BookingID = bookid;
	vcur4 cur4%rowtype;
begin
for vcur  in cur loop
	dbms_output.put_line('UserID:'|| vcur.webUserID  );
	dbms_output.put_line('First Name:'|| vcur.fName  );
	dbms_output.put_line('Last Name:'|| vcur.lName  );
	dbms_output.put_line('========================================================='  );

for vcur2  in cur2 loop
	dbms_output.put_line(vcur2.name ||' '|| vcur2.language ||' '||vcur2.genre ||' '|| vcur2.targetAudience);
	dbms_output.put_line('Movie Name:'|| vcur2.name  );
	dbms_output.put_line('Movie Language:'|| vcur2.language  );
	dbms_output.put_line('Movie Genre:'|| vcur2.genre  );
	dbms_output.put_line('Movie Target Audience:'|| vcur2.targetAudience  );
	dbms_output.put_line('========================================================='  );

for vcur3 in cur3 loop
	dbms_output.put_line('Screen ID:'|| vcur3.screenID  );
	dbms_output.put_line('First Name:'|| vcur3.theatreID  );
	dbms_output.put_line('========================================================='  );

for vcur4 in cur4 loop
	dbms_output.put_line('Total Cost' ||' '|| vcur4.totalCost );
	dbms_output.put_line('========================================================='  );
end loop;
end loop;
end loop;
end loop;

end;	
/