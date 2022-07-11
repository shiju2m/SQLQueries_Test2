--Creating a table Person
CREATE TABLE PERSON(
	PersonId INTEGER NOT NULL,
	Name VARCHAR(64) NOT NULL,
	DOB date NOT NULL,
	Nationality VARCHAR(64) NOT NULL,
	CONSTRAINT PersonPK PRIMARY KEY(PersonId));
--Inserting values to the table
INSERT INTO PERSON 
(PersonId,Name,DOB,Nationality)
VALUES (1001,'Ricky Ponting','1974-12-19','Australia'),
(1002,'Brendon Mccullum','1981-09-27','New Zealand'),
(1003,'Stephen Fleming','1973-04-01','New Zealand'),
(1004,'Mike Phelps','1985-06-30','United States'),
(1005,'Sean Ervine','1982-12-06','Zimbabwe'),
(1006,'David Miller','1989-06-10','South Africa'),
(1007,'Sachin Tendulkar','1973-04-24','India'),
(1008,'Brian Lara','1969-05-02','West indies'),
(1009,'Wasim Akram','1966-06-03','Pakistan'),
(1010,'Joe Root','1990-12-30','England'),
(1011,'Shane Warne','1969-09-13','Australia'),
(1012,'Aranvinda Desilva','1965-10-17','Sri Lanka'),
(1013,'Aranvinda Desilva','1965-10-17','Sri Lanka'),
(1014,'Joe Root','1990-12-30','England'),
(1015,'Brian Lara','1969-05-02','West indies'),
(10016,'Sachin Tendulkar','1973-04-25','India'),
(10017,'Stephen Fleming','1973-04-11','New Zealand'),
(10018,'Sean Ervine','1982-12-06','Canada'),
(10019,'Sean Ervine','1982-12-06','Canada'),
(1020,'Wasim Akram','1966-06-03','Pakistan')
;
--Selecting the duplicate records
--Select PersonId,Name,DOB,Nationality,Count(*) from PERSON group by Name,DOB,Nationality having count(*)>1;
--Deleting the duplicate records
Delete from PERSON where PersonId not in (Select max(PersonId) from PERSON group by Name,DOB,Nationality); 
-- Just looking for duplicates are removed by this select statement
--Select * from Person;
--Calculating average Age from DOB field
Select avg(DATEDIFF(YY, DOB, getdate())) as AverageAge from Person;
--Creating a procedure to find all persons whose age less than N
CREATE PROCEDURE GetAllPersonUnderAge @Age int
AS
Select PersonId,Name,Nationality,DATEDIFF(YY, DOB, getdate()) as Age from Person where DATEDIFF(YY, DOB, getdate()) < @Age
GO;

exec GetAllPersonUnderAge 45
GO;
--SQL Query to return unique countries
Select distinct Nationality from Person
