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


# # Simple demonstration de la récursivité
# def recursive(n):
#     if n == 0:
#         return 0
#     print(n)
#     return recursive(n-1)
# recursive(5)

# # Exo 2
# def f(i,j):
#     print(i,j,'|',end=' ')
#     if i < 2:
#         f(i+1,j)
#     if j < 1:
#         f(i,j+1)
# f(0,0)