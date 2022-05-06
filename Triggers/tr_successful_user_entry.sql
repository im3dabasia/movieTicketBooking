CREATE OR REPLACE TRIGGER successful_user_entry 
AFTER INSERT ON webUser
begin   
	dbms_output.put_line('User Inserted  Successfully');
END;
/