-- Etape_01: afficher les plats du plus cher au moins cher.
SELECT * FROM plats ORDER BY prix DESC;

-- Etape_02: nombre de plats par catégorie, y compris les catégories sans plat.
SELECT categories.libelle, COUNT(plats.nom) FROM categories LEFT JOIN plats ON categories.id = plats.idCategorie GROUP BY categories.libelle; 

-- Etape_03: montant total de chaque commande.
SELECT commandes.id, SUM(plats.prix * commandes_detail.quantite) FROM commandes_detail LEFT JOIN commandes ON commandes.id = commandes_detail.idCommande LEFT JOIN plats ON commandes_detail.idPLat = plats.id GROUP BY commandes.id;