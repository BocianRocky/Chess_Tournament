--Trigger 1
-- dodawanie zawodnika do tabeli ZAWODNICY
-- ranking nie moze byc NULL
-- ranking zawodnika musi miescic sie w granicach 950 a 2050
ALTER TRIGGER addZawodnik
ON Zawodnicy
AFTER INSERT,UPDATE
AS
DECLARE @zawodnik int, @ranking int, @klub int, @imie varchar(50), @nazwisko varchar(50);
SELECT @zawodnik=Id_zawodnika, @ranking=Ranking_szachowy, @klub=Klub_szachowy_id_klubu FROM inserted;
SELECT @imie=Imie, @nazwisko=Nazwisko FROM Osoba WHERE id_osoby=@zawodnik;
IF @ranking is NULL
    BEGIN
        ROLLBACK;
        INSERT INTO Zawodnicy (id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu) VALUES (@zawodnik, 1000, @klub);
        PRINT @Imie+' '+@nazwisko+' zostal dodany jako zawodnik z poczatkowym rankingiem';
    end
ELSE IF @ranking<950 OR @ranking>2050
    BEGIN
        RAISERROR('Podano bledny ranking',16,1);
        ROLLBACK;
    end
ELSE
PRINT @Imie+' '+@nazwisko+' zostal dodany jako zawodnik';
end;
INSERT INTO Zawodnicy (Id_zawodnika, Ranking_szachowy, Klub_szachowy_id_klubu) VALUES (20,1200,2);


--Trigger 2
-- dodawanie wyniku do tabeli WYNIKI
-- jesli wynik jest inny niz 0 lub 0,5 lub 1 to wystapi blad
-- jezeli wyniki beda w innej konfiguracaji od takiej (1:0, 0:1, 0,5:0,5)
-- wypisuje kto z kim wygral, przegral badz zremisowal
CREATE TRIGGER addWynik
ON Wyniki
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @id_wyniku_partii int, @wbiale decimal(3,2), @wczarne decimal(3,2);
    DECLARE @imie_biale varchar(30), @nazwisko_biale varchar(30), @imie_czarne varchar(30), @nazwisko_czarne varchar(30);
    SELECT @id_wyniku_partii=Id_wyniku_partii, @wbiale=Biale_wynik, @wczarne=Czarne_wynik FROM inserted;

    SELECT @imie_biale=Imie, @nazwisko_biale=Nazwisko FROM Osoba o
    JOIN Zawodnicy Z on o.Id_osoby = Z.Id_zawodnika
    WHERE o.Id_osoby=(SELECT Id_zawodnika FROM Zawodnicy
                        WHERE Id_zawodnika IN (SELECT Zawodnik_biale FROM Partia WHERE Id_partii=@id_wyniku_partii));
    SELECT @imie_czarne=o.Imie, @nazwisko_czarne=o.Nazwisko FROM Osoba o
    JOIN Zawodnicy z on o.Id_osoby = z.Id_zawodnika
    WHERE o.Id_osoby=(SELECT Id_zawodnika FROM Zawodnicy
                        WHERE Id_zawodnika IN (SELECT Zawodnik_czarne FROM Partia WHERE Id_partii=@id_wyniku_partii));

    IF @wbiale NOT IN(0,0.5,1) OR @wczarne NOT IN(0,0.5,1)
        BEGIN
            RAISERROR('podano bledne wyniki',16,1);
            ROLLBACK;
        end
    IF (@wbiale=@wczarne AND @wbiale<>0.5) OR (@wbiale<>@wczarne AND (@wbiale=0.5 OR @wczarne=0))
        BEGIN
            RAISERROR ('wyniki sa niezgodne',16,1);
            ROLLBACK;
        end
    IF @wbiale=1
        BEGIN
            PRINT @imie_biale+' '+@nazwisko_biale+' wygrywa partie z '+@imie_czarne+' '+@nazwisko_czarne;
        end
    ELSE IF @wbiale=0
        BEGIN
            PRINT @imie_czarne+' '+@nazwisko_czarne+' wygrywa partie z '+@imie_biale+' '+@nazwisko_biale;
        end
    ELSE
            PRINT @imie_biale+' '+@nazwisko_biale+' remisuje z '+@imie_czarne+' '+@nazwisko_czarne;

end

--Trigger 3
-- dodawanie druzyny do tabeli KLUB_SZACHOWY
-- jesli istnieje klub z taka sama nazwa, klub nie zostanie dodany
-- jesli jest juz klub w tego samego miasta, klub nie zostanie dodany
CREATE TRIGGER addTeam
ON Klub_szachowy
INSTEAD OF INSERT
AS
BEGIN
DECLARE @id int, @nazwa varchar(30), @miasto varchar(30), @adres varchar(30);
SELECT  @nazwa=Nazwa_klubu, @miasto=Miasto, @adres=Adres FROM inserted;
SELECT @id=count(*)+1 FROM Klub_szachowy;
IF EXISTS (SELECT * FROM Klub_szachowy WHERE Nazwa_klubu=@nazwa)
    RAISERROR ('Podany klub juz jest zapisany w turnieju',16,1);
ELSE IF @miasto IN (SELECT Miasto FROM Klub_szachowy)
    RAISERROR ('Do turnieju moze byc przypisany tylko jeden klub z danego miasta',16,1);
ELSE
    BEGIN
    INSERT INTO Klub_szachowy (id_klubu, Nazwa_klubu, Miasto, Adres) VALUES (@id, @nazwa, @miasto, @adres);
    PRINT 'Klub szachowy zostal dodany do turnieju';
    END;
end


--Procedure 1
-- do procedury wpisujemy nr zajetego miejsca w turnieju
-- procedura zwraca idZawodnika oraz liczbe punktow
ALTER PROCEDURE checkPlace @id int
AS
BEGIN
DECLARE @idZawodnika int, @wyniki int, @count int=1;
DECLARE moj_kursor CURSOR FOR
SELECT ID_ZAWODNIKA, SUM(wynik) as wyniki
FROM(   SELECT a.Id_zawodnika, sum(Biale_wynik) as wynik
        FROM OSOBA Z JOIN ZAWODNICY a ON z.ID_OSOBY=a.Id_zawodnika
        JOIN PARTIA b ON a.ID_ZAWODNIKA=b.Zawodnik_biale OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
        JOIN WYNIKI c ON b.ID_PARTII=c.Id_wyniku_partii
        WHERE a.ID_ZAWODNIKA=b.Zawodnik_biale
        group by ID_ZAWODNIKA
        UNION
        SELECT a.ID_ZAWODNIKA, sum(CZARNE_WYNIK) as wynik
        FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.Zawodnik_biale OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
        JOIN WYNIKI c ON b.ID_PARTII=c.Id_wyniku_partii
        WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
        group by ID_ZAWODNIKA) as scores
GROUP BY ID_ZAWODNIKA
ORDER BY SUM(wynik) DESC;

OPEN moj_kursor;
FETCH NEXT FROM moj_kursor INTO @idZawodnika, @wyniki;

WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @idZawodnika=@id
         BEGIN
             PRINT 'Zawodnik zajal '+CAST(@count as varchar(5))+' miejsce w turnieju';
             PRINT 'zdobyl '+CAST(@wyniki as varchar(5))+' pkt';
         end
        SET @count=@count+1;
        FETCH NEXT FROM moj_kursor INTO @idZawodnika, @wyniki;
    end
CLOSE moj_kursor;
DEALLOCATE moj_kursor;
end

EXEC checkPlace 2;

--Procedure 2
-- do procedury wprowadzamy nr rundy
-- procedura zwraca wyniki zrobyte przez zawodnikow do tej rundy
CREATE PROCEDURE wynikiRundy @id_rundy int
AS
BEGIN
    PRINT 'Wyniki zawodnikow w '+CAST(@id_rundy AS varchar(5))+' rundy:';
    SELECT zawodnik, CASE WHEN wynik='1' THEN 'zwyciestwo' WHEN wynik='0.5' THEN 'porazka' ELSE 'remis' END as wynik
    FROM(
    SELECT p.Zawodnik_biale as 'zawodnik', w.Biale_wynik as 'wynik' FROM Partia p JOIN Wyniki w ON p.Id_partii=w.Id_wyniku_partii WHERE p.Runda_numer_rundy=@id_rundy
    UNION
    SELECT p.Zawodnik_czarne as 'zawodnik', w.Czarne_wynik as 'wynik' FROM Partia p JOIN Wyniki w ON p.Id_partii=w.Id_wyniku_partii WHERE p.Runda_numer_rundy=@id_rundy) as wyniki;
end

EXEC wynikiRundy 5;
EXEC wynikiRundy 7;









