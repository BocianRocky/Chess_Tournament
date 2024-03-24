drop table Kategorie_szachowe;
drop table Wyniki;
drop table Partia;
drop table stoly;
drop table Runda;
drop table Zawodnicy;
drop table Klub_szachowy;
drop table Arbitrzy;
drop table Osoba;

--ORACLE

-- tables
-- Table: Arbitrzy
CREATE TABLE Arbitrzy (
    Id_arbitra integer  NOT NULL,
    Kraj varchar(30)  NOT NULL,
    Doswiadczenie varchar(30)  NOT NULL,
    Arbitrzy_pomoc integer  NULL,
    CONSTRAINT Arbitrzy_pk PRIMARY KEY (Id_arbitra)
) ;

-- Table: Kategorie_szachowe
CREATE TABLE Kategorie_szachowe (
    Numer_kategorii integer  NOT NULL,
    Granica1 integer  NOT NULL,
    Granica2 integer  NOT NULL,
    CONSTRAINT Kategorie_szachowe_pk PRIMARY KEY (Numer_kategorii)
) ;

-- Table: Klub_szachowy
CREATE TABLE Klub_szachowy (
    id_klubu integer  NOT NULL,
    Nazwa_klubu varchar(30)  NOT NULL,
    Miasto varchar(30)  NOT NULL,
    Adres varchar(30)  NOT NULL,
    CONSTRAINT Klub_szachowy_pk PRIMARY KEY (id_klubu)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    Id_osoby integer  NOT NULL,
    Imie varchar(20)  NOT NULL,
    Nazwisko varchar(20)  NOT NULL,
    Data_urodzenia date  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (Id_osoby)
) ;

-- Table: Partia
CREATE TABLE Partia (
    Id_partii integer  NOT NULL,
    Zawodnik_biale integer  NOT NULL,
    Zawodnik_czarne integer  NOT NULL,
    Arbitrzy_Id_arbitra integer  NOT NULL,
    Runda_numer_rundy integer  NOT NULL,
    Stoly_id_stolu integer  NOT NULL,
    CONSTRAINT Partia_pk PRIMARY KEY (Id_partii)
) ;

-- Table: Runda
CREATE TABLE Runda (
    Numer_rundy integer  NOT NULL,
    Godzina_rozpoczecia TIMESTAMP NOT NULL,
    Godzina_zakonczenia TIMESTAMP NOT NULL,
    Data date  NOT NULL,
    CONSTRAINT Runda_pk PRIMARY KEY (Numer_rundy)
) ;

-- Table: Wyniki
CREATE TABLE Wyniki (
    Id_wyniku_partii integer  NOT NULL,
    Biale_wynik decimal(3,2)  NOT NULL,
    Czarne_wynik decimal(3,2)  NOT NULL,
    CONSTRAINT Wyniki_pk PRIMARY KEY (Id_wyniku_partii)
) ;

-- Table: Zawodnicy
CREATE TABLE Zawodnicy (
    Id_zawodnika integer  NOT NULL,
    Ranking_szachowy integer  NULL,
    Klub_szachowy_id_klubu integer  NOT NULL,
    CONSTRAINT Zawodnicy_pk PRIMARY KEY (Id_zawodnika)
) ;

-- Table: stoly
CREATE TABLE stoly (
    Id_stolu integer  NOT NULL,
    Pozycja_na_sali char(2)  NOT NULL,
    CONSTRAINT stoly_pk PRIMARY KEY (Id_stolu)
) ;

-- foreign keys

ALTER TABLE Arbitrzy ADD CONSTRAINT Arbitrzy_Arbitrzy
    FOREIGN KEY (Arbitrzy_pomoc)
    REFERENCES Arbitrzy (Id_arbitra);


ALTER TABLE Arbitrzy ADD CONSTRAINT Osoba_Arbitrzy
    FOREIGN KEY (Id_arbitra)
    REFERENCES Osoba (Id_osoby);


ALTER TABLE Zawodnicy ADD CONSTRAINT Osoba_Zawodnicy
    FOREIGN KEY (Id_zawodnika)
    REFERENCES Osoba (Id_osoby);


ALTER TABLE Partia ADD CONSTRAINT Partia_Arbitrzy
    FOREIGN KEY (Arbitrzy_Id_arbitra)
    REFERENCES Arbitrzy (Id_arbitra);


ALTER TABLE Partia ADD CONSTRAINT Partia_Runda
    FOREIGN KEY (Runda_numer_rundy)
    REFERENCES Runda (Numer_rundy);


ALTER TABLE Partia ADD CONSTRAINT Partia_Zadownicy1
    FOREIGN KEY (Zawodnik_czarne)
    REFERENCES Zawodnicy (Id_zawodnika);


ALTER TABLE Partia ADD CONSTRAINT Partia_Zadownicy2
    FOREIGN KEY (Zawodnik_biale)
    REFERENCES Zawodnicy (Id_zawodnika);


ALTER TABLE Partia ADD CONSTRAINT Partia_stoly
    FOREIGN KEY (Stoly_id_stolu)
    REFERENCES stoly (Id_stolu);


ALTER TABLE Wyniki ADD CONSTRAINT Wyniki_Partia
    FOREIGN KEY (Id_wyniku_partii)
    REFERENCES Partia (Id_partii);


ALTER TABLE Zawodnicy ADD CONSTRAINT Zawodnicy_Klub_szachowy
    FOREIGN KEY (Klub_szachowy_id_klubu)
    REFERENCES Klub_szachowy (id_klubu);



--Klub szachowy

INSERT INTO Klub_szachowy (id_klubu,Nazwa_klubu, Miasto, Adres)
VALUES (1,'Szara Furia', 'Lomianki', 'Ekologiczna 11');

INSERT INTO Klub_szachowy (id_klubu,Nazwa_klubu, Miasto, Adres)
VALUES (2,'Iskra Szydlowo', 'Sulejowek', ' Owcza 23');

INSERT INTO Klub_szachowy (id_klubu,Nazwa_klubu, Miasto, Adres)
VALUES (3,'Bociany Baniocha', 'Kutno', 'Notecka 51');

INSERT INTO Klub_szachowy (id_klubu,Nazwa_klubu, Miasto, Adres)
VALUES (4,'RKS Rakow', 'Grodzisk Mazowiecki', 'Lesna 5');

INSERT INTO Klub_szachowy (id_klubu,Nazwa_klubu, Miasto, Adres)
VALUES (5,'Mazur Elk', 'Elk', 'Bartnicza 10');

--Kategorie szachowe

INSERT INTO Kategorie_szachowe (Numer_kategorii, Granica1, Granica2)
VALUES (6, 950, 1050);

INSERT INTO Kategorie_szachowe (Numer_kategorii, Granica1, Granica2)
VALUES (5, 1150, 1250);

INSERT INTO Kategorie_szachowe (Numer_kategorii, Granica1, Granica2)
VALUES (4, 1350, 1450);

INSERT INTO Kategorie_szachowe (Numer_kategorii, Granica1, Granica2)
VALUES (3, 1550, 1650);

INSERT INTO Kategorie_szachowe (Numer_kategorii, Granica1, Granica2)
VALUES (2, 1750, 1850);

INSERT INTO Kategorie_szachowe (Numer_kategorii, Granica1, Granica2)
VALUES (1, 1950, 2050);

--Osoba

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (1, 'Jan', 'Kowalski', '1998-05-12');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (2, 'Anna', 'Nowak', '1991-09-03');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (3, 'Michal', 'Wisniewski', '2005-02-28');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (4, 'Karolina', 'Jankowska', '1996-07-15');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (5, 'Piotr', 'Nowicki', '1993-12-18');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (6, 'Katarzyna', 'Wozniak', '2000-09-21');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (7, 'Tomasz', 'Kowalczyk', '1994-03-07');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (8, 'Magdalena', 'Mazur', '1989-11-30');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (9, 'Pawel', 'Lewandowski', '2001-06-02');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (10, 'Monika', 'Adamczyk', '1995-08-11');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (11, 'Robert', 'Kaczmarek', '1990-04-25');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (12, 'Natalia', 'Wojcik', '1997-01-09');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (13, 'Marcin', 'Kruk', '1999-10-14');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (14, 'Alicja', 'Szymanska', '1994-06-28');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (15, 'Grzegorz', 'Kowal', '1989-03-04');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (16, 'Olga', 'Zajac', '1996-09-17');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (17, 'John', 'Smith', '1981-10-20');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (18, 'Maria', 'Garcia', '1974-02-07');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (19, 'Ivan', 'Petrov', '1995-09-10');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (20, 'Cristina', 'Silva', '1964-04-22');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (21, 'Adam', 'Nowak', '1986-01-01');

INSERT INTO Osoba (Id_osoby, Imie, Nazwisko, Data_urodzenia)
VALUES (22, 'Anna', 'Kowalska', '1990-01-28');

--

--ARBITRZY

INSERT INTO Arbitrzy (Id_arbitra, Kraj, Doswiadczenie, Arbitrzy_pomoc)
VALUES (17, 'USA', 'International Arbiter', NULL);

INSERT INTO Arbitrzy (Id_arbitra, Kraj, Doswiadczenie, Arbitrzy_pomoc)
VALUES (18, 'Hiszpania', 'FIDE Master', NULL);

INSERT INTO Arbitrzy (Id_arbitra, Kraj, Doswiadczenie, Arbitrzy_pomoc)
VALUES (19, 'Rosja', 'International Arbiter', NULL);

INSERT INTO Arbitrzy (Id_arbitra, Kraj, Doswiadczenie, Arbitrzy_pomoc)
VALUES (20, 'Portugalia', 'FIDE Arbiter', NULL);

INSERT INTO Arbitrzy (Id_arbitra, Kraj, Doswiadczenie, Arbitrzy_pomoc)
VALUES (21, 'Polska', 'FIDE Master', 17);

INSERT INTO Arbitrzy (Id_arbitra, Kraj, Doswiadczenie, Arbitrzy_pomoc)
VALUES (22, 'Polska', 'FIDE Arbiter', 18);

--ZAWODNICY

-- ZAWODNICY
INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (1, 1800, 2);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (2, 1400, 1);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (3, 1600, 4);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (4, 1950, 3);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (5, 1600, 1);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (6, 1000, 5);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (7, 1600, 4);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (8, 1400, 1);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (9, 1750, 2);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (10, 1950, 5);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (11, 1600, 2);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (12, 1600, 3);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (13, 1800, 3);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (14, 2000, 5);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (15, 1800, 4);

INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu)
VALUES (16, 1950, 1);

--RUNDA
INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('1', '2023-02-04 12:00:00', '2023-02-04 15:00:00', '2023-02-04');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('2', '2023-02-11 12:00:00', '2023-02-11 15:00:00', '2023-02-11');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('3', '2023-02-18 10:00:00', '2023-02-18 13:00:00', '2023-02-18');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('4', '2023-02-25 11:00:00', '2023-02-25 14:00:00', '2023-02-25');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('5', '2023-03-04 12:00:00', '2023-03-04 15:00:00', '2023-03-04');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('6', '2023-03-11 16:00:00', '2023-03-11 19:00:00', '2023-03-11');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('7', '2023-03-18 14:00:00', '2023-03-18 17:00:00', '2023-03-18');

INSERT INTO Runda (Numer_rundy, Godzina_rozpoczecia, Godzina_zakonczenia, Data)
VALUES ('8', '2023-03-25 15:00:00', '2023-03-25 18:00:00', '2023-03-25');


--STOLY
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('1','A1');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('2','A2');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('3','A3');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('4','B1');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('5','B2');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('6','B3');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('7','C1');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('8','C2');
INSERT INTO Stoly (Id_stolu, Pozycja_na_sali)
    VALUES          ('9','C3');




--PARTIA

--runda 1
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (1, 1, 2, 17, 1, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (2, 3, 4, 18, 1, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (3, 5, 6, 19, 1, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (4, 7, 8, 20, 1, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (5, 9, 10, 21, 1, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (6, 11, 12, 22, 1, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (7, 13, 14, 17, 1, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (8, 15, 16, 18, 1, 8);

--runda 2
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (9, 1, 3, 19, 2, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (10, 2, 4, 20, 2, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (11, 5, 7, 21, 2, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (12, 6, 8, 22, 2, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (13, 9, 11, 17, 2, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (14, 10, 12, 18, 2, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (15, 13, 15, 19, 2, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (16, 14, 16, 20, 2, 8);

--runda 3
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (17, 4, 1, 21, 3, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (18, 2, 5, 22, 3, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (19, 3, 6, 17, 3, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (20, 7, 9, 18, 3, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (21, 10, 13, 19, 3, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (22, 11, 14, 20, 3, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (23, 12, 15, 21, 3, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (24, 8, 16, 22, 3, 8);

--runda 4
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (25, 5, 1, 17, 4, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (26, 6, 2, 18, 4, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (27, 8, 3, 19, 4, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (28, 4, 9, 20, 4, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (29, 15, 7, 21, 4, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (30, 16, 11, 22, 4, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (31, 12, 13, 17, 4, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (32, 14, 10, 18, 4, 8);


--runda 5
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (33, 1, 7, 19, 5, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (34, 2, 8, 20, 5, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (35, 3, 9, 21, 5, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (36, 4, 10, 22, 5, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (37, 5, 11, 17, 5, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (38, 6, 12, 18, 5, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (39, 13, 16, 19, 5, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (40, 14, 15, 20, 5, 8);

--runda 6
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (41, 8, 1, 21, 6, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (42, 10, 2, 22, 6, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (43, 15, 3, 17, 6, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (44, 4, 14, 18, 6, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (45, 13, 5, 19, 6, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (46, 11, 6, 20, 6, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (47, 12, 7, 21, 6, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (48, 9, 16, 22, 6, 8);

--runda 7
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (49, 1, 9, 17, 7, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (50, 2, 13, 18, 7, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (51, 14, 11, 19, 7, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (52, 16, 8, 20, 7, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (53, 3, 10, 21, 7, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (54, 5, 15, 22, 7, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (55, 6, 12, 17, 7, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (56, 7, 4, 18, 7, 8);

--runda 8
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (57, 13, 1, 19, 8, 1);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (58, 12, 2, 20, 8, 2);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (59, 11, 3, 21, 8, 3);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (60, 4, 16, 22, 8, 4);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (61, 9, 5, 17, 8, 5);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (62, 15, 6, 18, 8, 6);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (63, 10, 7, 19, 8, 7);
INSERT INTO Partia (Id_partii, Zawodnik_biale, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_numer_rundy, Stoly_id_stolu)
VALUES (64, 8, 14, 20, 8, 8);


-- WYNIKI
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (1, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (2, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (3, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (4, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (5, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (6, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (7, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (8, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (9, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (10, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (11, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (12, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (13, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (14, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (15, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (16, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (17, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (18, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (19, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (20, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (21, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (22, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (23, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (24, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (25, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (26, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (27, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (28, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (29, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (30, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (31, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (32, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (33, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (34, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (35, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (36, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (37, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (38, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (39, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (40, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (41, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (42, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (43, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (44, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (45, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (46, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (47, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (48, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (49, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (50, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (51, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (52, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (53, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (54, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (55, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (56, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (57, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (58, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (59, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (60, 0.5, 0.5);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (61, 0, 1);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (62, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (63, 1, 0);
INSERT INTO Wyniki (Id_wyniku_partii, Biale_wynik, Czarne_wynik)
VALUES (64, 1, 0);

