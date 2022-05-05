create or replace type object_detail2 as object
	( o_fName varchar2(15),
	o_lName varchar2(20),
	o_webUserID varchar2(5),
	o_phoneNumber varchar2(10),
	o_emailID varchar2(30)
);
/

create or replace type type_detail2 is table of object_detail2;
/

create or replace function details_User(webUserTempID varchar)
return type_detail2
is
	p_fName varchar2(15);
	p_lName varchar2(20);
	p_webUserID varchar2(10);
	p_phoneNumber varchar2(10);
	p_emailID varchar2(30);

	detail9 type_detail2 := type_detail2();
begin
	detail9.extend();
	
	select webUser.fName, webUser.lName , webUser.webUserID, webUser.phoneNumber, webUser.emailID 
	into p_fName, p_lName, p_webUserID, p_phoneNumber, p_emailID 
	from  webUser
	where  webUser.webUserID = webUserTempID;

	detail9(1)  := object_detail2( p_fName, p_lName, p_webUserID, p_phoneNumber, p_emailID );
	
	return detail9;
end;
/

select   details_User( webUserID ) from webUser  ;