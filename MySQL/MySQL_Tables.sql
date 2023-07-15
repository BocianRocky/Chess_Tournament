CREATE DATABASE turniej_szachowy;
USE turniej_szachowy;
-- tables


-- Table: Kategorie_szachowe
CREATE TABLE Kategorie_szachowe (
    Numer_kategorii integer  NOT NULL,
    granica1 integer  NOT NULL,
    granica2 integer  NOT NULL,
    CONSTRAINT Kategorie_szachowe_pk PRIMARY KEY (Numer_kategorii)
) ;

-- Table: Klub_szachowy
CREATE TABLE Klub_szachowy (
    Nazwa_klubu varchar(255)  NOT NULL,
    miasto varchar(255)  NOT NULL,
    Adres varchar(255)  NOT NULL,
    CONSTRAINT Klub_szachowy_pk PRIMARY KEY (Nazwa_klubu)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    Id_osoby integer  NOT NULL AUTO_INCREMENT,
    Imie varchar(255)  NOT NULL,
    Nazwisko varchar(255)  NOT NULL,
    data_urodzenia date  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (Id_osoby)
) ;

-- Table: Arbitrzy
CREATE TABLE Arbitrzy (
    Id_arbitra integer  NOT NULL AUTO_INCREMENT,
    Osoba_Id_osoby integer  NOT NULL,
    kraj varchar(255)  NOT NULL,
    doświadczenie varchar(255)  NOT NULL,
    Arbitrzy_Id_arbitra integer  NULL,
    CONSTRAINT Arbitrzy_pk PRIMARY KEY (Id_arbitra)
) ;

-- Table: Partia
CREATE TABLE Partia (
    Id_partii integer  NOT NULL,
    Zawodnik_białe integer  NOT NULL,
    Zawodnik_czarne integer  NOT NULL,
    Arbitrzy_Id_arbitra integer  NOT NULL,
    Runda_Numer_rundy integer  NOT NULL,
    stoły_id_stołu integer  NOT NULL,
    CONSTRAINT Partia_pk PRIMARY KEY (Id_partii)
) ;

-- Table: Runda
CREATE TABLE Runda (
    Numer_rundy integer  NOT NULL,
    godzina_rozpoczęcia timestamp  NOT NULL,
    godzina_zakończenia timestamp  NOT NULL,
    Data date  NOT NULL,
    CONSTRAINT Runda_pk PRIMARY KEY (Numer_rundy)
) ;

-- Table: Wyniki
CREATE TABLE Wyniki (
    id_wyniku integer  NOT NULL,
    Partia_Id_partii integer  NOT NULL,
    białe_wynik INT  NOT NULL,
    czarne_wynik INT  NOT NULL,
    CONSTRAINT Wyniki_pk PRIMARY KEY (id_wyniku)
) ;

-- Table: Zawodnicy
CREATE TABLE Zawodnicy (
    Id_zawodnika integer  NOT NULL AUTO_INCREMENT,
    Osoba_Id_osoby integer  NOT NULL,
    ranking_szachowy integer  NOT NULL,
    Klub_szachowy_Nazwa_klubu varchar(255)  NOT NULL,
    CONSTRAINT Zawodnicy_pk PRIMARY KEY (Id_zawodnika)
) ;

-- Table: stoły
CREATE TABLE stoły (
    id_stołu integer  NOT NULL,
    Pozycja_na_sali char(2)  NOT NULL,
    CONSTRAINT stoły_pk PRIMARY KEY (id_stołu)
) ;

-- foreign keys
-- Reference: Arbitrzy_Arbitrzy (table: Arbitrzy)
ALTER TABLE Arbitrzy ADD CONSTRAINT Arbitrzy_Arbitrzy
    FOREIGN KEY (Arbitrzy_Id_arbitra)
    REFERENCES Arbitrzy (Id_arbitra);

-- Reference: Arbitrzy_Osoba (table: Arbitrzy)
ALTER TABLE Arbitrzy ADD CONSTRAINT Arbitrzy_Osoba
    FOREIGN KEY (Osoba_Id_osoby)
    REFERENCES Osoba (Id_osoby);

-- Reference: Partia_Arbitrzy (table: Partia)
ALTER TABLE Partia ADD CONSTRAINT Partia_Arbitrzy
    FOREIGN KEY (Arbitrzy_Id_arbitra)
    REFERENCES Arbitrzy (Id_arbitra);

-- Reference: Partia_Runda (table: Partia)
ALTER TABLE Partia ADD CONSTRAINT Partia_Runda
    FOREIGN KEY (Runda_Numer_rundy)
    REFERENCES Runda (Numer_rundy);

-- Reference: Partia_Zadownicy1 (table: Partia)
ALTER TABLE Partia ADD CONSTRAINT Partia_Zadownicy1
    FOREIGN KEY (Zawodnik_czarne)
    REFERENCES Zawodnicy (Id_zawodnika);

-- Reference: Partia_Zadownicy2 (table: Partia)
ALTER TABLE Partia ADD CONSTRAINT Partia_Zadownicy2
    FOREIGN KEY (Zawodnik_białe)
    REFERENCES Zawodnicy (Id_zawodnika);

-- Reference: Partia_stoły (table: Partia)
ALTER TABLE Partia ADD CONSTRAINT Partia_stoły
    FOREIGN KEY (stoły_id_stołu)
    REFERENCES stoły (id_stołu);

-- Reference: Wyniki_Partia (table: Wyniki)
ALTER TABLE Wyniki ADD CONSTRAINT Wyniki_Partia
    FOREIGN KEY (Partia_Id_partii)
    REFERENCES Partia (Id_partii);

-- Reference: Zadownicy_Klub_szachowy (table: Zawodnicy)
ALTER TABLE Zawodnicy ADD CONSTRAINT Zadownicy_Klub_szachowy
    FOREIGN KEY (Klub_szachowy_Nazwa_klubu)
    REFERENCES Klub_szachowy (Nazwa_klubu);

-- Reference: Zawodnicy_Osoba (table: Zawodnicy)
ALTER TABLE Zawodnicy ADD CONSTRAINT Zawodnicy_Osoba
    FOREIGN KEY (Osoba_Id_osoby)
    REFERENCES Osoba (Id_osoby);



