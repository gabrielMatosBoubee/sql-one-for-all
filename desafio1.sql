DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE
    SpotifyClone.usuario(
        usuario_id INT UNIQUE,
        usuario VARCHAR(200),
        idade INT,
        PRIMARY KEY (usuario_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.historico_reproducao(
        historico_reproducao_id INT UNIQUE,
        usuario_id INT,
        historico_de_reprodução VARCHAR(200),
        data_reproducao DATETIME,
        PRIMARY KEY (historico_reproducao_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.plano(
        plano_id INT UNIQUE,
        usuario_id INT,
        plano VARCHAR(100),
        data_assinatura DATE,
        valor_plano FLOAT,
        PRIMARY KEY (plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.seguindo_artistas (
        seguindo_artistas_id INT UNIQUE,
        usuario_id INT,
        seguindo_artistas VARCHAR(200),
        PRIMARY KEY (seguindo_artistas_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artistas (
        artistas_id INT UNIQUE,
        album_id INT,
        artistas VARCHAR(200),
        PRIMARY KEY (artistas_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.album (
        album_id INT UNIQUE,
        album VARCHAR(200),
        ano_de_lancamento YEAR,
        PRIMARY KEY (album_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.cancoes (
        cancoes_id INT UNIQUE,
        album_id INT,
        cancoes VARCHAR(200),
        duracao_segundos INT,
        PRIMARY KEY(cancoes_id)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.tabela1 (coluna1, coluna2)
VALUES (
        'exemplo de dados 1',
        'exemplo de dados A'
    ), (
        'exemplo de dados 2',
        'exemplo de dados B'
    ), (
        'exemplo de dados 3',
        'exemplo de dados C'
    );

INSERT INTO
    SpotifyClone.tabela2 (coluna1, coluna2)
VALUES (
        'exemplo de dados 1',
        'exemplo de dados X'
    ), (
        'exemplo de dados 2',
        'exemplo de dados Y'
    );