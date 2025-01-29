# Création d'une liste avec différents types de données
Liste=list("aaa",3,4.5,TRUE,c(1,3,7,9))
print("Liste complète:")
print(Liste)

# Quelle différence entre la fonction c(...) et list(...) ?
# La fonction c(...) permet de créer un vecteur, tandis que la fonction list(...) permet de créer une liste.

# Accès aux éléments de la liste
print("Élément à l'index 0 (retourne NULL car R commence à 1):")
print(Liste[0])
print("Élément à l'index 2:")
print(Liste[2])
print("Élément à l'index 4:")
print(Liste[4])
print("Contenu de l'élément 4 (accès direct):")
print(Liste[[4]])
print("Deuxième élément du vecteur dans l'élément 5:")
print(Liste[[5]][2])

# Vérification du type des éléments
print("Type de Liste[5] (retourne une liste):")
print(is(Liste[5]))
print("Type de Liste[[5]] (retourne un vecteur):")
print(is(Liste[[5]]))

# Manipulation du vecteur extrait
x=Liste[[5]]
print("Les deux premiers éléments de x:")
print(x[1:2])
print("Les éléments de x supérieurs ou égaux à 3:")
print(x[x>=3])

# Combinaison de listes
Liste2=list("b",-3.5)
print("Nouvelle liste Liste2:")
print(Liste2)
L=c(Liste,Liste2)
print("Combinaison des deux listes:")
print(L)