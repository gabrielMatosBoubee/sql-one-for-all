SELECT
    DISTINCT art.artistas AS artista,
    album.album AS album,
    COUNT(follow.artista_id) AS seguidores
FROM
    SpotifyClone.artistas AS art
    INNER JOIN SpotifyClone.album AS album ON album.artista_id = art.artista_id
    INNER JOIN SpotifyClone.seguindo_artistas AS follow ON album.artista_id = follow.artista_id
GROUP BY
    follow.artista_id,
    art.artistas,
    album.album
ORDER BY
    COUNT(follow.artista_id) DESC,
    art.artistas,
    album.album;