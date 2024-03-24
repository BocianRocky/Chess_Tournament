
--PROCEDURE 1
-- do procedury wprowadzamy nr rundy
-- procedura zwraca nam kto zajmuje pierwsze miejsce w danej rundzie
CREATE OR REPLACE PROCEDURE KtoProwadziWRundzie
(
    v_runda int
)
AS
    v_zawodnik ZAWODNICY.ID_ZAWODNIKA%type;
    v_pkt number(4,2);
BEGIN
    SELECT ID_ZAWODNIKA, SUM(wynik) INTO v_zawodnik, v_pkt
FROM(
SELECT z.ID_ZAWODNIKA, SUM(w.BIALE_WYNIK) as wynik
FROM ZAWODNICY z JOIN PARTIA p ON z.ID_ZAWODNIKA=p.ZAWODNIK_BIALE OR z.ID_ZAWODNIKA=p.ZAWODNIK_CZARNE
    JOIN WYNIKI w ON p.ID_PARTII = w.ID_WYNIKU_PARTII
WHERE p.ZAWODNIK_BIALE=z.ID_ZAWODNIKA AND RUNDA_NUMER_RUNDY<=v_runda GROUP BY z.ID_ZAWODNIKA
UNION
SELECT z.ID_ZAWODNIKA, SUM(w.CZARNE_WYNIK) as wynik
FROM ZAWODNICY z JOIN PARTIA p ON z.ID_ZAWODNIKA=p.ZAWODNIK_BIALE OR z.ID_ZAWODNIKA=p.ZAWODNIK_CZARNE
    JOIN WYNIKI w ON p.ID_PARTII = w.ID_WYNIKU_PARTII
WHERE p.ZAWODNIK_CZARNE=z.ID_ZAWODNIKA AND RUNDA_NUMER_RUNDY<=v_runda GROUP BY z.ID_ZAWODNIKA)
GROUP BY ID_ZAWODNIKA
ORDER BY SUM(wynik) DESC
FETCH FIRST 1 ROW ONLY;
DBMS_OUTPUT.PUT_LINE('W rundzie nr: '||v_runda||' prowadzi zawodnik z id: '||v_zawodnik||' z iloscia punktow: '||v_pkt);
end;
    BEGIN
        KtoProwadziWRundzie(3);
    end;

--PROCEDURE 2
-- procedura jest bezparametrowa
-- procedura wypisze dla kazdego zawodnika ktory zdobyl wiecej niz 3,5 pkt czy awansowal
CREATE PROCEDURE awans
AS
CURSOR promo IS (SELECT ID_ZAWODNIKA, SUM(wynik)
FROM(
SELECT z.ID_ZAWODNIKA, SUM(w.BIALE_WYNIK) as wynik
FROM ZAWODNICY z JOIN PARTIA p ON z.ID_ZAWODNIKA=p.ZAWODNIK_BIALE OR z.ID_ZAWODNIKA=p.ZAWODNIK_CZARNE
    JOIN WYNIKI w ON p.ID_PARTII = w.ID_WYNIKU_PARTII
WHERE p.ZAWODNIK_BIALE=z.ID_ZAWODNIKA GROUP BY z.ID_ZAWODNIKA
UNION
SELECT z.ID_ZAWODNIKA, SUM(w.CZARNE_WYNIK) as wynik
FROM ZAWODNICY z JOIN PARTIA p ON z.ID_ZAWODNIKA=p.ZAWODNIK_BIALE OR z.ID_ZAWODNIKA=p.ZAWODNIK_CZARNE
    JOIN WYNIKI w ON p.ID_PARTII = w.ID_WYNIKU_PARTII
WHERE p.ZAWODNIK_CZARNE=z.ID_ZAWODNIKA GROUP BY z.ID_ZAWODNIKA)
GROUP BY ID_ZAWODNIKA);

v_zawodnik ZAWODNICY.ID_ZAWODNIKA%type;
v_pkt number(4,2);
v_imie OSOBA.IMIE%type;
v_nazwisko OSOBA.NAZWISKO%type;
BEGIN
    OPEN promo;
    LOOP
        FETCH promo INTO v_zawodnik, v_pkt;
        EXIT WHEN promo%NOTFOUND;
        SELECT IMIE, NAZWISKO INTO v_imie, v_nazwisko FROM OSOBA WHERE ID_OSOBY=v_zawodnik;
        IF v_pkt >=4 THEN
            UPDATE ZAWODNICY SET RANKING_SZACHOWY=RANKING_SZACHOWY+200 WHERE ID_ZAWODNIKA=v_zawodnik;
            DBMS_OUTPUT.PUT_LINE(v_imie||' '||v_nazwisko||' - Gratulujemy awansu na nastepna kategorie');
        ELSE
            DBMS_OUTPUT.PUT_LINE(v_imie||' '||v_nazwisko||' - Niestety nie udalo sie awansowac');
        end if;


    END LOOP;
end;

BEGIN
    awans();
END;


--TRIGGER 1
-- (INSERT) jezeli dwoch zawodnikow grali juz ze soba, wystapi blad
-- (DELETE) usunie rekordy powiazne w tabeli podrzednej
-- (UPDATE) nie mozna aktualizowac tabeli
CREATE OR REPLACE TRIGGER TR_Partia_BDUIR
BEFORE DELETE OR UPDATE OR INSERT
ON Partia
FOR EACH ROW
DECLARE
v_ctn_czyist int;
BEGIN
    SELECT count(*) INTO v_ctn_czyist FROM Partia WHERE (ZAWODNIK_BIALE=:NEW.Zawodnik_biale AND ZAWODNIK_CZARNE=:NEW.Zawodnik_CZARNE) OR (ZAWODNIK_BIALE=:NEW.Zawodnik_CZARNE AND ZAWODNIK_CZARNE=:NEW.Zawodnik_biale);
    IF DELETING THEN
    DELETE FROM WYNIKI WHERE ID_WYNIKU_PARTII=:OLD.Id_partii;
    DBMS_OUTPUT.PUT_LINE('Usunieto partie o id: '||:OLD.Id_Partii);
    ELSIF UPDATING THEN
        RAISE_APPLICATION_ERROR(-20001,'nie mozna aktualizowac rekordow');
    ELSIF v_ctn_czyist >0 THEN
        RAISE_APPLICATION_ERROR(-20001,'Zawodnicy grali juz ze soba partie');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Dodano partie o id: '||:NEW.Id_Partii);
        END if;
end;

--TRIGGER 2
-- (INSERT) jezeli ranking jest rowny NULL, wystapi blad
-- (UPDATE) jezeli ranking jest mniejszy od 950, wystapi blad
-- (DELTE) jezeli usuniemy zawodnika, usunie to rowniez rekordy powiazne z tabeli podrzednej
CREATE OR REPLACE TRIGGER TR_Zawodnicy_BDUIR
BEFORE DELETE OR UPDATE OR INSERT
ON ZAWODNICY
FOR EACH ROW
BEGIN
    IF INSERTING AND :NEW.RANKING_SZACHOWY is NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'trzeba ustawic jakikolwiek ranking');
    end if;
    IF UPDATING AND :NEW.RANKING_SZACHOWY<950 THEN
        RAISE_APPLICATION_ERROR(-20001, 'za niski ranking');
    end if;
    IF DELETING THEN
        DELETE FROM Partia WHERE ZAWODNIK_CZARNE=:OLD.id_zawodnika OR ZAWODNIK_BIALE=:OLD.id_zawodnika;
    end if;
end;