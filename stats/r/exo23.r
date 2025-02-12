# Dataframe orginal:

id=c(1,2,3)
module=c("maths","informatique","réseaux")
heure=c(30,60,15)
df<-data.frame(id=id, module=module, heure=heure)
print("Old Dataframe:")
print(df)

cbind(df,coef=c(1,4,1))
# print("New Dataframe:")
# print(df)
# Est ce que la structure de df possède une nouvelle colonne coef ?
# Non, la structure de df n'a pas été modifiée. La fonction cbind() retourne un nouveau dataframe, mais ne modifie pas le dataframe d'origine.

df = cbind(df,coef=c(1,4,1))
print("New Dataframe:")
print(df)
# Est ce que la structure de df possède une nouvelle colonne coef ?
# Oui, la structure de df a été modifiée. La fonction cbind() a ajouté une nouvelle colonne coef au dataframe d'origine.

subset(df, heure>=20)
subset(df,heure>=20 & coef > 1)
subset(df,heure>=20, select=module)
transform(df,heure=60*heure,coef=sqrt(coef))
print("Dataframe après transformation:")
print(df)