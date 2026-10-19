ALTER TABLE commandes_detail
ADD COLUMN prix_unitaire INT;

UPDATE commandes_detail
SET prix_unitaire = plats.prix
FROM plats
WHERE commandes_detail.idPlat = plats.id;

CREATE TABLE historiques_prix (
    id SERIAL PRIMARY KEY,
    idPLat INT NOT NULL REFERENCES plats(id),
    nouveauPrix INT NOT NULL,
    dateModif DATE
);

UPDATE plats SET prix = 7500 WHERE id = 1;

INSERT INTO commandes (date, idClient, idServeur, idTable) VALUES
    ('2026-10-19', 3, 2, 8);

INSERT INTO commandes_detail (idCommande, idPLat, quantite, prix_unitaire) VALUES
    (5, 1, 5, (SELECT prix FROM plats WHERE plats.id = 1));

INSERT INTO historiques_prix (idPLat, nouveauPrix, dateModif) VALUES
    (1, 7000, '2026-10-16'),
    (2, 8000, '2026-10-16'),
    (3, 8500, '2026-10-16'),
    (4, 6000, '2026-10-16'),
    (5, 5000, '2026-10-16'),
    (6, 1000, '2026-10-16'),
    (7, 500, '2026-10-16'),
    (1, 7500, '2026-10-19');