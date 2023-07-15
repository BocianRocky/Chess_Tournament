--zad 1
--który zawodnik zdobył najwięcej pkt w turnieju ( również z jakiego klubu jest)
SELECT a.IMIE, a.NAZWISKO, c.NAZWA_KLUBU
FROM OSOBA a JOIN ZAWODNICY b ON a.ID_OSOBY=b.OSOBA_ID_OSOBY
JOIN KLUB_SZACHOWY c on b.KLUB_SZACHOWY_NAZWA_KLUBU = c.NAZWA_KLUBU
WHERE ID_ZAWODNIKA= (SELECT ID_ZAWODNIKA
                    FROM(   SELECT ID_ZAWODNIKA, sum(BIAŁE_WYNIK) as wyniki
                            FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                            JOIN WYNIKI c ON b.ID_PARTII=c.PARTIA_ID_PARTII
                            WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE
                            group by ID_ZAWODNIKA
                            UNION
                            SELECT ID_ZAWODNIKA, sum(CZARNE_WYNIK) as wyniki
                            FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                            JOIN WYNIKI c ON b.ID_PARTII=c.PARTIA_ID_PARTII
                            WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                            group by ID_ZAWODNIKA)
                    GROUP BY ID_ZAWODNIKA
                    HAVING sum(wyniki) = (SELECT max(SUM(wynik))
                                         FROM(   SELECT ID_ZAWODNIKA, sum(c.BIAŁE_WYNIK) as wynik
                                                FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                                                JOIN WYNIKI c ON b.ID_PARTII=c.PARTIA_ID_PARTII
                                                WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE
                                                group by ID_ZAWODNIKA
                                                UNION
                                                SELECT ID_ZAWODNIKA, sum(c.CZARNE_WYNIK) as wynik
                                                FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                                                JOIN WYNIKI c ON b.ID_PARTII=c.PARTIA_ID_PARTII
                                                WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
                                                group by ID_ZAWODNIKA)
                                            GROUP BY ID_ZAWODNIKA));


--zad 2
--wyniki zawodnikow
SELECT ID_ZAWODNIKA, SUM(wynik)
FROM(   SELECT ID_ZAWODNIKA, sum(BIAŁE_WYNIK) as wynik
        FROM OSOBA Z JOIN ZAWODNICY a ON z.ID_OSOBY=a.OSOBA_ID_OSOBY
        JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
        JOIN WYNIKI c ON b.ID_PARTII=c.PARTIA_ID_PARTII
        WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE
        group by ID_ZAWODNIKA
        UNION
        SELECT ID_ZAWODNIKA, sum(CZARNE_WYNIK) as wynik
        FROM ZAWODNICY a JOIN PARTIA b ON a.ID_ZAWODNIKA=b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
        JOIN WYNIKI c ON b.ID_PARTII=c.PARTIA_ID_PARTII
        WHERE a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
        group by ID_ZAWODNIKA)
GROUP BY ID_ZAWODNIKA;



--zad 3
-- jaką kategorie ma najwięcej zawodników
SELECT b.NUMER_KATEGORII
FROM ZAWODNICY a JOIN KATEGORIE_SZACHOWE b ON a.RANKING_SZACHOWY>=b.GRANICA1 AND a.RANKING_SZACHOWY<=b.GRANICA2
GROUP BY b.NUMER_KATEGORII
HAVING count(1) = (SELECT max(count(1))
                    FROM ZAWODNICY a JOIN KATEGORIE_SZACHOWE b ON a.RANKING_SZACHOWY>=b.GRANICA1 AND a.RANKING_SZACHOWY<=b.GRANICA2
                    GROUP BY b.NUMER_KATEGORII);

--zad 4
--jak miał na imie zawodnik, który grał na stole C1 w rundzie 5 i wygrał

SELECT IMIE, NAZWISKO
FROM OSOBA a JOIN ZAWODNICY b ON a.ID_OSOBY = b.OSOBA_ID_OSOBY
    JOIN PARTIA c ON b.ID_ZAWODNIKA = c.ZAWODNIK_BIAŁE OR ID_ZAWODNIKA=ZAWODNIK_CZARNE
    JOIN WYNIKI d ON d.PARTIA_ID_PARTII=c.ID_PARTII
    JOIN RUNDA e ON e.NUMER_RUNDY=c.RUNDA_NUMER_RUNDY
    JOIN STOŁY f ON f.ID_STOŁU=c.STOŁY_ID_STOŁU
WHERE POZYCJA_NA_SALI='C1' and NUMER_RUNDY=5 and
      ((ZAWODNIK_CZARNE=b.ID_ZAWODNIKA and CZARNE_WYNIK=1) OR (ZAWODNIK_BIAŁE=b.ID_ZAWODNIKA and BIAŁE_WYNIK=1));

--zad 5
--ile najmlodszy zawodnik miał remisów
SELECT a.ID_ZAWODNIKA, count(1) as "liczba remisów"
FROM  ZAWODNICY a JOIN PARTIA b on a.ID_ZAWODNIKA = b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
JOIN WYNIKI c on b.ID_PARTII = c.PARTIA_ID_PARTII
WHERE BIAŁE_WYNIK =0.5 AND a.ID_ZAWODNIKA = (SELECT ID_ZAWODNIKA
                                            FROM OSOBA a JOIN ZAWODNICY b on a.ID_OSOBY = b.OSOBA_ID_OSOBY
                                            WHERE data_urodzenia = (SELECT max(data_urodzenia)
                                            FROM OSOBA))
GROUP BY a.ID_ZAWODNIKA;

--zad 6
--pokaz rezultaty partii zawodnika z najgorszą kategorią na stole A2
SELECT a.ID_ZAWODNIKA, d.ID_STOŁU, c.BIAŁE_WYNIK, c.CZARNE_WYNIK
FROM ZAWODNICY a JOIN PARTIA b on a.ID_ZAWODNIKA = b.ZAWODNIK_BIAŁE OR a.ID_ZAWODNIKA=b.ZAWODNIK_CZARNE
JOIN WYNIKI c on b.ID_PARTII = c.PARTIA_ID_PARTII JOIN STOŁY d on b.STOŁY_ID_STOŁU = d.ID_STOŁU
WHERE d.POZYCJA_NA_SALI= 'A2' AND RANKING_SZACHOWY = (SELECT min(RANKING_SZACHOWY)
                            FROM ZAWODNICY);

--zad 7
-- ilu mamy zawodników z pierwszą kategorią w poszczególnych klubach
SELECT NAZWA_KLUBU, count(1) "liczba zawodników z 1 kategorią"
FROM OSOBA a JOIN ZAWODNICY b on a.ID_OSOBY = b.OSOBA_ID_OSOBY
    JOIN KLUB_SZACHOWY c on b.KLUB_SZACHOWY_NAZWA_KLUBU = c.NAZWA_KLUBU
    JOIN KATEGORIE_SZACHOWE d ON b.RANKING_SZACHOWY>=d.GRANICA1 AND b.RANKING_SZACHOWY<=GRANICA2
WHERE NUMER_KATEGORII=1
GROUP BY NAZWA_KLUBU;


--zad 8
--ile było remisów rundzie 4
SELECT NUMER_RUNDY, count(1)
FROM RUNDA a JOIN PARTIA b ON a.NUMER_RUNDY=b.RUNDA_NUMER_RUNDY
JOIN WYNIKI c ON b.ID_PARTII = c.PARTIA_ID_PARTII
WHERE CZARNE_WYNIK=0.5 AND NUMER_RUNDY=4
GROUP BY NUMER_RUNDY;

--zad 9
--w jakim klubie gra anna nowak
SELECT NAZWA_KLUBU
FROM OSOBA a JOIN ZAWODNICY b ON a.ID_OSOBY=b.ID_ZAWODNIKA
JOIN KLUB_SZACHOWY c on b.KLUB_SZACHOWY_NAZWA_KLUBU = c.NAZWA_KLUBU
WHERE a.IMIE = 'Anna' AND a.NAZWISKO = 'Nowak';

--zad 10
--w którym klubie jest najmniej zawodników
SELECT a.NAZWA_KLUBU
FROM KLUB_SZACHOWY a JOIN ZAWODNICY b ON a.NAZWA_KLUBU = b.KLUB_SZACHOWY_NAZWA_KLUBU
JOIN OSOBA c ON b.OSOBA_ID_OSOBY = c.ID_OSOBY
GROUP BY a.NAZWA_KLUBU
HAVING count(1) IN (SELECT min(count(1))
                    FROM KLUB_SZACHOWY a JOIN ZAWODNICY b ON a.NAZWA_KLUBU = b.KLUB_SZACHOWY_NAZWA_KLUBU
                    JOIN OSOBA c ON b.OSOBA_ID_OSOBY = c.ID_OSOBY
                    GROUP BY a.NAZWA_KLUBU);











