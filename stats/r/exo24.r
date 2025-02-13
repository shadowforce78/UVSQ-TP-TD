# Un fichier CSV est un fichier qui contient un tableau (EX: Excel)
# On peut écrire un CSV a la main avec des séparateurs (, ou ;) ou avec un logiciel de tableur


df=read.csv(file="C:/Users/saumondeluxe/Desktop/DevProject/TP-TD/stats/r/filecsv.csv", header=T, sep=";")
df
is(df)

# La structure de donnée ici est un dataframe list oldClass et vector
