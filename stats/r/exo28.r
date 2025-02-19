# Lecture du fichier CSV (sans row.names)
data <- read.csv2("C:/Users/saumondeluxe/Desktop/DevProject/TP-TD/stats/r/exo28.csv")
print("Données brutes:")
print(data)

# Calcul du nombre total d'étudiants par année
data$Total <- rowSums(data[,2:5])
print("\nNombre total d'étudiants par année:")
print(data$Total)

# Calcul des pourcentages pour chaque mention
data_pct <- sweep(data[,2:5], 1, data$Total, "/") * 100
print("\nPourcentages des mentions par année:")
print(round(data_pct, 2))

# Création d'un graphique d'évolution
par(mfrow=c(2,1))

# Graphique 1: Évolution en valeurs absolues
barplot(t(as.matrix(data[,2:5])), 
        beside=TRUE,
        col=c("lightblue", "lightgreen", "orange", "red"),
        main="Évolution des mentions au baccalauréat",
        legend.text=colnames(data[,2:5]),
        names.arg=data$Annee,
        xlab="Années",
        ylab="Nombre d'étudiants")

# Graphique 2: Évolution en pourcentages
barplot(t(as.matrix(data_pct)), 
        beside=TRUE,
        col=c("lightblue", "lightgreen", "orange", "red"),
        main="Évolution des mentions en pourcentage",
        legend.text=colnames(data[,2:5]),
        names.arg=data$Annee,
        xlab="Années",
        ylab="Pourcentage")

# Statistiques descriptives
print("\nRésumé statistique par type de mention:")
print(summary(data[,2:5]))

# Vérification des noms de colonnes
print("\nNoms exacts des colonnes:")
print(names(data))

# Analyse des tendances (correction)
print("\nÉvolution des mentions 'Bien' et 'Très Bien' au fil des années:")
print(data[,c(1,4,5)])  # Utilisation des indices de colonnes plutôt que les noms

# Alternative avec les noms exacts si nécessaire
print("\nMême résultat avec les noms exacts des colonnes:")
colonnes <- c("Annee", "Bien", "Très.Bien")  # Ajuster selon les noms réels affichés
print(data[,colonnes])

print("\nAnnée avec le plus grand nombre total de mentions:")
meilleure_annee <- data$Annee[which.max(data$Total)]
print(paste("Année:", meilleure_annee, "avec", max(data$Total), "étudiants"))
