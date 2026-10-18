CREATE TABLE serveurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);

INSERT INTO serveurs (nom, prenom) VALUES
    ('Rakoto', 'Jean'),
    ('Rasoa', 'Lalao');

CREATE TABLE tables (
    id SERIAL PRIMARY KEY,
    numero VARCHAR(10) NOT NULL
);

INSERT INTO tables (numero) VALUES
    ('Table 1'),
    ('Table 2'),
    ('Table 3'),
    ('Table 4'),
    ('Table 5'),
    ('Table 6'),
    ('Table 7'),
    ('Table 8');

ALTER TABLE commandes ADD COLUMN idServeur INT REFERENCES serveurs(id);
ALTER TABLE commandes ADD COLUMN idTable INT REFERENCES tables(id);


UPDATE commandes SET idServeur = 1, idTable = 1 WHERE id = 1;
UPDATE commandes SET idServeur = 2, idTable = 2 WHERE id = 2;
UPDATE commandes SET idServeur = 1, idTable = 3 WHERE id = 3;
UPDATE commandes SET idServeur = 2 WHERE id = 4;