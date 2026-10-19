CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    ingredient VARCHAR(50),
    unite VARCHAR(20) NOT NULL,
    stock NUMERIC(10,2) NOT NULL
);

CREATE TABLE ingredients_plat (
    id SERIAL PRIMARY KEY,
    idIngredient INT NOT NULL REFERENCES ingredients(id),
    idPlat INT NOT NULL REFERENCES plats(id),
    quantite NUMERIC(10,2) NOT NULL
);

INSERT INTO ingredients (ingredient, unite, stock) VALUES
    ('Riz', 'Gramme', 15000),
    ('Viande de zébu', 'Gramme', 5000),
    ('Brèdes mafana', 'Gramme', 3000.5);

INSERT INTO ingredients_plat (idIngredient, idPlat, quantite) VALUES
    (1, 1, 250),
    (2, 1, 150),
    (3, 1, 100);