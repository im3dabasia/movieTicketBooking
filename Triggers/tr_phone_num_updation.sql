create trigger lastname_updation
    before update of lName
    on webUser
    for each row
begin
    if :old.Lname is not null then
        raise_application_error (-20100, 'Last name already has a value');
    end if;
end;
/


--UPDATE webUser
--SET lName = 'Patel' 
--WHERE webUserID = '100';