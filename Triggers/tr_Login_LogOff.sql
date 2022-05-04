create table login_details(
	loginID varchar2(20),
	loginTime date,
	action varchar2(10));

create or replace trigger login_trigger
	After logon on C##MOVIES1.schema 
BEGIN 
		insert into login_details values(USER, to_char(SYSDATE, 'dd-mm-yyyy hh24:mi:ss'), 'Login');
END;
/

create or replace trigger logoff_trigger
	Before logoff on C##MOVIES1.schema  
BEGIN 
		insert into login_details values(USER, to_char(SYSDATE, 'dd-mm-yyyy hh24:mi:ss'), 'Logout');
END;
/

ALTER TRIGGER XE.logoff_trigger ENABLE;