SELECT name_treck, time 
FROM Trecks 
WHERE time=(SELECT MAX(time) FROM Trecks);

SELECT name_treck 
FROM Trecks 
WHERE time> 210;

SELECT name
FROM Collections c 
WHERE year > 2018 AND year <= 2020;

SELECT singer 
FROM Singers 
WHERE singer NOT LIKE '% %';

SELECT name_treck 
FROM Trecks t  
WHERE name_treck LIKE '%My%';

SELECT janr, COUNT(singer)
FROM Singers S
LEFT JOIN janrsSingers js ON S.id = js.janr_id
LEFT JOIN janrs j ON js.janr_id = j.id
GROUP BY janr;

SELECT name_album, COUNT(name_treck) 
FROM Albums a 
LEFT JOIN Trecks ON a.id = Trecks.album_id
WHERE year_of_album  >= 2019 AND year_of_album  <= 2020;

SELECT name_album, AVG(time)
FROM Albums a 
LEFT JOIN Trecks ON a.id = Trecks.album_id
GROUP BY name_album;

SELECT singer  
FROM Singers s
LEFT JOIN AlbumsSingers ALS ON s.id = ALS.album_id
LEFT JOIN Albums a ON ALS.album_id = a.id
WHERE year_of_album NOT LIKE 2020;

SELECT name, name_treck, singer
FROM Collections c 
LEFT JOIN TrecksCollections TC ON c.id = TC.collection_id 
LEFT JOIN Trecks T ON TC.treck_id = T.id
LEFT JOIN Albums A ON T.album_id = A.id 
LEFT JOIN AlbumsSingers ALS ON A.id = ALS.album_id
LEFT JOIN Singers s ON s.id = ALS.singer_id
WHERE singer LIKE '%Бетховен%';
