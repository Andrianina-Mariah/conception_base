CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100)
);


INSERT INTO categories (libelle) VALUES
    ('Plat malagasy'),
    ('Plat chinois'),
    ('Soupe'),
    ('Dessert et goûter'),
    ('Boisson');

ALTER TABLE plats ADD COLUMN idCategorie INT;

UPDATE plats SET idCategorie = 1 WHERE id IN (1, 2, 3);
UPDATE plats SET idCategorie = 2 WHERE id IN (4);
UPDATE plats SET idCategorie = 3 WHERE id IN (5);
UPDATE plats SET idCategorie = 4 WHERE id IN (6);
UPDATE plats SET idCategorie = 5 WHERE id IN (7);

ALTER TABLE plats ALTER COLUMN idCategorie SET NOT NULL;

ALTER TABLE plats ADD CONSTRAINT fk_categorie FOREIGN KEY (idCategorie) REFERENCES categories(id);

--Categorie sans plat
INSERT INTO categories (libelle) VALUES ('Plat italien');