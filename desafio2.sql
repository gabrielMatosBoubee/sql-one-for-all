SELECT
    COUNT(DISTINCT cancoes.cancoes_id) AS cancoes,
    COUNT(DISTINCT artistas.artista_id) AS artistas,
    COUNT(DISTINCT album.album_id) AS albuns
FROM
    SpotifyClone.cancoes as cancoes
    inner JOIN SpotifyClone.artistas as artistas
    inner JOIN SpotifyClone.album as album;