# Question 1: Création du dataframe initial
# ---------------------------------------
id=c(1,2,3)
module=c("maths","informatique","réseaux")
heure=c(30,60,15)
df<-data.frame(id=id, module=module, heure=heure)
print("Dataframe initial:")
print(df)

# Question 2: Test d'ajout d'une colonne avec cbind sans affectation
# ----------------------------------------------------------------
print("\nTest 1 - cbind sans affectation:")
resultat_cbind <- cbind(df,coef=c(1,4,1))
print(resultat_cbind)
print("\nStructure du dataframe original après cbind sans affectation:")
str(df)
cat("Réponse: La structure de df n'est pas modifiée car cbind() retourne un nouveau dataframe\n")

# Question 3: Ajout d'une colonne avec cbind et affectation
# -------------------------------------------------------
print("\nTest 2 - cbind avec affectation:")
df <- cbind(df,coef=c(1,4,1))
print(df)
print("\nStructure du nouveau dataframe:")
str(df)
cat("Réponse: La structure de df est modifiée car nous avons affecté le résultat\n")

# Question 4: Différentes opérations de filtrage avec subset
# -------------------------------------------------------
print("\nFiltrage 1 - Heures >= 20:")
print(subset(df, heure>=20))

print("\nFiltrage 2 - Heures >= 20 ET coef > 1:")
print(subset(df,heure>=20 & coef > 1))

print("\nFiltrage 3 - Sélection du module où heures >= 20:")
print(subset(df,heure>=20, select=module))

# Question 5: Transformation des données
# -----------------------------------
print("\nTransformation des heures (×60) et coefficients (racine carrée):")
df_transforme <- transform(df,heure=60*heure,coef=sqrt(coef))
print(df_transforme)

# Comparaison des résultats
print("\nComparaison avant/après transformation:")
print("Original:")
print(df)
print("Transformé:")
print(df_transforme)