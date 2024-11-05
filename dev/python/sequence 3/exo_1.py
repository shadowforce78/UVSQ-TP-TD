from tkiteasy import ouvrirFenetre

# Ouverture de fenêtre
g = ouvrirFenetre(800, 600)

# Votre programme ICI



# Boucle à vide qui attend un clic
while g.recupererClic() is None:
    continue

# Fermeture fenêtre
g.fermerFenetre()
