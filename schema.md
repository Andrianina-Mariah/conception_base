### Étape 1: La carte

PLATS(**id**, nom, prix)

Réponse Piège -> Pour le prix je choisis le type INT (entier)

### Étape 2: Les catégories

PLATS(**id**, nom, prix, #idCategorie)

CATEGORIES(**id**, libelle)

Réponse Piège -> On n'ajoute pas simplement une colonne categorie VARCHAR(50) dans la tables des plats car ça peux créer des conflits ou des ambiguité. Par exemple si une utilisateur veux faire entrer du jus et écrit Boison au lieu de Boisson dans la catégories ça crée une erreur au moment de compter le nombre de plat par categorie.

### Étape 3: Les commandes

COMMANDES(**id**, date)

COMMANDES_DETAIL(**id**, **#idCommande, #**idPlat**, quantite)**

Réponse Piège -> je place quantité dans la table COMMANDES_DETAIL.

### Étape 4: Les habitués

CLIENTS(**id**, nom, ?prenom, ?telephone)

COMMANDES(**id**, date, ?#idClient)

Réponse Piège -> Non ma clé étrangère ne peux pas être NOT NULL car il se peux qu'il y a des clients de passages -> NULL. Pour ne pas perdre aucune commande il faut la jointure LEFT JOIN.

### Étape 5: Serveurs et tables

SERVEURS (**id**, nom, prenom)

TABLES (**id**, numero)

COMMANDES(**id**, date, ?#idClient#idClient, ?#idServeur#idServeur, ?#idTable#idTable)

Réponse Piège -> Une table de la salle et une commande sont deux choses différentes car pour les plat à emporter il n'y a pas de table. Le nom table pose problème en SQL car ça peux créer une ambiguité au moment de créer une table.

### Étape 6 : Les paiements

MODE_PAIEMENT(**id**, libelle)

PAIEMENT(id, #idModePaiement#idModePaiement, #idCommande#idCommande, montant, ?reference)

Réponse Piège -> Une colonne montant_paye dans la table des commandes ne suffit pas car un(e) client(e) peux payée plusieurs fois et de différentes manière. Pour le mode de paiement : j'utilise la table de référence.

CHECK : les valeurs autorisées sont écrites directement dans la table.

Table de référence : les valeurs autorisées sont stockées dans une autre table et reliées par une clé étrangère.

### Étape 7 : Les prix changent

COMMANDES_DETAIL(**id**, **#idCommande, #**idPlat**, **quantite, #prix_unitaire**)**

HISTORIQUES_PRIX(id, #idPlat, nouveauPrix, dateModif)
