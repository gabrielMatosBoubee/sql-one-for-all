SELECT
    song.cancoes AS cancao,
    COUNT(history.usuario_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS song
    INNER JOIN SpotifyClone.historico_reproducao AS history ON history.cancoes_id = song.cancoes_id
GROUP BY song.cancoes
ORDER BY
    reproducoes DESC,
    song.cancoes
LIMIT 2;