DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE
    SpotifyClone.plano(
        plano_id INT UNIQUE,
        plano VARCHAR(100),
        valor_plano FLOAT,
        PRIMARY KEY (plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.usuario(
        usuario_id INT UNIQUE,
        usuario VARCHAR(200),
        idade INT,
        plano_id INT,
        data_assinatura DATE,
        PRIMARY KEY (usuario_id),
        Foreign Key (plano_id) REFERENCES SpotifyClone.plano(plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artistas (
        artista_id INT UNIQUE,
        artistas VARCHAR(200),
        PRIMARY KEY (artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.album (
        album_id INT UNIQUE,
        album VARCHAR(200),
        ano_de_lancamento YEAR,
        artista_id INT,
        PRIMARY KEY (album_id),
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.cancoes (
        cancoes_id INT UNIQUE,
        cancoes VARCHAR(200),
        duracao_segundos INT,
        album_id INT,
        PRIMARY KEY(cancoes_id),
        FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.historico_reproducao(
        usuario_id INT,
        data_reproducao DATETIME,
        cancoes_id INT,
        CONSTRAINT PRIMARY KEY (usuario_id, cancoes_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
        Foreign Key (cancoes_id) REFERENCES SpotifyClone.cancoes(cancoes_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.seguindo_artistas (
        usuario_id INT,
        artista_id INT,
        CONSTRAINT PRIMARY KEY (artista_id, usuario_id),
        Foreign Key (artista_id) REFERENCES SpotifyClone.artistas (artista_id),
        Foreign Key (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.plano (plano_id, plano, valor_plano)
VALUES (1, 'gratuito', 0.00), (2, 'universitário', 5.99), (3, 'familiar', 7.99), (4, 'pessoal', 6.99);

INSERT INTO
    SpotifyClone.usuario (
        usuario_id,
        usuario,
        idade,
        plano_id,
        data_assinatura
    )
VALUES (
        1,
        "Barbara Liskov",
        82,
        1,
        "2019-10-20"
    ), (
        2,
        "Robert Cecil Martin",
        58,
        1,
        "2017-01-06"
    ), (
        3,
        "Ada Lovelace",
        37,
        3,
        "2017-12-30"
    ), (
        4,
        'Martin Fowler',
        46,
        3,
        "2017-01-17"
    ), (
        5,
        'Sandi Metz',
        58,
        3,
        "2018-04-29"
    ), (
        6,
        'Paulo Freire',
        19,
        2,
        "2018-02-14"
    ), (
        7,
        'Bell Hooks',
        26,
        2,
        "2018-01-05"
    ), (
        8,
        'Christopher alexande',
        85,
        4,
        "2019-06-05"
    ), (
        9,
        'judith Butler',
        45,
        4,
        "2020-05-13"
    ), (
        10,
        'Jorge Amado',
        58,
        4,
        "2017-02-17"
    );

INSERT INTO
    SpotifyClone.artistas (artista_id, artistas)
VALUES (1, "Beyoncé"), (2, 'Queen'), (3, 'Elis Regina'), (4, 'Baco Exu do Blues'), (5, 'Blind Guardian'), (6, 'Nina Simone');

INSERT INTO
    SpotifyClone.album (
        album_id,
        album,
        ano_de_lancamento,
        artista_id
    )
VALUES (1, "Renaissance", 2022, 1), (2, "Jazz", 1978, 2), (3, "Hot Space", 1982, 2), (4, "Falso Brilhante", 1998, 3), (5, "Vento de Maio", 2001, 3), (6, "QVVJFA?", 2003, 4), (
        7,
        "Somewhere Far Beyond",
        2007,
        5
    ), (
        8,
        "I Put A Spell On You",
        2012,
        6
    );

INSERT INTO
    SpotifyClone.cancoes (
        cancoes,
        cancoes_id,
        duracao_segundos,
        album_id
    )
VALUES ("Samba em Paris", 1, 267, 6), ("VIRGO'S GROOVE", 2, 369, 1), ("Feeling Good", 3, 100, 8), ("Under Pressure", 4, 152, 3), (
        "O Medo de Amar é o Medo de Ser Livre",
        5,
        207,
        5
    ), ("Don't Stop Me Now", 6, 203, 2), ("BREAK MY SOUL", 7, 279, 1), ("The Bard's Song", 8, 244, 7), ("ALIEN SUPERSTAR", 9, 116, 1), ("Como Nossos Pais", 10, 105, 4);

INSERT INTO
    SpotifyClone.historico_reproducao (
        usuario_id,
        cancoes_id,
        data_reproducao
    )
VALUES (1, 1, "2022-02-28 10:45:55"), (1, 2, "2020-05-02 05:30:35"), (1, 3, "2020-03-06 11:22:33"), (2, 3, "2022-08-05 08:05:17"), (2, 5, "2020-01-02 07:40:33"), (3, 3, "2020-11-13 16:55:13"), (3, 2, "2020-12-05 18:38:30"), (4, 1, "2021-08-15 17:10:10"), (5, 1, "2022-01-09 01:44:33"), (5, 4, "2020-08-06 15:23:43"), (6, 5, "2017-01-24 00:31:17"), (6, 7, "2017-10-12 12:35:20"), (7, 7, "2011-12-15 22:30:49"), (8, 7, "2012-03-17 14:56:41"), (9, 8, "2022-02-24 21:14:22"), (10, 9, "2015-12-13 08:30:22");

INSERT INTO
    SpotifyClone.seguindo_artistas (usuario_id, artista_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);