CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    telephone VARCHAR(20)
);

ALTER TABLE commandes ADD COLUMN idClient INT REFERENCES clients(id);

INSERT INTO clients (nom, prenom, telephone) VALUES
    ('Dupont', 'Jean', '0333859723'),
    ('Martin', 'Sophie', '0345897612'),
    ('Durand', 'Pierre', '0387895263');

UPDATE commandes SET idClient = 1 WHERE id = 1;
UPDATE commandes SET idClient = 2 WHERE id = 2;
UPDATE commandes SET idClient = 3 WHERE id = 3;
