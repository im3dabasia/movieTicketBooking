CREATE OR REPLACE TRIGGER checkUserAge BEFORE INSERT ON webUser
FOR EACH ROW
declare
		new_age int:=  (select age from webUser  where webUserID = :new.webUserID);
begin   
    IF (new_age < 18) THEN
	raise_application_error(-20001,'Age should be greater than 18');
    END IF;
END;
/
