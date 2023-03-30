SELECT * 
FROM spisok_postavki
WHERE id_spisok_postavki = (SELECT id_spisok_postavki FROM spisok_tovarov WHERE id_tovar = (SELECT id_tovar FROM tovar WHERE id_tovar = 
(SELECT id_tovar FROM price_list WHERE dataa = '2022-06-01')))
SELECT *
FROM spisok_tovarov
WHERE id_spisok_postavki = (SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki = (SELECT id_postavki FROM postavki
WHERE id_postavshik = (SELECT id_postavshik FROM postavshik WHERE nazvanie = 'Best Buy')))
SELECT *
FROM spisok_postavki
WHERE id_spisok_postavki = (SELECT id_spisok_postavki FROM spisok_tovarov WHERE id_tovar = (SELECT id_tovar FROM tovar WHERE tovar = 'iPhone'))
DECLARE @id_zaka INT
SELECT @id_zaka = id_zakaz 
FROM zakaz
WHERE id_sostoyanie	= (SELECT id_sostoyanie FROM sostoyanie WHERE sostoyanie = 'inactive') and dataPos >= '2023-02-11' and dataPos <= '2023-02-13'
SELECT id_tovar, kolichestvo
FROM spisok_tovarov
WHERE id_zakaz = @id_zaka
SELECT kontakty
FROM kontakty
WHERE id_klient = (SELECT id_klient FROM klient_ WHERE id_klient = 2)
UPDATE price_list SET cena = 134
WHERE dataa >= '2022-09-01' and dataa <= '2022-12-01';
SELECT *
FROM price_list;
SELECT id_oplata, summa, id_zakaz
FROM oplata
WHERE dataOplati >= '2022-01-01' and dataOplati <= '2022-03-01'
SELECT summa
FROM oplata
WHERE id_vid_oplaty = (SELECT id_vid_oplaty from vid_oplaty WHERE vid_oplaty = 'cash') and dataOplati >= '2022-01-01' and dataOplati <= '2022-03-01'
SELECT id_zakaz, id_sotrudnik
FROM zakaz
SELECT id_zakaz, id_tip_zakaza
FROM zakaz
SELECT id_zakaz, id_tip_prodaj
FROM zakaz
