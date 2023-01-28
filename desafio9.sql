SELECT
    COUNT(history.usuario_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.historico_reproducao AS history
    INNER JOIN SpotifyClone.usuario AS user ON user.usuario_id = history.usuario_id
WHERE
    user.usuario = "Barbara Liskov";