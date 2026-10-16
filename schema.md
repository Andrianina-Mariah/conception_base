### Etape 1: La carte

PLATS(**id**, nom, prix)

Réponse Piège -> Pour le prix je choisis le type INT (entier)

### Etape 2: Les catégories

PLATS(**id**, nom, prix, #idCategorie)

CATEGORIES(**id**, libelle)

Réponse Piège -> On n'ajoute pas simplement une colonne categorie VARCHAR(50) dans la tables des plats car ça peux créer des conflits ou des ambiguité. Par exemple si une utilisateur veux faire entrer du jus et écrit Boison au lieu de Boisson dans la catégories ça crée une erreur au moment de compter le nombre de plat par categorie.
