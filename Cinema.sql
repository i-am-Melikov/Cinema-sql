CREATE DATABASE Cinema

USE Cinema

CREATE TABLE Films (
    Id INT PRIMARY KEY IDENTITY,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Date DATE NOT NULL
);

INSERT INTO Films VALUES('The Godfather' , 'About italian family' , '1970-01-11'), ('Openhaimer' , 'I didn`t watch this film:))', '2023-07-11'),('Barbie' , 'About a dolls' , '2008-02-11')

CREATE TABLE Halls (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    Capacity INT
);

INSERT INTO Halls VALUES('Sirius', 200), ('Titan', 250), ('Neptune', 500) , ('Earth', 1000), ('Mercury', 50)

CREATE TABLE Places (
    Id INT PRIMARY KEY IDENTITY,
    No INT NOT NULL,
    SeatNo INT NOT NULL,
	HallId INT FOREIGN KEY REFERENCES Halls(Id)
);

INSERT INTO Places VALUES(1, 5, 1), (2,2,2), (5,10,3),(3, 20,3),(10,50,4) , (1,100,4), (3, 10 , 4) , (12, 15 , 4), (1,10,5)

CREATE TABLE Tickets (
    Id INT PRIMARY KEY IDENTITY,
    Time DATETIME,
    FilmId INT FOREIGN KEY REFERENCES Films(Id),
    PlaceId INT FOREIGN KEY REFERENCES Places(Id)
);

INSERT INTO Tickets VALUES('2023-09-30 20:00:00', 1 , 4), ('2023-09-30 20:00:00', 2 , 1) ,(	'2023-10-01 20:00:00', 3 , 5), (	'2023-09-25 20:00:00', 1 , 4), (	'2023-09-26 20:00:00', 1 , 6), (	'2023-09-27 20:00:00', 2 , 2) , (	'2023-10-03 20:00:00', 3 , 2)


SELECT tc.Id, fm.Title, fm.Date , hl.Name, pl.No, pl.SeatNo, tc.Time FROM Tickets tc
Join Films as fm
ON 
fm.Id=tc.FilmId
JOIN Places as pl
On
tc.PlaceId=pl.Id
JOIN Halls As hl
ON
hl.Id=pl.HallId

Use Cinema

CREATE VIEW Cinema_Ticket AS
SELECT tc.Id, fm.Title, fm.Date , hl.Name, pl.No, pl.SeatNo, tc.Time FROM Tickets As tc
Join Films as fm
ON 
fm.Id=tc.FilmId
JOIN Places as pl
On
tc.PlaceId=pl.Id
JOIN Halls As hl
ON
hl.Id=pl.HallId
