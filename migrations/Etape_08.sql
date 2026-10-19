CREATE TABLE ingredients_plat (
    id SERIAL PRIMARY KEY,
    idPLat INT NOT NULL REFERENCES plats(id),
    ingredient VARCHAR(50),
    unite DECIMAL(10,3) NOT NULL,
    stock DECIMAL (10,2) NOT NULL
);