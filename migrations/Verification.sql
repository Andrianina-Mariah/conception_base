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