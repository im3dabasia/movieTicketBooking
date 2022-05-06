create trigger phoneNum_updation
    before update of phoneNumber
    on webUser
    for each row
begin
    if :old.phoneNumber is not null then
        raise_application_error (-20100, 'phone Number already has a value and can not be changed');
    end if;
end;
/


UPDATE webUser
SET phoneNumber = '1234567890' 
WHERE webUserID = '100';