x1=seq(1, 10, by=2)

print("Longueur de x1:")
print(length(x1))
print("Type de x1:")
print(is(x1))
print("Classe de x1:")
print(class(x1))
print("x1[0]:")
print(x1[0])
print("x1[1]:")
print(x1[1])

# Parmis les instructions suivantes, lesquelles ne retourneront pas de resultat ?

print("Dernier élément de x1:")
print(x1[length(x1)])
print("Éléments 2 et 3 de x1:")
print(x1[c(2,3)])
# print("x1[c(-1,2)]:")
# x1[c(-1,2)]
print("x1 sans le premier élément:")
print(x1[-1])
print("x1[c(-1,0)]:")
print(x1[c(-1,0)])
print("x1 sans le deuxième élément:")
print(x1[-2])
print("Modulo 2 de x1:")
print(x1%%2)
print("Modulo 3 de x1:")
print(x1%%3)

print("Indices où x1 modulo 3 égale 0:")
print(which(x1%%3==0))
print("Éléments de x1 qui sont divisibles par 3:")
print(x1[which(x1%%3==0)])

# Que retourne la fonction which ?
# La fonction which retourne les indices des éléments d'un vecteur qui vérifient une condition donnée.