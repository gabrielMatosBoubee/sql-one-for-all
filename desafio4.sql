SELECT
    user.usuario AS usuario,
    IF ( ( (
                YEAR(MAX(history.data_reproducao))
            ) >= 2021
        ),
        'Usuário ativo',
        'Usuário inativo'
    ) AS status_usuario
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.historico_reproducao AS history ON user.usuario_id = history.usuario_id
GROUP BY user.usuario
ORDER BY user.usuario;