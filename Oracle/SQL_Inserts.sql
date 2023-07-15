--KLUB SZACHOWY
INSERT INTO Klub_szachowy (Nazwa_klubu, miasto, Adres)
    VALUES          ('Szara Furia', 'Łomianki', 'Ekologiczna 11');
INSERT INTO Klub_szachowy (Nazwa_klubu, miasto, Adres)
    VALUES          ('Iskra Szydłowo', 'Sulejówek', 'Łowcza 23');
INSERT INTO Klub_szachowy (Nazwa_klubu, miasto, Adres)
    VALUES          ('Bociany Baniocha', 'Kutno', 'Notecka 51');
INSERT INTO Klub_szachowy (Nazwa_klubu, miasto, Adres)
    VALUES          ('RKS Raków', 'Grodzisk Mazowiecki', 'Leśna 5');
INSERT INTO Klub_szachowy (Nazwa_klubu, miasto, Adres)
    VALUES          ('Mazur Ełk', 'Ełk', 'Bartnicza 10');


--KATEGORIE SZACHOWE
INSERT INTO Kategorie_szachowe (Numer_kategorii, granica1, granica2)
    VALUES          ('6',950,1050);
INSERT INTO Kategorie_szachowe (Numer_kategorii, granica1, granica2)
    VALUES          ('5',1150,1250);
INSERT INTO Kategorie_szachowe (Numer_kategorii, granica1, granica2)
    VALUES          ('4',1350,1450);
INSERT INTO Kategorie_szachowe (Numer_kategorii, granica1, granica2)
    VALUES          ('3',1550,1650);
INSERT INTO Kategorie_szachowe (Numer_kategorii, granica1, granica2)
    VALUES          ('2',1750,1850);
INSERT INTO Kategorie_szachowe (Numer_kategorii, granica1, granica2)
    VALUES          ('1',1950,2050);


--OSOBA
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (1, 'Jan', 'Kowalski', TO_DATE('1998-05-12', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (2, 'Anna', 'Nowak', TO_DATE('1991-09-03', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (3, 'Michał', 'Wiśniewski', TO_DATE('2005-02-28', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (4, 'Karolina', 'Jankowska', TO_DATE('1996-07-15', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (5, 'Piotr', 'Nowicki', TO_DATE('1993-12-18', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (6, 'Katarzyna', 'Woźniak', TO_DATE('2000-09-21', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (7, 'Tomasz', 'Kowalczyk', TO_DATE('1994-03-07', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (8, 'Magdalena', 'Mazur', TO_DATE('1989-11-30', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (9, 'Paweł', 'Lewandowski', TO_DATE('2001-06-02', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (10, 'Monika', 'Adamczyk', TO_DATE('1995-08-11', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (11, 'Robert', 'Kaczmarek', TO_DATE('1990-04-25', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (12, 'Natalia', 'Wójcik', TO_DATE('1997-01-09', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (13, 'Marcin', 'Kruk', TO_DATE('1999-10-14', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (14, 'Alicja', 'Szymańska', TO_DATE('1994-06-28', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (15, 'Grzegorz', 'Kowal', TO_DATE('1989-03-04', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (16, 'Olga', 'Zając', TO_DATE('1996-09-17', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (17, 'John', 'Smith', TO_DATE('1981-10-20', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (18, 'Maria', 'Garcia', TO_DATE('1974-02-07', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (19, 'Ivan', 'Petrov', TO_DATE('1995-09-10', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (20, 'Cristina', 'Silva', TO_DATE('1964-04-22', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (21, 'Adam', 'Nowak', TO_DATE('1986-01-01', 'YYYY-MM-DD'));
INSERT INTO OSOBA (Id_osoby, Imie, Nazwisko, data_urodzenia)
    VALUES (22, 'Anna', 'Kowalska', TO_DATE('1990-01-28', 'YYYY-MM-DD'));


--ARBITRZY
INSERT INTO Arbitrzy (Id_arbitra, OSOBA_ID_OSOBY, kraj, doświadczenie, Arbitrzy_Id_arbitra)
VALUES (3, 17, 'USA', 'International Arbiter', NULL);
INSERT INTO Arbitrzy (Id_arbitra, OSOBA_ID_OSOBY, kraj, doświadczenie, Arbitrzy_Id_arbitra)
VALUES (4, 18, 'Hiszpania', 'FIDE Master', NULL);
INSERT INTO Arbitrzy (Id_arbitra, OSOBA_ID_OSOBY, kraj, doświadczenie, Arbitrzy_Id_arbitra)
VALUES (5, 19, 'Rosja', 'International Arbiter', NULL);
INSERT INTO Arbitrzy (Id_arbitra, OSOBA_ID_OSOBY, kraj, doświadczenie, Arbitrzy_Id_arbitra)
VALUES (6, 20, 'Portugalia', 'FIDE Arbiter', NULL);
INSERT INTO Arbitrzy (Id_arbitra, OSOBA_ID_OSOBY, kraj, doświadczenie, Arbitrzy_Id_arbitra)
VALUES (1, 21, 'Polska', 'FIDE Master', 5);
INSERT INTO Arbitrzy (Id_arbitra, OSOBA_ID_OSOBY, kraj, doświadczenie, Arbitrzy_Id_arbitra)
VALUES (2, 22, 'Polska', 'FIDE Arbiter', 6);


--ZAWODNICY
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (1, 1, 1800, 'Szara Furia');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (2, 2, 1400, 'Iskra Szydłowo');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (3, 3, 1600, 'Bociany Baniocha');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (4, 4, 1950, 'RKS Raków');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (5, 5, 1600, 'Mazur Ełk');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (6, 6, 1000, 'Szara Furia');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (7, 7, 1600, 'Iskra Szydłowo');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (8, 8, 1400, 'Bociany Baniocha');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (9, 9, 1750, 'RKS Raków');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (10, 10, 1950, 'Mazur Ełk');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (11, 11, 1600, 'Szara Furia');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (12, 12, 1600, 'Iskra Szydłowo');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (13, 13, 1800, 'Bociany Baniocha');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (14, 14, 2000, 'RKS Raków');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (15, 15, 1800, 'Mazur Ełk');
INSERT INTO Zawodnicy (Id_zawodnika, OSOBA_ID_OSOBY,ranking_szachowy, Klub_szachowy_Nazwa_klubu)
	VALUES (16, 16, 1950, 'Szara Furia');


--RUNDA
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('1', TO_TIMESTAMP('2023-02-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-04', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('2', TO_TIMESTAMP('2023-02-11 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-11 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-11', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('3', TO_TIMESTAMP('2023-02-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-18 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-18', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('4', TO_TIMESTAMP('2023-02-25 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-02-25 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-25', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('5', TO_TIMESTAMP('2023-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-04', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('6', TO_TIMESTAMP('2023-03-11 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-11 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-11', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('7', TO_TIMESTAMP('2023-03-18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-18 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-18', 'YYYY-MM-DD'));
INSERT INTO Runda (Numer_rundy, godzina_rozpoczęcia, godzina_zakończenia, Data)
VALUES ('8', TO_TIMESTAMP('2023-03-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-03-25', 'YYYY-MM-DD'));


--STOŁY
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('1','A1');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('2','A2');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('3','A3');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('4','B1');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('5','B2');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('6','B3');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('7','C1');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('8','C2');
INSERT INTO Stoły (Id_stołu, Pozycja_na_sali)
    VALUES          ('9','C3');




--PARTIA

--runda 1
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (1, 1, 2, 1, 1, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (2, 3, 4, 2, 1, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (3, 5, 6, 3, 1, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (4, 7, 8, 4, 1, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (5, 9, 10, 1, 1, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (6, 11, 12, 2, 1, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (7, 13, 14, 3, 1, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (8, 15, 16, 4, 1, 8);

--runda 2
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (9, 1, 3, 1, 2, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (10, 2, 4, 2, 2, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (11, 5, 7, 3, 2, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (12, 6, 8, 4, 2, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (13, 9, 11, 1, 2, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (14, 10, 12, 2, 2, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (15, 13, 15, 3, 2, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (16, 14, 16, 4, 2, 8);

--runda 3
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (17, 4, 1, 1, 3, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (18, 2, 5, 2, 3, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (19, 3, 6, 3, 3, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (20, 7, 9, 4, 3, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (21, 10, 13, 1, 3, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (22, 11, 14, 2, 3, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (23, 12, 15, 3, 3, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (24, 8, 16, 4, 3, 8);

--runda 4
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (25, 5, 1, 1, 4, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (26, 6, 2, 2, 4, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (27, 8, 3, 3, 4, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (28, 4, 9, 4, 4, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (29, 15, 7, 1, 4, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (30, 16, 11, 2, 4, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (31, 12, 13, 3, 4, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (32, 14, 10, 4, 4, 8);

--runda 5
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (33, 1, 7, 1, 5, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (34, 2, 8, 2, 5, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (35, 3, 9, 3, 5, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (36, 4, 10, 4, 5, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (37, 5, 11, 1, 5, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (38, 6, 12, 2, 5, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (39, 13, 16, 3, 5, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (40, 14, 15, 4, 5, 8);

--runda 6
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (41, 8, 1, 1, 6, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (42, 10, 2, 2, 6, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (43, 15, 3, 3, 6, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (44, 4, 14, 4, 6, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (45, 13, 5, 1, 6, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (46, 11, 6, 2, 6, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (47, 12, 7, 3, 6, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (48, 9, 16, 4, 6, 8);

--runda 7
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (49, 1, 9, 1, 7, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (50, 2, 13, 2, 7, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (51, 14, 11, 3, 7, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (52, 16, 8, 4, 7, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (53, 3, 10, 1, 7, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (54, 5, 15, 2, 7, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (55, 6, 12, 3, 7, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (56, 7, 4, 4, 7, 8);

--runda 8
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (57, 13, 1, 1, 8, 1);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (58, 12, 2, 2, 8, 2);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (59, 11, 3, 3, 8, 3);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (60, 4, 16, 4, 8, 4);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (61, 9, 5, 1, 8, 5);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (62, 15, 6, 2, 8, 6);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (63, 10, 7, 3, 8, 7);
INSERT INTO Partia (Id_partii, Zawodnik_białe, Zawodnik_czarne, Arbitrzy_Id_arbitra, Runda_Numer_rundy, stoły_id_stołu)
VALUES (64, 8, 14, 4, 8, 8);


--WYNIKI
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (1, 1, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (2, 2, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (3, 3, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (4, 4, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (5, 5, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (6, 6, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (7, 7, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (8, 8, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (9, 9, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (10, 10, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (11, 11, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (12, 12, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (13, 13, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (14, 14, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (15, 15, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (16, 16, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (17, 17, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (18, 18, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (19, 19, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (20, 20, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (21, 21, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (22, 22, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (23, 23, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (24, 24, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (25, 25, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (26, 26, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (27, 27, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (28, 28, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (29, 29, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (30, 30, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (31, 31, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (32, 32, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (33, 33, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (34, 34, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (35, 35, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (36, 36, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (37, 37, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (38, 38, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (39, 39, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (40, 40, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (41, 41, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (42, 42, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (43, 43, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (44, 44, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (45, 45, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (46, 46, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (47, 47, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (48, 48, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (49, 49, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (50, 50, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (51, 51, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (52, 52, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (53, 53, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (54, 54, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (55, 55, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (56, 56, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (57, 57, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (58, 58, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (59, 59, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (60, 60, 0.5, 0.5);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (61, 61, 0, 1);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (62, 62, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (63, 63, 1, 0);
INSERT INTO Wyniki (id_wyniku, Partia_Id_partii, białe_wynik, czarne_wynik)
VALUES (64, 64, 1, 0);





