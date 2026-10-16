CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    date DATE
);

CREATE TABLE commandes_detail (
    id SERIAL PRIMARY KEY,
    idCommande INT NOT NULL REFERENCES commandes(id),
    idPlat INT NOT NULL REFERENCES plats(id),
    quantite INT NOT NULL
);

INSERT INTO commandes (date) VALUES
    ('2026-10-16'),
    ('2026-10-16'),
    ('2026-10-16'),
    ('2026-10-17');

INSERT INTO commandes_detail (idCommande, idPlat, quantite) VALUES
    (1, 1, 2),
    (1, 2, 3),
    (2, 3, 1),
    (2, 7, 2),
    (3, 4, 4),
    (3, 5, 1),
    (4, 6, 5);
