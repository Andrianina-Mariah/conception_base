-- Etape_01: afficher les plats du plus cher au moins cher.
SELECT * FROM plats ORDER BY prix DESC;

-- Etape_02: nombre de plats par catégorie, y compris les catégories sans plat.
SELECT categories.libelle, COUNT(plats.nom) FROM categories LEFT JOIN plats ON categories.id = plats.idCategorie GROUP BY categories.libelle; 