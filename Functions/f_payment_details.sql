create or replace type object_payment as object
	( o_cardname varchar2(21),
	o_cardnumber varchar2(19)

);
/

create or replace type type_payment is table of object_payment;
/

create or replace function details_payment(bookID varchar)
return type_payment
is
	p_cardname  varchar2(21);
	p_cardNumber varchar2(19);

	detail55 type_payment := type_payment();
begin
	detail55.extend();
	
	select Booking.cardname, Booking.cardNumber 
	into  p_cardName, p_cardNumber
	from  Booking
	where  Booking.bookingID = bookID;

	detail55(1)  := object_payment( p_cardname, p_cardNumber  );
	
	return detail55;
end;
/

select   details_payment( BookingID ) from Booking  ; 
