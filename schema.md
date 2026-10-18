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

COMMANDES(**id**, date, ?idClient)

Réponse Piège -> Non ma clé étrangère ne peux pas être NOT NULL car il se peux qu'il y a des clients de passages -> NULL. Pour ne pas perdre aucune commande il faut la jointure LEFT JOIN.
