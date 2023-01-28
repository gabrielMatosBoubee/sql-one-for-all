SELECT
    song.cancoes AS nome,
    COUNT(history.cancoes_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS song
    INNER JOIN SpotifyClone.historico_reproducao as history ON history.cancoes_id = song.cancoes_id
    INNER JOIN SpotifyClone.usuario AS user ON user.usuario_id = history.usuario_id
    INNER JOIN SpotifyClone.plano AS plan ON plan.plano_id = user.plano_id
WHERE (
        plan.plano = 'gratuito'
        OR plan.plano = 'pessoal'
    )
GROUP BY
    song.cancoes,
    history.cancoes_id
ORDER BY song.cancoes;