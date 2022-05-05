Create or replace trigger check_users_age
before insert on webUser
for each row
enable
declare
user_age int;
begin
select age into user_age from webUser;
if (user_age<18) then
dbms_output.put_line('Under age');
end if;
end;
/