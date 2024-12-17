arb = [[22,[13,4],8],[[1,0,4],2],7,0]
def zeroInListRecursif(liste):
    if not liste:  # si la liste est vide
        return False
    if isinstance(liste[0], list):  # si le premier élément est une liste
        return zeroInListRecursif(liste[0]) or zeroInListRecursif(liste[1:])
    if liste[0] == 0:  # si le premier élément est 0
        return True
    return zeroInListRecursif(liste[1:])  # vérifie le reste de la liste
print(zeroInListRecursif(arb))