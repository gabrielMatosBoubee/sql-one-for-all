SELECT
    user.usuario AS usuario,
    COUNT(
        DISTINCT music.data_reproducao
    ) AS qt_de_musicas_ouvidas,
    SUM(
        ROUND(song.duracao_segundos / 60, 2)
    ) AS total_minutos
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.historico_reproducao AS music ON music.usuario_id = user.usuario_id
    INNER JOIN SpotifyClone.cancoes AS song ON music.cancoes_id = song.cancoes_id
GROUP BY user.usuario
ORDER BY user.usuario;