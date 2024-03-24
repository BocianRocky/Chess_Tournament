USE [2019SBD];

SELECT * FROM Arbitrzy;
SELECT * FROM Kategorie_szachowe;
SELECT * FROM Klub_szachowy;
SELECT * FROM Osoba;
SELECT * FROM Partia;
SELECT * FROM Runda;
SELECT * FROM stoly;
SELECT * FROM Wyniki;
SELECT * FROM Zawodnicy;


--zad 1
--który zawodnik zdobył najwięcej pkt w turnieju ( również z jakiego klubu jest)
SELECT a.IMIE, a.NAZWISKO, c.NAZWA_KLUBU
FROM OSOBA a JOIN ZAWODNICY b ON a.ID_OSOBY=b.Id_zawodnika
JOIN KLUB_SZACHOWY c on b.Klub_szachowy_id_klubu= c.id_klubu
WHERE ID_ZAWODNIKA= (SELECT ID_ZAWODNIKA
                    FROM(   SELECT ID_ZAWODNIKA, sum(Biale_wynik) as wyniki
                            FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.Zawodnik_biale OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                            JOIN WYNIKI c ON b.ID_PARTII=c.Id_wyniku_partii
                            WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_BIALE
                            group by ID_ZAWODNIKA
                            UNION
                            SELECT ID_ZAWODNIKA, sum(CZARNE_WYNIK) as wyniki
                            FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIALE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                            JOIN WYNIKI c ON b.ID_PARTII=c.Id_wyniku_partii
                            WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                            group by ID_ZAWODNIKA) as scores
                    GROUP BY ID_ZAWODNIKA
                    HAVING sum(wyniki) = (SELECT TOP(1) SUM(wynik)
                                         FROM(  SELECT ID_ZAWODNIKA as id, sum(c.Biale_wynik) as wynik
                                                FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.Zawodnik_biale OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                                                JOIN WYNIKI c ON b.ID_PARTII=c.Id_wyniku_partii
                                                WHERE a.ID_ZAWODNIKA=b.Zawodnik_biale
                                                group by ID_ZAWODNIKA
                                                UNION
                                                SELECT ID_ZAWODNIKA as id, sum(c.CZARNE_WYNIK) as wynik
                                                FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIALE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                                                JOIN WYNIKI c ON b.ID_PARTII=c.Id_wyniku_partii
                                                WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                                                group by ID_ZAWODNIKA) as scores
                                         group by id
                                         ORDER BY SUM(wynik) DESC));

--zad 2
--wyniki zawodnikow
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
GROUP BY ID_ZAWODNIKA;

--zad 3
-- jaką kategorie ma najwięcej zawodników
SELECT TOP(1) b.Numer_kategorii
FROM ZAWODNICY a JOIN KATEGORIE_SZACHOWE b ON a.RANKING_SZACHOWY>=b.GRANICA1 AND a.RANKING_SZACHOWY<=b.GRANICA2
GROUP BY b.NUMER_KATEGORII
ORDER BY count(*) DESC;

--zad 4
--jak miał na imie zawodnik, który grał na stole C1 w rundzie 5 i wygrał

SELECT IMIE, NAZWISKO
FROM OSOBA a JOIN ZAWODNICY b ON a.ID_OSOBY = b.Id_zawodnika
    JOIN PARTIA c ON b.ID_ZAWODNIKA = c.ZAWODNIK_BIALE OR ID_ZAWODNIKA=ZAWODNIK_CZARNE
    JOIN WYNIKI d ON d.Id_wyniku_partii=c.ID_PARTII
    JOIN RUNDA e ON e.NUMER_RUNDY=c.RUNDA_NUMER_RUNDY
    JOIN stoly f ON f.Id_stolu=c.Stoly_id_stolu
WHERE POZYCJA_NA_SALI='C1' and NUMER_RUNDY=5 and
      ((ZAWODNIK_CZARNE=b.ID_ZAWODNIKA and CZARNE_WYNIK=1) OR (Zawodnik_biale=b.ID_ZAWODNIKA and Biale_wynik=1));

--zad 5
--ile najmlodszy zawodnik miał remisów
SELECT a.ID_ZAWODNIKA, count(1) as "liczba remisów"
FROM  ZAWODNICY a JOIN PARTIA b on a.ID_ZAWODNIKA = b.Zawodnik_biale OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
JOIN WYNIKI c on b.ID_PARTII = c.Id_wyniku_partii
WHERE BIALE_WYNIK =0.5 AND a.ID_ZAWODNIKA = (SELECT ID_ZAWODNIKA
                                            FROM OSOBA a JOIN ZAWODNICY b on a.ID_OSOBY = b.Id_zawodnika
                                            WHERE data_urodzenia = (SELECT max(data_urodzenia)
                                            FROM OSOBA))
GROUP BY a.ID_ZAWODNIKA;


--zad 6
--pokaz rezultaty partii zawodnika z najgorszą kategorią na stole A2
SELECT a.ID_ZAWODNIKA, d.id_stolu, c.Biale_wynik, c.CZARNE_WYNIK
FROM ZAWODNICY a JOIN PARTIA b on a.ID_ZAWODNIKA = b.Zawodnik_biale OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
JOIN WYNIKI c on b.ID_PARTII = c.Id_wyniku_partii JOIN stoly d on b.Stoly_id_stolu = d.Id_stolu
WHERE d.POZYCJA_NA_SALI= 'A2' AND RANKING_SZACHOWY = (SELECT min(RANKING_SZACHOWY)
                            FROM ZAWODNICY);

--zad 7
-- ilu mamy zawodników z pierwszą kategorią w poszczególnych klubach
SELECT c.Nazwa_klubu, count(1) "liczba zawodników z 1 kategorią"
FROM OSOBA a JOIN ZAWODNICY b on a.ID_OSOBY = b.Id_zawodnika
    JOIN KLUB_SZACHOWY c on b.Klub_szachowy_id_klubu = c.id_klubu
    JOIN KATEGORIE_SZACHOWE d ON b.RANKING_SZACHOWY>=d.GRANICA1 AND b.RANKING_SZACHOWY<=GRANICA2
WHERE NUMER_KATEGORII=1
GROUP BY NAZWA_KLUBU;


--zad 8
--ile było remisów rundzie 4
SELECT NUMER_RUNDY, count(1) as 'ilosc remisow'
FROM RUNDA a JOIN PARTIA b ON a.NUMER_RUNDY=b.RUNDA_NUMER_RUNDY
JOIN WYNIKI c ON b.ID_PARTII = c.Id_wyniku_partii
WHERE CZARNE_WYNIK=0.5 AND NUMER_RUNDY=4
GROUP BY NUMER_RUNDY;


--zad 9
--w jakim klubie gra anna nowak
SELECT c.NAZWA_KLUBU
FROM OSOBA a JOIN ZAWODNICY b ON a.ID_OSOBY=b.ID_ZAWODNIKA
JOIN KLUB_SZACHOWY c on b.Klub_szachowy_id_klubu = c.id_klubu
WHERE a.IMIE = 'Anna' AND a.NAZWISKO = 'Nowak';


--zad 10
--w którym klubie jest najmniej zawodników
SELECT a.NAZWA_KLUBU
FROM KLUB_SZACHOWY a JOIN ZAWODNICY b ON a.id_klubu= b.Klub_szachowy_id_klubu
JOIN OSOBA c ON b.Id_zawodnika = c.ID_OSOBY
GROUP BY a.NAZWA_KLUBU
HAVING count(1) IN (SELECT TOP(1) count(1)
                    FROM KLUB_SZACHOWY a JOIN ZAWODNICY b ON a.id_klubu = b.Klub_szachowy_id_klubu
                    JOIN OSOBA c ON b.Id_zawodnika = c.ID_OSOBY
                    GROUP BY a.NAZWA_KLUBU
                    ORDER BY count(1) ASC);
