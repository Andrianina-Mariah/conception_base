CREATE TABLE mode_paiement (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50)
);

CREATE TABLE paiements (
    id SERIAL PRIMARY KEY,
    idModePaiement INT NOT NULL REFERENCES mode_paiement(id),
    idCommande INT NOT NULL REFERENCES commandes(id),
    montant INT NOT NULL,
    reference VARCHAR(50)
);

INSERT INTO mode_paiement (libelle) VALUES
    ('Espèce'),
    ('Mvola'),
    ('Orange Money'),
    ('Airtel Money');

INSERT INTO paiements (idModePaiement, idCommande, montant, reference) VALUES
    (1, 1, 10000, NULL),
    (2, 1, 5000, 'MVL-001'),
    (3, 2, 6000, 'ORG-001');
