CREATE USER C##MOVIES1 IDENTIFIED BY MOVIES1;

GRANT ALL PRIVILEGES TO C##MOVIES1;


CREATE Table webUser(
webUserID varchar(10),
fName varchar(15), 
lName varchar(20),
emailID varchar(30),
age int,
phoneNumber varchar(10) NOT NULL, 
Primary Key(webUserID ));


Create Table Theatre(
theatreID varchar(5),
nameOfTheatre varchar(30) NOT NULL,
noOfScreens int,
area varchar(30),
Primary Key(theatreID ));

CREATE TABLE Screen(
screenID varchar(5),
noOfSeats_Gold int NOT NULL,
noOfSeats_Silver int NOT NULL,
theatreID varchar(5),
Primary Key(screenID),
Foreign Key(theatreID) REFERENCES Theatre(theatreID)
);


Create Table Movie(
movieID varchar(5),
name varchar(30) NOT NULL,
language varchar(10),
genre varchar(20),
targetAudience varchar(5),
Primary Key(movieID ));


CREATE Table Shows(				
showID varchar(10),
showTime varchar(20)  NOT NULL,
showDate date NOT NULL,				
seatsRemainingGold int NOT NULL CHECK (seatsRemainingGold  >= 0),
seatsRemainingSilver int NOT NULL CHECK (seatsRemainingSilver >= 0),
goldClassCost int NOT NULL,
silverClassCost  int NOT NULL,
screenID varchar(5) NOT NULL,
movieID varchar(5) NOT NULL,
Primary Key(showID ),
Foreign Key (screenID ) REFERENCES Screen(screenID ) ,
Foreign Key (movieID ) REFERENCES Movie(movieID) );


CREATE Table Booking(
bookingID varchar(10),
noOFTickets int NOT NULL,
totalCost int NOT NULL,                                           
cardNumber varchar(19),
cardName varchar(21),
webUserID VARCHAR2(10),
showID VARCHAR2(10),
theatreID VARCHAR2(5),
movieID VARCHAR2(5),
screenID VARCHAR2(5),
Foreign Key (webUserID) REFERENCES webUser(webUserID),
Foreign Key (showID) REFERENCES Shows(showID),
Foreign Key (theatreID) REFERENCES Theatre (theatreID),
Foreign Key (movieID) REFERENCES Movie(movieID),
Foreign Key (screenID) REFERENCES Screen (screenID),
Primary Key(bookingID));

CREATE Table Ticket(
ticketID varchar(20),
bookingID varchar(10),
class varchar(3) NOT NULL,
price int NOT NULL,
Primary Key(ticketID ),
Foreign Key(bookingID ) REFERENCES Booking(bookingID ));



//additional 
ALTER TABLE Booking MODIFY theatreID varchar(5) NOT NULL;
ALTER TABLE Booking MODIFY movieID varchar(5) NOT NULL;
ALTER TABLE Booking MODIFY screenID varchar(5) NOT NULL;

