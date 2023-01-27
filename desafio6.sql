SELECT
    CONCAT(
        "",
        ROUND(MIN(plan.valor_plano), 2),
        ".00"
    ) AS 'faturamento_minimo',
    CONCAT (
        "",
        MAX(ROUND(plan.valor_plano, 2)),
        ""
    ) AS 'faturamento_maximo',
    CONCAT (
        "",
        ROUND(
            AVG(ROUND(plan.valor_plano, 2)),
            2
        ),
        ""
    ) AS 'faturamento_medio',
    CONCAT(
        "",
        ROUND(
            SUM(ROUND(plan.valor_plano, 2)),
            2
        ),
        ""
    ) AS 'faturamento_total'
FROM SpotifyClone.plano AS plan
    INNER JOIN SpotifyClone.usuario AS user ON user.plano_id = plan.plano_id;