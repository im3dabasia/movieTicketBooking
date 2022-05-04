
create or replace procedure search_genre(gen varchar) as

BEGIN
  FOR rec IN (SELECT Movie.name 
                FROM Movie
                WHERE Movie.genre = gen)
  LOOP
    DBMS_OUTPUT.PUT_LINE ('Movie Name: ' || rec.name);
  END LOOP;
END;
/


