
    -- sprawdzanie zawodników z daną kategorią szachową
    
    DELIMITER $$
    CREATE PROCEDURE ZAWODNIK_KATEGORIA(IN nr_kategorii INT)
    BEGIN 
    SELECT a.IMIE, a.NAZWISKO, c.NUMER_KATEGORII
	FROM OSOBA a
    JOIN ZAWODNICY b ON a.ID_OSOBY = b.OSOBA_ID_OSOBY
    JOIN KATEGORIE_SZACHOWE c ON c.GRANICA1<=b.RANKING_SZACHOWY AND c.GRANICA2>=b.RANKING_SZACHOWY
    WHERE c.numer_kategorii=nr_kategorii;
    END$$
    DELIMITER ;
    
    CALL ZAWODNIK_KATEGORIA(3);
    
    -- dopisywanie zawodników do bazy danych
    
    DELIMITER $$
    CREATE PROCEDURE RejestrujZawodnika(
    IN imie VARCHAR(255),
    IN nazwisko VARCHAR(255),
    IN data_uro DATE,
    IN ranking INT,
    IN klub VARCHAR(255)
)
BEGIN
    INSERT INTO Osoba (Imie, Nazwisko, data_urodzenia)
    VALUES (imie, nazwisko, data_uro);
    
    SET @osoba_id = LAST_INSERT_ID();
    
    INSERT INTO Zawodnicy (Osoba_Id_osoby, ranking_szachowy, Klub_szachowy_Nazwa_klubu)
    VALUES (@osoba_id, ranking, klub);
    SELECT 'ZAWODNIK ZAREJESTROWANY' AS message;
END$$
DELIMITER ;
    
CALL RejestrujZawodnika('Joseph','Blazkowicz','1998-08-12',1800,'Szara Furia');


-- przedstawiciele klubów

DELIMITER $$
CREATE PROCEDURE CzlonkowieKlubu(IN nazwaKlubu varchar(255))
BEGIN
SELECT a.Imie, a.Nazwisko, c.Nazwa_klubu
FROM OSOBA a 
JOIN ZAWODNICY b ON a.Id_osoby=b.Osoba_Id_osoby
JOIN klub_szachowy c ON c.Nazwa_klubu=b.Klub_szachowy_Nazwa_klubu
WHERE c.Nazwa_klubu=nazwaKlubu;
END$$
DELIMITER ;
 
 CALL CzlonkowieKlubu('Szara Furia');
 
 -- podanie błędnego rankingu
 
 DELIMITER $$
 CREATE TRIGGER check_rank
 BEFORE INSERT ON zawodnicy
 FOR EACH ROW
 BEGIN
	IF NEW.ranking_szachowy<1000 OR NEW.ranking_szachowy is NULL then
		SET NEW.ranking_szachowy = 1000;
	END IF;
END $$
DELIMITER ;
 
CALL RejestrujZawodnika('Michael','Myers','1978-10-31',300,'RKS Raków');


