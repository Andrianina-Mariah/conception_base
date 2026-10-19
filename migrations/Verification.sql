-- Etape_01: afficher les plats du plus cher au moins cher.
SELECT * FROM plats ORDER BY prix DESC;

-- Etape_02: nombre de plats par catégorie, y compris les catégories sans plat.
SELECT categories.libelle, COUNT(plats.nom) FROM categories LEFT JOIN plats ON categories.id = plats.idCategorie GROUP BY categories.libelle; 

-- Etape_03: montant total de chaque commande.
SELECT commandes.id, SUM(plats.prix * commandes_detail.quantite) FROM commandes_detail LEFT JOIN commandes ON commandes.id = commandes_detail.idCommande LEFT JOIN plats ON commandes_detail.idPLat = plats.id GROUP BY commandes.id;

-- Etape_04: liste des commandes avec le nom du client, en affichant « client de passage » quand il n'y en a pas.
SELECT commandes.id, commandes.date, commandes_detail.idPlat, commandes_detail.quantite, COALESCE(clients.nom, 'client de passage') AS client FROM commandes LEFT JOIN commandes_detail ON commandes.id = commandes_detail.idCommande LEFT JOIN clients ON commandes.idClient = clients.id;

-- Etape_05: nombre de commandes et chiffre d'affaires par serveur.
SELECT serveurs.nom, serveurs.prenom, COUNT(DISTINCT commandes.id) AS nombre_commandes, SUM(plats.prix * commandes_detail.quantite) AS chiffre_affaires FROM serveurs LEFT JOIN commandes ON serveurs.id = commandes.idServeur LEFT JOIN commandes_detail ON commandes.id = commandes_detail.idCommande LEFT JOIN plats ON commandes_detail.idPlat = plats.id GROUP BY serveurs.nom, serveurs.prenom;

-- Etape_06: liste des commandes non soldées avec le montant dû, le montant payé et le reste à payer.
SELECT commandes.id, SUM(plats.prix * commandes_detail.quantite) AS montant_du,
       COALESCE(p.total_paye, 0) AS montant_paye,
       SUM(plats.prix * commandes_detail.quantite)
           - COALESCE(p.total_paye, 0) AS reste_a_payer
FROM commandes
LEFT JOIN commandes_detail
    ON commandes.id = commandes_detail.idCommande
LEFT JOIN plats
    ON commandes_detail.idPlat = plats.id
LEFT JOIN (
    SELECT idCommande, SUM(montant) AS total_paye
    FROM paiements
    GROUP BY idCommande
) p ON commandes.id = p.idCommande
GROUP BY commandes.id, p.total_paye;

-- Etape_07
SELECT commandes.id, SUM(commandes_detail.prix_unitaire * commandes_detail.quantite) FROM commandes_detail LEFT JOIN commandes ON commandes.id = commandes_detail.idCommande LEFT JOIN plats ON commandes_detail.idPLat = plats.id GROUP BY commandes.id;

-- Etape_08: consommation théorique de chaque ingrédient pour la journée du 12 octobre.
SELECT
    ingredients_plat.idIngredient,
    SUM(commandes_detail.quantite * ingredients_plat.quantite)
        AS consommation_theorique
FROM commandes_detail
JOIN ingredients_plat
    ON ingredients_plat.idPlat = commandes_detail.idPlat
WHERE commandes_detail.idPlat = 1
GROUP BY ingredients_plat.idIngredient;

-- Etape_09: pour chaque menu, son prix, la somme des prix à la carte et l'économie réalisée par le client
SELECT
    m.id AS id_menu,
    m.nom AS menu,
    m.prix AS prix_menu,
    SUM(p.prix) AS prix_a_la_carte,
    SUM(p.prix) - m.prix AS economie
FROM composition_menu cm
JOIN plats m ON m.id = cm.idMenu
JOIN plats p ON p.id = cm.idPlat
GROUP BY m.id, m.nom, m.prix;