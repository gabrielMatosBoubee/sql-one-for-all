SELECT
    art.artistas AS artista,
    album.album AS album
FROM
    SpotifyClone.artistas AS art
    INNER JOIN SpotifyClone.album AS album ON album.artista_id = art.artista_id
WHERE
    art.artistas = "Elis Regina"
GROUP BY
    art.artistas,
    album.album
ORDER BY album.album;