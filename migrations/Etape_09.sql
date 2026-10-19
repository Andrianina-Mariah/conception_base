CREATE TABLE composition_menu (
    idMenu INT NOT NULL REFERENCES plats(id),
    idPlat INT NOT NULL REFERENCES plats(id),
    PRIMARY KEY (idMenu, idPlat),
    CHECK (idMenu <> idPlat)
);

INSERT INTO plats (nom, prix, idCategorie)
VALUES ('Menu Romazava', 8000, 1);

INSERT INTO composition_menu (idMenu, idPlat)
VALUES
    (11, 1),
    (11, 7),
    (11, 6);