SELECT
    song.cancoes AS nome_musica,
    CASE
        WHEN newSong.cancoes LIKE '%Bard%' THEN
        REPLACE (newSong.cancoes, "Bard", "QA")
            WHEN newSong.cancoes LIKE '%Amar%' THEN
        REPLACE (
                newSong.cancoes,
                "Amar",
                "Code Review"
            )
            WHEN newSong.cancoes LIKE "%Pais%" THEN
        REPLACE (
                newSong.cancoes,
                "Pais",
                "Pull Requests"
            )
            WHEN newSong.cancoes LIKE "%SOUL%" THEN
        REPLACE (
                newSong.cancoes,
                "SOUL",
                "CODE"
            )
            WHEN newSong.cancoes LIKE "%SUPERSTAR%" THEN
        REPLACE (
                newSong.cancoes,
                "SUPERSTAR",
                "SUPERDEV"
            )
            ELSE 'test'
    END AS novo_nome
FROM
    `SpotifyClone`.cancoes AS song
    INNER JOIN `SpotifyClone`.cancoes AS newSong ON newSong.cancoes_id = song.cancoes_id
GROUP BY
    song.cancoes,
    newSong.cancoes
HAVING novo_nome != "test"
ORDER BY song.cancoes DESC